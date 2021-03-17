import 'dart:ui';

import 'package:airoute/airoute.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// TaskNextPage
class TaskNextPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TaskNextState();
  }
}

///
/// _TaskNextState
class _TaskNextState extends State<TaskNextPage> {
  String _boxNumberInputed = "";

  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width / window.devicePixelRatio;
    double screenHeight = window.physicalSize.height / window.devicePixelRatio;

    var screenWidthSize = screenWidth;
    return Scaffold(
      appBar: AppBar(
        title: Text("手输号码"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Container(
              width: screenWidthSize / 5 * 4,
              child: TextFormField(
                initialValue: "",
                decoration: InputDecoration(
                  labelText: '无法扫描的号码',
                  hintText: "请输入无法扫描的号码",
                  errorText: "",
                  helperText: "helper",
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                textAlign: TextAlign.start,
                enabled: true,
                onChanged: (String content) {
                  _boxNumberInputed = content;
                },
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              /*
              检查扫码的箱子号码的状态
              */
              showCupertinoDialog(
                context: context,
                builder: (BuildContext context) {
                  return CupertinoAlertDialog(
                    content: Text("内容 : $_boxNumberInputed"),
                    actions: <Widget>[
                      CupertinoDialogAction(
                        onPressed: () {
                          Airoute.pop();
                        },
                        child: Text("知道了"),
                      ),
                    ],
                  );
                },
              );
            },
            color: Theme.of(context).primaryColor,
            minWidth: screenWidthSize / 3,
            textColor: Colors.white,
            child: Tooltip(
              message: "",
              child: Text("确认"),
            ),
          ),
        ],
      ),
    );
  }
}
