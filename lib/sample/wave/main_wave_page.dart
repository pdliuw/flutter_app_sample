import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app_sample/sample/wave/wave_triangle_clipper.dart';

import 'wave_arc_clipper.dart';
import 'wave_oval_clipper.dart';

class MainWavePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainWaveState();
  }
}

class _MainWaveState extends State<MainWavePage> {
  static const double min = 2;
  static const double max = 30;
  double _slideValue = min + 1;
  int _slideDivisions = (max - min).toInt();
  int _waveCount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wave"),
      ),
      body: Column(
        children: <Widget>[
          Spacer(),
          Spacer(),
          Slider(
            value: _slideValue,
            min: min,
            max: max,
            divisions: _slideDivisions,
            label: "$_waveCount",
            onChanged: (double value) {
              setState(() {
                _slideValue = value;
                _waveCount = value.toInt();
              });
            },
          ),
          Divider(),
          Spacer(),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: ClipPath(
              key: GlobalKey(),
              clipBehavior: Clip.antiAlias,
              clipper:
                  WaveTriangleClipper(waveCount: _waveCount, isReverse: false),
              child: BlueGradient(),
            ),
          ),
          Divider(),
          Spacer(),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: ClipPath(
              key: GlobalKey(),
              clipBehavior: Clip.antiAlias,
              clipper: WaveOvalClipper(waveCount: _waveCount, isReverse: false),
              child: BlueGradient(),
            ),
          ),
          Divider(),
          Spacer(),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: ClipPath(
              key: GlobalKey(),
              clipBehavior: Clip.antiAlias,
              clipper: WaveArcClipper(waveCount: _waveCount, isReverse: false),
              child: BlueGradient(),
            ),
          ),
          Divider(),
          Spacer(),
          Spacer(),
        ],
      ),
    );
  }
}

class BlueGradient extends StatelessWidget {
  final overlayHeight = 50.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: overlayHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          colors: [
            Colors.blue,
            Colors.blue.withOpacity(0.25),
          ],
        ),
      ),
    );
  }
}
