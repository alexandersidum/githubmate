import 'package:dartz/dartz.dart';
import 'package:githubmate/core/domain/fresh.dart';
import 'package:githubmate/core/infrastructure/network_exceptions.dart';
import 'package:githubmate/github/core/domain/github_failure.dart';
import 'package:githubmate/github/core/domain/github_repo.dart';
import 'package:githubmate/github/core/infrastructure/github_repo_dto.dart';
import 'package:githubmate/github/repos/starred_repo/infrastructure/starred_repo_local_service.dart';
import 'package:githubmate/github/repos/starred_repo/infrastructure/starred_repo_remote_service.dart';

class StarredRepoRepository {
  StarredRepoRepository(this._remoteService, this._localService);

  final StarredRepoRemoteService _remoteService;
  final StarredRepoLocalService _localService;

  Future<Either<GithubFailure, Fresh<List<GithubRepo>>>> getStarredRepo(
      {int page = 1}) async {
    try {
      final response = await _remoteService.getStarredRepoPage(page);
      return right(await response.when(
          noConnection: (maxPage) async => Fresh.no(
              data: await _localService
                  .readPage(page)
                  .then((value) => value.toDomain()),
              isNextPageAvailable: page < maxPage),
          notModified: (maxPage) async => Fresh.yes(
              data: await _localService
                  .readPage(page)
                  .then((value) => value.toDomain()),
              isNextPageAvailable: page < maxPage),
          withNewData: (dtoList, maxPage) async {
            await _localService.upsertPage(dtoList, page);
            return Fresh.yes(
                data: dtoList.toDomain(), isNextPageAvailable: page < maxPage);
          }));
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
