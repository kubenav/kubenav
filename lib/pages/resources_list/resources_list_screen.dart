import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/pages/resources_list/resources_list_controller.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/custom_icons.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/app_actions_header_widget.dart';
import 'package:kubenav/widgets/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/app_error_widget.dart';

class ResourcesList extends GetView<ResourcesListController> {
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
              style: primaryTextStyle(size: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: controller.scope == ResourceScope.namespaced
            ? [
                IconButton(
                  icon: const Icon(CustomIcons.namespaces),
                  tooltip: 'Select active namespace',
                  onPressed: () {
                    controller.showNamespaces();
                  },
                ),
              ]
            : null,
        title: Obx(
          () {
            return Column(
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
                Text(
                  Characters(controller.clusterController
                                      .getActiveClusterNamespace() ==
                                  '' ||
                              (controller.scope == ResourceScope.cluster)
                          ? 'All Namespaces'
                          : controller
                              .clusterController
                              .clusters[controller
                                  .clusterController.activeClusterIndex.value]
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
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: const AppBottomNavigationBarWidget(),
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
                          child: AppErrorWidget(error: controller.error.value),
                        ),
                      ),
                    ],
                  );
                }

                return Wrap(
                  children: [
                    AppActionsHeaderWidget(
                      actions: [
                        AppActionsHeaderModel(
                          title: 'Create',
                          icon: Icons.create,
                          onTap: () {},
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
                          icon: Icons.bookmark_border,
                          onTap: () {},
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        top: Constants.spacingMiddle,
                        bottom: Constants.spacingMiddle,
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.only(
                          right: Constants.spacingMiddle,
                          left: Constants.spacingMiddle,
                        ),
                        itemCount: controller.items.length,
                        itemBuilder: (context, index) {
                          return controller.resource != null &&
                                  Resources.map[controller.resource] != null
                              ? Resources.map[controller.resource]!
                                  .buildListItem(controller.items[index])
                              : Text('data');
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
