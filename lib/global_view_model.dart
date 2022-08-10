import 'package:flutter/material.dart';

///
/// GlobalViewModel
class GlobalViewModel extends ChangeNotifier {
  static GlobalViewModel? _globalViewModel;

  ThemeMode _themeMode = ThemeMode.system;

  GlobalViewModel._();

  ///
  /// Instance
  static GlobalViewModel getInstance() {
    if (_globalViewModel == null) {
      _globalViewModel = GlobalViewModel._();
    }
    return _globalViewModel!;
  }

  ///
  /// LightTheme
  ThemeMode toggleLightThemeMode() {
    _themeMode = ThemeMode.light;
    //notify listeners adapter
    notifyListeners();
    return _themeMode;
  }

  ///
  /// DarkTheme
  ThemeMode toggleDarkThemeMode() {
    _themeMode = ThemeMode.dark;
    //notify listeners adapter
    notifyListeners();
    return _themeMode;
  }

  ///
  /// SystemTheme
  ThemeMode toggleSystemThemeMode() {
    _themeMode = ThemeMode.system;
    //notify listeners adapter
    notifyListeners();
    return _themeMode;
  }

  /// Toggle theme mode
  /// ToggleTheme(one of 'DarkTheme or LightTheme')
  ThemeMode toggleThemeMode() {
    _themeMode = _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    //notify listeners adapter
    notifyListeners();
    return _themeMode;
  }

  ThemeMode get themeMode => _themeMode;

  bool get isDarkTheme => _themeMode == ThemeMode.dark;

  bool get isLightTheme => _themeMode == ThemeMode.light;

  bool get isSystemTheme => _themeMode == ThemeMode.system;
}
