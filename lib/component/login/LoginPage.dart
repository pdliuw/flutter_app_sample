import 'package:flutter/material.dart';
import 'package:flutter_app_sample/ui/base/AppCommonStatefulPage.dart';
import 'package:flutter_app_sample/ui/common/AppCommonTextField.dart';

class LoginPage extends AppCommonStatefulPage {
  @override
  Config createConfig() {
    return Config(
      titleName: "登陆",
      showBackArrow: true,
      showAppBar: true,
    );
  }

  @override
  Widget createWidget() {
    return Center(
      child: Column(
        children: <Widget>[
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
        ],
      ),
    );
  }
}
