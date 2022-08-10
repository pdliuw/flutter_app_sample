import 'package:flutter/material.dart';

class AppPageRoute<T> extends PageRoute<T> {
  @override
  Color get barrierColor => Colors.white;

  @override
  String get barrierLabel => "null";

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return Container();
  }

  @override
  bool get maintainState => false;

  @override
  Duration get transitionDuration => Duration();
}
