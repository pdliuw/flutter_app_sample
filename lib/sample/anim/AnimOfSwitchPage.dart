import 'package:airoute/airoute.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/helper/tip_helper.dart';
import '../../common/helper/tip_type.dart';

///
/// AnimOfSwitchPage
/// 页面切换的集中动画效果展示
class AnimOfSwitchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimOfSwitchState();
  }
}

///
/// _AnimOfSwitchState
class _AnimOfSwitchState extends State<AnimOfSwitchPage> {
  var _titleName = "页面跳转动画";

  List<String> _tabLabels = ["基本动画", "过渡动画"];
  List<IconData> _tabIcons = [
    Icons.list,
    Icons.transform,
  ];
  List<bool> _toggleSelected = [true, false, false, false];
  List<String> _toggleLabels = ["缩放动画", "渐变动画", "侧滑动画", "旋转动画"];

  int _tabSelectedIndex = 0;

  static const RangeValues _durationAnimationLimit = RangeValues(1, 10);
  static const int _durationAnimationDivisions = 10 - 1;
  RangeValues _durationAnimation = RangeValues(1, 10);

  Widget createWidget() {
    return DefaultTabController(
      length: _tabIcons.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("$_titleName"),
          actions: <Widget>[],
          bottom: TabBar(
            onTap: (int index) {
              setState(() {
                _tabSelectedIndex = index;
              });
            },
            isScrollable: true,
            tabs: _getTabs(),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            /*
            跳转到页面
            */
            if (_tabSelectedIndex == 0) {
              Airoute.pushNamedWithAnimation(
                routeName: "/CollapsingToolbarPage",
                duration: Duration(seconds: _durationAnimation.start.truncate()),
                routePageAnimation: (BuildContext? context, Animation<double>? animation, Animation<double>? secondaryAnimation, Widget? page) {
                  return _getTransition(
                    animation: animation!,
                    page: page!,
                  );
                },
              );
            } else {
              Airoute.pushNamedWithAnimation(
                routeName: "/CollapsingToolbarPage",
                duration: Duration(seconds: _durationAnimation.start.truncate()),
                routePageAnimation: AirouteTransition.Fade,
              );
            }
          },
          child: Icon(Icons.play_arrow),
          tooltip: "点击我，查看页面切换动画效果！",
        ),
        body: Column(
          children: <Widget>[
            IndexedStack(
              index: _tabSelectedIndex,
              children: <Widget>[
                Column(
                  //选择，动画类型
                  children: <Widget>[
                    Placeholder(
                      strokeWidth: 0,
                      fallbackHeight: 50,
                      color: Colors.blue,
                    ),
                    ToggleButtons(
                      textStyle: TextStyle(
                        fontSize: 20,
                      ),
                      borderWidth: 5,
                      borderColor: Colors.grey,
                      selectedBorderColor: Colors.blue,
                      borderRadius: BorderRadius.circular(5),
                      onPressed: (int index) {
                        TipHelper.showTip(
                          context: context,
                          tipType: TipType.INFO,
                          title: "动画",
                          message: "${_toggleLabels.elementAt(index)}",
                        );
                        setState(() {
                          for (int i = 0; i < _toggleSelected.length; i++) {
                            if (i == index) {
                              _toggleSelected[index] = !_toggleSelected[index];
                            } else {
                              _toggleSelected[i] = false;
                            }
                          }
                        });
                      },
                      children: _toggleLabels.map((String label) {
                        return Text("$label");
                      }).toList(),
                      isSelected: _toggleSelected,
                    ),
                  ],
                ),
                Card(
                  margin: EdgeInsets.all(0),
                  child: Column(
                    children: <Widget>[
                      _tabSelectedIndex == 0
                          ? Text('')
                          : Hero(
                              tag: "hero_image",
                              child: Image.asset(
                                "assets/pexels-photo-396547.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text("动画时间(秒):${_durationAnimation.start.ceil()}"),
                Expanded(
                  child: RangeSlider(
                    onChanged: (RangeValues values) {
                      setState(() {
                        double end = _durationAnimation.end;
                        _durationAnimation = RangeValues(values.start, end);
                      });
                    },
                    values: RangeValues(_durationAnimation.start, _durationAnimation.end),
                    min: _durationAnimationLimit.start,
                    max: _durationAnimationLimit.end,
                    labels: RangeLabels("${_durationAnimation.start.truncate()}", "${_durationAnimation.end.truncate()}"),
                    divisions: _durationAnimationDivisions,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ///获取Tab
  _getTabs() {
    List<Widget> tabs = [];

    for (int i = 0; i < _tabLabels.length; i++) {
      tabs.add(
        Tab(
          text: "${_tabLabels.elementAt(i)}",
          icon: Icon(_tabIcons.elementAt(i)),
        ),
      );
    }
    return tabs;
  }

  ///动画类型
  _getTransition({required Animation<double> animation, required Widget page}) {
    List<Widget> animations = [];

    /*
    缩放
    */
    animations.add(
      ScaleTransition(
        scale: animation,
        alignment: Alignment.topRight,
        child: page,
      ),
    );
    /*
    渐变
    */
    animations.add(
      FadeTransition(
        opacity: animation,
        child: page,
      ),
    );
    /*
    侧滑
    */
    animations.add(
      SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: const Offset(0.0, 0.0),
        ).animate(animation),
        child: page,
      ),
    );

    /*
    旋转
    */
    animations.add(
      RotationTransition(
        turns: animation,
        alignment: Alignment.center,
        child: page,
      ),
    );
    /*
    返回选中的动画类型
     */
    for (int i = 0; i < _toggleSelected.length; i++) {
      if (_toggleSelected[i]) {
        return animations.elementAt(i);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return createWidget();
  }
}
