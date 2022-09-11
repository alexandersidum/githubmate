import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:githubmate/core/domain/fresh.dart';
import 'package:githubmate/github/core/domain/github_failure.dart';
import 'package:githubmate/github/core/domain/github_repo.dart';
import 'package:githubmate/github/core/infrastructure/pagination_config.dart';
import 'package:githubmate/github/repos/starred_repo/infrastructure/starred_repo_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'starred_repo_state_notifier.freezed.dart';

class StarredRepoStateNotifier extends StateNotifier<StarredRepoState> {
  StarredRepoStateNotifier(this._repository)
      : super(StarredRepoState.initial(repoList: Fresh.yes(data: [])));

  final StarredRepoRepository _repository;

  int _currentPage = 1;

  Future<void> getNextStarredRepoPage() async {
    state = StarredRepoState.loading(
        repoList: state.repoList, itemPerPage: PaginationConfig.itemsPerPage);

    final result = await _repository.getStarredRepoPage(_currentPage);

    state = result.fold(
        (l) =>
            StarredRepoState.loadFailure(repoList: state.repoList, failure: l),
        (r) {
      _currentPage++;
      return StarredRepoState.loadSuccess(
          repoList: r.copyWith(data: [...state.repoList.data, ...r.data]));
    });
  }
}

@freezed
class StarredRepoState with _$StarredRepoState {
  const StarredRepoState._();
  const factory StarredRepoState.initial(
      {required Fresh<List<GithubRepo>> repoList}) = _Initial;
  const factory StarredRepoState.loading({
    required Fresh<List<GithubRepo>> repoList,
    required int itemPerPage,
  }) = _Loading;
  const factory StarredRepoState.loadSuccess(
      {required Fresh<List<GithubRepo>> repoList}) = _LoadSuccess;
  const factory StarredRepoState.loadFailure(
      {required Fresh<List<GithubRepo>> repoList,
      required GithubFailure failure}) = _LoadFailure;
}
