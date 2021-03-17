import 'package:air_design/air_design.dart';
import 'package:airoute/airoute.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_sample/component/main/main_config.dart';
import 'package:flutter_app_sample/component/main/main_list_item_widget.dart';
import 'package:flutter_app_sample/component/personal/personal_drawer_widget.dart';

import '../../common/helper/tip_helper.dart';
import '../../common/helper/tip_type.dart';

///
/// MainPage
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
  /// 获取底部导航标签的对应的显示视图
  List<Widget> getBottomNavigationWidgets() {
    List<Widget> _bottomNavigationWidgets = [
      Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return AppCardOutlinedStyleWidget.defaultStyle(
                  onTap: () {
                    Airoute.pushNamedWithAnimation(
                      routeName: MainModelConfig.widgetConfigList
                          .elementAt(index)['routeName'],
                      routePageAnimation: AirouteTransition.Slide,
                    );
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        "${MainModelConfig.widgetConfigList.elementAt(index)['title'].substring(0, 1)}",
                      ),
                    ),
                    title: Text(
                      "${MainModelConfig.widgetConfigList.elementAt(index)['title']}",
                    ),
                    subtitle: Text(
                      "${MainModelConfig.widgetConfigList.elementAt(index)['subtitle']}",
                    ),
                  ),
                );
              },
              itemCount: MainModelConfig.widgetConfigList.length,
            ),
          )
        ],
      ),
      Column(
        children: [
          for (int packageIndex = 0,
                  packageSize = MainModelConfig.packageConfigList.length;
              packageIndex < packageSize;
              packageIndex++)
            MainListItemWidget.defaultStyle(
              itemData: MainModelConfig.packageConfigList[packageIndex],
            ),
        ],
      ),
      Column(
        children: [
          for (int pluginIndex = 0,
                  pluginSize = MainModelConfig.pluginConfigList.length;
              pluginIndex < pluginSize;
              pluginIndex++)
            MainListItemWidget.defaultStyle(
              itemData: MainModelConfig.pluginConfigList[pluginIndex],
            ),
        ],
      ),
    ];

    return _bottomNavigationWidgets;
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
