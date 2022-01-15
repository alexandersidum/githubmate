import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:githubmate/auth/domain/auth_failure.dart';
import 'package:githubmate/auth/infrastructure/credentials_storage/credential_storage.dart';
import 'package:githubmate/core/shared/encoder.dart';
import 'package:githubmate/core/infrastructure/dio_extension.dart';

import 'package:oauth2/oauth2.dart';
import 'package:http/http.dart' as http;

class GithubAuthenticator {
  GithubAuthenticator(this._credentialsStorage, this._dioClient);
  final CredentialsStorage _credentialsStorage;
  final Dio _dioClient;
  static const _clientId = String.fromEnvironment('clientId');
  static const _clientSecret = String.fromEnvironment('clientSecret');
  static final authorizationEndpoint =
      Uri.parse('https://github.com/login/oauth/authorize');
  static final tokenEndpoint =
      Uri.parse('https://github.com/login/oauth/access_token');
  static final redirectUri = Uri.parse('http://localhost:3000/callback');
  static const scopes = ['read:user', 'repo'];
  static const revokeEndpoint =
      'https://api.github.com/applications/$_clientId/grant';

  Future<bool> get isSignedIn =>
      getSignedInCredential().then((value) => value != null);

  Future<Credentials?> getSignedInCredential() async {
    try {
      final credentials = await _credentialsStorage.read();
      if (credentials == null) {
        return null;
      }
      if (credentials.canRefresh && credentials.isExpired) {
        //TODO: Refresh Credentials
      }
      return null;
    } on PlatformException {
      return null;
    }
  }

  AuthorizationCodeGrant createAuthorizationGrant() {
    return AuthorizationCodeGrant(
        _clientId, authorizationEndpoint, tokenEndpoint,
        secret: _clientSecret, httpClient: GithubOauthHttpClient());
  }

  Uri getAuthorizationUrl(AuthorizationCodeGrant grant) {
    return grant.getAuthorizationUrl(redirectUri, scopes: scopes);
  }

  Future<Either<AuthFailure, Unit>> handleAuthorizationResponse(
      AuthorizationCodeGrant grant, Map<String, String> queryParam) async {
    try {
      final client = await grant.handleAuthorizationResponse(queryParam);
      await _credentialsStorage.save(client.credentials);
      return right(unit);
    } on FormatException {
      return left(const AuthFailure.server());
    } on AuthorizationException catch (e) {
      return left(AuthFailure.server('${e.error}: ${e.description}'));
    } on PlatformException {
      return left(const AuthFailure.storage());
    }
  }

  Future<Either<AuthFailure, Unit>> signOut() async {
    try {
      await revokeToken();
      await _credentialsStorage.clear();
      return right(unit);
    } on SocketException {
      return left(const AuthFailure.server());
    } on PlatformException {
      return left(const AuthFailure.storage());
    }
  }

  Future revokeToken() async {
    try {
      final accessToken = await _credentialsStorage.read();
      await _dioClient.delete(revokeEndpoint,
          options: Options(headers: {
            'Authorization':
                'basic ${stringToBase64.encode('$_clientId:$_clientSecret')}'
          }),
          data: {'access_token': accessToken?.accessToken});
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        await _credentialsStorage.clear();
      } else {
        rethrow;
      }
    }
  }
}

//Custom Http Client to edit Accept header
//Used because github default response is not json
class GithubOauthHttpClient extends http.BaseClient {
  final httpClient = http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['Accept'] = 'application/json';
    return httpClient.send(request);
  }
}
