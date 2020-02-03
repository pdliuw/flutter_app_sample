import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';
import 'tip_type.dart';

///
/// TipHelper
class TipHelper {
  ///
  /// showTip
  /// [context]
  /// [title]
  /// [message]
  /// [tipType]
  static showTip({
    @required BuildContext context,
    String title,
    String message = '',
    TipType tipType = TipType.INFO,
  }) {
    List<Color> _tipStyleColorsSample = [
      Colors.blue[100],
      Colors.orange[100],
      Colors.red[100],
      Colors.green[200]
    ];
    List<Color> _tipIndicatorColorsSample = [
      Colors.blue[300],
      Colors.orange[300],
      Colors.red[300],
      Colors.blue[300]
    ];
    List<Color> _tipIconColorsSample = [
      Colors.blue[500],
      Colors.orange[500],
      Colors.red[500],
      Colors.blue[500]
    ];

    IconData _tipIcon;
    Color _tipStyleColor;
    Color _tipStyleIconColor;
    Color _tipStyleBorderColor;
    if (tipType == TipType.INFO) {
      title = title ?? "提示";
      _tipIcon = Icons.info_outline;
      _tipStyleColor = Colors.blue[100];
      _tipStyleIconColor = Colors.blue[500];
      _tipStyleBorderColor = Colors.blue[300];
    } else if (tipType == TipType.WARN) {
      title = title ?? "警告";
      _tipIcon = Icons.error_outline;
      _tipStyleColor = Colors.orange[100];
      _tipStyleIconColor = Colors.orange[500];
      _tipStyleBorderColor = Colors.orange[300];
    } else if (tipType == TipType.ERROR) {
      title = title ?? "错误";
      _tipIcon = Icons.cancel;
      _tipStyleColor = Colors.red[100];
      _tipStyleIconColor = Colors.red[500];
      _tipStyleBorderColor = Colors.red[300];
    } else if (tipType == TipType.COMPLETE) {
      title = title ?? "完成";
      _tipIcon = Icons.done_outline;
      _tipStyleColor = Colors.green[100];
      _tipStyleIconColor = Colors.green[500];
      _tipStyleBorderColor = Colors.green[300];
    } else {
      title = title ?? "默认";
      _tipIcon = Icons.info_outline;
      _tipStyleColor = Colors.blue[100];
      _tipStyleIconColor = Colors.blue[500];
      _tipStyleBorderColor = Colors.blue[300];
    }

    Flushbar(
      titleText: Text(
        "${title ?? '提示'}",
        style: TextStyle(
          color: Colors.black87,
        ),
      ),
      messageText: Text(
        "${message ?? '提示'}",
        style: TextStyle(
          color: Colors.black54,
        ),
      ),
      icon: Icon(
        _tipIcon,
        size: 28.0,
        color: _tipStyleIconColor,
      ),
      duration: Duration(
        seconds: 2,
      ),
      flushbarPosition: FlushbarPosition.TOP,
      shouldIconPulse: true,
      showProgressIndicator: false,
      flushbarStyle: FlushbarStyle.GROUNDED,
      backgroundColor: _tipStyleColor,
      borderColor: _tipStyleBorderColor,
    )..show(context);
  }
}
