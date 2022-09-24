import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:githubmate/core/domain/fresh.dart';
import 'package:githubmate/github/core/domain/github_failure.dart';
import 'package:githubmate/github/core/domain/github_repo.dart';
import 'package:githubmate/github/core/infrastructure/pagination_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'pagination_state_notifier.freezed.dart';

typedef RepositoryGetter
    = Future<Either<GithubFailure, Fresh<List<GithubRepo>>>> Function(int page);

@freezed
class PaginatedRepoState with _$PaginatedRepoState {
  const PaginatedRepoState._();
  const factory PaginatedRepoState.initial(
      {required Fresh<List<GithubRepo>> repoList}) = _Initial;
  const factory PaginatedRepoState.loading({
    required Fresh<List<GithubRepo>> repoList,
    required int itemPerPage,
  }) = _Loading;
  const factory PaginatedRepoState.loadSuccess(
      {required Fresh<List<GithubRepo>> repoList}) = _LoadSuccess;
  const factory PaginatedRepoState.loadFailure(
      {required Fresh<List<GithubRepo>> repoList,
      required GithubFailure failure}) = _LoadFailure;
}

class PaginatedRepoNotifier extends StateNotifier<PaginatedRepoState> {
  PaginatedRepoNotifier()
      : super(PaginatedRepoState.initial(repoList: Fresh.yes(data: [])));

  int _currentPage = 1;

  @protected
  Future<void> getNextRepoPage(RepositoryGetter getter) async {
    state = PaginatedRepoState.loading(
        repoList: state.repoList, itemPerPage: PaginationConfig.itemsPerPage);

    final result = await getter(_currentPage);

    state = result.fold(
        (l) => PaginatedRepoState.loadFailure(
            repoList: state.repoList, failure: l), (r) {
      _currentPage++;
      return PaginatedRepoState.loadSuccess(
          repoList: r.copyWith(data: [...state.repoList.data, ...r.data]));
    });
  }
}
