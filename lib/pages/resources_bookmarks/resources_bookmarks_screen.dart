import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/models/bookmark_model.dart';
import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/pages/resources_bookmarks/resources_bookmarks_controller.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/app_floating_action_buttons_widget.dart';

class ResourcesBookmarks extends GetView<ResourcesBookmarksController> {
  const ResourcesBookmarks({Key? key}) : super(key: key);

  /// [_proxyDecorator] is used to highlight the cluster which is currently draged by the user.
  Widget _proxyDecorator(Widget child, int index, Animation<double> animation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        final double animValue = Curves.easeInOut.transform(animation.value);
        final double elevation = lerpDouble(0, 6, animValue)!;
        return Material(
          elevation: elevation,
          shadowColor: Constants.shadowColorGlobal,
          child: child,
        );
      },
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Bookmarks'),
      ),
      bottomNavigationBar: const AppBottomNavigationBarWidget(),
      floatingActionButton: const AppFloatingActionButtonsWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: Constants.spacingLarge),
            Obx(
              () {
                return ReorderableListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(
                    right: Constants.spacingMiddle,
                    left: Constants.spacingMiddle,
                  ),
                  onReorder: (int start, int current) {
                    controller.bookmarkController.reorder(start, current);
                  },
                  proxyDecorator: _proxyDecorator,
                  itemCount: controller.bookmarkController.bookmarks.length,
                  itemBuilder: (
                    context,
                    index,
                  ) {
                    print(controller.bookmarkController.bookmarks[index].type);
                    return Container(
                      key: Key(
                        '${controller.bookmarkController.bookmarks[index].cluster} ${controller.bookmarkController.bookmarks[index].type} ${controller.bookmarkController.bookmarks[index].title} ${controller.bookmarkController.bookmarks[index].resource} ${controller.bookmarkController.bookmarks[index].path} ${controller.bookmarkController.bookmarks[index].scope} ${controller.bookmarkController.bookmarks[index].name} ${controller.bookmarkController.bookmarks[index].namespace}',
                      ),
                      child: Container(
                        margin: const EdgeInsets.only(
                          bottom: Constants.spacingMiddle,
                        ),
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Constants.shadowColorGlobal,
                              blurRadius: Constants.sizeBorderBlurRadius,
                              spreadRadius: Constants.sizeBorderSpreadRadius,
                              offset: const Offset(0.0, 0.0),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(Constants.sizeBorderRadius),
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            if (controller
                                    .bookmarkController.bookmarks[index].type ==
                                BookmarkType.list) {
                              if (controller.clusterController
                                  .setActiveClusterAndNamespace(
                                controller.bookmarkController.bookmarks[index]
                                    .cluster,
                                controller.bookmarkController.bookmarks[index]
                                    .namespace,
                              )) {
                                Get.toNamed(
                                  '/resources/list?title=${controller.bookmarkController.bookmarks[index].title}&resource=${controller.bookmarkController.bookmarks[index].resource}&path=${controller.bookmarkController.bookmarks[index].path}&scope=${controller.bookmarkController.bookmarks[index].scope.name}',
                                );
                              }
                            } else if (controller
                                    .bookmarkController.bookmarks[index].type ==
                                BookmarkType.details) {
                              if (controller.clusterController
                                  .setActiveClusterAndNamespace(
                                controller.bookmarkController.bookmarks[index]
                                    .cluster,
                                controller.bookmarkController.bookmarks[index]
                                    .namespace,
                              )) {
                                Get.toNamed(
                                  '/resources/details?title=${controller.bookmarkController.bookmarks[index].title}&resource=${controller.bookmarkController.bookmarks[index].resource}&path=${controller.bookmarkController.bookmarks[index].path}&scope=${controller.bookmarkController.bookmarks[index].scope.name}&name=${controller.bookmarkController.bookmarks[index].name}&${controller.bookmarkController.bookmarks[index].scope == ResourceScope.namespaced ? 'namespace=${controller.bookmarkController.bookmarks[index].namespace}' : ''}',
                                );
                              }
                            }
                          },
                          onDoubleTap: () {
                            controller.showBookmarkActionsBottomSheet(index);
                          },
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.bookmarkController
                                              .bookmarks[index].title,
                                          style: primaryTextStyle(),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              Characters(
                                                      'Cluster: ${controller.bookmarkController.bookmarks[index].cluster}')
                                                  .replaceAll(Characters(''),
                                                      Characters('\u{200B}'))
                                                  .toString(),
                                              style: secondaryTextStyle(),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              Characters(
                                                      'Namespace: ${controller.bookmarkController.bookmarks[index].namespace}')
                                                  .replaceAll(Characters(''),
                                                      Characters('\u{200B}'))
                                                  .toString(),
                                              style: secondaryTextStyle(),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            controller
                                                        .bookmarkController
                                                        .bookmarks[index]
                                                        .name !=
                                                    null
                                                ? Text(
                                                    Characters(
                                                            'Name: ${controller.bookmarkController.bookmarks[index].name}')
                                                        .replaceAll(
                                                            Characters(''),
                                                            Characters(
                                                                '\u{200B}'))
                                                        .toString(),
                                                    style: secondaryTextStyle(),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  )
                                                : Container(),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.grey[300],
                                    size: 24,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: Constants.spacingSmall),
          ],
        ),
      ),
    );
  }
}
