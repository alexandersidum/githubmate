import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:githubmate/auth/infrastructure/github_authenticator.dart';
import 'package:githubmate/core/shared/log.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'auth_notifier.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const AuthState._();
  const factory AuthState.initial() = _Initial;
  const factory AuthState.authenticated() = _Authenticated;
  const factory AuthState.unauthenticated() = _Unauthenticated;
  const factory AuthState.failure(String? message) = _Failure;
}

typedef AuthorizationCallback = Future<Uri> Function(Uri);

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier({required GithubAuthenticator authenticator})
      : _authenticator = authenticator,
        super(const AuthState.initial());

  final GithubAuthenticator _authenticator;

  Future<void> checkAuth() async {
    Log.setLog("Start checkAuth", tag: "checkAuth");

    final isSignedIn = await _authenticator.isSignedIn;
    Log.setLog("is signed in ? $isSignedIn", tag: "checkAuth");
    state = isSignedIn
        ? const AuthState.authenticated()
        : const AuthState.unauthenticated();
  }

  Future<void> signIn(AuthorizationCallback authorizationCallback) async {
    final grant = _authenticator.createAuthorizationGrant();
    Log.setLog("Start SignIn", tag: "signIn");
    final responseUri =
        await authorizationCallback(_authenticator.getAuthorizationUrl(grant));
    Log.setLog("Response Uri => $responseUri", tag: "signIn");
    final result = await _authenticator.handleAuthorizationResponse(
        grant, responseUri.queryParameters);
    state = result.fold((l) => AuthState.failure(l.toString()),
        (r) => const AuthState.authenticated());
    grant.close();
  }

  Future<void> signOut() async {
    final result = await _authenticator.signOut();
    state = result.fold((l) => AuthState.failure(l.toString()),
        (r) => const AuthState.unauthenticated());
  }
}
