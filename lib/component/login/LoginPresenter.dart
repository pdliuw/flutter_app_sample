import 'package:flutter_app_sample/component/BasePresenter.dart';
import 'package:flutter_app_sample/component/login/LoginSource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_sample/net/HttpContext.dart';
import 'package:flutter_app_sample/component/login/LoginContract.dart';
import 'package:flutter_app_sample/common/util/LogUtil.dart';
import 'package:flutter_app_sample/data/response/User.dart';

class LoginPresenter extends ILoginPresenter {
  ILoginView _loginView;
  LoginSource _loginSource;

  LoginPresenter({
    @required LoginSource loginSource,
    @required ILoginView loginView,
  }) {
    this._loginSource = loginSource;
    this._loginView = loginView;

    _loginView.setPresenter(this);
  }
  @override
  create() {
    return null;
  }

  @override
  destroy() {
    return null;
  }

  @override
  getVerificationCode({@required dynamic data}) {
    _loginSource.getVerificationCode(
      data: data,
      responseCallback: ResponseCallback(
        successCallback: (SuccessData successData) {
          /*
          获取响应数据后，解析数据！
          此解析数据形势不同与：Java等静态语言
          类似于：JavaScript等动态语言
           */
          var result = successData.toObject();
          StringBuffer stringBuffer = StringBuffer();
          stringBuffer.writeln();
          stringBuffer.writeln("-");
          //遍历数据
          result.forEach((String key, dynamic value) {

            stringBuffer.writeln("key : $key , value: $value");

          });
          stringBuffer.writeln("-");
          LogUtil.logWithTag(
              tag: "LoginPresenter", message: stringBuffer.toString());

          _loginView.getVerificationCodeSuccess();
        },
        failureCallback: (FailureData failureData) {
          _loginView.getVerificationCodeFailure();
        },
      ),
    );
  }

  @override
  login({@required dynamic data}) {
    _loginSource.login(
      data: data,
      responseCallback: ResponseCallback(
        successCallback: (SuccessData successData) {
          //成功后，保存Token以及用户信息
          LogUtil.log("登陆数据：${successData.data}");

          _loginView.loginSuccess();
        },
        failureCallback: (FailureData failureData) {
          _loginView.loginFailure();
        },
      ),
    );
  }
}
