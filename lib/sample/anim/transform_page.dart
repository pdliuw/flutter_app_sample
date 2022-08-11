import 'dart:math';

import 'package:flutter/material.dart';

///
/// TransformPage
class TransformPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TransformState();
  }
}

///
/// _TransformState
class _TransformState extends State<TransformPage> {
  double _rangeStart = 1;
  double _rangeEnd = 180;
  double _rangeMin = 1;
  double _rangeMax = 180;
  int _rangeDivisions = 180;
  double _transformRotateX = 0;

  String _transformTitle = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transform"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Opacity(
              opacity: 0.0,
              child: Text("这是隐藏的文字,是为了站位\n\n\n"),
            ),
            Transform(
              alignment: Alignment.topRight,
              transform: Matrix4.skewX(0.3),
              child: Text("Hello Transform"),
            ),
            Opacity(
              opacity: 0.0,
              child: Text("这是隐藏的文字,是为了站位\n\n\n"),
            ),
            Transform(
              alignment: Alignment.topRight,
              transform: Matrix4.skewY(0.3),
              child: Text("Hello Transform"),
            ),
            Transform(
              transform: Matrix4.identity()..rotateX(_transformRotateX),
              child: Container(
                width: 200,
                height: 200,
                color: Colors.blue,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Image.network(
                      "https://www.educaciontrespuntocero.com/wp-content/uploads/2018/01/chichen-itza.jpg",
                      fit: BoxFit.cover,
                    ),
                    Text(
                      "$_transformTitle",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Transform(
              transform: Matrix4.identity()..rotateY(_transformRotateX),
              child: Center(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.amber,
                        height: 100,
                      ),
                    ),
                    Container(
                      color: Colors.blue,
                      height: 100,
                      width: 50,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.amber,
                        height: 100,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            RangeSlider(
              min: _rangeMin,
              max: _rangeMax,
              divisions: _rangeDivisions,
              labels: RangeLabels("$_rangeStart", "$_rangeEnd"),
              values: RangeValues(_rangeStart, _rangeEnd),
              onChanged: (RangeValues values) {
                /*
              Render
               */
                setState(() {
                  _rangeStart = values.start;
                  if (_rangeStart > 90) {
                    _transformTitle = "明天";
                  } else {
                    _transformTitle = "今天";
                  }
                  _transformRotateX = (pi / 180) * _rangeStart;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
