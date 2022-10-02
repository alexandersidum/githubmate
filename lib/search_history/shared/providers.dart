import 'package:githubmate/search_history/application/search_history_notifier.dart';
import 'package:githubmate/search_history/infrastructure/search_history_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final searchHistoryRepositoryProvider =
    Provider((ref) => SearchHistoryRepository());
final searchHistoryNotifierProvider =
    StateNotifierProvider<SearchHistoryNotifier, SearchHistoryState>((ref) =>
        SearchHistoryNotifier(ref.watch(searchHistoryRepositoryProvider)));
