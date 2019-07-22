import 'package:flutter/material.dart';
import 'package:flutter_app_sample/common/util/LogUtil.dart';
import 'package:flutter_app_sample/common/util/ToastUtil.dart';

///基类：每个页面的创建都需要继承此类
///功能描述
///1、创建页面的配置信息Config createConfig();
///2、创建页面的主部件Widget createWidget();
///3、提示 showToast(msg);
///4、更新小部件setState(stateCallback: Function);
///
typedef StateCallback = Function();

abstract class AppCommonStatefulPage extends StatefulWidget {
  
  EnterParameter enterParameter = null;
  _AppCommonStatefulPage _statefulPage = null;

  ///有参数构造器
  AppCommonStatefulPage({
    @required this.enterParameter,
  });

  @override
  State<StatefulWidget> createState() {
    _statefulPage = _AppCommonStatefulPage(
        createConfig(), createWidget(), this.enterParameter);
    return _statefulPage;
  }

  ///创建页面的配置信息
  Config createConfig();

  ///创建页面的小部件
  Widget createWidget();

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
}

class _AppCommonStatefulPage extends State<AppCommonStatefulPage> {
  Config config;
  Widget rootWidget;
  EnterParameter enterParameter;

  _AppCommonStatefulPage(
      Config config, Widget rootWidget, EnterParameter enterParameter) {
    this.config = config;
    this.rootWidget = rootWidget;
    this.enterParameter = enterParameter;
  }

  Widget _getAppBarLeading() {
    if (config.showBackArrow) {
      return GestureDetector(
        onTap: () {
          _exitThisPage();
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

  _exitThisPage() {
    var context = enterParameter?.previousPageContext;
    if (context != null) {
      Navigator.pop(context);
    } else {
      LogUtil.log("检测到异常；退出页面时，上下文对象为空！");
    }
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
