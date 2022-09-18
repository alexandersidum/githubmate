import 'package:flutter/material.dart';

class NoResultsDisplay extends StatelessWidget {
  const NoResultsDisplay({
    Key? key,
    required this.message,
  }) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.manage_search,
            size: 96,
          ),
          Text(
            message,
            style: Theme.of(context).textTheme.headline5,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
