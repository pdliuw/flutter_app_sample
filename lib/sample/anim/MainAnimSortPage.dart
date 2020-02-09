import 'package:flutter/material.dart';
import 'package:airoute/airoute.dart';

///
/// MainAnimSortPage
class MainAnimSortPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainAnimState();
  }
}

///
/// _MainAnimState
class _MainAnimState extends State<MainAnimSortPage> {
  var _titleName = "动画";

  //label:routeName
  var _list = [
    "Page transition",
    "AnimatedContainer",
    "Opacity AnimatedOpacity",
    "FadeInImage",
    "Hero",
    "Transform",
    "AnimatedBuilder",
    "ColorTween",
    "AnappableAnimation",
    "DrawAnimation",
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
    "AnappablePage 雾散",
    "模拟绘画过程的动画",
  ];

  var _listRouteNames = [
    "/AnimOfSwitchPage",
    "/AnimatedContainerPage",
    "/OpacityAndAnimatedOpacityPage",
    "/FadeInImagePage",
    "/HeroAnimPage",
    "/TransformPage",
    "/AnimatedBuilderPage",
    "/ColorTweenPage",
    "/AnappablePage",
    "/DrawAnimPage",
  ];

  int _currentStep = 0;

  Widget getStepper() {
    return Stepper(
      type: StepperType.vertical,
      controlsBuilder: (
        BuildContext context, {
        VoidCallback onStepContinue,
        VoidCallback onStepCancel,
      }) {
        return Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: RaisedButton.icon(
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: (_currentStep == (_list.length - 1))
                      ? null
                      : onStepContinue,
                  icon: Icon(Icons.arrow_drop_down),
                  label: Text(
                      "${(_currentStep == (_list.length - 1)) ? 'Last' : 'Next'}"),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: RaisedButton.icon(
                  onPressed: (_currentStep == 0) ? null : onStepCancel,
                  icon: Icon(Icons.arrow_drop_up),
                  label: Text("${(_currentStep == 0) ? 'First' : 'Previous'}"),
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

        setState(() {
          _currentStep--;
        });
      },
      onStepContinue: () {
        /*
        Render
         */
        setState(() {
          _currentStep++;
        });
      },
      onStepTapped: (int index) {
        /*
        Render
         */
        setState(() {
          _currentStep = index;
        });
      },
      steps: getSteps(),
    );
  }

  List<Step> getSteps() {
    List<Step> steps = List<Step>();

    for (int i = 0, size = _list.length; i < size; i++) {
      StepState _stepState = StepState.indexed;
      bool _stepIsActive = false;

      if (i == size - 1 && i == _currentStep) {
        _stepIsActive = true;
        _stepState = StepState.complete;
      } else if (i == _currentStep) {
        _stepIsActive = true;
        _stepState = StepState.editing;
      } else if (i > _currentStep && i < size) {
        _stepIsActive = false;
        _stepState = StepState.indexed;
      } else if (i < _currentStep) {
        _stepIsActive = true;
        _stepState = StepState.indexed;
      } else {}

      steps.add(
        Step(
          state: _stepState,
          title: Text("${_list.elementAt(i)}"),
          subtitle: Text("${_list.elementAt(i)}"),
          content: GestureDetector(
            onTap: () {
              /*
              跳转到动画详情页
              */
              Airoute.pushNamedWithAnimation(
                routeName: _listRouteNames.elementAt(i),
                routePageAnimation: AirouteTransition.Slide,
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.green, width: 1),
                  borderRadius: BorderRadius.circular(5)),
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
          isActive: _stepIsActive,
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
            Airoute.pushNamedWithAnimation(
              routeName: _listRouteNames.elementAt(index),
              routePageAnimation: AirouteTransition.Slide,
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$_titleName"),
      ),
      body: getStepper(),
    );
  }
}
