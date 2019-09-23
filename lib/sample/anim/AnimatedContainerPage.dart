import 'package:flutter/material.dart';
import 'package:flutter_app_sample/ui/base/AppCommonStatefulPage.dart';

class AnimatedContainerPage extends AppCommonStatefulPage {
  var _titleName = "AnimatedContainer";
  bool selected = false;

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
      child: Center(
        child: AnimatedContainer(
          width: selected ? 300.0 : 200.0,
          height: selected ? 200.0 : 300.0,
          color: selected ? Colors.red : Colors.blue,
          alignment:
              selected ? Alignment.center : AlignmentDirectional.topCenter,
          duration: Duration(seconds: 1),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
