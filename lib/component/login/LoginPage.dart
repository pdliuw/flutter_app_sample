import 'package:flutter/material.dart';
import 'package:flutter_app_sample/ui/base/AppCommonStatefulPage.dart';
import 'package:flutter_app_sample/ui/common/AppCommonTextField.dart';

class LoginPage extends AppCommonStatefulPage {
  @override
  Config createConfig() {
    return Config(
      titleName: "登陆",
      showBackArrow: false,
      showAppBar: true,
    );
  }

  @override
  Widget createWidget() {
    return Center(
      child: SizedBox(
        width: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(80),
                child: Text(
                  "Air",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                  ),
                )),
            AppCommonTextField(
              textField: TextField(
                decoration: InputDecoration(
                  labelText: '手机号',
                  hintText: "请输入手机号",
                  errorText: "请输入11位手机号",
                  helperText: "helper",
                ),
                textAlign: TextAlign.start,
                enabled: true,
                maxLength: 11,
              ),
            ),
            AppCommonTextField(
              textField: TextField(
                decoration: InputDecoration(
                  labelText: '密码',
                  hintText: "请输入密码",
                  errorText: "请输入正确的密码",
                  helperText: "helper",
                ),
                textAlign: TextAlign.start,
                enabled: true,
                maxLength: 100,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                  textColor: Colors.blue,
                  onPressed: () {},
                  child: Text("退出"),
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {},
                  child: Text("登陆"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
