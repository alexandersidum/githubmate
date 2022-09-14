import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:githubmate/core/shared/thousand_int_extension.dart';
import 'package:githubmate/github/core/domain/github_repo.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RepoListTile extends StatelessWidget {
  const RepoListTile({super.key, required this.repo});

  final GithubRepo repo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
      leading: CircleAvatar(
        radius: 20,
        backgroundImage: CachedNetworkImageProvider(repo.owner.avatar),
      ),
      title: Text(repo.name),
      subtitle: Text(
        repo.description,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(MdiIcons.starOutline),
          Text(
            repo.stargazerCount.toKString(),
            style: Theme.of(context).textTheme.caption,
          )
        ],
      ),
    );
  }
}
