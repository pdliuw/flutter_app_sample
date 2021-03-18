import 'package:airoute/airoute.dart';
import 'package:flutter/material.dart';

///
/// SecondPage
class SecondPage extends StatefulWidget with AirArgumentReceiver {
  dynamic _content;
  @override
  State<StatefulWidget> createState() {
    return _SecondPageState();
  }

  @override
  void receive(AirArgument argument) {
    _content = argument.argument;
    print("收到：${argument.argument}");
  }
}

///
/// _SecondPageState
class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        elevation: 0,
        title: Text("Second"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              "以下为上页传递的数据\n\n\n${widget._content}",
              style: TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            RaisedButton.icon(
              onPressed: () {
                Airoute.pushNamed(
                    routeName: "/route/ThirdPage", argument: "Air");
              },
              icon: Icon(Icons.arrow_right),
              label: Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}
