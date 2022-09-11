import 'package:flutter/material.dart';
import 'package:githubmate/auth/shared/providers.dart';
import 'package:githubmate/github/core/shared/providers.dart';
import 'package:githubmate/github/repos/core/presentation/paginated_repo_list_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
            title: const Text("Starred Repository")),
        body: const PaginatedRepoListView());
  }
}
