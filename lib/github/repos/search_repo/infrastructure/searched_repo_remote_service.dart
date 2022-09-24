import 'package:githubmate/core/infrastructure/remote_response.dart';
import 'package:githubmate/github/core/infrastructure/github_repo_dto.dart';
import 'package:githubmate/github/core/infrastructure/pagination_config.dart';
import 'package:githubmate/github/repos/core/infrastructure/repos_remote_service.dart';

class SearchedRepoRemoteService extends RepoRemoteService {
  SearchedRepoRemoteService(super.dio, super.headersCache);

  final baseUrl = "https://api.github.com";

  Future<RemoteResponse<List<GithubRepoDTO>>> getSearchedRepoPage(
      String keyword, int page) async {
    final requestUri = Uri.https("api.github.com", "/search/repositories", {
      "page": page.toString(),
      "q": keyword,
      "per_page": PaginationConfig.itemsPerPage.toString(),
    });

    return await getPage(requestUri,
        jsonDataSelector: (data) => data['items'] as List<dynamic>);
  }
}
