import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_app_sample/common/config/EnvironmentConfig.dart';

///https://github.com/PonnamKarthik/FlutterToast
///
/// 提示工具类
class ToastUtil {
  static showToast({@required String message}) {
    if (message == null) {
      return;
    }
    Fluttertoast.showToast(
      msg: "${message}",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 1,
      backgroundColor: Colors.black45,
      textColor: Colors.white,
    );
  }

  static showToastDebug({@required String debugMsg}) {
    if (EnvironmentConfig.DEBUG_TOAST) {
      //调试环境下执行提示
      showToast(message: debugMsg);
    } else {
      //非调试环境下不执行
    }
  }
}
