import 'package:flutter/material.dart';

/// AppGlobalModel
class AppGlobalModel {
  AppGlobalModel._internal();

  static AppGlobalModel? _instance;

  static AppGlobalModel get instance {
    return _instance ??= AppGlobalModel._internal();
  }

  final ValueNotifier<bool> clockNotifier = ValueNotifier(false);
}
