import 'package:flutter/material.dart';
import 'package:flutter_app_sample/common/util/LogUtil.dart';
import 'package:flutter_app_sample/common/util/ToastUtil.dart';

///基类：每个页面的创建都需要继承此类
///功能描述
///1、创建页面的配置信息Config createConfig();
///2、创建页面的主部件Widget createWidget();
///3、提示 showToast(msg);
///4、更新小部件setState(stateCallback: Function);
///5、生命周期的管理
///6、关闭当前页面pop();
typedef StateCallback = Function();
typedef LifecycleCallback = Function();

abstract class AppCommonStatefulPage extends StatefulWidget {
  EnterParameter enterParameter = null;
  _AppCommonStatefulPage _statefulPage = null;
  LifecycleManager _lifecycleManager = null;

  AppCommonStatefulPage({
    @required EnterParameter enterParameter,
  }) {
    this.enterParameter = enterParameter;
  }

  @override
  State<StatefulWidget> createState() {
    //创建生命周期管理者
    _lifecycleManager = LifecycleManager(
      initState: initState,
      dispose: dispose,
    );
    //主状态小部件
    _statefulPage = _AppCommonStatefulPage(
      config: createConfig(),
      rootWidget: createWidget(),
      enterParameter: this.enterParameter,
      lifecycleManager: _lifecycleManager,
    );
    return _statefulPage;
  }

  ///创建页面的配置信息
  Config createConfig();

  ///创建页面的小部件
  Widget createWidget();

  ///Lifecycle
  void initState() {}

  ///Lifecycle
  void dispose() {}

  showToast(String message) {
    ToastUtil.showToast(message: message);
  }

  setState({@required StateCallback stateCallback}) {
    if (_statefulPage == null) {
      return;
    }
    //更新状态
    _statefulPage?.setState(() {
      stateCallback();
      _statefulPage.rootWidget = createWidget();
      _statefulPage.config = createConfig();
      _statefulPage.enterParameter = this.enterParameter;
    });
  }

  ///Pop this page!
  pop() {
    _statefulPage?.exitThisPage();
  }
  ///TODO:修改中
  push({@required Widget widget}) {
    _statefulPage?.push(widget);
  }

  BuildContext getContext() {
    return _statefulPage?.getContext();
  }
}

class _AppCommonStatefulPage extends State<AppCommonStatefulPage>
    with WidgetsBindingObserver {
  Config config;
  Widget rootWidget;
  EnterParameter enterParameter;

  AppLifecycleState _lastLifecycleState;
  LifecycleManager _lifecycleManager;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _lifecycleManager?.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
    _lifecycleManager?.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      _lastLifecycleState = state;
    });
  }

  _AppCommonStatefulPage({
    @required Config config,
    @required Widget rootWidget,
    @required EnterParameter enterParameter,
    @required LifecycleManager lifecycleManager,
  }) {
    this.config = config;
    this.rootWidget = rootWidget;
    this.enterParameter = enterParameter;
    this._lifecycleManager = lifecycleManager;
  }

  Widget _getAppBarLeading() {
    if (config.showBackArrow) {
      return GestureDetector(
        onTap: () {
          exitThisPage();
        },
        child: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      );
    } else {
      return null;
    }
  }

  _getShowAppBar() {
    if (config.showAppBar) {
      return AppBar(
        leading: _getAppBarLeading(),
        title: Text("${config.titleName}"),
        centerTitle: true,
      );
    } else {
      return null;
    }
  }

  push(Widget widget) {
    Navigator.push(getContext(), new MaterialPageRoute(builder: (context) {
      return new Builder(builder: (context) {
        return widget;
      });
    }));
  }

  exitThisPage() {
    var context = enterParameter?.previousPageContext;
    if (context != null) {
      Navigator.pop(context);
    } else {
      LogUtil.log("检测到异常；退出页面时，上下文对象为空！");
    }
  }

  BuildContext getContext() {
    return context;
  }

  BuildContext getPreContext() {
    return enterParameter?.previousPageContext;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: _getShowAppBar(),
        body: rootWidget,
      ),
    );
  }
}

class Config {
  Config({
    @required String titleName = 'title',
    bool showAppBar = true,
    bool showBackArrow = true,
  }) {
    this._titleName = titleName;
    this._showAppBar = showAppBar;
    this._showBackArrow = showBackArrow;
  }

  bool _showAppBar;
  String _titleName;
  bool _showBackArrow;

  set titleName(String titleName) {
    this._titleName = titleName;
  }

  set showAppBar(bool showAppBar) => _showAppBar = showAppBar;
  set showBackArrow(bool showBackArrow) => _showBackArrow = showBackArrow;

  String get titleName => _titleName;
  bool get showAppBar => _showAppBar;
  bool get showBackArrow => _showBackArrow;
}

class EnterParameter {
  BuildContext previousPageContext;
  EnterParameter({
    @required BuildContext previousPageContext,
  }) {
    this.previousPageContext = previousPageContext;
  }
}

///TODO:待进一步完善！
class LifecycleManager {
  LifecycleCallback _initState;
  LifecycleCallback _dispose;

  ///Setter Getter!
  LifecycleCallback get initState => _initState;
  LifecycleCallback get dispose => _dispose;

  LifecycleManager({LifecycleCallback initState, LifecycleCallback dispose}) {
    this._initState = initState;
    this._dispose = dispose;
  }
}
