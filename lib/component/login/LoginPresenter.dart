import 'package:flutter_app_sample/component/BasePresenter.dart';
import 'package:flutter_app_sample/component/login/LoginSource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_sample/net/HttpContext.dart';
import 'package:flutter_app_sample/component/login/LoginContract.dart';

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
    _loginSource.login();
  }
}
