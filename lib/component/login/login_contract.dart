import 'package:flutter/material.dart';
import 'package:flutter_app_sample/component/BasePresenter.dart';
import 'package:flutter_app_sample/component/BaseView.dart';

/// LoginPresenter
class LoginPresenter extends BasePresenter {
  late ILoginView _loginView;
  late LoginRepository _loginSource;

  LoginPresenter({
    required LoginRepository loginSource,
    required ILoginView loginView,
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
//    _loginSource.getVerificationCode(
//      data: data,
//      responseCallback: ResponseCallback(
//        successCallback: (SuccessData successData) {
//          /*
//          获取响应数据后，解析数据！
//          此解析数据形势不同与：Java等静态语言
//          类似于：JavaScript等动态语言
//           */
//          var result = successData.toObject();
//          StringBuffer stringBuffer = StringBuffer();
//          stringBuffer.writeln();
//          stringBuffer.writeln("-");
//          //遍历数据
//          result.forEach((String key, dynamic value) {
//
//            stringBuffer.writeln("key : $key , value: $value");
//
//          });
//          stringBuffer.writeln("-");
//          LogUtil.logWithTag(
//              tag: "LoginPresenter", message: stringBuffer.toString());
//
//          _loginView.getVerificationCodeSuccess();
//        },
//        failureCallback: (FailureData failureData) {
//          _loginView.getVerificationCodeFailure();
//        },
//      ),
//    );
  }

  @override
  login({@required dynamic data}) {
//    _loginSource.login(
//      data: data,
//      responseCallback: ResponseCallback(
//        successCallback: (SuccessData successData) {
//          //成功后，保存Token以及用户信息
//          LogUtil.log("登陆数据：${successData.data}");
//
//          _loginView.loginSuccess();
//        },
//        failureCallback: (FailureData failureData) {
//          _loginView.loginFailure();
//        },
//      ),
//    );
  }
}

///
/// ILoginView
abstract class ILoginView extends BaseView<LoginPresenter> {
  ///获取验证码
  getVerificationCode();

  ///开始获取验证码
  getVerificationCodeStart();

  ///完成获取验证码
  getVerificationCodeStop();

  ///获取验证码成功
  getVerificationCodeSuccess();

  ///获取验证码失败
  getVerificationCodeFailure();

  ///登陆
  login();

  ///登陆开始
  loginStart();

  ///登陆完成
  loginStop();

  ///登陆成功
  loginSuccess();

  ///登陆失败
  loginFailure();
}

class LoginRepository {
//  @override
//  getVerificationCode({
//    @required dynamic data,
//    @required ResponseCallback responseCallback,
//  }) {
//    HttpContext().postHttp(
//      postOption: PostOption(
//        urlPath: ApiConfig.GET_VERIFICATION_CODE_URL,
//        data: data,
//      ),
//      responseCallback: ResponseCallback(
//        successCallback: (SuccessData successData) {
//          //成功
//          responseCallback.successCallback(successData);
//        },
//        failureCallback: (FailureData failureData) {
//          //失败
//          responseCallback.failureCallback(failureData);
//        },
//      ),
//    );
//
//    return null;
//  }
//
//  @override
//  login({
//    @required dynamic data,
//    @required ResponseCallback responseCallback,
//  }) {
//    HttpContext().postHttp(
//      postOption: PostOption(
//        urlPath: ApiConfig.LOGIN_URL,
//        data: data,
//      ),
//      responseCallback: ResponseCallback(
//        successCallback: (SuccessData successData) {
//          responseCallback.successCallback(successData);
//        },
//        failureCallback: (FailureData failureData) {
//          responseCallback.failureCallback(failureData);
//        },
//      ),
//    );
//    return null;
//  }
}
