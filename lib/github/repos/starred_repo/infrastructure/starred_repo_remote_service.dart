import 'package:dio/dio.dart';
import 'package:githubmate/core/infrastructure/remote_response.dart';
import 'package:githubmate/github/core/infrastructure/github_repo_dto.dart';

class StarredRepoRemoteService {
  StarredRepoRemoteService(this._dio);

  final Dio _dio;

  Future<RemoteResponse<List<GithubRepoDTO>>> getStarredRepoPage(
      int page) async {
    throw UnimplementedError();
  }
}
