import 'package:airoute/airoute.dart';
import 'package:flutter/material.dart';

///
/// ThirdPage
class ThirdPage extends StatefulWidget with AirArgumentReceiver {
  dynamic _content;
  @override
  State<StatefulWidget> createState() {
    return _ThirdPageState();
  }

  @override
  void receive(AirArgument argument) {
    _content = argument.argument;
    print("收到：${argument.argument}");
  }
}

///
/// _SecondPageState
class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        elevation: 0,
        title: Text("Third"),
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
            ElevatedButton.icon(
              onPressed: () {
                Airoute.popUntil(untilRouteName: "/route/SecondPage");
              },
              icon: Icon(Icons.arrow_back),
              label: Text("Back"),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Airoute.pushNamed(
                    routeName: "/route/ThirdPage", argument: "Repeat");
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
