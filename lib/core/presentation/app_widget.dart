import 'package:flutter/material.dart';
import 'package:githubmate/auth/shared/providers.dart';
import 'package:githubmate/core/presentation/route/app_router.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// This provider exist only to initialize checking on app starting
final initializationProvider = FutureProvider((ref) async {
  final notifier = ref.read(authNotifierProvider.notifier);
  await notifier.checkAuth();
});

class MyApp extends ConsumerWidget {
  MyApp({Key? key}) : super(key: key);

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //This listen call will do nothing , the purpose is only to run the initialization provider once
    //on app start since provider is lazy
    ref.listen(initializationProvider, (previous, next) {});
    return MaterialApp.router(
        routeInformationParser: appRouter.defaultRouteParser(),
        routerDelegate: appRouter.delegate());
  }
}
