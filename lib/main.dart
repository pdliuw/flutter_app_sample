import 'package:airoute/airoute.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_sample/component/login/login_page.dart';
import 'package:flutter_app_sample/component/main/MainPage.dart';
import 'package:flutter_app_sample/component/shop/ShoppingList.dart';
import 'package:flutter_app_sample/component/test/TestPage.dart';
import 'package:flutter_app_sample/global_view_model.dart';
import 'package:flutter_app_sample/sample/CollapsingToolbarPage.dart';
import 'package:flutter_app_sample/sample/DrawerVariouslyPage.dart';
import 'package:flutter_app_sample/sample/MainSortListPage.dart';
import 'package:flutter_app_sample/sample/ViewPagerFragmentPage.dart';
import 'package:flutter_app_sample/sample/anim/AnimOfSwitchPage.dart';
import 'package:flutter_app_sample/sample/anim/AnimatedBuilderPage.dart';
import 'package:flutter_app_sample/sample/anim/AnimatedContainerPage.dart';
import 'package:flutter_app_sample/sample/anim/ColorTweenPage.dart';
import 'package:flutter_app_sample/sample/anim/FadeInImagePage.dart';
import 'package:flutter_app_sample/sample/anim/HeroAnimPage.dart';
import 'package:flutter_app_sample/sample/anim/MainAnimSortPage.dart';
import 'package:flutter_app_sample/sample/anim/OpacityAndAnimatedOpacityPage.dart';
import 'package:flutter_app_sample/sample/anim/TransformPage.dart';
import 'package:flutter_app_sample/sample/drag/DragListPage.dart';
import 'package:flutter_app_sample/sample/notifier/CardInfoPage.dart';
import 'package:flutter_app_sample/sample/notifier/CardMainPage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'ChineseCupertinoLocalizations.dart';
import 'sample/anim/draw_anim_page.dart';
import 'sample/anim/snappable_page.dart';
import 'sample/chart/chart_page.dart';
import 'sample/clip/clip_main_page.dart';
import 'sample/navigation/curved_navigation_bar_page.dart';
import 'sample/picker/main_picker_page.dart';
import 'sample/tip/flushbar_page.dart';
import 'sample/user/user_info_page.dart';
import 'sample/webview/air_license_page.dart';
import 'sample/webview/flutter_web_page.dart';
import 'sample/wheel/list_wheel_scroll_view_page.dart';

// Register the RouteObserver as a navigation observer.
@deprecated //2019
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

void main() {
  runApp(
    Test(),
  );
}

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GlobalViewModel.getInstance())
      ],
      child: Consumer<GlobalViewModel>(
        builder: (context, value, child) {
          return Airoute.createMaterialApp(
            home: Scaffold(
              body: LoginPage(),
            ),
            themeMode: value.themeMode,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
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
            routes: <String, WidgetBuilder>{
              "/LoginPage": (_) => LoginPage(),
              "/MainPage": (_) => MainPage(),
              "/TestPage": (_) => TestPage(),
              "/ShoppingList": (_) => ShoppingListPage(),
              "/MainSortListPage": (_) => MainSortListPage(),
              "/ViewPagerFragmentPage": (_) => ViewPagerFragmentPage(),
              "/CollapsingToolbarPage": (_) => CollapsingToolbarPage(),
              "/MainAnimSortPage": (_) => MainAnimSortPage(),
              "/AnimOfSwitchPage": (_) => AnimOfSwitchPage(),
              "/AnimatedContainerPage": (_) => AnimatedContainerPage(),
              "/OpacityAndAnimatedOpacityPage": (_) =>
                  OpacityAndAnimatedOpacityPage(),
              "/FadeInImagePage": (_) => FadeInImagePage(),
              "/HeroAnimPage": (_) => HeroAnimPage(),
              "/TransformPage": (_) => TransformPage(),
              "/AnimatedBuilderPage": (_) => AnimatedBuilderPage(),
              "/ColorTweenPage": (_) => ColorTweenPage(),
              "/AnappablePage": (_) => AnappablePage(),
              "/CardMainPage": (_) => CardMainPage(),
              "/CardInfoPage": (_) => CardInfoPage(),
              "/DragListPage": (_) => DragListPage(),
              "/DrawerVariouslyPage": (_) => DrawerVariouslyPage(),
              "/FlushBarPage": (_) => FlushBarPage(),
              "/DrawAnimPage": (_) => DrawAnimPage(),
              "/ChartPage": (_) => ChartPage(),
              "/UserInfoPage": (_) => UserInfoPage(),
              "/MainPickerPage": (_) => MainPickerPage(),
              "/FlutterWebPage": (_) => FlutterWebPage(),
              "/AirLicensePage": (_) => AirLicensePage(),
              "/ListWheelScrollViewPage": (_) => ListWheelScrollViewPage(),
              "/CurvedNavigationBarPage": (_) => CurvedNavigationBarPage(),
              "/ClipMainPage": (_) => ClipMainPage(),
            },
          );
        },
      ),
    );
  }
}

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
