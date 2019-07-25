import 'package:flutter/material.dart';
import 'package:flutter_app_sample/ui/base/AppCommonStatefulPage.dart';

///主页面
class MainPage extends AppCommonStatefulPage {
  @override
  Config createConfig() {
    return Config(
      titleName: "Flutter",
      showAppBar: true,
      showBackArrow: false,
    );
  }

  @override
  Widget createWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("Yea login success!"),
          Text("Center!"),
        ],
      ),
    );
  }
}
