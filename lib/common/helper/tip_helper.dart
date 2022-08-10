import 'package:ai_awesome_message/ai_awesome_message.dart' as awesome_message;
import 'package:airoute/airoute.dart';
import 'package:flutter/material.dart';

import 'tip_type.dart' as tip_type;

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
    required BuildContext context,
    String? title,
    String message = '',
    tip_type.TipType tipType = tip_type.TipType.INFO,
  }) {
    awesome_message.TipType awesomeTipType;
    if (tipType == tip_type.TipType.INFO) {
      awesomeTipType = awesome_message.TipType.INFO;
    } else if (tipType == tip_type.TipType.WARN) {
      awesomeTipType = awesome_message.TipType.WARN;
    } else if (tipType == tip_type.TipType.ERROR) {
      awesomeTipType = awesome_message.TipType.ERROR;
    } else if (tipType == tip_type.TipType.COMPLETE) {
      awesomeTipType = awesome_message.TipType.COMPLETE;
    } else {
      awesomeTipType = awesome_message.TipType.INFO;
    }
    Airoute.push(
      route: awesome_message.AwesomeMessageRoute(
        theme: null,
        settings: RouteSettings(name: "/ai_awesome_message"),
        awesomeMessage: awesome_message.AwesomeHelper.createAwesome(
          title: "${title ?? "提示"}",
          message: "${message}",
          tipType: awesomeTipType,
        ),
      ),
    );
  }
}
