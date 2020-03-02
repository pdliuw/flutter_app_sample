import 'package:flutter/material.dart';

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
