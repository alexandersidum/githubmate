import 'package:dartz/dartz.dart';
import 'package:githubmate/core/domain/fresh.dart';
import 'package:githubmate/core/infrastructure/network_exceptions.dart';
import 'package:githubmate/github/core/domain/github_failure.dart';
import 'package:githubmate/github/core/domain/github_repo.dart';
import 'package:githubmate/github/core/infrastructure/github_repo_dto.dart';
import 'package:githubmate/github/repos/starred_repo/infrastructure/starred_repo_remote_service.dart';

class StarredRepoRepository {
  StarredRepoRepository(this._remoteService);

  final StarredRepoRemoteService _remoteService;

  Future<Either<GithubFailure, Fresh<List<GithubRepo>>>> getStarredRepo(
      {int page = 1}) async {
    try {
      //TODO Local Service
      final response = await _remoteService.getStarredRepoPage(page);
      return right(response.when(
          noConnection: (maxPage) =>
              Fresh.no(data: [], isNextPageAvailable: page < maxPage),
          notModified: (maxPage) =>
              Fresh.yes(data: [], isNextPageAvailable: page < maxPage),
          //TODO Cache if it bring new data
          withNewData: (dtoList, maxPage) => Fresh.yes(
              data: dtoList.toDomain(), isNextPageAvailable: page < maxPage)));
    } on RestApiException {
      return left(const GithubFailure.api());
    }
  }
}

extension ListGithubRepoDtoToDomain on List<GithubRepoDTO> {
  List<GithubRepo> toDomain() {
    return map((e) => e.toDomain()).toList();
  }
}
