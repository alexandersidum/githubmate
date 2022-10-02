import 'package:githubmate/core/shared/providers.dart';
import 'package:githubmate/github/core/infrastructure/github_headers_cache.dart';
import 'package:githubmate/github/repos/core/application/pagination_state_notifier.dart';
import 'package:githubmate/github/repos/search_repo/application/searched_repo_state_notifier.dart';
import 'package:githubmate/github/repos/search_repo/infrastructure/searched_repo_remote_service.dart';
import 'package:githubmate/github/repos/search_repo/infrastructure/searched_repo_repository.dart';
import 'package:githubmate/github/repos/starred_repo/application/starred_repo_state_notifier.dart';
import 'package:githubmate/github/repos/starred_repo/infrastructure/starred_repo_local_service.dart';
import 'package:githubmate/github/repos/starred_repo/infrastructure/starred_repo_remote_service.dart';
import 'package:githubmate/github/repos/starred_repo/infrastructure/starred_repo_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final githubHeaderCacheProvider =
    Provider<GithubHeadersCache>((ref) => GithubHeadersCache());

final githubStarredRemoteServiceProvider = Provider<StarredRepoRemoteService>(
    (ref) => StarredRepoRemoteService(
        ref.watch(dioProvider), ref.watch(githubHeaderCacheProvider)));

final githubStarredLocalServiceProvider =
    Provider<StarredRepoLocalService>((ref) => StarredRepoLocalService());

final githubStarredRepoRepositoryProvider =
    Provider<StarredRepoRepository>((ref) => StarredRepoRepository(
          ref.watch(githubStarredRemoteServiceProvider),
          ref.watch(githubStarredLocalServiceProvider),
        ));

final starredRepoNotifierProvider = AutoDisposeStateNotifierProvider<
        StarredRepoStateNotifier, PaginatedRepoState>(
    (ref) => StarredRepoStateNotifier(
          ref.watch(githubStarredRepoRepositoryProvider),
        ));

final githubSearcheddRemoteServiceProvider =
    Provider<SearchedRepoRemoteService>((ref) => SearchedRepoRemoteService(
        ref.watch(dioProvider), ref.watch(githubHeaderCacheProvider)));

final githubSearcheddRepoRepositoryProvider =
    Provider<SearchedRepoRepository>((ref) => SearchedRepoRepository(
          ref.watch(githubSearcheddRemoteServiceProvider),
        ));

final searchedRepoNotifierProvider = AutoDisposeStateNotifierProvider<
        SearchedRepoStateNotifier, PaginatedRepoState>(
    (ref) => SearchedRepoStateNotifier(
          ref.watch(githubSearcheddRepoRepositoryProvider),
        ));
