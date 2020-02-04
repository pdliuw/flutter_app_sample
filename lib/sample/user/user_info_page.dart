import 'dart:ui';

import 'package:flutter/material.dart';

///
/// UserInfoPage
class UserInfoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UserInfoState();
  }
}

///
/// _UserInfoState
class _UserInfoState extends State<UserInfoPage> {
  double _sigmaX = 0;
  double _sigmaY = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Image.network(
                      "https://pdliuw.github.io/medias/avatar.jpg",
                      fit: BoxFit.cover,
                    ),
                    BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: _sigmaX,
                        sigmaY: _sigmaY,
                      ),
                      child: Container(
                        width: 1,
                        height: 1,
                        color: Colors.green.withOpacity(0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Slider(
                  value: _sigmaX,
                  onChanged: (double value) {
                    setState(() {
                      _sigmaX = value;
                    });
                  },
                  label: "$_sigmaX",
                  min: 0.0,
                  max: 10.0,
                  divisions: 10,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Slider(
                  value: _sigmaY,
                  onChanged: (double value) {
                    setState(() {
                      _sigmaY = value;
                    });
                  },
                  label: "$_sigmaY",
                  min: 0.0,
                  max: 10.0,
                  divisions: 10,
                ),
              ],
            ),
            Text("0" * 1000),
            Text("drawer"),
          ],
        ),
      ),
    );
  }
}
