import 'package:flutter/material.dart';
import 'package:githubmate/github/core/shared/providers.dart';
import 'package:githubmate/github/repos/core/presentation/repo_list_tile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PaginatedRepoListView extends StatefulWidget {
  const PaginatedRepoListView({super.key});

  @override
  State<PaginatedRepoListView> createState() => _PaginatedRepoListViewState();
}

class _PaginatedRepoListViewState extends State<PaginatedRepoListView> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final state = ref.watch(starredRepoNotifierProvider);
      return ListView.builder(
          itemCount: state.when(
            initial: (repoList) => 0,
            loading: (repoList, additionalPage) =>
                repoList.data.length + additionalPage,
            loadSuccess: (repoList) => repoList.data.length,
            loadFailure: (repoList, failure) => repoList.data.length + 1,
          ),
          itemBuilder: ((context, index) {
            if (index >= state.repoList.data.length) {
              return const Text("Load");
            }
            return RepoListTile(repo: state.repoList.data[index]);
          }));
    });
  }
}
