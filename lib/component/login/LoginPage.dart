import 'package:flutter/material.dart';
import 'package:flutter_app_sample/component/main/MainPage.dart';
//import 'dart:io';
import 'package:flutter_app_sample/ui/base/AppCommonStatefulPage.dart';
import 'package:flutter_app_sample/common/util/StringUtil.dart';
import 'package:flutter_app_sample/component/login/LoginContract.dart';
import 'package:flutter_app_sample/component/login/LoginRepository.dart';
import 'package:flutter_app_sample/component/login/LoginPresenter.dart';
import 'package:flutter_app_sample/component/test/TestPage.dart';
import 'package:flutter_app_sample/ui/route/AppRoute.dart';
import 'package:flutter_app_sample/component/shop/ShoppingList.dart';
import 'package:flutter_app_sample/component/shop/Product.dart';
import 'package:flutter_app_sample/common/config/StringConfig.dart';

///登陆页面
///
///针对IOS和Android设备制定不同的设计
///1、逻辑：账号/手机号+验证码/密码的形势执行登陆操作！
///2、提示：账号/手机号为"11位"，验证码/密码位"6"位！
///5、平台：IOS平台没有"退出"按钮，Android平台有"退出"按钮！
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
      titleName: StringConfig.pageNameConfig.mLoginPageName,
      showBackArrow: false,
      showAppBar: true,
      customBuildWidget: true,
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

  @override
  Widget createWidget() {
    return Scaffold(
      appBar: AppBar(
        title: Text("${StringConfig.pageNameConfig.mLoginPageName}"),
      ),
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: SizedBox(
          width: 250,
          child: SingleChildScrollView(
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
//    _presenter.login(data: {
//      "mobile": phoneStr,
//      "code": passwordStr,
//    });
    pushNamed(
        routeName: "MainPage",
        enterParameter: EnterParameter(previousPageContext: getContext()));
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
    Navigator.push(getContext(),
        MaterialPageRoute(builder: (BuildContext buildContext) {
      return ShoppingListPage(
        products: <Product>[
          Product(
            name: "One",
            originPrice: "150.0",
            nowPrice: "99.0",
          ),
          Product(
            name: "Two",
            originPrice: "1000.0",
            nowPrice: "109.0",
          ),
          Product(
            name: "Three",
            originPrice: "190.0",
            nowPrice: "89.0",
          ),
          Product(
            name: "Four",
            originPrice: "580.0",
            nowPrice: "180.0",
          ),
          Product(
            name: "Five",
            originPrice: "358.0",
            nowPrice: "88.0",
          ),
        ],
      );
    }));
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
