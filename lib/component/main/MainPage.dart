import 'package:flutter/material.dart';
import 'package:flutter_app_sample/ui/base/AppCommonStatefulPage.dart';
import 'package:flutter_app_sample/sample/MainSortListPage.dart';
import 'package:flutter_app_sample/component/game/MainGamePage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:airoute/airoute.dart';

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
    Icon(Icons.title),
  ];

  ///
  /// 底部导航标签的标题文字集合
  List<String> _bottomNavigationTitles = [
    "演示主页",
    "小游戏",
    "TODO",
  ];

  ///
  /// 底部选中的导航标签索引项
  int _bottomNavigationSelectedIndex = 0;

  ///
  /// 获取示例列表的显示的描述
  List<String> _getSortTitles() {
    List<String> _sortTitles = [
      "TabBar+TabBarView",
      "Collapsing+TabBar+TabBarView",
      "Animation",
      "Communication",
      "DrawerVariously",
      "Drag list grid...",
    ];
    return _sortTitles;
  }

  ///
  /// 获取示例列表的跳转的路由名字集合
  List<String> _getSortRouteNames() {
    List<String> _sortRouteNames = [
      "ViewPagerFragmentPage",
      "CollapsingToolbarPage",
      "MainAnimSortPage",
      "CardMainPage",
      "DrawerVariouslyPage",
      "DragListPage",
    ];
    return _sortRouteNames;
  }

  ///
  /// 获取底部导航标签的对应的显示视图
  List<Widget> getBottomNavigationWidgets() {
    List<Widget> _bottomNavigationWidgets = [
      _getListView(),
      Center(
        child: Column(
          children: <Widget>[
            Text("Games"),
          ],
        ),
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
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Airoute.pushNamed(
              routeName: _getSortRouteNames().elementAt(index),
            );
          },
          child: Card(
            color: Colors.lightGreen,
            elevation: 3.0,
            margin: EdgeInsets.all(5),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(
                  "${sortTitles.elementAt(index).substring(0, 1)}",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              title: Text(
                "${sortTitles.elementAt(index)}",
                style: TextStyle(color: Colors.white),
              ),
            ),
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
//        ToastUtil(
//            "${_bottomNavigationTitles.elementAt(_bottomNavigationSelectedIndex)}触发刷新机制");
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
          title: Text("${_bottomNavigationTitles.elementAt(i)}"),
        ),
      );
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "${_bottomNavigationTitles.elementAt(_bottomNavigationSelectedIndex)}"),
      ),
      body: Center(
        child: getBottomNavigationWidgets()
            .elementAt(_bottomNavigationSelectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 5.0,
        currentIndex: _bottomNavigationSelectedIndex,
        items: _getBottomNavigationBar(),
        onTap: _bottomNavigationTap,
      ),
    );
  }
}
