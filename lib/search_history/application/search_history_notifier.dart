import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:githubmate/search_history/infrastructure/search_history_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'search_history_notifier.freezed.dart';

// @freezed
// class SearchHistoryState with _$SearchHistoryState {
//   const SearchHistoryState._();
//   const factory SearchHistoryState({required List<String> historyList}) =
//       _SearchHistoryState;
// }

@freezed
class SearchHistoryState with _$SearchHistoryState {
  const SearchHistoryState._();
  const factory SearchHistoryState.initial() = _Initial;
  const factory SearchHistoryState.data({required List<String> searchHistory}) =
      _Data;
  const factory SearchHistoryState.error(String message) = _Error;
}

class SearchHistoryNotifier extends StateNotifier<SearchHistoryState> {
  SearchHistoryNotifier(this._repository)
      : super(const SearchHistoryState.initial());

  final SearchHistoryRepository _repository;
  StreamSubscription? searchHistorySubscription;

  @override
  void dispose() {
    searchHistorySubscription?.cancel();
    super.dispose();
  }

  void watchSearchHistory({String? keyword}) {
    searchHistorySubscription?.cancel();
    searchHistorySubscription =
        _repository.streamSearchHistoryData(keyword: keyword).listen((event) {
      state = SearchHistoryState.data(searchHistory: event);
    }, onError: (err) {
      state = SearchHistoryState.error(err.toString());
    });
  }

  Future<void> deleteSearchHistory(String keyword) async {
    await _repository.deleteSearchHistory(keyword);
  }

  Future<void> addSearchHistory(String keyword) async {
    await _repository.addSearchHistory(keyword);
  }
}
