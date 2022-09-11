import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:githubmate/auth/application/auth_notifier.dart';
import 'package:githubmate/auth/infrastructure/credentials_storage/credential_storage.dart';
import 'package:githubmate/auth/infrastructure/credentials_storage/secure_credential_storage.dart';
import 'package:githubmate/auth/infrastructure/github_authenticator.dart';
import 'package:githubmate/core/infrastructure/oauth_interceptor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authDioProvider = Provider<Dio>((ref) => Dio(BaseOptions(
      validateStatus: (status) =>
          status != null && status >= 200 && status < 400,
    )));
final oauthInterceptorProvider = Provider<OAuth2Interceptor>((ref) =>
    OAuth2Interceptor(ref.watch(githubAuthenticatorProvider),
        ref.watch(authNotifierProvider.notifier), ref.watch(authDioProvider)));
final secureStorageProvider =
    Provider<FlutterSecureStorage>((ref) => const FlutterSecureStorage());
final credentialStorageProvider = Provider<CredentialsStorage>(
    (ref) => SecureCredentialsStorage(ref.watch(secureStorageProvider)));
final githubAuthenticatorProvider =
    Provider<GithubAuthenticator>((ref) => GithubAuthenticator(
          credentialsStorage: ref.watch(credentialStorageProvider),
          dio: ref.watch(authDioProvider),
        ));

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
    (ref) =>
        AuthNotifier(authenticator: ref.watch(githubAuthenticatorProvider)));
