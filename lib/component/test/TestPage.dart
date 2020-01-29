import 'package:flutter/material.dart';
import 'package:flutter_app_sample/ui/base/AppCommonStatefulPage.dart';

///用于测试
@deprecated
class TestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TestState();
  }
}

///
/// _TestState
class _TestState extends State<TestPage> {
  Config createConfig() {
    return Config(titleName: "测试");
  }

  Widget createWidget() {
    return Center(
      child: Text("Center！"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return createWidget();
  }
}
