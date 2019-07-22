import 'package:flutter/material.dart';
import 'package:flutter_app_sample/ui/base/AppCommonStatefulPage.dart';
import 'package:flutter_app_sample/net/HttpContext.dart';
import 'package:flutter_app_sample/common/util/StringUtil.dart';

class LoginPage extends AppCommonStatefulPage {
  String phoneStr = "";
  String verificationStr = "";

  @override
  Config createConfig() {
    return Config(
      titleName: "登陆",
      showBackArrow: false,
      showAppBar: true,
    );
  }

  ///获取验证码
  _getVerificationCode() {
    if (phoneStr.isEmpty) {
      setState(stateCallback: () {});
      return;
    }
    showToast("验证码已发送");
    HttpContext().getVerificationCode(call: (String responseStr) {
      showToast("OK" + responseStr);
    });
  }

  String _getPhoneErrorInfo() {
    if (StringUtil.isNull(phoneStr) || phoneStr.length == 11) {
      return StringUtil.getEmpty;
    } else {
      return "请输入11位手机号";
    }
  }

  _phoneInputChange(String content) {
    setState(stateCallback: () {
      phoneStr = content;
    });
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
            TextField(
              decoration: InputDecoration(
                labelText: '手机号',
                hintText: "请输入手机号",
                errorText: _getPhoneErrorInfo(),
                helperText: "helper",
              ),
              textAlign: TextAlign.start,
              enabled: true,
              maxLength: 11,
              onChanged: (String content) {
                _phoneInputChange(content);
              },
            ),
            Stack(
              alignment: AlignmentDirectional.centerEnd,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    labelText: '密码',
                    hintText: "请输入密码",
                    errorText: "请输入正确的密码",
                    helperText: "helper",
                  ),
                  textAlign: TextAlign.start,
                  enabled: true,
                  onChanged: (String content) {},
                ),
                FlatButton(
                  onPressed: () {
                    _getVerificationCode();
                  },
                  child: Text("验证码"),
                  textColor: Colors.blue,
                )
              ],
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
