import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:githubmate/github/core/domain/github_repo.dart';

class RepoListTile extends StatelessWidget {
  const RepoListTile({super.key, required this.repo});

  final GithubRepo repo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
    );
  }
}
