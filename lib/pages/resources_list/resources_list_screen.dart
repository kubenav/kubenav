import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/models/bookmark_model.dart';
import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/pages/resources_list/resources_list_controller.dart';
import 'package:kubenav/pages/resources_list/widgets/default_list_item_widget.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/custom_icons.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/app_actions_header_widget.dart';
import 'package:kubenav/widgets/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/app_error_widget.dart';
import 'package:kubenav/widgets/app_floating_action_buttons_widget.dart';

class ResourcesList extends GetView {
  const ResourcesList({Key? key}) : super(key: key);

  Widget buildAction(
    BuildContext context,
    String text,
    IconData icon,
    void Function()? onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width * 0.25,
        ),
        padding: const EdgeInsets.only(
          top: Constants.spacingMiddle,
          bottom: Constants.spacingMiddle,
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: Constants.colorPrimary,
              size: 28,
            ),
            const SizedBox(
              height: Constants.spacingSmall,
            ),
            Text(
              text,
              style: primaryTextStyle(context, size: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListItem(
    String? title,
    String? resource,
    String? path,
    ResourceScope? scope,
    dynamic item,
    dynamic metrics,
  ) {
    if (resource != null &&
        path != null &&
        Resources.map.containsKey(resource) &&
        Resources.map[resource]!.resource == resource &&
        Resources.map[resource]!.path == path &&
        Resources.map[resource]!.buildListItem != null) {
      return Resources.map[resource]!.buildListItem!(
        title,
        resource,
        path,
        scope,
        item,
        metrics,
      );
    }

    return DefaultListItemWidget(
      title: title,
      resource: resource,
      path: path,
      scope: scope,
      item: item,
    );
  }

  @override
  Widget build(BuildContext context) {
    ResourcesListController controller = Get.put(
      ResourcesListController(
        title: Get.parameters['title'],
        resource: Get.parameters['resource'],
        path: Get.parameters['path'],
        scope: resourceScopeFromString(Get.parameters['scope']),
        namespace: Get.parameters['namespace'],
        selector: Get.parameters['selector'],
      ),
      tag:
          '${Get.parameters['title']} ${Get.parameters['resource']} ${Get.parameters['path']} ${Get.parameters['scope']} ${Get.parameters['namespace']} ${Get.parameters['selector']}',
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: controller.scope == ResourceScope.namespaced &&
                controller.selector == null
            ? [
                IconButton(
                  icon: const Icon(CustomIcons.namespaces),
                  onPressed: () {
                    controller.showNamespaces();
                  },
                ),
              ]
            : null,
        title: Column(
          children: [
            Text(
              Characters(controller.title != null
                      ? controller.title!
                      : 'Unknown Resource')
                  .replaceAll(Characters(''), Characters('\u{200B}'))
                  .toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            controller.selector == null
                ? Obx(() {
                    return Text(
                      Characters(controller.clusterController
                                          .getActiveClusterNamespace() ==
                                      '' ||
                                  (controller.scope == ResourceScope.cluster)
                              ? 'All Namespaces'
                              : controller
                                  .clusterController
                                  .clusters[controller.clusterController
                                      .activeClusterIndex.value]
                                  .value
                                  .namespace)
                          .replaceAll(Characters(''), Characters('\u{200B}'))
                          .toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  })
                : Text(
                    Characters(controller.namespace != null
                            ? controller.namespace!
                            : 'All Namespaces')
                        .replaceAll(Characters(''), Characters('\u{200B}'))
                        .toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNavigationBarWidget(),
      floatingActionButton: const AppFloatingActionButtonsWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () {
                if (controller.loading.value) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(Constants.spacingMiddle),
                        child: CircularProgressIndicator(
                            color: Constants.colorPrimary),
                      ),
                    ],
                  );
                }

                if (controller.error.value != '') {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Padding(
                          padding:
                              const EdgeInsets.all(Constants.spacingMiddle),
                          child: AppErrorWidget(
                            message: 'Could not load ${controller.title}',
                            details: controller.error.value,
                            icon: Resources.map
                                        .containsKey(controller.resource) &&
                                    Resources.map[controller.resource]!.path ==
                                        controller.path
                                ? 'assets/resources/image108x108/${controller.resource}.png'
                                : null,
                          ),
                        ),
                      ),
                    ],
                  );
                }

                return Wrap(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        top: Constants.spacingMiddle,
                        bottom: Constants.spacingSmall,
                        left: Constants.spacingMiddle,
                        right: Constants.spacingMiddle,
                      ),
                      color: Constants.colorPrimary,
                      child: TextField(
                        controller: controller.search,
                        onSubmitted: (value) {
                          controller.filter.value = controller.search.text;
                        },
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        cursorColor: Colors.white,
                        keyboardType: TextInputType.text,
                        autocorrect: false,
                        enableSuggestions: false,
                        maxLines: 1,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.0),
                          ),
                          isDense: true,
                          contentPadding: EdgeInsets.all(8),
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          hintText: 'Filter...',
                        ),
                      ),
                    ),
                    AppActionsHeaderWidget(
                      actions: [
                        AppActionsHeaderModel(
                          title: 'Create',
                          icon: Icons.create,
                          onTap: () {
                            if (controller.title != null &&
                                controller.resource != null &&
                                controller.path != null &&
                                Resources.map
                                    .containsKey(controller.resource) &&
                                Resources.map[controller.resource]!.resource ==
                                    controller.resource &&
                                Resources.map[controller.resource]!.path ==
                                    controller.path &&
                                Resources.map[controller.resource]!.template !=
                                    '') {
                              controller.createResource(
                                  Resources.map[controller.resource]!.template);
                            } else {
                              controller.createResource(
                                  '{"apiVersion":"","kind":"","metadata":{"name":"","namespace":""},"spec":{}}');
                            }
                          },
                        ),
                        AppActionsHeaderModel(
                          title: 'Refresh',
                          icon: Icons.refresh,
                          onTap: () {
                            controller.getResources();
                          },
                        ),
                        AppActionsHeaderModel(
                          title: 'Bookmark',
                          icon: controller.bookmarkController.isBookmarked(
                                    controller.clusterController
                                        .getActiveClusterName(),
                                    BookmarkType.list,
                                    controller.title,
                                    controller.resource,
                                    controller.path,
                                    controller.scope,
                                    null,
                                    controller.clusterController
                                        .getActiveClusterNamespace(),
                                  ) >
                                  -1
                              ? Icons.bookmark
                              : Icons.bookmark_border,
                          onTap: () {
                            final bookmarkIndex =
                                controller.bookmarkController.isBookmarked(
                              controller.clusterController
                                  .getActiveClusterName(),
                              BookmarkType.list,
                              controller.title,
                              controller.resource,
                              controller.path,
                              controller.scope,
                              null,
                              controller.clusterController
                                  .getActiveClusterNamespace(),
                            );
                            if (bookmarkIndex > -1) {
                              controller.bookmarkController
                                  .removeBookmark(bookmarkIndex);
                            } else {
                              controller.bookmarkController.addBookmark(
                                controller.clusterController
                                    .getActiveClusterName(),
                                BookmarkType.list,
                                controller.title,
                                controller.resource,
                                controller.path,
                                controller.scope,
                                null,
                                controller.clusterController
                                    .getActiveClusterNamespace(),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        top: Constants.spacingMiddle,
                        bottom: Constants.spacingMiddle,
                      ),
                      child: Obx(
                        () {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.only(
                              right: Constants.spacingMiddle,
                              left: Constants.spacingMiddle,
                            ),
                            itemCount: controller.getItems().length,
                            itemBuilder: (context, index) {
                              return buildListItem(
                                controller.title,
                                controller.resource,
                                controller.path,
                                controller.scope,
                                controller.getItems()[index],
                                controller.metrics,
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
