import 'package:flutter/material.dart';
import 'package:flutter_app_sample/ui/base/AppCommonStatefulPage.dart';

class MainAnimSortPage extends AppCommonStatefulPage {
  var _titleName = "动画";

  //label:routeName
  var _list = [
    "页面跳转动画",
    "AnimatedContainer",
    "Opacity AnimatedOpacity",
    "FadeInImage",
    "Hero",
    "Transform",
    "AnimatedBuilder",
    "ColorTween",
  ];

  var _listRouteNames = [
    "AnimOfSwitchPage",
    "AnimatedContainerPage",
    "OpacityAndAnimatedOpacityPage",
    "FadeInImagePage",
    "HeroAnimPage",
    "TransformPage",
    "AnimatedBuilderPage",
    "ColorTweenPage",
  ];

  @override
  Config createConfig() {
    return Config(
      titleName: _titleName,
    );
  }

  @override
  Widget createWidget() {
    return ListView.builder(
      itemCount: _list.length,
      reverse: false,
      itemBuilder: (BuildContext context, int index) {
        return RaisedButton.icon(
          onPressed: () {
            /*
            跳转到动画详情页
             */
            pushNamed(
              routeName: _listRouteNames.elementAt(index),
              enterParameter: EnterParameter(previousPageContext: getContext()),
            );
          },
          color: Colors.blue,
          textColor: Colors.white,
          disabledTextColor: Colors.grey,
          icon: Icon(
            Icons.star,
            color: Colors.white,
          ),
          label: Text(
            "${_list.elementAt(index)}",
          ),
        );
      },
    );
  }
}
