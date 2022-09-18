import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shimmer/shimmer.dart';

class RepoLoadingTile extends StatelessWidget {
  const RepoLoadingTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade200,
      child: ListTile(
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
        leading: const CircleAvatar(
          radius: 20,
        ),
        title: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 110,
            height: 14,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        subtitle: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 250,
            height: 14,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(MdiIcons.starOutline),
            Text(
              '',
              style: Theme.of(context).textTheme.caption,
            )
          ],
        ),
      ),
    );
  }
}
