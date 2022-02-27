import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kubenav/models/resource_model.dart' as resource_model;
import 'package:kubenav/pages/resources/resources_controller.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/custom_icons.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/app_vertical_list_simple_widget.dart';

class Resources extends GetView<ResourcesController> {
  const Resources({Key? key}) : super(key: key);

  List<AppVertialListSimpleModel> getItems(
      resource_model.ResourceType resourceType) {
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
                        style: primaryTextStyle(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        value.description,
                        style: secondaryTextStyle(),
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
        actions: [
          IconButton(
            icon: const Icon(CustomIcons.clusters),
            tooltip: 'Select active cluster',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: Constants.spacingSmall),
            AppVertialListSimpleWidget(
              title: 'Workloads',
              items: getItems(
                resource_model.ResourceType.workload,
              ),
            ),
            AppVertialListSimpleWidget(
              title: 'Discovery and Load Balancing',
              items: getItems(
                resource_model.ResourceType.discoveryandloadbalancing,
              ),
            ),
            AppVertialListSimpleWidget(
              title: 'Config and Storage',
              items: getItems(
                resource_model.ResourceType.configandstorage,
              ),
            ),
            AppVertialListSimpleWidget(
              title: 'RBAC',
              items: getItems(
                resource_model.ResourceType.rbac,
              ),
            ),
            AppVertialListSimpleWidget(
              title: 'Cluster',
              items: getItems(
                resource_model.ResourceType.cluster,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
