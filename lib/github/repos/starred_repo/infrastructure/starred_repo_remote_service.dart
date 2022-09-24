import 'package:githubmate/core/infrastructure/remote_response.dart';
import 'package:githubmate/github/core/infrastructure/github_repo_dto.dart';
import 'package:githubmate/github/core/infrastructure/pagination_config.dart';
import 'package:githubmate/github/repos/core/infrastructure/repos_remote_service.dart';

class StarredRepoRemoteService extends RepoRemoteService {
  StarredRepoRemoteService(super.dio, super.headersCache);

  final baseUrl = "https://api.github.com";

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
