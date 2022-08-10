class LogUtil {
  static final StringBuffer stringBuffer = new StringBuffer();

  static void log(Object object) {
    print("${object}");
  }

  static void logWithTag({String? tag, Object? message}) {
    print("${createLine()}");

    String all = "TAG:$tag, $message";
    print("$all");

    print("${createLine()}");
  }

  static String createSpace({int value = 0}) {
    stringBuffer.clear();

    for (int i = 0; i < value; i++) {
      stringBuffer.write(" ");
    }
    return stringBuffer.toString();
  }

  static String createLine({int max = 100}) {
    stringBuffer.clear();

    for (int i = 0; i < max; i++) {
      stringBuffer.write("-");
    }

    return stringBuffer.toString();
  }
}
