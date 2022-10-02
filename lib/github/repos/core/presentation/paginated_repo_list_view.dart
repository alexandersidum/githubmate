import 'package:flutter/material.dart';
import 'package:githubmate/core/presentation/toasts.dart';
import 'package:githubmate/core/shared/log.dart';
import 'package:githubmate/github/core/shared/providers.dart';
import 'package:githubmate/github/repos/core/application/pagination_state_notifier.dart';
import 'package:githubmate/github/repos/core/presentation/failure_repo_tile.dart';
import 'package:githubmate/github/repos/core/presentation/no_result_display.dart';
import 'package:githubmate/github/repos/core/presentation/repo_list_tile.dart';
import 'package:githubmate/github/repos/core/presentation/repos_loading_tile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class PaginatedRepoListView extends ConsumerStatefulWidget {
  const PaginatedRepoListView(
      {super.key, required this.provider, required this.nextPageCallback});

  final AutoDisposeStateNotifierProvider<PaginatedRepoNotifier,
      PaginatedRepoState> provider;
  final Function() nextPageCallback;

  @override
  ConsumerState<PaginatedRepoListView> createState() =>
      _PaginatedRepoListViewState();
}

class _PaginatedRepoListViewState extends ConsumerState<PaginatedRepoListView> {
  bool canLoadNextPage = false;
  bool hasShownNoConnectionToast = false;

  bool onNotification(notification) {
    final metrics = notification.metrics;
    final limit = metrics.maxScrollExtent - metrics.viewportDimension / 3;

    if (canLoadNextPage && metrics.pixels >= limit) {
      canLoadNextPage = false;
      widget.nextPageCallback();
      ref.read(starredRepoNotifierProvider.notifier).getNextStarredRepoPage();
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    //Check if there is searchBar on ancestor and give padding based on it
    final bar =
        context.findAncestorWidgetOfExactType<FloatingSearchBar>()?.height;
    return Padding(
      padding:
          EdgeInsets.only(top: MediaQuery.of(context).padding.top + (bar ?? 0)),
      child: NotificationListener<ScrollNotification>(
        onNotification: onNotification,
        child: Consumer(builder: (context, ref, child) {
          ref.listen<PaginatedRepoState>(widget.provider, (previous, state) {
            if (previous == state) {
              return;
            }
            if (!state.repoList.isFresh && !hasShownNoConnectionToast) {
              showDefaultToast(
                  "You are viewing repository in Offline mode, some data might be outdated",
                  context);
            }
            state.map(
                initial: (x) => canLoadNextPage = true,
                loading: (x) => canLoadNextPage = false,
                loadSuccess: (x) =>
                    canLoadNextPage = x.repoList.isNextPageAvailable,
                loadFailure: (x) => canLoadNextPage = false);
          });
          final state = ref.watch(widget.provider);
          return state.maybeMap(
                  loadSuccess: (val) => val.repoList.data.isEmpty,
                  orElse: () => false)
              ? const NoResultsDisplay(message: "Repository not Found")
              : ListView.builder(
                  padding: const EdgeInsets.only(top: 10),
                  itemCount: state.when(
                    initial: (repoList) => 0,
                    loading: (repoList, additionalPage) =>
                        repoList.data.length + additionalPage,
                    loadSuccess: (repoList) => repoList.data.length,
                    loadFailure: (repoList, failure) =>
                        repoList.data.length + 1,
                  ),
                  itemBuilder: ((context, index) {
                    return state.map(
                      initial: (val) =>
                          RepoListTile(repo: val.repoList.data[index]),
                      loading: (val) {
                        Log.setLog(val.repoList.data.length,
                            tag: '_PaginatedRepoListViewState');
                        if (index >= val.repoList.data.length) {
                          return const RepoLoadingTile();
                        }
                        return RepoListTile(repo: val.repoList.data[index]);
                      },
                      loadSuccess: (val) =>
                          RepoListTile(repo: val.repoList.data[index]),
                      loadFailure: (val) {
                        if (index > val.repoList.data.length) {
                          return RepoFailureTile(
                            failure: val.failure,
                            onRefresh: widget.nextPageCallback,
                          );
                        }
                        return RepoListTile(repo: val.repoList.data[index]);
                      },
                    );
                  }));
        }),
      ),
    );
  }
}
