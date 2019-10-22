
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_sample/ui/base/AppCommonStatefulPage.dart';

class SearchPage extends AppCommonStatefulPage{

  @override
  Config createConfig() {
    return Config(customBuildWidget: true);
  }

  @override
  Widget createWidget() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          TextField(
            style: TextStyle(background: Paint()..color = Colors.green),
          )

        ],
      ),
    );
  }

}