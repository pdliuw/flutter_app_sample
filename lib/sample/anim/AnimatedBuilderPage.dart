import 'package:flutter/material.dart';
import 'package:flutter_app_sample/ui/base/AppCommonStatefulPage.dart';

///
/// AnimatedBuilderPage
///
class AnimatedBuilderPage extends AppCommonStatefulPage {
  String _titleName = "AnimatedBuilder";

  @override
  Config createConfig() {
    return Config(titleName: "$_titleName");
  }

  @override
  Widget createWidget() {
    return Center(
      child: Text("TODO"),
    );
  }
}
