import 'package:dartz/dartz.dart';
import 'package:githubmate/core/domain/fresh.dart';
import 'package:githubmate/core/infrastructure/network_exceptions.dart';
import 'package:githubmate/github/core/domain/github_failure.dart';
import 'package:githubmate/github/core/domain/github_repo.dart';
import 'package:githubmate/github/core/infrastructure/github_repo_dto.dart';
import 'package:githubmate/github/repos/search_repo/infrastructure/searched_repo_remote_service.dart';

class SearchedRepoRepository {
  SearchedRepoRepository(this._remoteService);

  final SearchedRepoRemoteService _remoteService;

  Future<Either<GithubFailure, Fresh<List<GithubRepo>>>> getSearchedRepoPage(
      String keyword, int page) async {
    try {
      final response = await _remoteService.getSearchedRepoPage(keyword, page);
      return right(await response.maybeWhen(
          orElse: () => Fresh.no(
                data: [],
              ),
          withNewData: (dtoList, maxPage) async {
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
