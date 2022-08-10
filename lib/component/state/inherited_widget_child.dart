import 'package:flutter/material.dart';

///
/// InheritedWidgetChild
class InheritedWidgetChild extends InheritedWidget {
  final String name;

  InheritedWidgetChild({
    Key? key,
    required this.name,
    required Widget child,
  }) : super(key: key, child: child) {}

  @override
  bool updateShouldNotify(covariant InheritedWidgetChild oldWidget) {
    return this.name != oldWidget.name;
  }
}
