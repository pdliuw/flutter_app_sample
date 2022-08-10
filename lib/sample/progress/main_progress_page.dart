import 'package:ai_progress/ai_progress.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// MainProgressPage
class MainProgressPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<MainProgressPage> {
  @override
  Widget build(BuildContext context) {
    return ExampleHomePage._(
      title: "Progress",
    );
  }
}

///
/// _MainProgressState
class _MainProgressState extends State<MainProgressPage> with SingleTickerProviderStateMixin {
  static const double MAX = 100.0;
  static const double MIN = 1.0;
  static int _divisions = 99;

  double _progressValue = 1;
  double _slideValue = MAX;

  late AnimationController _controller;
  late Animation<Color> _colorTween;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    // _colorTween = _controller.drive(Animated(
    //   begin: Colors.grey,
    //   end: Colors.green,
    // ));
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
          RaisedButton.icon(
              onPressed: () {},
              icon: Container(
                width: 24,
                height: 24,
                padding: EdgeInsets.all(0),
                child: CircularProgressIndicator(),
              ),
              label: Text("loading button")),
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
          Spacer(),
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

class ExampleHomePage extends StatefulWidget {
  ExampleHomePage._({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ExampleHomePage> with SingleTickerProviderStateMixin {
  int _counter = 0;

  static const double MAX = 10.0;
  static const double MIN = 1.0;
  static int _divisions = 99;

  double _progressValue = 1;
  double _slideValue = MAX;

  late AnimationController _controller;
  late Animation<Color> _colorTween;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    // _colorTween = _controller.drive(ColorTween(
    //   begin: Colors.grey,
    //   end: Colors.green,
    // ));
    _controller.value = _progressValue;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    Paint paint = Paint();

    paint..isAntiAlias = true;
  }

  Map<int, Widget> _segmentChildren = {
    1: Text("1"),
    2: Text("2"),
    3: Text("3"),
    4: Text("4"),
    5: Text("5"),
    6: Text("6"),
    7: Text("7"),
    8: Text("8"),
    9: Text("9"),
    10: Text("10"),
  };
  int _segmentValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CupertinoSegmentedControl(
                    padding: EdgeInsets.all(5),
                    children: _segmentChildren,
                    onValueChanged: (int index) {
                      setState(() {
                        _segmentValue = index;
                        _controller.value = index * 10 / 100;
                      });
                    },
                    groupValue: _segmentValue,
                  ),
                ),
              ],
            ),
            Align(
              child: Text("$_segmentValue"),
            ),
            Slider(
              min: MIN,
              max: MAX,
              value: _segmentValue.toDouble(),
              onChanged: (double newValue) {
                setState(() {
                  _segmentValue = newValue.toInt();
                  _controller.value = newValue;
                });
              },
            ),
            Row(
              children: [
                Spacer(),
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      width: 150,
                      height: 150,
                      padding: EdgeInsets.all(5),
                      child: CircularProgressIndicator(
                        value: _segmentValue / 10,
                        strokeWidth: 10.0,
                        valueColor: _colorTween,
                      ),
                    ),
                    Text("${_segmentValue / 10 * 100}%"),
                  ],
                ),
                Spacer(),
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      width: 150,
                      height: 150,
                      padding: EdgeInsets.all(5),
                      child: AirDashboardStateProgressIndicator(
                        size: Size(150, 150),
                        value: _segmentValue / 10 * 100, //1~100
                        // valueColor:
                        //     ColorTween(begin: Colors.grey, end: Colors.blue)
                        //         .transform(_segmentValue / 10),
                        pathStrokeWidth: 10,
                        valueStrokeWidth: 10,
                        gapDegree: 60,
                        roundCap: true,
                      ),
                    ),
                    Text("${_segmentValue / 10 * 100}%"),
                  ],
                ),
                Spacer(),
              ],
            ),
            //圆环、扇形样式的进度
            Row(
              children: [
                Spacer(),
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      width: 150,
                      height: 150,
                      padding: EdgeInsets.all(5),
                      child: AirCircularStateProgressIndicator(
                        size: Size(150, 150),
                        value: _segmentValue / 10 * 100, //1~100
                        pathColor: Colors.white,
                        // valueColor:
                        //     ColorTween(begin: Colors.grey, end: Colors.blue)
                        //         .transform(_segmentValue / 10),
                        pathStrokeWidth: 10.0,
                        valueStrokeWidth: 10.0,
                        useCenter: false,
                        filled: false,
                        roundCap: true,
                      ),
                    ),
                    Text("${_segmentValue / 10 * 100}%"),
                  ],
                ),
                Spacer(),
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      width: 150,
                      height: 150,
                      padding: EdgeInsets.all(5),
                      child: AirCircularStateProgressIndicator(
                        size: Size(150, 150),
                        value: _segmentValue / 10 * 100, //1~100
                        pathColor: Colors.white,
                        // valueColor:
                        //     ColorTween(begin: Colors.grey, end: Colors.blue)
                        //         .transform(_segmentValue / 10),
                        pathStrokeWidth: 10.0,
                        valueStrokeWidth: 10.0,
                        useCenter: true,
                        filled: true,
                        roundCap: true,
                      ),
                    ),
                    Text("${_segmentValue / 10 * 100}%"),
                  ],
                ),
                Spacer(),
              ],
            ),
            //线性、步进样式的进度
            Row(
              children: [
                Spacer(),
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      width: 150,
                      height: 50,
                      padding: EdgeInsets.all(5),
                      child: AirLinearStateProgressIndicator(
                        size: Size(150, 150),
                        value: _segmentValue / 10 * 100, //1~100
                        // valueColor:
                        //     ColorTween(begin: Colors.grey, end: Colors.blue)
                        //         .transform(_segmentValue / 10),
                        pathStrokeWidth: 10.0,
                        valueStrokeWidth: 10.0,
                        roundCap: true,
                      ),
                    ),
                    Text("${_segmentValue / 10 * 100}%"),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Container(
                      width: 90,
                      height: 50,
                      padding: EdgeInsets.all(0),
                      child: AirStepStateProgressIndicator(
                        size: Size(150, 150),
                        stepCount: _segmentChildren.length,
                        stepValue: _segmentValue,
                        // valueColor:
                        //     ColorTween(begin: Colors.grey, end: Colors.blue)
                        //         .transform(_segmentValue / 10),
                        pathStrokeWidth: 10.0,
                        valueStrokeWidth: 10.0,
                      ),
                    ),
                    Text("${_segmentValue / 10 * 100}%"),
                  ],
                ),
                Spacer(),
              ],
            ),
            Row(
              children: [
                Spacer(),
                Row(
                  children: [
                    Container(
                      width: 250,
                      height: 50,
                      padding: EdgeInsets.all(0),
                      child: AirStepStateProgressIndicator(
                        size: Size(150, 150),
                        stepCount: _segmentChildren.length,
                        stepValue: _segmentValue,
                        // valueColor:
                        //     ColorTween(begin: Colors.grey, end: Colors.blue)
                        //         .transform(_segmentValue / 10),
                        pathStrokeWidth: 30.0,
                        valueStrokeWidth: 30.0,
                      ),
                    ),
                    Text("${_segmentValue / 10 * 100}%"),
                  ],
                ),
                Spacer(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 150,
                  padding: EdgeInsets.all(5),
                  child: LinearProgressIndicator(
                    value: _segmentValue / 10,
                    valueColor: _colorTween,
                  ),
                ),
                Text("${_segmentValue / 10 * 100}%"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
