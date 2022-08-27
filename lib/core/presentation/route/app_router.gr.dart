// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../../../auth/presentation/authorization_page.dart' as _i4;
import '../../../auth/presentation/sign_in_page.dart' as _i2;
import '../../../github/presentation/starred_repository_page.dart' as _i3;
import '../../../splash/presentation/splash_page.dart' as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    SignInRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SignInPage());
    },
    StarredRepositoryRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.StarredRepositoryPage());
    },
    AuthorizationRoute.name: (routeData) {
      final args = routeData.argsAs<AuthorizationRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.AuthorizationPage(
              key: args.key,
              authorizationUrl: args.authorizationUrl,
              onAuthorizationRedirectAttempt:
                  args.onAuthorizationRedirectAttempt));
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(SplashRoute.name, path: '/'),
        _i5.RouteConfig(SignInRoute.name, path: '/login'),
        _i5.RouteConfig(StarredRepositoryRoute.name, path: '/starred'),
        _i5.RouteConfig(AuthorizationRoute.name, path: '/authorization')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.SignInPage]
class SignInRoute extends _i5.PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: '/login');

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i3.StarredRepositoryPage]
class StarredRepositoryRoute extends _i5.PageRouteInfo<void> {
  const StarredRepositoryRoute()
      : super(StarredRepositoryRoute.name, path: '/starred');

  static const String name = 'StarredRepositoryRoute';
}

/// generated route for
/// [_i4.AuthorizationPage]
class AuthorizationRoute extends _i5.PageRouteInfo<AuthorizationRouteArgs> {
  AuthorizationRoute(
      {_i6.Key? key,
      required Uri authorizationUrl,
      required dynamic Function(Uri) onAuthorizationRedirectAttempt})
      : super(AuthorizationRoute.name,
            path: '/authorization',
            args: AuthorizationRouteArgs(
                key: key,
                authorizationUrl: authorizationUrl,
                onAuthorizationRedirectAttempt:
                    onAuthorizationRedirectAttempt));

  static const String name = 'AuthorizationRoute';
}

class AuthorizationRouteArgs {
  const AuthorizationRouteArgs(
      {this.key,
      required this.authorizationUrl,
      required this.onAuthorizationRedirectAttempt});

  final _i6.Key? key;

  final Uri authorizationUrl;

  final dynamic Function(Uri) onAuthorizationRedirectAttempt;

  @override
  String toString() {
    return 'AuthorizationRouteArgs{key: $key, authorizationUrl: $authorizationUrl, onAuthorizationRedirectAttempt: $onAuthorizationRedirectAttempt}';
  }
}
