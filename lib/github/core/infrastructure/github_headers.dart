import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'github_headers.freezed.dart';
part 'github_headers.g.dart';

@freezed
class GithubHeaders with _$GithubHeaders {
  factory GithubHeaders.parse(Response response) {
    final etag = response.headers.map['ETag']?[0];
    final link = response.headers.map['link']?[0];
    return GithubHeaders(
        etag: etag,
        link: link == null
            ? null
            : PaginationLink.parse(link.split(","),
                requestUrl: response.requestOptions.uri.toString()));
  }

  factory GithubHeaders.fromJson(Map<String, dynamic> json) =>
      _$GithubHeadersFromJson(json);
  @HiveType(typeId: 2, adapterName: 'GithubHeadersAdapter')
  const factory GithubHeaders({
    @HiveField(0) String? etag,
    @HiveField(1) PaginationLink? link,
  }) = _GithubHeaders;
  const GithubHeaders._();
  static const boxName = "GithubHeaders";
}

@freezed
class PaginationLink with _$PaginationLink {
  factory PaginationLink.fromJson(Map<String, dynamic> json) =>
      _$PaginationLinkFromJson(json);
  const PaginationLink._();
  @HiveType(typeId: 3, adapterName: 'PaginationLinkAdapter')
  const factory PaginationLink({@HiveField(0) required int maxPage}) =
      _PaginationLink;

  factory PaginationLink.parse(
    List<String> values, {
    required String requestUrl,
  }) {
    /* If there is no Link header with "last" rel , then the requested url is the last page
    e.g response header : 
    Link: <https://api.github.com/search/repositories?q=flutter&page=2>; rel="next", 
    <https://api.github.com/search/repositories?q=flutter&page=34>; rel="last"
    */

    return PaginationLink(
      maxPage: _extractPageNumber(
        values.firstWhere(
          (e) => e.contains('rel="last"'),
          orElse: () => requestUrl,
        ),
      ),
    );
  }

  static int _extractPageNumber(String value) {
    final uriString = RegExp(
            r'[(http(s)?):\/\/(www\.)?a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)')
        .stringMatch(value);
    return int.parse(Uri.parse(uriString!).queryParameters['page']!);
  }
}
