import 'dart:io';

import 'package:dio/dio.dart';

extension DioErrorExt on DioError {
  bool get isConnectionError =>
      type == DioErrorType.other && error is SocketException;
}
