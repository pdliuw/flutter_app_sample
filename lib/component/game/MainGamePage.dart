import 'package:flutter/material.dart';

class MainGamePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainGameState();
  }
}

///
/// _MainGameState
class _MainGameState extends State<MainGamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("小游戏"),
      ),
    );
  }
}
