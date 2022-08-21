import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:githubmate/auth/application/auth_notifier.dart';
import 'package:githubmate/auth/infrastructure/credentials_storage/credential_storage.dart';
import 'package:githubmate/auth/infrastructure/credentials_storage/secure_credential_storage.dart';
import 'package:githubmate/auth/infrastructure/github_authenticator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dioProvider = Provider<Dio>((ref) => Dio());
final secureStorageProvider =
    Provider<FlutterSecureStorage>((ref) => const FlutterSecureStorage());
final credentialStorageProvider = Provider<CredentialsStorage>(
    (ref) => SecureCredentialsStorage(ref.watch(secureStorageProvider)));
final githubAuthenticatorProvider =
    Provider<GithubAuthenticator>((ref) => GithubAuthenticator(
          credentialsStorage: ref.watch(credentialStorageProvider),
          dio: ref.watch(dioProvider),
        ));

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
    (ref) =>
        AuthNotifier(authenticator: ref.watch(githubAuthenticatorProvider)));
