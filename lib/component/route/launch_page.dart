import 'dart:ui';

import 'package:air_design/air_design.dart';
import 'package:airoute/airoute.dart';
import 'package:flutter/material.dart';

///
/// LaunchPage
class LaunchPage extends StatefulWidget with AirArgumentReceiver {
  dynamic _content = "";
  @override
  void receive(AirArgument argument) {
    if (!AppStringHelper.isEmpty(argument.argument)) {
      _content = argument.argument['content'];
    }
  }

  @override
  State<StatefulWidget> createState() {
    return _LaunchState();
  }
}

/// _LaunchState
class _LaunchState extends State<LaunchPage> {
  String _content = "";
  @override
  Widget build(BuildContext context) {
    Size size = window.physicalSize;
    double width = size.width / window.devicePixelRatio;
    double height = size.height / window.devicePixelRatio;

    return Scaffold(
      appBar: AppBar(
        title: Text("First"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Spacer(),
          Spacer(),
          AppCardElevatedStyleWidget.defaultStyle(
            child: TextField(
              enabled: true,
              decoration: InputDecoration(
                icon: Text("参数"),
                prefixIcon: Icon(Icons.content_paste),
              ),
              onChanged: (String content) {
                _content = content;
              },
            ),
          ),
          Spacer(),
          MaterialButton(
            onPressed: () {
              Airoute.pushNamedWithAnimation(
                routeName: "/route/SecondPage",
                argument: "$_content",
                routePageAnimation: AirouteTransition.Slide,
              );
            },
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
            child: Text("跳转下一页"),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
