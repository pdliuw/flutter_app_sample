import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_app_sample/ui/base/AppCommonStatefulPage.dart';
import 'package:flutter_app_sample/common/util/StringUtil.dart';
import 'package:flutter_app_sample/component/login/LoginContract.dart';
import 'package:flutter_app_sample/component/login/LoginRepository.dart';
import 'package:flutter_app_sample/component/login/LoginPresenter.dart';
import 'package:flutter_app_sample/component/test/TestPage.dart';
import 'package:flutter_app_sample/ui/route/AppRoute.dart';

///登陆页面
///
///针对IOS和Android设备制定不同的设计
class LoginPage extends AppCommonStatefulPage implements ILoginView {
  static const num PHONE_MAX_LENGTH_DEFAULT = 11;
  static const num VERIFICATION_MAX_LENGTH_DEFAULT = 6;
  String phoneStr = "";
  String passwordStr = "";
  String verificationStr = "";

  LoginPresenter _presenter;

  @override
  void initState() {
    super.initState();
    //Presenter.
    LoginPresenter(loginSource: LoginRepository(), loginView: this);
  }

  @override
  void dispose() {
    super.dispose();
    //Presenter.
    _presenter = null;
  }

  @override
  Config createConfig() {
    return Config(
      titleName: "登陆",
      showBackArrow: false,
      showAppBar: true,
    );
  }

  String _getPhoneErrorInfo() {
    if (StringUtil.isEmpty(phoneStr) ||
        phoneStr.length == PHONE_MAX_LENGTH_DEFAULT) {
      return StringUtil.getEmpty;
    } else {
      return "请输入11位手机号";
    }
  }

  String _getPasswordErrorInfo() {
    if (StringUtil.isEmpty(passwordStr) ||
        passwordStr.length == VERIFICATION_MAX_LENGTH_DEFAULT) {
      return StringUtil.getEmpty;
    } else {
      return "请输入6位验证码";
    }
  }

  _phoneInputChange(String content) {
    setState(stateCallback: () {
      phoneStr = content;
    });
  }

  _passwordInputChange(String content) {
    setState(stateCallback: () {
      passwordStr = content;
    });
  }

  Widget _getLogoutWidget() {
    if (Platform.isIOS) {
      return Text("");
    } else {
      return FlatButton(
        textColor: Colors.blue,
        onPressed: () {
          pop();
        },
        child: Text("退出"),
      );
    }
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
              maxLength: PHONE_MAX_LENGTH_DEFAULT,
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
                    errorText: _getPasswordErrorInfo(),
                    helperText: "helper",
                  ),
                  textAlign: TextAlign.start,
                  enabled: true,
                  maxLength: VERIFICATION_MAX_LENGTH_DEFAULT,
                  onChanged: (String content) {
                    _passwordInputChange(content);
                  },
                ),
                FlatButton(
                  onPressed: () {
                    getVerificationCode();
                  },
                  child: Text("验证码"),
                  textColor: Colors.blue,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _getLogoutWidget(),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    login();
                  },
                  child: Text("登陆"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  getVerificationCode() {
    if (phoneStr.isEmpty) {
      setState(stateCallback: () {});
      return null;
    }
    showToast("验证码已发送");
    _presenter.getVerificationCode(data: {
      "mobile": phoneStr,
      "type": "APP_LOGIN",
    });
    return null;
  }

  @override
  getVerificationCodeFailure() {
    showToast("获取验证码失败，请检查后重试!");
    return null;
  }

  @override
  getVerificationCodeStart() {
    // TODO: implement getVerificationCodeStart
    return null;
  }

  @override
  getVerificationCodeStop() {
    // TODO: implement getVerificationCodeStop
    return null;
  }

  @override
  getVerificationCodeSuccess() {
    showToast("获取验证码成功，请注意查收!");
    return null;
  }

  @override
  login() {
    _presenter.login(data: {
      "mobile": phoneStr,
      "code": passwordStr,
    });
    return null;
  }

  @override
  loginFailure() {
    showToast("登陆失败，请检查后重试！");
    return null;
  }

  @override
  loginStart() {
    // TODO: implement loginStart
    return null;
  }

  @override
  loginStop() {
    // TODO: implement loginStop
    return null;
  }

  @override
  loginSuccess() {
    showToast("登陆成功");
//    Navigator.push(getContext(), MaterialPageRoute(builder: (BuildContext context){
//      return TestPage(enterParameter: EnterParameter(previousPageContext: getContext()));
//    }));
    return null;
  }

  @override
  setPresenter(presenter) {
    if (presenter is LoginPresenter) {
      _presenter = presenter;
    }
    return null;
  }
}
