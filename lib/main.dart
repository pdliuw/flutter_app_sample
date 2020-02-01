import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_sample/component/login/login_page.dart';
import 'package:flutter_app_sample/ui/base/AppCommonStatefulPage.dart';
import 'package:flutter_app_sample/component/test/TestPage.dart';
import 'package:flutter_app_sample/component/main/MainPage.dart';
import 'package:flutter_app_sample/component/shop/ShoppingList.dart';
import 'package:flutter_app_sample/sample/MainSortListPage.dart';
import 'package:flutter_app_sample/sample/ViewPagerFragmentPage.dart';
import 'package:flutter_app_sample/sample/CollapsingToolbarPage.dart';
import 'package:flutter_app_sample/sample/anim/MainAnimSortPage.dart';
import 'package:flutter_app_sample/sample/anim/AnimOfSwitchPage.dart';
import 'package:flutter_app_sample/sample/anim/AnimatedContainerPage.dart';
import 'package:flutter_app_sample/sample/anim/OpacityAndAnimatedOpacityPage.dart';
import 'package:flutter_app_sample/sample/anim/FadeInImagePage.dart';
import 'package:flutter_app_sample/sample/anim/HeroAnimPage.dart';
import 'package:flutter_app_sample/sample/anim/TransformPage.dart';
import 'package:flutter_app_sample/sample/anim/AnimatedBuilderPage.dart';
import 'package:flutter_app_sample/sample/anim/ColorTweenPage.dart';
import 'package:flutter_app_sample/sample/notifier/CardMainPage.dart';
import 'package:flutter_app_sample/sample/notifier/CardInfoPage.dart';
import 'package:flutter_app_sample/sample/drag/DragListPage.dart';
import 'package:flutter_app_sample/sample/DrawerVariouslyPage.dart';
import 'package:airoute/airoute.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'ChineseCupertinoLocalizations.dart';
import 'sample/anim/snappable_page.dart';
import 'sample/tip/flushbar_page.dart';

// Register the RouteObserver as a navigation observer.
@deprecated //2019
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

void main() => runApp(
      Airoute.createMaterialApp(
        home: Scaffold(
          body: LoginPage(),
        ),
        locale: const Locale('zh', 'CH'),
        localizationsDelegates: [
          ChineseCupertinoLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('zh', 'CH'),
          const Locale('en', 'US'),
        ],

        ///全局静态路由的配置！
        routes: <String, AirouteBuilder>{
          "/LoginPage": () => LoginPage(),
          "/MainPage": () => MainPage(),
          "/TestPage": () => TestPage(),
          "/ShoppingList": () => ShoppingListPage(),
          "/MainSortListPage": () => MainSortListPage(),
          "/ViewPagerFragmentPage": () => ViewPagerFragmentPage(),
          "/CollapsingToolbarPage": () => CollapsingToolbarPage(),
          "/MainAnimSortPage": () => MainAnimSortPage(),
          "/AnimOfSwitchPage": () => AnimOfSwitchPage(),
          "/AnimatedContainerPage": () => AnimatedContainerPage(),
          "/OpacityAndAnimatedOpacityPage": () =>
              OpacityAndAnimatedOpacityPage(),
          "/FadeInImagePage": () => FadeInImagePage(),
          "/HeroAnimPage": () => HeroAnimPage(),
          "/TransformPage": () => TransformPage(),
          "/AnimatedBuilderPage": () => AnimatedBuilderPage(),
          "/ColorTweenPage": () => ColorTweenPage(),
          "/AnappablePage": () => AnappablePage(),
          "/CardMainPage": () => CardMainPage(),
          "/CardInfoPage": () => CardInfoPage(),
          "/DragListPage": () => DragListPage(),
          "/DrawerVariouslyPage": () => DrawerVariouslyPage(),
          "/FlushBarPage": () => FlushBarPage(),
        },
      ),
    );

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

///
/// _AppState
class _AppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App"),
      ),
      body: Center(
        child: Text("MyApp"),
      ),
    );
  }
}
