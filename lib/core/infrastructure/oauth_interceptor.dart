import 'package:dio/dio.dart';
import 'package:githubmate/auth/application/auth_notifier.dart';
import 'package:githubmate/auth/infrastructure/github_authenticator.dart';

class OAuth2Interceptor extends Interceptor {
  OAuth2Interceptor(this._authenticator, this._authNotifier, this._dio) {
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: onRequest, onError: onRetryError));
  }

  final GithubAuthenticator _authenticator;
  final AuthNotifier _authNotifier;
  final Dio _dio;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final credentials = await _authenticator.getSignedInCredential();
    final modifiedOptions = options
      ..headers.addAll(credentials == null
          ? {
              'Accept': 'application/vnd.github.v3.html+json',
            }
          : {
              'Accept': 'application/vnd.github.v3.html+json',
              'Authorization': 'bearer ${credentials.accessToken}'
            });

    handler.next(modifiedOptions);
  }

  @override
  Future<void> onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) async {
    final response = err.response;
    if (response != null && response.statusCode == 401) {
      //401 is unauthorized
      final credentials = await _authenticator.getSignedInCredential();
      if (credentials != null && credentials.canRefresh) {
        final refreshResult =
            await _authenticator.refreshCredential(credentials);
        await refreshResult.fold(
            (l) async => await _authenticator.clearCredentialStorage(),
            (r) async => await _retryRequest(err.requestOptions));
      }
    } else {
      handler.next(err);
    }
  }

  Future<void> _retryRequest(RequestOptions requestOptions) {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return _dio.request(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  Future<void> onRetryError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) async {
    final response = err.response;
    if (response != null && response.statusCode == 401) {
      await _authenticator.clearCredentialStorage();
      await _authNotifier.checkAuth();
    }
    handler.next(err);
  }
}
