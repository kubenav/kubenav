import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/models/resource.dart' as resource_model;
import 'package:kubenav/repositories/bookmarks_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/utils/navigate.dart';
import 'package:kubenav/widgets/resources/bookmarks/resources_bookmarks.dart';
import 'package:kubenav/widgets/resources/resource_details.dart';
import 'package:kubenav/widgets/resources/resources_list.dart';
import 'package:kubenav/widgets/shared/app_horizontal_list_cards_widget.dart';

/// The [ResourcesBookmarksPreview] widget can be used to display the top x
/// bookmarks within the resources page. It also contains the link to view all
/// bookmarks.
///
/// If the user selects a bookmark from the preview he will be redirected to the
/// corresponding resource.
class ResourcesBookmarksPreview extends StatefulWidget {
  const ResourcesBookmarksPreview({super.key});

  @override
  State<ResourcesBookmarksPreview> createState() =>
      _ResourcesBookmarksPreviewState();
}

class _ResourcesBookmarksPreviewState extends State<ResourcesBookmarksPreview> {
  /// [openBookmark] redirects the user to the bookmark with the provided
  /// [index]. Before the user is redirected to the resource page, we have to
  /// change the active cluster and namespace to the values saved in the
  /// bookmark. Then we open the [ResourcesList] or [ResourcesDetails] widget
  /// with the bookmark values as arguments.
  Future<void> openBookmark(BuildContext context, int index) async {
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: false,
    );
    BookmarksRepository bookmarksRepository = Provider.of<BookmarksRepository>(
      context,
      listen: false,
    );

    try {
      if (bookmarksRepository.bookmarks[index].type == BookmarkType.list) {
        await clustersRepository
            .setActiveCluster(bookmarksRepository.bookmarks[index].clusterId);
        await clustersRepository.setNamespace(
            bookmarksRepository.bookmarks[index].clusterId,
            bookmarksRepository.bookmarks[index].namespace ?? '');

        if (mounted) {
          navigate(
            context,
            ResourcesList(
              title: bookmarksRepository.bookmarks[index].title,
              resource: bookmarksRepository.bookmarks[index].resource,
              path: bookmarksRepository.bookmarks[index].path,
              scope: bookmarksRepository.bookmarks[index].scope,
              additionalPrinterColumns:
                  bookmarksRepository.bookmarks[index].additionalPrinterColumns,
              namespace: bookmarksRepository.bookmarks[index].namespace,
              selector: null,
            ),
          );
        }
      } else if (bookmarksRepository.bookmarks[index].type ==
          BookmarkType.details) {
        if (bookmarksRepository.bookmarks[index].name == null) {
          throw Exception('Invalid Bookmark');
        }

        await clustersRepository
            .setActiveCluster(bookmarksRepository.bookmarks[index].clusterId);
        await clustersRepository.setNamespace(
            bookmarksRepository.bookmarks[index].clusterId,
            bookmarksRepository.bookmarks[index].namespace ?? '');

        if (mounted) {
          navigate(
            context,
            ResourcesDetails(
              title: bookmarksRepository.bookmarks[index].title,
              resource: bookmarksRepository.bookmarks[index].resource,
              path: bookmarksRepository.bookmarks[index].path,
              scope: bookmarksRepository.bookmarks[index].scope,
              additionalPrinterColumns:
                  bookmarksRepository.bookmarks[index].additionalPrinterColumns,
              name: bookmarksRepository.bookmarks[index].name!,
              namespace: bookmarksRepository.bookmarks[index].namespace,
            ),
          );
        }
      }
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    BookmarksRepository bookmarksRepository = Provider.of<BookmarksRepository>(
      context,
      listen: true,
    );
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: true,
    );

    if (bookmarksRepository.bookmarks.isEmpty) {
      return Container();
    }

    return AppHorizontalListCardsWidget(
      title: 'Bookmarks',
      cards: List.generate(
        bookmarksRepository.bookmarks.length <= 10
            ? bookmarksRepository.bookmarks.length
            : 10,
        (index) {
          final cluster = clustersRepository.getCluster(
            bookmarksRepository.bookmarks[index].clusterId,
          );

          return AppHorizontalListCardsModel(
            title: bookmarksRepository.bookmarks[index].title,
            subtitle: bookmarksRepository.bookmarks[index].name == null
                ? [
                    'Cluster: ${cluster?.name ?? bookmarksRepository.bookmarks[index].clusterId}',
                    'Namespace: ${bookmarksRepository.bookmarks[index].namespace}',
                  ]
                : [
                    'Cluster: ${cluster?.name ?? bookmarksRepository.bookmarks[index].clusterId}',
                    'Namespace: ${bookmarksRepository.bookmarks[index].namespace}',
                    'Name: ${bookmarksRepository.bookmarks[index].name}',
                  ],
            image: resource_model.Resources.map.containsKey(
                        bookmarksRepository.bookmarks[index].resource) &&
                    resource_model
                            .Resources
                            .map[bookmarksRepository.bookmarks[index].resource]!
                            .resource ==
                        bookmarksRepository.bookmarks[index].resource &&
                    resource_model
                            .Resources
                            .map[bookmarksRepository.bookmarks[index].resource]!
                            .path ==
                        bookmarksRepository.bookmarks[index].path
                ? 'assets/resources/${bookmarksRepository.bookmarks[index].resource}.svg'
                : 'assets/resources/customresourcedefinitions.svg',
            imageFit: BoxFit.none,
            onTap: () {
              openBookmark(context, index);
            },
          );
        },
      ),
      moreIcon: Icons.keyboard_arrow_right,
      moreText: 'View all',
      moreOnTap: () {
        navigate(
          context,
          const ResourcesBookmarks(),
        );
      },
    );
  }
}
