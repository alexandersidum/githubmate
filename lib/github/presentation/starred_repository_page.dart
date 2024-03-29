import 'package:flutter/material.dart';
import 'package:githubmate/auth/shared/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StarredRepositoryPage extends ConsumerWidget {
  const StarredRepositoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              ref.read(authNotifierProvider.notifier).signOut();
            },
            child: const Text("Sign Out")),
      ),
    );
  }
}
