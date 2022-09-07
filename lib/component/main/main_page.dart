import 'package:airoute/airoute.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_sample/component/dartpad/dartpad_page.dart';
import 'package:flutter_app_sample/component/main/main_config.dart';
import 'package:flutter_app_sample/component/main/main_list_item_widget.dart';
import 'package:flutter_app_sample/component/personal/personal_drawer_widget.dart';
import 'package:flutter_app_sample/component/search/search_entry_widget.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "${_bottomNavigationTitles.elementAt(_bottomNavigationSelectedIndex)}"),
        actions: [
          if (kIsWeb)
            TextButton.icon(
              onPressed: () {
                Airoute.push(route: MaterialPageRoute(builder: (context) {
                  return DartpadPage();
                }));
              },
              label: Text(
                "DartPad",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              icon: Image.asset(
                "assets/dart-192.png",
                width: 24,
                height: 24,
              ),
            ),
          SearchEntryWidget(),
        ],
      ),
      drawer: Builder(
        builder: (context) {
          return Drawer(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: PersonalDrawerWidget(),
            ),
          );
        },
      ),
      body: Center(
        child: getBottomNavigationWidgets()
            .elementAt(_bottomNavigationSelectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavigationSelectedIndex,
        items: <BottomNavigationBarItem>[
          for (int i = 0; i < getBottomNavigationWidgets().length; i++)
            BottomNavigationBarItem(
              icon: _bottomNavigationIcons.elementAt(i),
              label: "${_bottomNavigationTitles.elementAt(i)}",
            ),
        ],
        onTap: (int index) {
          setState(() {
            //如果已经选中当前项，此时再选择此项则视为刷新当前页面
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
        },
      ),
    );
  }

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
                return MainListItemWidget.defaultStyle(
                    itemData: MainModelConfig.widgetConfigList[index]);
              },
              itemCount: MainModelConfig.widgetConfigList.length,
            ),
          )
        ],
      ),
      Column(
        children: [
          Expanded(
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: MainModelConfig.packageConfigList.length,
                itemBuilder: (BuildContext context, int index) {
                  return MainListItemWidget.defaultStyle(
                    itemData: MainModelConfig.packageConfigList[index],
                  );
                }),
          ),
        ],
      ),
      Column(
        children: [
          Expanded(
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: MainModelConfig.pluginConfigList.length,
                itemBuilder: (BuildContext context, int index) {
                  return MainListItemWidget.defaultStyle(
                    itemData: MainModelConfig.pluginConfigList[index],
                  );
                }),
          ),
        ],
      ),
    ];

    return _bottomNavigationWidgets;
  }
}
