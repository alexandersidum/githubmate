import 'package:flutter/material.dart';
import 'package:githubmate/core/presentation/app_widget.dart';
import 'package:githubmate/setup.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeHive();
  runApp(ProviderScope(child: MyApp()));
}
