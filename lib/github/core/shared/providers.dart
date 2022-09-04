import 'package:githubmate/github/core/infrastructure/github_headers_cache.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final githubHeaderCacheProvider =
    Provider<GithubHeadersCache>((ref) => GithubHeadersCache());
