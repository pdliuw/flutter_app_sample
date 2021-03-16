
import 'package:air_design/air_design.dart';
import 'package:airoute/airoute.dart';
//import 'package:flip_panel/flip_panel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_sample/component/personal/personal_drawer_widget.dart';

import '../../common/helper/tip_helper.dart';
import '../../common/helper/tip_type.dart';

///主页面
///
/// 增加："演示主页"、"小游戏"、"TO DO的底部切换标签
/// 增加：点击底部已选中的标签会触发刷新机制
///
class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainState();
  }
}

///
/// _MainState
class _MainState extends State<MainPage> {
  ///
  /// 底部导航标签的图标集合
  List<Widget> _bottomNavigationIcons = [
    Icon(Icons.slideshow),
    Icon(Icons.games),
    Icon(Icons.person),
  ];

  ///
  /// 底部导航标签的标题文字集合
  List<String> _bottomNavigationTitles = [
    "组件",
    "库",
    "插件",
  ];

  ///
  /// 底部选中的导航标签索引项
  int _bottomNavigationSelectedIndex = 0;

  ///
  /// 获取示例列表的显示的描述
  List<String> _getSortTitles() {
    List<String> _sortTitles = [
      "Animation",
      "Communication",
      "Drag list grid...",
      "Tip message...",
      "Chart: bar line pie...",
      "Picker",
      "WebView",
      "3D Widget",
      "Curved Navigation Bar",
      "Clip",
      "Ink",
      "RichText",
      "Progress",
      "Segment",
      "DropDown",
      "Popup",
      "Wave",
      "IconAnim",
      "Overlay",
      "Loading",
    ];
    return _sortTitles;
  }

  ///
  /// 获取示例列表的跳转的路由名字集合
  List<String> _getSortRouteNames() {
    List<String> _sortRouteNames = [
      "/MainAnimSortPage",
      "/CardMainPage",
      "/DragListPage",
      "/FlushBarPage",
      "/ChartPage",
      "/MainPickerPage",
      "/FlutterWebPage",
      "/ListWheelScrollViewPage",
      "/CurvedNavigationBarPage",
      "/ClipMainPage",
      "/InkPage",
      "/RichTextPage",
      "/MainProgressPage",
      "/SegmentPage",
      "/DropDownPage",
      "/MainPopupPage",
      "/MainWavePage",
      "/MainIconAnimPage",
      "/MainOverlayPage",
      "/MainLoadingPage",
    ];
    return _sortRouteNames;
  }

  ///
  /// 获取底部导航标签的对应的显示视图
  List<Widget> getBottomNavigationWidgets() {
    List<Widget> _bottomNavigationWidgets = [
      _getListView(),
      Center(
        child: Text("TODO"),
      ),
      Center(
        child: Text("TODO"),
      ),
    ];

    return _bottomNavigationWidgets;
  }

  ///
  ///获取列表
  ListView _getListView() {
    List<String> sortTitles = _getSortTitles();

    ListView listView = ListView.builder(
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return AppCardOutlinedStyleWidget.defaultStyle(
          onTap: () {
            Airoute.pushNamedWithAnimation(
              routeName: _getSortRouteNames().elementAt(index),
              routePageAnimation: AirouteTransition.Slide,
            );
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                child: Text(
                  "${sortTitles.elementAt(index).substring(0, 1)}",
                ),
              ),
              Text(
                "${sortTitles.elementAt(index)}",
              )
            ],
          ),
        );
      },
      itemCount: sortTitles.length,
    );

    return listView;
  }

  ///
  /// 底部导航的点击事件处理
  _bottomNavigationTap(int index) {
    /*
    Render
     */
    setState(() {
      /*
      如果已经选中当前项，此时再选择此项则视为刷新当前页面
       */
      if (_bottomNavigationSelectedIndex == index) {
        TipHelper.showTip(
          context: context,
          tipType: TipType.INFO,
          message:
              "${_bottomNavigationTitles.elementAt(_bottomNavigationSelectedIndex)}触发刷新机制",
        );
      }
      _bottomNavigationSelectedIndex = index;
    });
  }

  ///
  /// 获取底部导航项集合
  List<BottomNavigationBarItem> _getBottomNavigationBar() {
    List<BottomNavigationBarItem> items = [];

    for (int i = 0; i < getBottomNavigationWidgets().length; i++) {
      items.add(
        BottomNavigationBarItem(
          icon: _bottomNavigationIcons.elementAt(i),
          label: "${_bottomNavigationTitles.elementAt(i)}",
        ),
      );
    }

    return items;
  }

  Drawer _getDrawer({bool leftDraw = true}) {
    return Drawer(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: PersonalDrawerWidget(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "${_bottomNavigationTitles.elementAt(_bottomNavigationSelectedIndex)}"),
      ),
      drawer: _getDrawer(leftDraw: true),
      body: Center(
        child: getBottomNavigationWidgets()
            .elementAt(_bottomNavigationSelectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavigationSelectedIndex,
        items: _getBottomNavigationBar(),
        onTap: _bottomNavigationTap,
      ),
    );
  }
}
