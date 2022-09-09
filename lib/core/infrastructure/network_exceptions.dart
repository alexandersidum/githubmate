class RestApiException implements Exception {
  const RestApiException(this.errorCode, {this.message});
  final int? errorCode;
  final String? message;
}
