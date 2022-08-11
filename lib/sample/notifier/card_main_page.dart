import 'package:airoute/airoute.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_sample/sample/notifier/card_model.dart';

///
/// CardMainPage
class CardMainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarMainState();
  }
}

///
/// _CarMainState
class _CarMainState extends State<CardMainPage> {
  callback() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    CardModel.getInstance().addListener(callback);
    CardModel.getInstance().age = 0;
    CardModel.getInstance().name = "Air";
    CardModel.getInstance().notify();
  }

  @override
  void dispose() {
    super.dispose();
    CardModel.getInstance().removeListener(callback);
  }

  Widget createWidget() {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: Text("通信机制：此页面显示的数据，与跳转后的页面的数据保持一致性！"),
          ),
          Text(
            "这里显示的是消息通信流程中进行更新的数据：\n\nname = ${CardModel.getInstance().name}, age = ${CardModel.getInstance().age}",
            textAlign: TextAlign.center,
          ),
          RaisedButton(
            textColor: Colors.white,
            color: ColorTween(begin: Colors.red, end: Colors.blue).transform(0.5),
            onPressed: () {
              Airoute.pushNamedWithAnimation(
                routeName: "/CardInfoPage",
                routePageAnimation: AirouteTransition.Slide,
              );
            },
            child: Text("跳转页面"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("消息通信"),
      ),
      body: createWidget(),
    );
  }
}
