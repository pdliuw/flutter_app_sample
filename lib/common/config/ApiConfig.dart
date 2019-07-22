import 'package:flutter_app_sample/common/config/EnvironmentConfig.dart';

///
///
///
class ApiConfig {
  static const String RELEASE_URL = "http://101.201.77.210";
  static const String TEST_URL = "http://101.201.77.210";
  static const String DEBUG_URL = "http://101.201.77.210";
  static String BASE_URL = getUrl();
  static const int CONNECT_TIME_OUT = 5000;
  static const int RECEIVE_TIME_OUT = 3000;

  static String getUrl() {
    if (EnvironmentConfig.DEBUG_URL) {
      return TEST_URL;
    } else {
      return RELEASE_URL;
    }
  }
}
