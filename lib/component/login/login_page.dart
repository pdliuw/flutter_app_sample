import 'package:airoute/airoute.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_sample/common/config/StringConfig.dart';
import 'package:flutter_app_sample/common/util/StringUtil.dart';

import '../../common/util/ToastUtil.dart';
import 'login_contract.dart';

///登陆页面
///
///针对IOS和Android设备制定不同的设计
///1、逻辑：账号/手机号+验证码/密码的形势执行登陆操作！
///2、提示：账号/手机号为"11位"，验证码/密码位"6"位！
///5、平台：IOS平台没有"退出"按钮，Android平台有"退出"按钮！
class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

///
/// _LoginState
class _LoginState extends State<LoginPage> implements ILoginView {
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
    setState(() {
      phoneStr = content;
    });
  }

  _passwordInputChange(String content) {
    setState(() {
      passwordStr = content;
    });
  }

  Widget _getLogoutWidget() {
//    if (Platform.isIOS) {
//      return Text("");
//    } else {
    return FlatButton(
      textColor: Colors.blue,
      onPressed: () {
        ///退出程序！
//          exit(exitCode);
      },
      child: Text("退出"),
    );
//    }
  }

  Widget _createWidget() {
    return Scaffold(
      appBar: AppBar(
        title: Text("${StringConfig.pageNameConfig.mLoginPageName}"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            alignment: Alignment.center,
            width: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(),
                    ),
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
                        labelText: '验证码',
                        hintText: "请输入验证码",
                        errorText: _getPasswordErrorInfo(),
                        helperText: "helper",
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(),
                        ),
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
                    RaisedButton.icon(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      color: Colors.blue,
                      textColor: Colors.white,
                      onPressed: () {
                        login();
                      },
                      icon: Icon(
                        Icons.brightness_high,
                        color: Colors.white,
                      ),
                      label: Text("登陆"),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  getVerificationCode() {
    if (phoneStr.isEmpty) {
      setState(() {});
      return null;
    }
    ToastUtil.showToast(message: "验证码已发送");
    _presenter.getVerificationCode(data: {
      "mobile": phoneStr,
      "type": "APP_LOGIN",
    });
    return null;
  }

  @override
  getVerificationCodeFailure() {
    ToastUtil.showToast(message: "获取验证码失败，请检查后重试!");
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
    ToastUtil.showToast(message: "获取验证码成功，请注意查收!");
    return null;
  }

  @override
  login() {
//    _presenter.login(data: {
//      "mobile": phoneStr,
//      "code": passwordStr,
//    });
    Airoute.pushNamed(
      routeName: "/MainPage",
    );
    return null;
  }

  @override
  loginFailure() {
    return null;
  }

  @override
  loginStart() {
    return null;
  }

  @override
  loginStop() {
    return null;
  }

  @override
  loginSuccess() {
    //跳转到新页面
    return null;
  }

  @override
  setPresenter(presenter) {
    if (presenter is LoginPresenter) {
      _presenter = presenter;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return _createWidget();
  }
}
