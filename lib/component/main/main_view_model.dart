import 'package:flutter/material.dart';

/// MainViewModel
class MainViewModel extends ChangeNotifier {
  static MainViewModel? _instance;

  MainViewModel._();

  static MainViewModel getInstance() {
    if (_instance == null) {
      _instance = MainViewModel._();
    }
    return _instance!;
  }

  void notify() {
    notifyListeners();
  }

  static void releaseInstance() {
    _instance = null;
  }
}
