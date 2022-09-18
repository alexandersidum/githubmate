import 'package:dio/dio.dart';
import 'package:githubmate/core/infrastructure/dio_extension.dart';
import 'package:githubmate/core/infrastructure/network_exceptions.dart';
import 'package:githubmate/core/infrastructure/remote_response.dart';
import 'package:githubmate/core/shared/log.dart';
import 'package:githubmate/github/core/infrastructure/github_headers.dart';
import 'package:githubmate/github/core/infrastructure/github_headers_cache.dart';
import 'package:githubmate/github/core/infrastructure/github_repo_dto.dart';

abstract class RepoRemoteService {
  RepoRemoteService(this._dio, this._headersCache);

  final acceptHeader = "application/vnd.github.v3.html+json";

  final Dio _dio;
  final GithubHeadersCache _headersCache;

  Future<RemoteResponse<List<GithubRepoDTO>>> getPage(Uri requestUri,
      {required List<dynamic> Function(dynamic json) jsonDataSelector}) async {
    final prevHeader = await _headersCache.getHeader(requestUri);

    try {
      final response = await _dio.getUri(requestUri,
          options: Options(headers: {
            "Accept": acceptHeader,
            "If-None-Match": prevHeader?.etag ?? '',
          }));
      if (response.statusCode == 304) {
        return RemoteResponse.notModified(
            maxPage: prevHeader?.link?.maxPage ?? 0);
      }
      if (response.statusCode == 200) {
        final newHeaders = GithubHeaders.parse(response);
        await _headersCache.saveHeader(requestUri, newHeaders);

        Log.setLog("Response Data => ${response.data}", tag: "getPage");

        final convertedData = jsonDataSelector(response.data);
        return RemoteResponse.withNewData(
          convertedData.map((e) => GithubRepoDTO.fromJson(e)).toList(),
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
