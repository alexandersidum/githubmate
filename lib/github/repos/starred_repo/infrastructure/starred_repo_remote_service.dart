import 'package:dio/dio.dart';
import 'package:githubmate/core/infrastructure/remote_response.dart';
import 'package:githubmate/github/core/infrastructure/github_headers_cache.dart';
import 'package:githubmate/github/core/infrastructure/github_repo_dto.dart';
import 'package:githubmate/github/core/infrastructure/pagination_config.dart';
import 'package:githubmate/github/repos/core/infrastructure/repos_remote_service.dart';

class StarredRepoRemoteService extends RepoRemoteService {
  StarredRepoRemoteService(this._dio, this._headersCache)
      : super(_dio, _headersCache);

  final baseUrl = "https://api.github.com";

  final Dio _dio;
  final GithubHeadersCache _headersCache;

  Future<RemoteResponse<List<GithubRepoDTO>>> getStarredRepoPage(
      int page) async {
    final requestUri = Uri.https("api.github.com", "/user/starred", {
      "page": page.toString(),
      "per_page": PaginationConfig.itemsPerPage.toString(),
    });

    return await getPage(requestUri,
        jsonDataSelector: (data) => data as List<dynamic>);
  }
}
