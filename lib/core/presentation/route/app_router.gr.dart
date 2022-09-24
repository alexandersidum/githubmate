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
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../../../auth/presentation/authorization_page.dart' as _i4;
import '../../../auth/presentation/sign_in_page.dart' as _i2;
import '../../../github/repos/search_repo/presentation/searched_repository_page.dart'
    as _i5;
import '../../../github/repos/starred_repo/presentation/starred_repository_page.dart'
    as _i3;
import '../../../splash/presentation/splash_page.dart' as _i1;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    SignInRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SignInPage());
    },
    StarredRepositoryRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.StarredRepositoryPage());
    },
    AuthorizationRoute.name: (routeData) {
      final args = routeData.argsAs<AuthorizationRouteArgs>();
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.AuthorizationPage(
              key: args.key,
              authorizationUrl: args.authorizationUrl,
              onAuthorizationRedirectAttempt:
                  args.onAuthorizationRedirectAttempt));
    },
    SearchRepositoryRoute.name: (routeData) {
      final args = routeData.argsAs<SearchRepositoryRouteArgs>();
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i5.SearchRepositoryPage(key: args.key, keyword: args.keyword));
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(SplashRoute.name, path: '/'),
        _i6.RouteConfig(SignInRoute.name, path: '/login'),
        _i6.RouteConfig(StarredRepositoryRoute.name, path: '/starred'),
        _i6.RouteConfig(AuthorizationRoute.name, path: '/authorization'),
        _i6.RouteConfig(SearchRepositoryRoute.name, path: '/search')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.SignInPage]
class SignInRoute extends _i6.PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: '/login');

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i3.StarredRepositoryPage]
class StarredRepositoryRoute extends _i6.PageRouteInfo<void> {
  const StarredRepositoryRoute()
      : super(StarredRepositoryRoute.name, path: '/starred');

  static const String name = 'StarredRepositoryRoute';
}

/// generated route for
/// [_i4.AuthorizationPage]
class AuthorizationRoute extends _i6.PageRouteInfo<AuthorizationRouteArgs> {
  AuthorizationRoute(
      {_i7.Key? key,
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

  final _i7.Key? key;

  final Uri authorizationUrl;

  final dynamic Function(Uri) onAuthorizationRedirectAttempt;

  @override
  String toString() {
    return 'AuthorizationRouteArgs{key: $key, authorizationUrl: $authorizationUrl, onAuthorizationRedirectAttempt: $onAuthorizationRedirectAttempt}';
  }
}

/// generated route for
/// [_i5.SearchRepositoryPage]
class SearchRepositoryRoute
    extends _i6.PageRouteInfo<SearchRepositoryRouteArgs> {
  SearchRepositoryRoute({_i7.Key? key, required String keyword})
      : super(SearchRepositoryRoute.name,
            path: '/search',
            args: SearchRepositoryRouteArgs(key: key, keyword: keyword));

  static const String name = 'SearchRepositoryRoute';
}

class SearchRepositoryRouteArgs {
  const SearchRepositoryRouteArgs({this.key, required this.keyword});

  final _i7.Key? key;

  final String keyword;

  @override
  String toString() {
    return 'SearchRepositoryRouteArgs{key: $key, keyword: $keyword}';
  }
}
