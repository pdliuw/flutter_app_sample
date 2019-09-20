import 'package:flutter/material.dart';
import 'package:flutter_app_sample/ui/base/AppCommonStatefulPage.dart';
import 'package:flutter_app_sample/component/login/LoginPage.dart';
import 'package:flutter_app_sample/component/test/TestPage.dart';
import 'package:flutter_app_sample/component/main/MainPage.dart';
import 'package:flutter_app_sample/component/shop/ShoppingList.dart';
import 'package:flutter_app_sample/sample/MainSortListPage.dart';
import 'package:flutter_app_sample/sample/ViewPagerFragmentPage.dart';
import 'package:flutter_app_sample/sample/CollapsingToolbarPage.dart';
import 'package:flutter_app_sample/sample/anim/MainAnimSortPage.dart';
import 'package:flutter_app_sample/sample/anim/AnimOfSwitchPage.dart';

// Register the RouteObserver as a navigation observer.
@deprecated //2019
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

void main() => runApp(MaterialApp(
      home: Scaffold(
        body: LoginPage(),
      ),

      ///全局静态路由的配置！
      routes: <String, WidgetBuilder>{
        "LoginPage": (BuildContext context) => LoginPage(),
        "MainPage": (BuildContext context) => MainPage(),
        "TestPage": (BuildContext context) => TestPage(),
        "ShoppingList": (BuildContext context) => ShoppingListPage(),
        "MainSortListPage": (BuildContext context) => MainSortListPage(),
        "ViewPagerFragmentPage": (BuildContext context) => ViewPagerFragmentPage(),
        "CollapsingToolbarPage": (BuildContext context) => CollapsingToolbarPage(),
        "MainAnimSortPage": (BuildContext context) => MainAnimSortPage(),
        "AnimOfSwitchPage": (BuildContext context) => AnimOfSwitchPage(),
      },
      navigatorObservers: [
        routeObserver,
      ],
    ));

class MyApp extends AppCommonStatefulPage {
  @override
  Config createConfig() {
    return Config(titleName: "MyApp");
  }

  @override
  Widget createWidget() {
    return Center(
      child: Text("MyApp"),
    );
  }
}
