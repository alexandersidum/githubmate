import 'package:githubmate/github/repos/starred_repo/infrastructure/starred_repo_repository.dart';

import '../../core/application/pagination_state_notifier.dart';

class StarredRepoStateNotifier extends PaginatedRepoNotifier {
  StarredRepoStateNotifier(this._repository);

  final StarredRepoRepository _repository;

  Future<void> getNextStarredRepoPage() async {
    await getNextRepoPage(_repository.getStarredRepoPage);
  }
}

// @freezed
// class StarredRepoState with _$StarredRepoState {
//   const StarredRepoState._();
//   const factory StarredRepoState.initial(
//       {required Fresh<List<GithubRepo>> repoList}) = _Initial;
//   const factory StarredRepoState.loading({
//     required Fresh<List<GithubRepo>> repoList,
//     required int itemPerPage,
//   }) = _Loading;
//   const factory StarredRepoState.loadSuccess(
//       {required Fresh<List<GithubRepo>> repoList}) = _LoadSuccess;
//   const factory StarredRepoState.loadFailure(
//       {required Fresh<List<GithubRepo>> repoList,
//       required GithubFailure failure}) = _LoadFailure;
// }
