import 'package:flutter/material.dart';
import 'package:flutter_app_sample/ui/base/AppCommonStatefulPage.dart';

class TestPage extends StatefulWidget {
//  TestPage({
//    @required EnterParameter enterParameter,
//  }) : super(enterParameter: enterParameter);
//  @override
//  Config createConfig() {
//    return Config(titleName: "测试");
//  }
//
//  @override
//  Widget createWidget() {
//    return Text("测试！");
//  }

  @override
  State<StatefulWidget> createState() {
    return _TestPage();
  }
}

class _TestPage extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: Center(
        child: Text("Center!"),
      ),
    );
  }
}
