import 'package:flutter/material.dart';
import 'package:flutter_app_sample/ui/base/AppCommonStatefulPage.dart';

///
///ColorTweenPage
///from one color to another color!
///
class ColorTweenPage extends AppCommonStatefulPage {
  String _titleName = "ColorTween";

  ///0.0 ... 1.0
  double _colorTweenTransform = 0.0;

  double _rangeMin = 0.0;
  double _rangeMax = 1.0;
  double _rangeStart = 0.0;
  double _rangeEnd = 1.0;
  double _rangeUnit = 0.1;
  int _rangeDivisions = 100;

  @override
  Config createConfig() {
    return Config(titleName: _titleName);
  }

  @override
  Widget createWidget() {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.grey,
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          child: Text(
            "拖动选择条，查看从一个颜色到另一个颜色间的过渡色",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        Container(
          color: ColorTween(begin: Colors.red, end: Colors.blue)
              .transform(_colorTweenTransform),
          width: 300,
          height: 300,
          alignment: Alignment.center,
          child: Text(
            "ColorTween",
            style: TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        RangeSlider(
          divisions: _rangeDivisions,
          labels: RangeLabels("$_rangeStart", "$_rangeEnd"),
          min: _rangeMin,
          max: _rangeMax,
          values: RangeValues(_rangeStart, _rangeEnd),
          onChanged: (RangeValues values) {
            /*
            Render
             */
            setState(stateCallback: () {
              _rangeStart = values.start;
              _colorTweenTransform = _rangeStart;
            });
          },
        ),
      ],
    );
  }
}
