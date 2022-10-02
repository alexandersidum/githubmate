import 'package:flutter/material.dart';
import 'package:githubmate/github/core/domain/github_failure.dart';

class RepoFailureTile extends StatelessWidget {
  const RepoFailureTile({
    super.key,
    required this.failure,
    required this.onRefresh,
  });

  final GithubFailure failure;
  final Function() onRefresh;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        dense: true,
        tileColor: Colors.red,
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
        title: const Align(
            alignment: Alignment.centerLeft,
            child: Text("An Error occured, please try again")),
        subtitle: Text(
          failure.map(
            api: (_) => 'API returned ${_.statusCode}',
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        leading: const SizedBox(
          height: double.infinity,
          child: Icon(Icons.warning),
        ),
        trailing:
            IconButton(onPressed: onRefresh, icon: const Icon(Icons.refresh)));
  }
}
