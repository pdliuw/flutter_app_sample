import 'package:flutter/material.dart';
import 'package:flutter_app_sample/ui/base/AppCommonStatefulPage.dart';

///
/// TransformPage
///
class TransformPage extends AppCommonStatefulPage {
  @override
  Config createConfig() {
    return Config(
      titleName: "Transform",
    );
  }

  @override
  Widget createWidget() {
    return Container(
      child: Column(
        children: <Widget>[
          Opacity(
            opacity: 0.0,
            child: Text("这是隐藏的文字,是为了站位\n\n\n"),
          ),
          Transform(
            alignment: Alignment.topRight,
            transform: Matrix4.skewX(0.3),
            child: Text("Hello Transform"),
          ),
          Opacity(
            opacity: 0.0,
            child: Text("这是隐藏的文字,是为了站位\n\n\n"),
          ),
          Transform(
            alignment: Alignment.topRight,
            transform: Matrix4.skewY(0.3),
            child: Text("Hello Transform"),
          ),
        ],
      ),
    );
  }
}
