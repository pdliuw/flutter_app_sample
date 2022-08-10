import 'dart:math' as math;

import 'package:flutter/material.dart';

///
/// AnimatedBuilderPage
///
///
class AnimatedBuilderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimatedBuilderState();
  }
}

///
/// _AnimatedBuilderState
class _AnimatedBuilderState extends State<AnimatedBuilderPage> with SingleTickerProviderStateMixin {
  String _titleName = "AnimatedBuilderPage";

  bool _selected = false;

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$_titleName"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Text("使用AnimatedBuilder为widget装饰动画效果，这是相对AnimatedContainer更强大的扩展哦"),
            ),
            Center(
              child: AnimatedBuilder(
                animation: _controller,
                child: Container(width: 200.0, height: 200.0, color: Colors.green),
                builder: (BuildContext context, Widget? child) {
                  return Transform.rotate(
                    angle: _controller.value * 2.0 * math.pi,
                    child: Container(
                      width: 200.0,
                      height: 200.0,
                      color: ColorTween(begin: Colors.red, end: Colors.blue).transform(_controller.value),
                    ),
                  );
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _selected = !_selected;
                });
              },
              child: AnimatedContainer(
                width: 200,
                height: 200,
                duration: Duration(seconds: 3),
                curve: Curves.fastOutSlowIn,
                child: Container(
                  child: Text(
                    "Style",
                    style: TextStyle(
                      color: _selected ? Colors.red : Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
            AnimatedBuilder(
              animation: _controller,
              child: Text(
                "AnimatedBuilder-Color",
                style: TextStyle(color: ColorTween(begin: Colors.red, end: Colors.blue).transform(_controller.value)),
              ),
              builder: (BuildContext context, Widget? widget) {
                ///
                /// 此函数参数widget是AnimatedBuilder的child
                /// return 返回的widget会替代AnimatedBuilder的child
                ///
                return Column(
                  children: <Widget>[
                    Container(
                      width: 200,
                      height: 200,
                      color: ColorTween(begin: Colors.red, end: Colors.blue).transform(_controller.value),
                    ),
                    Text(
                      "AnimatedBuilder-Color , value = ${(_controller.value * 10).toInt() / 10}",
                      style: TextStyle(color: ColorTween(begin: Colors.red, end: Colors.blue).transform(_controller.value)),
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
