import 'package:flutter/material.dart';

///
/// InputTextPage
class InputTextPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InputTextState();
  }
}

///
/// _InputTextState
class _InputTextState extends State<InputTextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InputText"),
      ),
    );
  }
}
