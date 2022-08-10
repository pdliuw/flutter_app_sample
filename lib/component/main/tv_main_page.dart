import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_sample/component/main/main_config.dart';
import 'package:flutter_app_sample/component/main/main_list_item_widget.dart';
import 'package:flutter_app_sample/component/personal/personal_drawer_widget.dart';
import 'package:flutter_app_sample/tv/app_raw_key_board_listener_widget.dart';

///
/// TvMainPage
class TvMainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainState();
  }
}

///
/// _MainState
class _MainState extends State<TvMainPage> with SingleTickerProviderStateMixin {
  ///
  /// FocusNode
  List<FocusNode> _focusNodeList = [];
  final int initialNodeListLength = 3;
  bool isFirstIn = true;

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
  /// TabController
  late TabController _tabController;

  ///
  /// Tab length
  int _tabLength = 3;

  Drawer _getDrawer({bool leftDraw = true}) {
    return Drawer(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: PersonalDrawerWidget(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: _tabLength, vsync: this);

    for (int i = 0, size = initialNodeListLength; i < size; i++) {
      _focusNodeList.add(FocusNode());
    }
  }

  @override
  void dispose() {
    super.dispose();
    for (int i = 0; i < _focusNodeList.length; i++) {
      _focusNodeList[i].dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isFirstIn) {
      FocusScope.of(context).requestFocus(_focusNodeList[0]);
      isFirstIn = false;
    }

    return DefaultTabController(
      length: _tabLength,
      child: Scaffold(
        appBar: AppBar(
          title: Text("${_bottomNavigationTitles.elementAt(_tabController.index)}"),
        ),
        drawer: _getDrawer(leftDraw: true),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return MainListItemWidget.defaultStyle(itemData: MainModelConfig.widgetConfigList[index]);
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
                ],
              ),
            ),
            Container(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (int i = 0, size = _focusNodeList.length; i < size; i++)
                    AppRawKeyboardListenerWidget.defaultStyle(
                      focusList: _focusNodeList,
                      focusIndex: i,
                      child: Container(
                          height: 100,
                          width: 100,
                          child: Column(
                            children: [
                              _bottomNavigationIcons.elementAt(i),
                              Text("${_bottomNavigationTitles.elementAt(i)}"),
                            ],
                          )),
                      onTap: () {
                        _tabController.animateTo(i);
                      },
                      onTelevisionTap: () {
                        //switch tab view
                        _tabController.animateTo(i);
                      },
                      onKey: (key) {
                        setState(() {});
                      },
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
