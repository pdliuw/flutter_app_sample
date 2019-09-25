import 'package:flutter/material.dart';
import 'package:flutter_app_sample/ui/base/AppCommonStatefulPage.dart';

///
/// AnimatedContainerPage
///
class AnimatedContainerPage extends AppCommonStatefulPage {
  var _titleName = "AnimatedContainer";
  bool selected = false;

  int durationUnitSecond = 2;

  @override
  Config createConfig() {
    return Config(
      titleName: _titleName,
    );
  }

  @override
  Widget createWidget() {
    return GestureDetector(
      onTap: () {
        setState(stateCallback: () {
          selected = !selected;
        });
      },
      child: Column(
        children: <Widget>[
          ///
          /// AnimatedContainer演示效果
          ///
          Center(
            child: AnimatedContainer(
              width: selected ? 300.0 : 200.0,
              height: selected ? 200.0 : 300.0,
              color: selected ? Colors.red : Colors.blue,
              alignment:
                  selected ? Alignment.center : AlignmentDirectional.topCenter,
              duration: Duration(seconds: durationUnitSecond),
              curve: Curves.fastOutSlowIn,
              child: Column(
                children: <Widget>[
                  FlutterLogo(size: 75),
                  Text(
                    "Flutter's AnimatedContainer!",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "click the rect to show anim!",
                    style: TextStyle(color: Colors.white),
                  ),
                  RaisedButton(
                    animationDuration: Duration(seconds: durationUnitSecond),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(selected ? 15 : 0),
                    ),
                    child: Text("AnimatedContainerPage"),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),

          ///
          /// 以下说明AnimatedContainer的限制场景
          ///
          AnimatedContainer(
            width: 200.0,
            height: 200.0,
            color: selected ? Colors.red : Colors.blue,
            duration: Duration(seconds: durationUnitSecond),
            curve: Curves.fastOutSlowIn,
            child: Container(
              width: 200,
              height: 200,
              child: Text(
                "请注意这段文字：AnimatedContainer只能为AnimatedContainer自身设置动画（自身不包括AnimatedContainer的child,以及更深层次的child...\n这是AnimatedContainer的限制和短处）",
                style: TextStyle(
                  color: selected ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
