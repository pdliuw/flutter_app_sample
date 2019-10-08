import 'package:flutter/material.dart';
import 'package:flutter_app_sample/ui/base/AppCommonStatefulPage.dart';

class MainGamePage extends AppCommonStatefulPage {
  @override
  Config createConfig() {
    return Config(titleName: "小游戏",customBuildWidget: true);
  }

  @override
  Widget createWidget() {
    return Column(
      children: <Widget>[Text("Hello game!")],
    );
  }
}
