import 'package:flutter_app_sample/component/BasePresenter.dart';
import 'package:flutter_app_sample/component/login/LoginSource.dart';
import 'package:flutter_app_sample/component/login/LoginView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_sample/net/HttpContext.dart';

class LoginPresenter extends BasePresenter {
  LoginView _loginView;
  LoginSource _loginSource;

  LoginPresenter({
    @required LoginSource loginSource,
    @required LoginView loginView,
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

  getVerificationCode() {
    _loginSource.getVerificationCode(
      data: {
        "mobile": "18518176804",
        "type": "APP_LOGIN",
      },
      responseCallback: ResponseCallback(
        successCallback: (SuccessData successData) {
          _loginView.getVerificationCodeSuccess();
        },
        failureCallback: (FailureData failureData) {
          _loginView.getVerificationCodeFailure();
        },
      ),
    );
  }

  login() {
    _loginSource.login();
  }
}
