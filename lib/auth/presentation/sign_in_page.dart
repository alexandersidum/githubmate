import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:githubmate/auth/shared/providers.dart';
import 'package:githubmate/core/presentation/route/app_router.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            MdiIcons.github,
            size: 150,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Welcome to Githubmate",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                ref.read(authNotifierProvider.notifier).signIn((uri) {
                  //Run Webview
                  final completer = Completer<Uri>();
                  AutoRouter.of(context).push(AuthorizationRoute(
                    authorizationUrl: uri,
                    onAuthorizationRedirectAttempt: (redirectedUri) {
                      completer.complete(redirectedUri);
                    },
                  ));
                  return completer.future;
                  // print('start webviewing');
                  // final redirected = await AutoRouter.of(context)
                  //     .push<Uri?>(AuthorizationRoute(
                  //   authorizationUrl: uri,
                  //   onAuthorizationRedirectAttempt: (redirectedUri) {
                  //     // completer.complete(redirectedUri);
                  //   },
                  // ));

                  // print('end webviewing $redirected');
                  // if (redirected == null) {
                  //   throw Exception('Fail to Authorize');
                  // }
                  // return redirected;
                });
              },
              child: const Text("Sign In"),
              style: ElevatedButton.styleFrom(primary: Colors.green),
            ),
          )
        ],
      ),
    );
  }
}
