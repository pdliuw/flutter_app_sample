import 'package:flutter_app_sample/component/login/LoginSource.dart';
import 'package:flutter_app_sample/net/HttpContext.dart';
import 'package:flutter/material.dart';

class LoginRepository extends LoginSource {
  @override
  getVerificationCode({
    @required dynamic data,
    @required ResponseCallback responseCallback,
  }) {
    HttpContext().postHttp(
      postOption: PostOption(
        urlPath: "/api/app/v1/LoginCtrl/getVerificationCode",
        data: data,
      ),
      responseCallback: ResponseCallback(
        successCallback: (SuccessData successData) {
          //成功
          responseCallback.successCallback(successData);
        },
        failureCallback: (FailureData failureData) {
          //失败
          responseCallback.failureCallback(failureData);
        },
      ),
    );

    return null;
  }

  @override
  login() {
    return null;
  }
}
