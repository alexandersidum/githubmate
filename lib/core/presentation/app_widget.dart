import 'package:flutter/material.dart';
import 'package:githubmate/auth/application/auth_notifier.dart';
import 'package:githubmate/auth/shared/providers.dart';
import 'package:githubmate/core/presentation/route/app_router.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// This provider exist only to initialize checking on app starting
final initializationProvider = FutureProvider((ref) async {
  final notifier = ref.read(authNotifierProvider.notifier);
  // final hive = ref.read(hiveProvider);
  // final cache = ref.read(githubHeaderCacheProvider);
  // Log.setLog("Saving Header");
  // await cache.saveHeader(Uri.parse("www.google.com"),
  //     const GithubHeaders(etag: "etagTest", link: PaginationLink(maxPage: 2)));
  // Log.setLog("Loading Header");
  // final header = await cache.getHeader(
  //   Uri.parse("www.google.com"),
  // );
  // Log.setLog("Header is $header");

  await notifier.checkAuth();
});

class MyApp extends ConsumerWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //This listen call will do nothing , the purpose is only to run the initialization provider once
    //on app start since provider is lazy
    ref.listen(initializationProvider, (previous, next) {});
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
        routerDelegate: _appRouter.delegate());
  }
}
