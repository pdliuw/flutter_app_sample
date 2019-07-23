import 'package:flutter_app_sample/component/BaseView.dart';
import 'package:flutter_app_sample/component/login/LoginPresenter.dart';
///Login component-View
abstract class LoginView extends BaseView<LoginPresenter>{
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
