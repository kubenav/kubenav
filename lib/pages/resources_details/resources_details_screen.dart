import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/pages/resources_details/resources_details_controller.dart';
import 'package:kubenav/widgets/app_actions_header_widget.dart';
import 'package:kubenav/widgets/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/app_error_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/details_item_conditions_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/details_item_metadata_widget.dart';
import 'package:kubenav/utils/constants.dart';

class ResourcesDetails extends GetView<ResourcesDetailsController> {
  const ResourcesDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              Characters(controller.name ?? 'Unknown Resource')
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
              Characters(controller.namespace ?? '')
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

                return Column(
                  children: [
                    AppActionsHeaderWidget(
                      actions: [
                        AppActionsHeaderModel(
                          title: 'Yaml',
                          icon: Icons.description,
                          onTap: () {
                            controller.showYaml();
                          },
                        ),
                        AppActionsHeaderModel(
                          title: 'Edit',
                          icon: Icons.edit,
                          onTap: () {},
                        ),
                        AppActionsHeaderModel(
                          title: 'Delete',
                          icon: Icons.delete,
                          onTap: () {
                            controller.deleteResource();
                          },
                        ),
                        AppActionsHeaderModel(
                          title: 'Refresh',
                          icon: Icons.refresh,
                          onTap: () {
                            controller.getResource();
                          },
                        ),
                        AppActionsHeaderModel(
                          title: 'Bookmark',
                          icon: Icons.bookmark_border,
                          onTap: () {},
                        ),
                      ],
                    ),
                    DetailsItemMetadataWidget(
                      item: controller.item,
                    ),
                    DetailsItemConditionsWidget(
                      item: controller.item,
                    ),
                    const SizedBox(height: Constants.spacingMiddle),
                    controller.resource != null &&
                            Resources.map[controller.resource] != null
                        ? Resources.map[controller.resource]!
                            .buildDetailsItem(controller.item)
                        : Container(),
                    const SizedBox(height: Constants.spacingExtraLarge),
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
