import 'package:githubmate/core/infrastructure/hive_database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final hiveProvider = Provider<HiveDatabase>((ref) => HiveDatabase());