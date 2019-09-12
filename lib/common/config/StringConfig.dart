import 'package:flutter_app_sample/common/config/PageNameConfig.dart';

class StringConfig{


  static final PageNameConfig _pageNameConfig = PageNameConfig();

  ///Get PageNameConfig object!
  static PageNameConfig get pageNameConfig{
    return _pageNameConfig;
  }
}