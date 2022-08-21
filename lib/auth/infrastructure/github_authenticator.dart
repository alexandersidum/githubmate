import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:githubmate/auth/domain/auth_failure.dart';
import 'package:githubmate/auth/infrastructure/credentials_storage/credential_storage.dart';
import 'package:githubmate/core/infrastructure/dio_extension.dart';
import 'package:githubmate/core/shared/encoders.dart';
import 'package:http/http.dart' as http;
import 'package:oauth2/oauth2.dart';

class GithubAuthenticator {
  GithubAuthenticator(
      {required CredentialsStorage credentialsStorage, required Dio dio})
      : _credentialsStorage = credentialsStorage,
        _dio = dio;

  final CredentialsStorage _credentialsStorage;
  final Dio _dio;
  final GithubHttpClient _customHttpClient = GithubHttpClient();
  static const _clientId = String.fromEnvironment('clientId');
  static const _clientSecret = String.fromEnvironment('clientSecret');
  static final authorizationEndpoint =
      Uri.parse('https://github.com/login/oauth/authorize');
  static final tokenEndpoint =
      Uri.parse('https://github.com/login/oauth/access_token');
  static final revocationEndpoint =
      Uri.parse('https://api.github.com/applications/$_clientId/token');
  static final redirectUri = Uri.parse('http://localhost:3000/callback');
  static final scopes = ['read:user', 'repo'];

  Future<bool> get isSignedIn =>
      getSignedInCredential().then((value) => value != null);

  Future<Credentials?> getSignedInCredential() async {
    try {
      final credentials = await _credentialsStorage.read();
      if (credentials == null) {
        return null;
      }
      if (credentials.canRefresh && credentials.isExpired) {
        final refreshResult = await refreshCredential(credentials);
        return refreshResult.fold(
            (failure) => null, (credential) => credential);
      }
      return null;
    } on PlatformException {
      return null;
    }
  }

  AuthorizationCodeGrant createAuthorizationGrant() {
    return AuthorizationCodeGrant(
        _clientId, authorizationEndpoint, tokenEndpoint,
        secret: _clientSecret, httpClient: GithubHttpClient());
  }

  Uri getAuthorizationUrl(AuthorizationCodeGrant grant) {
    return grant.getAuthorizationUrl(redirectUri, scopes: scopes);
  }

  Future<Either<AuthFailure, Unit>> handleAuthorizationResponse(
      AuthorizationCodeGrant grant, Map<String, String> parameters) async {
    try {
      final client = await grant.handleAuthorizationResponse(parameters);
      await _credentialsStorage.save(client.credentials);
      return right(unit);
    } on FormatException {
      return left(const AuthFailure.server());
    } on AuthorizationException catch (e) {
      return left(AuthFailure.server(message: "${e.error} : ${e.description}"));
    }
  }

  Future<Either<AuthFailure, Unit>> signOut() async {
    try {
      final credential = await _credentialsStorage.read();
      if (credential?.accessToken != null) {
        try {
          final basicAuth = Encoder.stringToBase64('$_clientId:$_clientSecret');
          await _dio.deleteUri(revocationEndpoint,
              options: Options(headers: {'Authorization': 'basic $basicAuth'}),
              data: {"access_token": credential!.accessToken});
        } on DioError catch (e) {
          if (e.isConnectionError) {
            // Ignore it so that signout still possible on offline user
          } else {
            // We didnt expect this error so need to rethrow
            rethrow;
          }
        }
      }
      await _credentialsStorage.clear();
      return right(unit);
    } on FormatException {
      return left(const AuthFailure.server());
    } on AuthorizationException catch (e) {
      return left(AuthFailure.server(message: "${e.error} : ${e.description}"));
    }
  }

  Future<Either<AuthFailure, Credentials>> refreshCredential(
      Credentials credentials) async {
    try {
      final refreshedCredentials = await credentials.refresh(
          identifier: _clientId,
          secret: _clientSecret,
          httpClient: _customHttpClient);
      await _credentialsStorage.save(refreshedCredentials);
      return right(refreshedCredentials);
    } on FormatException {
      return left(const AuthFailure.server());
    } on AuthorizationException catch (e) {
      return left(AuthFailure.server(message: "${e.error} : ${e.description}"));
    } on PlatformException {
      return left(const AuthFailure.storage());
    }
  }
}

//To Customize Send request on oauth2 package adding Accept Header to json
class GithubHttpClient extends http.BaseClient {
  http.Client client = http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers["Accept"] = 'application/json';
    return client.send(request);
  }
}
