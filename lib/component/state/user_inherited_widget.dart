import 'package:flutter/material.dart';
import 'package:flutter_app_sample/component/state/user_info.dart';

class UserInheritedWidget extends InheritedWidget {
  final UserInfo userInfo;

  UserInheritedWidget({this.userInfo, Widget child}) : super(child: child);

  static UserInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserInheritedWidget>();
  }

  @override
  bool updateShouldNotify(covariant UserInheritedWidget oldWidget) {
    return oldWidget.userInfo != userInfo;
  }
}
