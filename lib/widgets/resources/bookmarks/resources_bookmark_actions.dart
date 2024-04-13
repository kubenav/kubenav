import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/repositories/bookmarks_repository.dart';
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/shared/app_actions_widget.dart';

/// The [ResourcesBookmarkActions] can be used to show some additional actions
/// for a bookmark within the bookmarks screen. Currently it is only possible to
/// delete an existing bookmark via the actions.
class ResourcesBookmarkActions extends StatelessWidget {
  const ResourcesBookmarkActions({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    BookmarksRepository bookmarksRepository = Provider.of<BookmarksRepository>(
      context,
      listen: false,
    );

    return AppActionsWidget(
      actions: [
        AppActionsWidgetAction(
          title: 'Delete',
          color: theme(context).error,
          onTap: () {
            final title = bookmarksRepository.bookmarks[index].title;
            bookmarksRepository.removeBookmark(index);
            showSnackbar(
              context,
              'Bookmark deleted',
              'Bookmakr $title was deleted',
            );
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
