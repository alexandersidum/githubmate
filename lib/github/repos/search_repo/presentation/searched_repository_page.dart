import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:githubmate/auth/shared/providers.dart';
import 'package:githubmate/core/presentation/route/app_router.gr.dart';
import 'package:githubmate/github/core/shared/providers.dart';
import 'package:githubmate/github/repos/core/presentation/paginated_repo_list_view.dart';
import 'package:githubmate/search_history/presentation/search_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchRepositoryPage extends ConsumerStatefulWidget {
  const SearchRepositoryPage({super.key, required this.keyword});

  final String keyword;

  @override
  ConsumerState<SearchRepositoryPage> createState() =>
      _SearchRepositoryPageState();
}

class _SearchRepositoryPageState extends ConsumerState<SearchRepositoryPage> {
  @override
  void initState() {
    Future.microtask(() => ref
        .read(searchedRepoNotifierProvider.notifier)
        .getNextSearchedRepoPage(widget.keyword));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SearchBar(
        title: widget.keyword,
        onSignOutButtonPressed: () {
          ref.read(authNotifierProvider.notifier).signOut();
        },
        onShouldNavigateToResultPage: (keyword) => AutoRouter.of(context)
            .push(SearchRepositoryRoute(keyword: keyword)),
        hint: 'Search repository..',
        body: PaginatedRepoListView(
          provider: searchedRepoNotifierProvider,
          nextPageCallback: (() {
            ref
                .read(searchedRepoNotifierProvider.notifier)
                .getNextSearchedRepoPage(widget.keyword);
          }),
        ));
  }
}
