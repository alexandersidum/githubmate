import 'package:flutter/services.dart';
import 'package:githubmate/auth/infrastructure/credentials_storage/credential_storage.dart';
import 'package:oauth2/oauth2.dart';

class GithubAuthenticator {
  GithubAuthenticator(this._credentialsStorage);

  final CredentialsStorage _credentialsStorage;
  static const _clientId = String.fromEnvironment('clientId');
  static const _clientSecret = String.fromEnvironment('clientSecret');
  static final authorizationEndpoint =
      Uri.parse('https://github.com/login/oauth/authorize');
  static final tokenEndpoint =
      Uri.parse('https://github.com/login/oauth/access_token');
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
        //TODO: Refresh Credentials
      }
      return null;
    } on PlatformException {
      return null;
    }
  }

  AuthorizationCodeGrant createAuthorizationGrant() {
    return AuthorizationCodeGrant(
      _clientId,
      authorizationEndpoint,
      tokenEndpoint,
      secret: _clientSecret,
    );
  }

  Uri getAuthorizationUrl(AuthorizationCodeGrant grant) {
    return grant.getAuthorizationUrl(redirectUri, scopes: scopes);
  }
}
