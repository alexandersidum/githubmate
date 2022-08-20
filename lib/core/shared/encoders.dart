import 'dart:convert';

class Encoder {
  static stringToBase64(String input) {
    return utf8.fuse(base64).encode(input);
  }
}
