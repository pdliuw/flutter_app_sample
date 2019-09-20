import 'package:flutter/material.dart';
import 'package:flutter_app_sample/ui/base/AppCommonStatefulPage.dart';
import 'package:flutter_app_sample/sample/CollapsingToolbarPage.dart';

///
/// AnimOfSwitchPage
/// 页面切换的集中动画效果展示
class AnimOfSwitchPage extends AppCommonStatefulPage {
  var _titleName = "页面跳转动画";

  List<String> _tabLabels = ["Tab 1", "Tab 2", "Tab 3", "Tab 4"];
  List<bool> _toggleSelected = [true, false, false, false];
  List<String> _toggleLabels = ["缩放动画", "渐变动画", "侧滑动画", "旋转动画"];

  @override
  Config createConfig() {
    return Config(
      titleName: "${_titleName}",
      customBuildWidget: true,
    );
  }

  @override
  Widget createWidget() {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("${_titleName}"),
          actions: <Widget>[],
          bottom: TabBar(
            onTap: (int index) {
              /*
                选中
                 */
              showToast("${_tabLabels.elementAt(index)}");
            },
            isScrollable: true,
            tabs: [
              Tab(
                text: "${_tabLabels.elementAt(0)}",
                icon: Icon(Icons.face),
              ),
              Tab(
                text: "${_tabLabels.elementAt(1)}",
                icon: Icon(Icons.label),
              ),
              Tab(
                text: "${_tabLabels.elementAt(2)}",
                icon: Icon(Icons.map),
              ),
              Tab(
                text: "${_tabLabels.elementAt(3)}",
                icon: Icon(Icons.update),
              ),
            ],
          ),
        ),
        body: Column(
          /*
          选择，动画类型
           */
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
                /*
                实现：但选功能！
                 */
                showToast("${_toggleLabels.elementAt(index)}");
                setState(stateCallback: () {
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
            /*
            列表
             */
            Card(
              elevation: 5.0,
              margin: EdgeInsets.all(10),
              child: Tooltip(
                message: "点击列表项目，开启跳转动画",
                child: ListTile(
                  onTap: () {
                    /*
                    跳转到页面
                    */
                    Navigator.push(
                      getContext(),
                      PageRouteBuilder(
                        barrierDismissible: false,
                        transitionDuration: Duration(milliseconds: 1000),
                        pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return _getTransition(
                            animation: animation,
                            page: CollapsingToolbarPage(),
                          );
                        },
                      ),
                    );
                  },
                  selected: true,
                  leading: CircleAvatar(
                    child: Text("Air"),
                  ),
                  title: Text("点击我，查看页面切换动画效果！"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///动画类型
  _getTransition(
      {@required Animation<double> animation, @required Widget page}) {
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
}
