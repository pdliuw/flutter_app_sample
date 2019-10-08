import 'package:flutter/material.dart';
import 'package:flutter_app_sample/common/util/LogUtil.dart';
import 'package:flutter_app_sample/common/util/ToastUtil.dart';
import 'package:flutter_app_sample/ui/common/AppCommonToolBar.dart';

///基类：每个页面的创建都需要继承此类
///功能描述
///1、创建页面的配置信息[Config] [AppCommonStatefulPage.createConfig];
///2、创建页面的主部件[Widget] [AppCommonStatefulPage.createWidget];
///3、提示 [AppCommonStatefulPage.showToast];
///4、更新小部件[AppCommonStatefulPage.setState];
///5、生命周期的管理
///6、关闭当前页面[AppCommonStatefulPage.pop];
///7、启动新页面[AppCommonStatefulPage.pushNamed];
///8、TODO：push时携带参数的封装
typedef StateCallback = Function();
typedef LifecycleCallback = Function();

abstract class AppCommonStatefulPage extends StatefulWidget {
//    implements RouteObserver {
  EnterParameter enterParameter = null;
  _AppCommonStatefulPage _statefulPage = null;
  LifecycleManager _lifecycleManager = null;

  AppCommonStatefulPage({
    Key key,
    @required EnterParameter enterParameter,
  }) : super(key: key) {
    this.enterParameter = enterParameter;
  }

  @override
  State<StatefulWidget> createState() {
    /*
    上个页面传递的EnterParameter.Config对象 优先级 大于 本页面createConfig对象
    校验，从上个页面传递过来的Config数据
    如果不为空，则使用从上个页面传递过来的Config
    如果为空，则使用本页面createConfig函数回调的对象
     */
    Config enterParameterConfig = null;
    if (this.enterParameter != null) {
      if (this.enterParameter.config != null) {
        enterParameterConfig = this.enterParameter.config;
      }
    }

    //创建生命周期管理者
    _lifecycleManager = LifecycleManager(
      initState: initState,
      dispose: dispose,
    );
    //主状态小部件
    _statefulPage = _AppCommonStatefulPage(
      config:
          enterParameterConfig == null ? createConfig() : enterParameterConfig,
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
      if (_statefulPage.enterParameter != null) {
        if (_statefulPage.enterParameter.config != null) {
          _statefulPage.config = _statefulPage.enterParameter.config;
        }
      }
    });
  }

  ///Pop this page!
  pop() {
    _statefulPage?.exitThisPage();
  }

  ///
  pushNamed(
      {@required String routeName, @required EnterParameter enterParameter}) {
    _statefulPage?.pushNamed(routeName: routeName, arguments: enterParameter);
  }

  ///
  pushWidget({@required Widget widget}) {
    _statefulPage?.pushWidget(widget);
  }

//  @override
//  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
//    showToast("Route push:${route.settings.arguments.toString()}");
//    LogUtil.log("Route push:${route.settings.arguments.toString()}");
//  }

  BuildContext getContext() {
    return _statefulPage?.getContext();
  }

  Config getConfig() {
    return _statefulPage == null ? createConfig() : _statefulPage.config;
  }
}

///
///
///
///
class _AppCommonStatefulPage extends State<AppCommonStatefulPage>
    with WidgetsBindingObserver {
  Config _config;
  Widget _rootWidget;
  EnterParameter _enterParameter;

  AppLifecycleState _lastLifecycleState;
  LifecycleManager _lifecycleManager;

  EnterParameter get enterParameter => _enterParameter;
  Config get config => _config;
  Widget get rootWidget => _rootWidget;

  set enterParameter(EnterParameter enterParameter) {
    this._enterParameter = enterParameter;
  }

  set config(Config config) {
    this._config = config;
  }

  set rootWidget(Widget rootWidget) {
    this._rootWidget = rootWidget;
  }

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
    this._config = config;
    this._rootWidget = rootWidget;
    this._enterParameter = enterParameter;
    this._lifecycleManager = lifecycleManager;
  }

  Widget _getAppBarLeading() {
    if (config.showBackArrow) {
      return GestureDetector(
        onTap: () {
          exitThisPage();
        },
        child: Tooltip(
          message: "Back",
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
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
        title: Tooltip(
          message: "${config.titleName}",
          child: Text("${config.titleName}"),
        ),
        centerTitle: true,
      );
    } else {
      return null;
    }
  }

  pushWidget(Widget widget) {
    Navigator.push(getContext(), new MaterialPageRoute(builder: (context) {
      return new Builder(builder: (context) {
        return widget;
      });
    }));
  }

  pushNamed({@required String routeName, @required EnterParameter arguments}) {
    Navigator.pushNamed(getContext(), routeName, arguments: arguments);
  }

  exitThisPage() {
    ///TODO:Navigator pop's Context or PreContext!
    ///-某时刻使用Navigator.pop(context)导致失败(前提是：涉及到的页面不在同一个.dart文件中)，解决办法：使用上个页面的Context，因此产生了PreContext!
    ///-但是，现在的环境在这里使用context不会出现上次出现的问题！在此作记录，以备复盘，查找根本问题？
    ///PreContext and Context!
    ///Pick one of two!
    if (getPreContext() != null) {
      bool prePop = Navigator.pop(getPreContext());

      if (!prePop) {
        ///PreContext pop false!
        ///Use context
        Navigator.pop(getContext());
      }
    } else {
      ///PreContext is null!
      ///Use context
      Navigator.pop(getContext());
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
    return _getBuild();
  }

  Widget _getBuild() {
    if (config._customBuildWidget) {
      return rootWidget;
    } else {
      return MaterialApp(
        home: Scaffold(
          appBar: _getShowAppBar(),
          body: rootWidget,
        ),
      );
    }
  }
}

///
/// 页面配置类
///
class Config {
  Config({
    String titleName = 'title',
    bool showAppBar = true,
    bool showBackArrow = true,
    bool customBuildWidget = false,
  }) {
    this._titleName = titleName;
    this._showAppBar = showAppBar;
    this._showBackArrow = showBackArrow;
    this._customBuildWidget = customBuildWidget;
  }

  bool _showAppBar;
  String _titleName;
  bool _showBackArrow;
  bool _customBuildWidget;

  set titleName(String titleName) {
    this._titleName = titleName;
  }

  set showAppBar(showAppBar) => _showAppBar = showAppBar;
  set showBackArrow(showBackArrow) => _showBackArrow = showBackArrow;

  String get titleName => _titleName;
  bool get showAppBar => _showAppBar;
  bool get showBackArrow => _showBackArrow;
}

///
/// 页面跳转的参数类
///
class EnterParameter {
  BuildContext _previousPageContext;
  Config _config;
  EnterParameter({
    @required BuildContext previousPageContext,
    Config config,
  }) {
    this._previousPageContext = previousPageContext;
    this._config = config;
  }

  BuildContext get previousPageContext => this._previousPageContext;
  Config get config => this._config;

  set previousPageContext(BuildContext buildContext) {
    this._previousPageContext = buildContext;
  }

  set config(Config config) {
    this._config = config;
  }

  @override
  String toString() {
    return "EnterParameter toString!";
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
