import 'package:flutter/foundation.dart';

class Log {
  static void setLog(String text, {String tag = "Log"}) {
    if (kDebugMode) {
      print("$tag => $text");
    }
  }
}
