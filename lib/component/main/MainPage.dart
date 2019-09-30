import 'package:flutter/material.dart';
import 'package:flutter_app_sample/ui/base/AppCommonStatefulPage.dart';
import 'package:flutter_app_sample/sample/MainSortListPage.dart';

///主页面
class MainPage extends AppCommonStatefulPage {
  List<Widget> _bottomNavigationWidgets = [
    MainSortListPage(
      enterParameter: EnterParameter(),
    ),
    Text("Index 2"),
    Text("Index 3"),
  ];
  List<Widget> _bottomNavigationIcons = [
    Icon(Icons.title),
    Icon(Icons.title),
    Icon(Icons.title),
  ];

  List<String> _bottomNavigationTitles = [
    "演示主页",
    "标题2",
    "标题3",
  ];

  int _bottomNavigationSelectedIndex = 0;

  _bottomNavigationTap(int index) {
    /*
    Render
     */
    setState(stateCallback: () {
      _bottomNavigationSelectedIndex = index;
    });
  }

  List<BottomNavigationBarItem> _getBottomNavigationBar() {
    List<BottomNavigationBarItem> items = [];

    for (int i = 0; i < _bottomNavigationWidgets.length; i++) {
      items.add(
        BottomNavigationBarItem(
            icon: _bottomNavigationIcons.elementAt(i),
            title: Text("${_bottomNavigationTitles.elementAt(i)}")),
      );
    }

    return items;
  }

  @override
  Config createConfig() {
    return Config(
      titleName:
          "${_bottomNavigationTitles.elementAt(_bottomNavigationSelectedIndex)}",
    );
  }

  @override
  Widget createWidget() {
    return Scaffold(
      body: Center(
        child:
            _bottomNavigationWidgets.elementAt(_bottomNavigationSelectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavigationSelectedIndex,
        items: _getBottomNavigationBar(),
        onTap: _bottomNavigationTap,
      ),
    );
  }
}
