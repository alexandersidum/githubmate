import 'package:flutter/material.dart';
import 'package:githubmate/auth/shared/providers.dart';
import 'package:githubmate/github/core/shared/providers.dart';
import 'package:githubmate/github/repos/core/presentation/paginated_repo_list_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
    return Scaffold(
        appBar: AppBar(
            centerTitle: false,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: InkWell(
                    onTap: () =>
                        ref.read(authNotifierProvider.notifier).signOut(),
                    child: const Icon(MdiIcons.logout)),
              )
            ],
            title: const Text("Searched Repository")),
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
