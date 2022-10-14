import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/models/bookmark_model.dart';
import 'package:kubenav/models/resource_model.dart' as resource_model;
import 'package:kubenav/pages/resources/resources_controller.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/custom_icons.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/app_floating_action_buttons_widget.dart';
import 'package:kubenav/widgets/app_horizontal_list_cards_widget.dart';
import 'package:kubenav/widgets/app_vertical_list_simple_widget.dart';

class Resources extends GetView<ResourcesController> {
  const Resources({Key? key}) : super(key: key);

  Widget buildBookmarks() {
    if (controller.bookmarkController.bookmarks.isEmpty) {
      return Container();
    }

    return AppHorizontalListCardsWidget(
      title: 'Bookmarks',
      cards: List.generate(
        controller.bookmarkController.bookmarks.length <= 10
            ? controller.bookmarkController.bookmarks.length
            : 10,
        (index) => AppHorizontalListCardsModel(
          title: controller.bookmarkController.bookmarks[index].title,
          subtitle: controller.bookmarkController.bookmarks[index].name == null
              ? [
                  'Cluster: ${controller.bookmarkController.bookmarks[index].cluster}',
                  'Namespace: ${controller.bookmarkController.bookmarks[index].namespace}',
                ]
              : [
                  'Cluster: ${controller.bookmarkController.bookmarks[index].cluster}',
                  'Namespace: ${controller.bookmarkController.bookmarks[index].namespace}',
                  'Name: ${controller.bookmarkController.bookmarks[index].name}',
                ],
          image: resource_model.Resources.map.containsKey(controller
                      .bookmarkController.bookmarks[index].resource) &&
                  resource_model
                          .Resources
                          .map[controller
                              .bookmarkController.bookmarks[index].resource]!
                          .resource ==
                      controller.bookmarkController.bookmarks[index].resource &&
                  resource_model
                          .Resources
                          .map[controller
                              .bookmarkController.bookmarks[index].resource]!
                          .path ==
                      controller.bookmarkController.bookmarks[index].path
              ? 'assets/resources/image108x108/${controller.bookmarkController.bookmarks[index].resource}.png'
              : 'assets/resources/image108x108/customresourcedefinitions.png',
          imageFit: BoxFit.none,
          onTap: () {
            if (controller.bookmarkController.bookmarks[index].type ==
                BookmarkType.list) {
              if (controller.clusterController.setActiveClusterAndNamespace(
                controller.bookmarkController.bookmarks[index].cluster,
                controller.bookmarkController.bookmarks[index].namespace,
              )) {
                Get.toNamed(
                  '/resources/list?title=${controller.bookmarkController.bookmarks[index].title}&resource=${controller.bookmarkController.bookmarks[index].resource}&path=${controller.bookmarkController.bookmarks[index].path}&scope=${controller.bookmarkController.bookmarks[index].scope.name}',
                );
              }
            } else if (controller.bookmarkController.bookmarks[index].type ==
                BookmarkType.details) {
              if (controller.clusterController.setActiveClusterAndNamespace(
                controller.bookmarkController.bookmarks[index].cluster,
                controller.bookmarkController.bookmarks[index].namespace,
              )) {
                Get.toNamed(
                  '/resources/details?title=${controller.bookmarkController.bookmarks[index].title}&resource=${controller.bookmarkController.bookmarks[index].resource}&path=${controller.bookmarkController.bookmarks[index].path}&scope=${controller.bookmarkController.bookmarks[index].scope.name}&name=${controller.bookmarkController.bookmarks[index].name}&${controller.bookmarkController.bookmarks[index].scope == resource_model.ResourceScope.namespaced ? 'namespace=${controller.bookmarkController.bookmarks[index].namespace}' : ''}',
                );
              }
            }
          },
        ),
      ),
      moreIcon: Icons.keyboard_arrow_right,
      moreText: 'View all',
      moreOnTap: () {
        Get.toNamed(
          '/resources/bookmarks',
        );
      },
    );
  }

  List<AppVertialListSimpleModel> getItems(
    BuildContext context,
    resource_model.ResourceType resourceType,
  ) {
    List<AppVertialListSimpleModel> items = [];

    resource_model.Resources.map.forEach(
      (key, value) {
        if (value.resourceType == resourceType) {
          items.add(
            AppVertialListSimpleModel(
              onTap: () {
                if (value.resource == 'customresourcedefinitions') {
                  Get.toNamed(
                    '/resources/list/crds',
                  );
                } else {
                  Get.toNamed(
                    '/resources/list?title=${value.title}&resource=${value.resource}&path=${value.path}&scope=${value.scope.name}',
                  );
                }
              },
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Constants.colorPrimary,
                    borderRadius: BorderRadius.all(
                      Radius.circular(Constants.sizeBorderRadius),
                    ),
                  ),
                  height: 54,
                  width: 54,
                  child: Image.asset('assets/resources/image42x42/$key.png'),
                ),
                const SizedBox(width: Constants.spacingSmall),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        value.title,
                        style: primaryTextStyle(
                          context,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        value.description,
                        style: secondaryTextStyle(
                          context,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: Constants.spacingSmall),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey[300],
                  size: 24,
                ),
              ],
            ),
          );
        }
      },
    );

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(CustomIcons.clusters),
            onPressed: () {
              controller.showClusters();
            },
          ),
        ],
        title: Obx(
          () {
            return Column(
              children: [
                Text(
                  Characters('Resources')
                      .replaceAll(Characters(''), Characters('\u{200B}'))
                      .toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  Characters(
                          controller.clusterController.getActiveClusterName())
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
            );
          },
        ),
      ),
      bottomNavigationBar: const AppBottomNavigationBarWidget(),
      floatingActionButton: const AppFloatingActionButtonsWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: Constants.spacingSmall),
            Obx(() {
              return buildBookmarks();
            }),
            AppVertialListSimpleWidget(
              title: 'Workloads',
              items: getItems(
                context,
                resource_model.ResourceType.workload,
              ),
            ),
            AppVertialListSimpleWidget(
              title: 'Discovery and Load Balancing',
              items: getItems(
                context,
                resource_model.ResourceType.discoveryandloadbalancing,
              ),
            ),
            AppVertialListSimpleWidget(
              title: 'Config and Storage',
              items: getItems(
                context,
                resource_model.ResourceType.configandstorage,
              ),
            ),
            AppVertialListSimpleWidget(
              title: 'RBAC',
              items: getItems(
                context,
                resource_model.ResourceType.rbac,
              ),
            ),
            AppVertialListSimpleWidget(
              title: 'Cluster',
              items: getItems(
                context,
                resource_model.ResourceType.cluster,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
