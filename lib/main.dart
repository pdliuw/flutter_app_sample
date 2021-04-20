import 'package:air_design/air_design.dart';
import 'package:airoute/airoute.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_sample/component/login/login_page.dart';
import 'package:flutter_app_sample/component/main/main_page.dart';
import 'package:flutter_app_sample/component/paint/sun_main_page.dart';
import 'package:flutter_app_sample/component/route/second_page.dart';
import 'package:flutter_app_sample/component/route/third_page.dart';
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
import 'package:flutter_app_sample/sample/anim/draw_anim_page.dart';
import 'package:flutter_app_sample/sample/drag/DragListPage.dart';
import 'package:flutter_app_sample/sample/ink/ink_page.dart';
import 'package:flutter_app_sample/sample/loading/main_loading_page.dart';
import 'package:flutter_app_sample/sample/notifier/CardInfoPage.dart';
import 'package:flutter_app_sample/sample/notifier/CardMainPage.dart';
import 'package:flutter_app_sample/sample/popup/main_popup_page.dart';
import 'package:flutter_app_sample/sample/wave/main_wave_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'ChineseCupertinoLocalizations.dart';
import 'component/barcode/barcode_main_page.dart';
import 'component/filter/select_color_filter_page.dart';
import 'component/message/awesome_message_main_page.dart';
import 'component/personal/user_info_page.dart';
import 'component/route/launch_page.dart';
import 'component/setting/setting_page.dart';
import 'sample/anim/icon/main_icon_anim_page.dart';
import 'sample/anim/snappable_page.dart';
import 'sample/chart/chart_page.dart';
import 'sample/clip/clip_main_page.dart';
import 'sample/navigation/curved_navigation_bar_page.dart';
import 'sample/overlay/main_overlay_page.dart';
import 'sample/overlay/simple_overlay_page.dart';
import 'sample/picker/main_picker_page.dart';
import 'sample/progress/main_progress_page.dart';
import 'sample/segment/drop_down_page.dart';
import 'sample/segment/segment_page.dart';
import 'sample/text/RichTextPage.dart';
import 'sample/tip/flushbar_page.dart';
import 'sample/webview/air_license_page.dart';
import 'sample/webview/flutter_web_page.dart';
import 'sample/wheel/list_wheel_scroll_view_page.dart';

///
/// main
void main() {
  runApp(
    MyApp(),
  );
}

///
/// MyApp
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ErrorWidget.builder = (detail) {
      return AppTextHeadline6Widget.defaultStyle(detail.toString());
    };
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GlobalViewModel.getInstance())
      ],
      child: Consumer<GlobalViewModel>(
        builder: (context, value, child) {
          return ColorFiltered(
            colorFilter: ColorFilter.mode(Colors.transparent, BlendMode.color),
            child: Airoute.createMaterialApp(
                title: "flutter app sample",
                debugShowCheckedModeBanner: false,
                home: Scaffold(
                  body: LoginPage(),
                ),
                themeMode: value.themeMode,
                theme: ThemeData.light().copyWith(
                  primaryColor: Colors
                      .blue, //primary color,button enable color,check color
                  primaryColorDark: Colors.blue,
                  accentColor: Colors.blueAccent, //select color
                  unselectedWidgetColor:
                      Colors.grey, //unchecked color,unselected color
                  splashColor: Colors.blueAccent[100], //splash color
                  errorColor: Colors.red, //error color
                  indicatorColor: Colors.orange,
                  textTheme: Theme.of(context).textTheme.copyWith(
                        headline1: TextStyle(),
                      ),
                  //indicator color
                  appBarTheme: AppBarTheme.of(context).copyWith(
                    elevation: 0.0,
                    centerTitle: true,
                    titleTextStyle: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                darkTheme: ThemeData.dark().copyWith(
                  primaryColor: Colors.grey[
                      900], //primary color,button enable color,check color
                  primaryColorDark: Colors.black,
                  accentColor: Colors.tealAccent[200], //select color
                  unselectedWidgetColor:
                      Colors.grey, //unchecked color,unselected color
                  splashColor: Colors.black26, //splash color
                  errorColor: Colors.red, //error color
                  indicatorColor: Colors.orange,
                  textTheme: Theme.of(context).textTheme.copyWith(
                        headline1: TextStyle(),
                      ),
                  //indicator color
                  appBarTheme: AppBarTheme.of(context).copyWith(
                    elevation: 0.0,
                    centerTitle: true,
                    titleTextStyle: TextStyle(
                      color: Colors.black,
                    ),
                  ),
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
                  "/DrawAnimPage": (_) => DrawAnimPage(),
                  "/CardMainPage": (_) => CardMainPage(),
                  "/CardInfoPage": (_) => CardInfoPage(),
                  "/DragListPage": (_) => DragListPage(),
                  "/DrawerVariouslyPage": (_) => DrawerVariouslyPage(),
                  "/FlushBarPage": (_) => FlushBarPage(),
                  "/ChartPage": (_) => ChartPage(),
                  "/UserInfoPage": (_) => UserInfoPage(),
                  "/MainPickerPage": (_) => MainPickerPage(),
                  "/FlutterWebPage": (_) => FlutterWebPage(),
                  "/AirLicensePage": (_) => AirLicensePage(),
                  "/ListWheelScrollViewPage": (_) => ListWheelScrollViewPage(),
                  "/CurvedNavigationBarPage": (_) => CurvedNavigationBarPage(),
                  "/ClipMainPage": (_) => ClipMainPage(),
                  "/InkPage": (_) => InkPage(),
                  "/RichTextPage": (_) => RichTextPage(),
                  "/MainProgressPage": (_) => MainProgressPage(),
                  "/SegmentPage": (_) => SegmentPage(),
                  "/DropDownPage": (_) => DropDownPage(),
                  "/MainPopupPage": (_) => MainPopupPage(),
                  "/MainWavePage": (_) => MainWavePage(),
                  "/MainIconAnimPage": (_) => MainIconAnimPage(),
                  "/MainOverlayPage": (_) => MainOverlayPage(),
                  "/SimpleOverlayPage": (_) => SimpleOverlayPage(),
                  "/MainLoadingPage": (_) => MainLoadingPage(),
                  "/SelectColorFilterPage": (_) => SelectColorFilterPage(),
                  "/SettingPage": (_) => SettingPage(),
                  "/BarcodeMainPage": (_) => BarcodeMainPage(),
                  "/route/LaunchPage": (_) => LaunchPage(),
                  "/route/SecondPage": (_) => SecondPage(),
                  "/route/ThirdPage": (_) => ThirdPage(),
                  "/message/AwesomeMessageMainPage": (_) =>
                      AwesomeMessageMainPage(),
                  "/paint/SunMainPage": (_) => SunMainPage(),
                },
                builder: EasyLoading.init(
                  //loading
                  builder: (context, widget) {
                    return MediaQuery(
                      data:
                          MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                      child: widget,
                    );
                  },
                )),
          );
        },
      ),
    );
  }
}
