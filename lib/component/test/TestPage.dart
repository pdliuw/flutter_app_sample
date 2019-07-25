import 'package:flutter/material.dart';
import 'package:flutter_app_sample/ui/base/AppCommonStatefulPage.dart';

///用于测试
@deprecated
class TestPage extends AppCommonStatefulPage {
  TestPage({
    @required EnterParameter enterParameter,
  }) : super(enterParameter: enterParameter);
  @override
  Config createConfig() {
    return Config(titleName: "测试");
  }

  @override
  Widget createWidget() {
    return Center(
      child: Text("Center！"),
    );
  }
}
