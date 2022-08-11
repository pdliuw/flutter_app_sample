class StringUtil {
  static String get getEmpty => emptyString;
  static String emptyString = "";

  ///是否是空数据
  static bool isEmpty(Object object) {
    if (object == null) {
      return true;
    }
    if (object is String) {
      if (object.length == 0) {
        return true;
      } else {
        return false;
      }
    }

    return false;
  }

  ///是否是空对象
  static bool isNull(Object object) {
    if (object == null) {
      return true;
    } else {
      return false;
    }
  }
}
