import 'package:flutter/material.dart';
import 'package:flutter_app_sample/component/test/TestPage.dart';

class AppRoute {
  static var routes = MaterialApp(home: Text(""), routes: {
    "TestPage": (BuildContext context) {
      return TestPage();
    },
  });

  ///
  static void push(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }
}
