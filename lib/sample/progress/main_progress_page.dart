import 'package:flutter/material.dart';

///
/// MainProgressPage
class MainProgressPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainProgressState();
  }
}

///
/// _MainProgressState
class _MainProgressState extends State<MainProgressPage>
    with SingleTickerProviderStateMixin {
  static const double MAX = 100.0;
  static const double MIN = 1.0;
  static int _divisions = 99;

  double _progressValue = 1;
  double _slideValue = MAX;

  AnimationController _controller;
  Animation<Color> _colorTween;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _colorTween = _controller.drive(ColorTween(
      begin: Colors.grey,
      end: Colors.green,
    ));
    _controller.value = _progressValue;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Progress"),
      ),
      body: Column(
        children: <Widget>[
          Spacer(),
          Slider(
            min: MIN,
            max: MAX,
            label: "$_slideValue",
            divisions: _divisions,
            value: _slideValue,
            activeColor: _colorTween.value,
            onChanged: (double value) {
              setState(() {
                _slideValue = value.ceilToDouble();
                _progressValue = (value / 100);
                _controller.value = _progressValue;
              });
            },
          ),
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                width: 200,
                height: 200,
                padding: EdgeInsets.all(5),
                child: CircularProgressIndicator(
                  value: _progressValue,
                  strokeWidth: 10.0,
                  valueColor: _colorTween,
                ),
              ),
              Text("$_slideValue%"),
            ],
          ),
          Slider(
            min: MIN,
            max: MAX,
            label: "$_slideValue",
            divisions: _divisions,
            value: _slideValue,
            activeColor: _colorTween.value,
            onChanged: (double value) {
              setState(() {
                _slideValue = value.ceilToDouble();
                _progressValue = (value / 100);
                _controller.value = _progressValue;
              });
            },
          ),
          LinearProgressIndicator(
            value: _progressValue,
            valueColor: _colorTween,
            semanticsLabel: "label",
            semanticsValue: "value",
          ),
          Spacer(),
        ],
      ),
    );
  }
}
