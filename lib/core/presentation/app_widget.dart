import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:githubmate/auth/application/auth_notifier.dart';
import 'package:githubmate/auth/shared/providers.dart';
import 'package:githubmate/core/presentation/route/app_router.gr.dart';
import 'package:githubmate/core/shared/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

// This provider exist only to initialize checking on app starting
final initializationProvider = FutureProvider((ref) async {
  final notifier = ref.read(authNotifierProvider.notifier);
  ref.read(dioProvider)
    ..interceptors.add(ref.watch(oauthInterceptorProvider))
    ..options = BaseOptions(
      validateStatus: (status) =>
          status != null && status >= 200 && status < 400,
    );
  await notifier.checkAuth();
});

class MyApp extends ConsumerWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //This listen call will do nothing , the purpose is only to run the initialization provider once
    //on app start since provider is lazy and wont run if its not used
    ref.listen(initializationProvider, (_, __) {});
    ref.listen<AuthState>(authNotifierProvider, (previous, next) {
      next.maybeMap(
        orElse: () {},
        authenticated: (state) {
          _appRouter.pushAndPopUntil(const StarredRepositoryRoute(),
              predicate: ((route) => false));
        },
        unauthenticated: (state) {
          _appRouter.pushAndPopUntil(const SignInRoute(),
              predicate: ((route) => false));
        },
        failure: (state) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message ?? '')));
        },
      );
    });
    return MaterialApp.router(
        routeInformationParser: _appRouter.defaultRouteParser(),
        builder: (context, child) => ResponsiveWrapper.builder(
              BouncingScrollWrapper.builder(context, child!),
              // maxWidth: 800,
              // minWidth: 480,
              // child,
              defaultScale: true,
              breakpoints: [
                const ResponsiveBreakpoint.resize(480, name: MOBILE),
                const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
              ],
            ),
        routerDelegate: _appRouter.delegate());
  }
}
