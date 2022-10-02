import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:githubmate/search_history/shared/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class SearchBar extends ConsumerStatefulWidget {
  const SearchBar({
    Key? key,
    required this.body,
    required this.title,
    required this.hint,
    required this.onShouldNavigateToResultPage,
    required this.onSignOutButtonPressed,
  }) : super(key: key);

  final Widget body;
  final String title;
  final String hint;
  final void Function(String searchTerm) onShouldNavigateToResultPage;
  final void Function() onSignOutButtonPressed;

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends ConsumerState<SearchBar> {
  late FloatingSearchBarController _controller;

  @override
  void initState() {
    super.initState();
    _controller = FloatingSearchBarController();
    Future.microtask(
      () =>
          ref.read(searchHistoryNotifierProvider.notifier).watchSearchHistory(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void pushPageAndAddToHistory(String searchTerm) {
    widget.onShouldNavigateToResultPage(searchTerm);
    ref
        .read(searchHistoryNotifierProvider.notifier)
        .addSearchHistory(searchTerm);
    _controller.close();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingSearchBar(
      controller: _controller,
      body: FloatingSearchBarScrollNotifier(
        child: widget.body,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.title,
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            'Tap to search 👆',
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
      hint: widget.hint,
      automaticallyImplyBackButton: false,
      leadingActions: [
        if (AutoRouter.of(context).canPop())
          IconButton(
            icon: Icon((Platform.isIOS || Platform.isMacOS)
                ? Icons.arrow_back_ios
                : Icons.arrow_back),
            splashRadius: 18,
            onPressed: () {
              AutoRouter.of(context).pop();
            },
          )
      ],
      actions: [
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
        FloatingSearchBarAction(
          child: IconButton(
            icon: const Icon(MdiIcons.logoutVariant),
            splashRadius: 18,
            onPressed: () {
              widget.onSignOutButtonPressed();
            },
          ),
        ),
      ],
      onQueryChanged: (query) {
        ref
            .read(searchHistoryNotifierProvider.notifier)
            .watchSearchHistory(keyword: query);
      },
      onSubmitted: (query) {
        pushPageAndAddToHistory(query);
      },
      builder: (context, transition) {
        return Material(
          color: Theme.of(context).cardColor,
          elevation: 4,
          borderRadius: BorderRadius.circular(8),
          clipBehavior: Clip.hardEdge,
          child: Consumer(
            builder: (context, ref, child) {
              final searchHistoryState =
                  ref.watch(searchHistoryNotifierProvider);
              return searchHistoryState.when(
                data: (history) {
                  if (_controller.query.isEmpty && history.isEmpty) {
                    return Container(
                      height: 56,
                      alignment: Alignment.center,
                      child: Text(
                        'Start searching',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    );
                  } else if (history.isEmpty) {
                    return ListTile(
                      title: Text(_controller.query),
                      leading: const Icon(Icons.search),
                      onTap: () {
                        pushPageAndAddToHistory(_controller.query);
                      },
                    );
                  }
                  return Column(
                    children: history
                        .map(
                          (term) => ListTile(
                            title: Text(
                              term,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            leading: const Icon(Icons.history),
                            trailing: IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                ref
                                    .read(
                                        searchHistoryNotifierProvider.notifier)
                                    .deleteSearchHistory(term);
                              },
                            ),
                            onTap: () {
                              pushPageAndAddToHistory(term);
                            },
                          ),
                        )
                        .toList(),
                  );
                },
                initial: () => const SizedBox(),
                error: (msg) => ListTile(
                  title: Text('Very unexpected error $msg'),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
