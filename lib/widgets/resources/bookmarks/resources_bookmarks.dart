import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/repositories/bookmarks_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/navigate.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/utils/themes.dart';
import 'package:kubenav/widgets/resources/bookmarks/resources_bookmark_actions.dart';
import 'package:kubenav/widgets/resources/resources_details.dart';
import 'package:kubenav/widgets/resources/resources_list.dart';
import 'package:kubenav/widgets/shared/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/shared/app_floating_action_buttons_widget.dart';
import 'package:kubenav/widgets/shared/app_list_item.dart';

/// The [ResourcesBookmarks] widget can be used as a screen to view all
/// bookmarks saved by a user. When the user then clicks on a bookmark he will
/// be redirected to the corresponding resource. When the user double clicks on
/// the bookmark an actions menu will be shown which can be used to delete the
/// bookmark.
class ResourcesBookmarks extends StatefulWidget {
  const ResourcesBookmarks({super.key});

  @override
  State<ResourcesBookmarks> createState() => _ResourcesBookmarksState();
}

class _ResourcesBookmarksState extends State<ResourcesBookmarks> {
  /// [_proxyDecorator] is used to highlight the bookmark which is currently
  /// draged by the user.
  Widget _proxyDecorator(
    Widget child,
    int index,
    Animation<double> animation,
  ) {
    return Material(
      elevation: 0,
      color: Colors.transparent,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 16,
            child: Material(
              borderRadius: BorderRadius.circular(16),
              elevation: 24,
              color: Colors.transparent,
            ),
          ),
          child,
        ],
      ),
    );
  }

  /// [openBookmark] redirects the user to the bookmark with the provided
  /// [index]. Before the user is redirected to the resource page, we have to
  /// change the active cluster and namespace to the values saved in the
  /// bookmark. Then we open the [ResourcesList] or [ResourcesDetails] widget
  /// with the bookmark values as arguments.
  Future<void> openBookmark(int index) async {
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
          bookmarksRepository.bookmarks[index].namespace,
        );

        if (mounted) {
          navigate(
            context,
            ResourcesList(
              resource: bookmarksRepository.bookmarks[index].resource,
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
          bookmarksRepository.bookmarks[index].namespace,
        );

        if (mounted) {
          navigate(
            context,
            ResourcesDetails(
              resource: bookmarksRepository.bookmarks[index].resource,
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

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Bookmarks'),
      ),
      bottomNavigationBar: const AppBottomNavigationBarWidget(),
      floatingActionButton: const AppFloatingActionButtonsWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: Constants.spacingMiddle),
              ReorderableListView.builder(
                shrinkWrap: true,
                buildDefaultDragHandles: false,
                physics: const NeverScrollableScrollPhysics(),
                onReorder: (int start, int current) {
                  bookmarksRepository.reorder(start, current);
                },
                proxyDecorator: (
                  Widget child,
                  int index,
                  Animation<double> animation,
                ) {
                  return _proxyDecorator(child, index, animation);
                },
                itemCount: bookmarksRepository.bookmarks.length,
                itemBuilder: (
                  context,
                  index,
                ) {
                  final cluster = clustersRepository.getCluster(
                    bookmarksRepository.bookmarks[index].clusterId,
                  );

                  return Container(
                    key: Key(
                      '${bookmarksRepository.bookmarks[index].type} ${bookmarksRepository.bookmarks[index].clusterId} ${bookmarksRepository.bookmarks[index].name} ${bookmarksRepository.bookmarks[index].namespace} ${bookmarksRepository.bookmarks[index].resource}',
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(
                        bottom: Constants.spacingMiddle,
                        left: Constants.spacingMiddle,
                        right: Constants.spacingMiddle,
                      ),
                      child: AppListItem(
                        onTap: () {
                          openBookmark(index);
                        },
                        onLongPress: () {
                          HapticFeedback.vibrate();

                          showActions(
                            context,
                            ResourcesBookmarkActions(
                              index: index,
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        bookmarksRepository
                                                    .bookmarks[index].type ==
                                                BookmarkType.list
                                            ? bookmarksRepository
                                                .bookmarks[index]
                                                .resource
                                                .plural
                                            : bookmarksRepository
                                                .bookmarks[index]
                                                .resource
                                                .singular,
                                        style: primaryTextStyle(
                                          context,
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            Characters(
                                              'Cluster: ${cluster?.name ?? bookmarksRepository.bookmarks[index].clusterId}',
                                            )
                                                .replaceAll(
                                                  Characters(''),
                                                  Characters('\u{200B}'),
                                                )
                                                .toString(),
                                            style: secondaryTextStyle(
                                              context,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            Characters(
                                              'Namespace: ${bookmarksRepository.bookmarks[index].namespace ?? '-'}',
                                            )
                                                .replaceAll(
                                                  Characters(''),
                                                  Characters('\u{200B}'),
                                                )
                                                .toString(),
                                            style: secondaryTextStyle(
                                              context,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            Characters(
                                              'Name: ${bookmarksRepository.bookmarks[index].name ?? '-'}',
                                            )
                                                .replaceAll(
                                                  Characters(''),
                                                  Characters(
                                                    '\u{200B}',
                                                  ),
                                                )
                                                .toString(),
                                            style: secondaryTextStyle(
                                              context,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                ReorderableDragStartListener(
                                  index: index,
                                  child: Icon(
                                    Icons.drag_handle,
                                    color: Theme.of(context)
                                        .extension<CustomColors>()!
                                        .textSecondary
                                        .withOpacity(Constants.opacityIcon),
                                    size: 24,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
