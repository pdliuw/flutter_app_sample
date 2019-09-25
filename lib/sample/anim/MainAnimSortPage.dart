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

  var _listDescription = [
    "为页面之间跳转增加动画，如：平移、渐变、缩放、旋转，以及过渡动画",
    "AnimatedContainer为child widget添加动画",
    "Opacity AnimatedOpacity为widget添加透明值",
    "FadeInImage为网络加载图片添加加载等待图片和加载成功图片",
    "Hero 共享元素动画，也称为过渡动画",
    "Transform 为Widget添加 矩阵处理",
    "AnimatedBuilder 动画构建者",
    "ColorTween 从一个色值过渡到另一个色值的动画",
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

  int _currentStep = 0;

  @override
  Config createConfig() {
    return Config(
      titleName: _titleName,
    );
  }

  Widget getStepper() {
    return Stepper(
      controlsBuilder: (BuildContext context,
          {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
        return Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: RaisedButton.icon(
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: onStepContinue,
                  icon: Icon(Icons.arrow_drop_down),
                  label: Text("下一步"),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: RaisedButton.icon(
                  onPressed: onStepCancel,
                  icon: Icon(Icons.arrow_drop_up),
                  label: Text("上一步"),
                ),
              ),
            ),
          ],
        );
      },
      currentStep: _currentStep,
      onStepCancel: () {
        /*
        Render
         */
        setState(stateCallback: () {
          _currentStep--;
        });
      },
      onStepContinue: () {
        /*
        Render
         */
        setState(stateCallback: () {
          _currentStep++;
        });
      },
      onStepTapped: (int index) {
        /*
        Render
         */
        setState(stateCallback: () {
          _currentStep = index;
        });
      },
      steps: getSteps(),
    );
  }

  List<Step> getSteps() {
    List<Step> steps = List<Step>();

    for (int i = 0; i < _list.length; i++) {
      steps.add(
        Step(
          state: StepState.indexed,
          title: Text("${_list.elementAt(i)}"),
          subtitle: Text("${_list.elementAt(i)}"),
          content: GestureDetector(
            onTap: () {
              /*
              跳转到动画详情页
              */
              pushNamed(
                routeName: _listRouteNames.elementAt(i),
                enterParameter:
                    EnterParameter(previousPageContext: getContext()),
              );
            },
            child: Card(
              elevation: 5,
              margin: EdgeInsets.all(5),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "${_list.elementAt(i)}",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            _listDescription.elementAt(i),
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      flex: 3,
                    ),
                    Expanded(
                      child: Icon(Icons.arrow_right),
                    ),
                  ],
                ),
              ),
            ),
          ),
          isActive: true,
        ),
      );
    }
    return steps;
  }

  Widget getList() {
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

  @override
  Widget createWidget() {
    return getStepper();
  }
}
