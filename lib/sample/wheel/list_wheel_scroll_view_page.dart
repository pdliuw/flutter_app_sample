import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// ListWheelScrollViewPage
class ListWheelScrollViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListWheelScrollViewState();
  }
}

///
/// _ListWheelScrollViewState
class _ListWheelScrollViewState extends State<ListWheelScrollViewPage> {
  static const double slideMaxValue = 3;
  static const double slideMinValue = 1;

  double _sliderValue = slideMaxValue - slideMinValue;
  double _offAxisFraction = 0;
  List<Color?> _colors = [
    Colors.red[200],
    Colors.lightBlueAccent[200],
    Colors.red[100],
    Colors.orange[200],
    Colors.red[300],
    Colors.blue[200],
    Colors.red[200],
    Colors.lightBlueAccent[200],
    Colors.red[100],
    Colors.orange[200],
    Colors.red[300],
    Colors.blue[200],
    Colors.red[200],
    Colors.lightBlueAccent[200],
    Colors.red[100],
    Colors.orange[200],
    Colors.red[300],
    Colors.blue[200],
    Colors.red[200],
    Colors.lightBlueAccent[200],
    Colors.red[100],
    Colors.orange[200],
    Colors.red[300],
    Colors.blue[200],
  ];

  bool _useMagnifier = false;

  ///
  /// 三角形3D效果
  bool _isTriangle3D = false;

  int _indexPage = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wheel"),
      ),
      body: Column(
        children: <Widget>[
          ExpansionTile(
            title: Text("Tools"),
            subtitle: Text("${_indexPage}"),
            children: <Widget>[
              ListTile(
                title: Text("偏移"),
                subtitle: Slider(
                  value: _sliderValue,
                  min: slideMinValue,
                  max: slideMaxValue,
                  onChanged: (value) {
                    setState(() {
                      _sliderValue = value;
                      _offAxisFraction = value - 2;
                    });
                  },
                ),
              ),
              Wrap(
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      setState(() {
                        _useMagnifier = !_useMagnifier;
                      });
                    },
                    title: Text("放大镜"),
                    trailing: Switch(
                      value: _useMagnifier,
                      onChanged: (value) {
                        setState(() {
                          _useMagnifier = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Wrap(
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      setState(() {
                        _isTriangle3D = !_isTriangle3D;
                      });
                    },
                    title: Text("三角形3D效果"),
                    subtitle: Text("默认是四边形3D效果"),
                    trailing: Switch(
                      value: _isTriangle3D,
                      onChanged: (value) {
                        setState(() {
                          _isTriangle3D = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: ListWheelScrollView(
              onSelectedItemChanged: (index) {
                setState(() {
                  _indexPage = index + 1;
                });
              },
              children: _colors.map((color) {
                return Center(
                  child: Container(
                    color: color,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    child: Image.asset("assets/avatar.jpg"),
                  ),
                );
              }).toList(),
              perspective: _isTriangle3D ? 0.003 : 0.01,
              diameterRatio: _isTriangle3D ? 0.38 : 2.8,
              offAxisFraction: _offAxisFraction,
              itemExtent: 340,
              useMagnifier: _useMagnifier,
              magnification: 3.0,
            ),
          ),
        ],
      ),
    );
  }
}
