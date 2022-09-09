import 'package:dio/dio.dart';
import 'package:githubmate/core/infrastructure/dio_extension.dart';
import 'package:githubmate/core/infrastructure/network_exceptions.dart';
import 'package:githubmate/core/infrastructure/remote_response.dart';
import 'package:githubmate/github/core/infrastructure/github_headers.dart';
import 'package:githubmate/github/core/infrastructure/github_headers_cache.dart';
import 'package:githubmate/github/core/infrastructure/github_repo_dto.dart';

class StarredRepoRemoteService {
  StarredRepoRemoteService(this._dio, this._headersCache);

  final baseUrl = "https://api.github.com";
  final acceptHeader = "application/vnd.github.v3.html+json";
  //TODO Token etc
  final token = "";

  final Dio _dio;
  final GithubHeadersCache _headersCache;

  Future<RemoteResponse<List<GithubRepoDTO>>> getStarredRepoPage(
      int page) async {
    final requestUri =
        Uri.https("api.github.com", "/user/starred", {"page": page});

    final prevHeader = await _headersCache.getHeader(requestUri);

    try {
      final response = await _dio.getUri(requestUri,
          options: Options(headers: {
            "Authorization": "bearer $token",
            "Accept": "acceptHeader",
            "If-None-Match": prevHeader?.etag ?? '',
          }));
      if (response.statusCode == 304) {
        return RemoteResponse.notModified(
            maxPage: prevHeader?.link?.maxPage ?? 0);
      }
      if (response.statusCode == 200) {
        final newHeaders = GithubHeaders.parse(response);
        await _headersCache.saveHeader(requestUri, newHeaders);
        return RemoteResponse.withNewData(
          List<Map<String, dynamic>>.from(response.data)
              .map((e) => GithubRepoDTO.fromJson(e))
              .toList(),
          maxPage: newHeaders.link?.maxPage ?? 1,
        );
      }
      throw RestApiException(response.statusCode);
    } on DioError catch (e) {
      if (e.isConnectionError) {
        return RemoteResponse.noConnection(
            maxPage: prevHeader?.link?.maxPage ?? 0);
      } else if (e.response != null) {
        throw RestApiException(e.response!.statusCode);
      } else {
        rethrow;
      }
    }
  }
}
