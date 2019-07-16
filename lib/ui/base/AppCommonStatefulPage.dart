import 'package:flutter/material.dart';

abstract class AppCommonStatefulPage extends StatefulWidget {

  ///有参数构造器
  AppCommonStatefulPage({
    @required EnterParameter enterParameter,
  });

  @override
  _AppCommonStatefulPage createState() {
    return _AppCommonStatefulPage(createConfig(), createWidget());
  }
  ///创建页面的配置信息
  Config createConfig();

  ///创建页面的小部件
  Widget createWidget();
}

class _AppCommonStatefulPage extends State<AppCommonStatefulPage> {
  Config config;
  Widget rootWidget;

  _AppCommonStatefulPage(Config config, Widget rootWidget) {
    this.config = config;
    this.rootWidget = rootWidget;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              SnackBar(content: Text("Snack bar"));
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: Text("${config.titleName}"),
          centerTitle: true,
        ),
        body: rootWidget,
      ),
    );
  }
}

class Config {
  const Config({
    @required this.titleName = 'title',
    this.showAppBar = true,
    this.showBackArrow = true,
  });

  final bool showAppBar;
  final String titleName;
  final bool showBackArrow;
}

class EnterParameter {
  EnterParameter({
    @required BuildContext previousPageContext,
  });
}
