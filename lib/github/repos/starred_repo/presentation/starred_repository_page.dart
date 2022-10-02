import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:githubmate/auth/shared/providers.dart';
import 'package:githubmate/core/presentation/route/app_router.gr.dart';
import 'package:githubmate/github/core/shared/providers.dart';
import 'package:githubmate/github/repos/core/presentation/paginated_repo_list_view.dart';
import 'package:githubmate/search_history/presentation/search_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StarredRepositoryPage extends ConsumerStatefulWidget {
  const StarredRepositoryPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      StarredRepositoryPageState();
}

class StarredRepositoryPageState extends ConsumerState<StarredRepositoryPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref
        .read(starredRepoNotifierProvider.notifier)
        .getNextStarredRepoPage());
  }

  @override
  Widget build(BuildContext context) {
    return SearchBar(
        title: "Starred Repository",
        onSignOutButtonPressed: () {
          ref.read(authNotifierProvider.notifier).signOut();
        },
        onShouldNavigateToResultPage: (keyword) => AutoRouter.of(context)
            .push(SearchRepositoryRoute(keyword: keyword)),
        hint: 'Search repository..',
        body: PaginatedRepoListView(
          provider: starredRepoNotifierProvider,
          nextPageCallback: (() {
            ref
                .read(starredRepoNotifierProvider.notifier)
                .getNextStarredRepoPage();
          }),
        ));
  }
}
