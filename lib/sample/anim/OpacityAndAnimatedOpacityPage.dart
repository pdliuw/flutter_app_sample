import 'package:flutter/material.dart';
import 'package:flutter_app_sample/ui/base/AppCommonStatefulPage.dart';

///
/// Opacity
/// AnimatedOpacity
///
class OpacityAndAnimatedOpacityPage extends AppCommonStatefulPage {
  var _rangeStart = 40.0;
  var _rangeEnd = 100.0;

  var _rangeMin = 1.0;
  var _rangeMax = 100.0;

  double _opacity = 1.0;

  double opacityLevel = 1.0;

  void _changeOpacity() {
    setState(stateCallback: () {
      opacityLevel = opacityLevel == 0 ? 1.0 : 0.0;
    });
  }

  @override
  Config createConfig() {
    return Config(titleName: "OpacityAndAnimatedOpacityPage");
  }

  @override
  Widget createWidget() {
    return Column(
      children: <Widget>[
        Text("Opacity: $_opacity"),
        Opacity(
          opacity: _opacity,
          child: Column(
            children: <Widget>[
              FlutterLogo(
                size: 300,
              ),
              Text("Opacity"),
            ],
          ),
        ),
        RangeSlider(
          values: RangeValues(_rangeStart, _rangeEnd),
          min: _rangeMin,
          max: _rangeMax,
          divisions: 100, //把总数分为divisions份
          labels: RangeLabels("${_rangeStart.toInt()}", "${_rangeEnd.toInt()}"),
          onChanged: (RangeValues values) {
            /*
            update
             */
            setState(stateCallback: () {
              _rangeStart = values.start;
              //_rangeEnd = values.end;
              _opacity = _rangeStart / 100;
            });
          },
        ),

        /*
        Animated Opacity
        */
        AnimatedOpacity(
          opacity: opacityLevel,
          duration: Duration(seconds: 2),
          child: Column(
            children: <Widget>[
              FlutterLogo(
                size: 200,
              ),
              Text("AnimatedOpacity"),
            ],
          ),
        ),
        RaisedButton(
          textColor: Colors.white,
          color: Colors.blue,
          child: Text("Fade Logo"),
          onPressed: () {
            _changeOpacity();
          },
        ),
      ],
    );
  }
}
