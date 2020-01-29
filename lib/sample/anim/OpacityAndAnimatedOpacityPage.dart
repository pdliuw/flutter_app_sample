import 'package:flutter/material.dart';

///
/// Opacity
/// AnimatedOpacity
class OpacityAndAnimatedOpacityPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OpacityAndAnimatedOpacityState();
  }
}

///
/// _OpacityAndAnimatedOpacityState
class _OpacityAndAnimatedOpacityState
    extends State<OpacityAndAnimatedOpacityPage> {
  var _rangeStart = 40.0;
  var _rangeEnd = 100.0;

  var _rangeMin = 1.0;
  var _rangeMax = 100.0;

  double _opacity = 1.0;

  double opacityLevel = 1.0;

  void _changeOpacity() {
    setState(() {
      opacityLevel = opacityLevel == 0 ? 1.0 : 0.0;
    });
  }

  Widget createWidget() {
    return SingleChildScrollView(
      child: Column(
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
            labels:
                RangeLabels("${_rangeStart.toInt()}", "${_rangeEnd.toInt()}"),
            onChanged: (RangeValues values) {
              /*
              update
              */
              setState(() {
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OpacityAndAnimatedOpacityPage"),
      ),
      body: createWidget(),
    );
  }
}
