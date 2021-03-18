import 'package:ai_awesome_message/ai_awesome_message.dart';
import 'package:air_design/air_design.dart';
import 'package:airoute/airoute.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_sample/component/message/tool_page.dart';

import 'message_popup_route.dart';

///
/// PopupPage
class PopupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PopupState();
  }
}

///
/// PopupState
class PopupState extends State<PopupPage> {
  bool _showMessageWidget = false;

  List _pickerList = [
    1000,
    2000,
    3000,
    4000,
    5000,
    6000,
    7000,
    8000,
    9000,
    10000
  ];

  ///
  ///
  void _showTopPicker() {
    Navigator.of(context, rootNavigator: true).push(
      MessagePopupRoute(
        barrierLabel: 'Dismiss',
        semanticsDismissible: false,
        builder: (context) {
          return Container(
            height: 200,
            color: Colors.green,
            child: Scaffold(
              backgroundColor: Colors.green,
              body: Container(
                child: CupertinoPicker(
                    itemExtent: 42,
                    onSelectedItemChanged: (index) {},
                    children: _pickerList
                        .map(
                          (e) => MaterialButton(
                            onPressed: () {},
                            child: Text("${e}"),
                          ),
                        )
                        .toList()),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showTopPopup() {
    Navigator.of(context, rootNavigator: true).push(
      MessagePopupRoute(
        barrierLabel: 'Dismiss',
        semanticsDismissible: false,
        builder: (context) {
          return Container(
            height: 200,
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: _pickerList
                      .map(
                        (e) => ListTile(leading: Text("${e}")),
                      )
                      .toList(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Airoute.push(
            route: AwesomeMessageRoute(
              awesomeMessage: AwesomeHelper.createAwesome(
                  title: "title", message: "message"),
              theme: Theme.of(context),
              settings: RouteSettings(name: "/messageRouteName"),
            ),
          );
        },
        label: Text("message"),
        icon: Icon(Icons.add),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: _showMessageWidget
                ? AwesomeHelper.createAwesome(
                    title: "title", message: "message")
                : Text(""),
          ),
          AppCardOutlinedStyleWidget.defaultStyle(
            child: ListTile(
              title: Text("top popup + list"),
              trailing: Icon(Icons.arrow_right),
            ),
            onTap: () {
              _showTopPopup();
            },
          ),
          AppCardOutlinedStyleWidget.defaultStyle(
            child: ListTile(
              title: Text("top popup + picker"),
              trailing: Icon(Icons.arrow_right),
            ),
            onTap: () {
              _showTopPicker();
            },
          ),
          AppCardOutlinedStyleWidget.defaultStyle(
            child: ListTile(
              title: Text("AwesomeMessage online config tools"),
              trailing: Icon(Icons.arrow_right),
            ),
            onTap: () {
              Airoute.push(route: MaterialPageRoute(builder: (context) {
                return AiAwesomeMessageToolPage();
              }));
            },
          ),
        ],
      ),
    );
  }
}
