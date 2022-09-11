import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/pages/home/home_controller.dart';
import 'package:kubenav/pages/home/widgets/events_widget.dart';
import 'package:kubenav/pages/home/widgets/metrics_widget.dart';
import 'package:kubenav/routes/app_routes.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/custom_icons.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/app_actions_header_widget.dart';
import 'package:kubenav/widgets/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/app_floating_action_buttons_widget.dart';

class Home extends GetView<HomeController> {
  const Home({Key? key}) : super(key: key);

  List<Widget> buildContent(BuildContext context) {
    if (controller.clusterController.clusters.isEmpty) {
      return [
        const SizedBox(height: Constants.spacingSmall),
        Container(
          padding: const EdgeInsets.only(
            left: Constants.spacingMiddle,
            right: Constants.spacingMiddle,
          ),
          child: Container(
            margin: const EdgeInsets.only(
              top: Constants.spacingSmall,
              bottom: Constants.spacingSmall,
            ),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).shadowColor,
                  blurRadius: Constants.sizeBorderBlurRadius,
                  spreadRadius: Constants.sizeBorderSpreadRadius,
                  offset: const Offset(0.0, 0.0),
                ),
              ],
              color: Theme.of(context).cardColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(Constants.sizeBorderRadius),
              ),
            ),
            child: InkWell(
              onTap: () {
                Get.toNamed('/settings/clusters');
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Constants.colorPrimary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Constants.sizeBorderRadius),
                        topRight: Radius.circular(Constants.sizeBorderRadius),
                      ),
                    ),
                    height: 140,
                    width: MediaQuery.of(context).size.width,
                    child: const Icon(
                      CustomIcons.clusters,
                      color: Colors.white,
                      size: 108,
                    ),
                  ),
                  const SizedBox(height: Constants.spacingSmall),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: Constants.spacingSmall,
                    ),
                    child: Text(
                      'Add a Cluster',
                      style: primaryTextStyle(
                        context,
                      ),
                    ),
                  ),
                  const SizedBox(height: Constants.spacingExtraSmall),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: Constants.spacingSmall,
                    ),
                    child: Text(
                      'Add your fist cluster and start using kubenav',
                      style: secondaryTextStyle(
                        context,
                      ),
                    ),
                  ),
                  const SizedBox(height: Constants.spacingSmall),
                ],
              ),
            ),
          ),
        ),
      ];
    }

    return [
      AppActionsHeaderWidget(
        actions: [
          AppActionsHeaderModel(
            title: 'Resources',
            icon: CustomIcons.kubernetes,
            onTap: () {
              Get.toNamed(Routes.resources);
            },
          ),
          AppActionsHeaderModel(
            title: 'Plugins',
            icon: Icons.extension,
            onTap: () {
              Get.toNamed(Routes.plugins);
            },
          ),
          AppActionsHeaderModel(
            title: 'Settings',
            icon: Icons.settings,
            onTap: () {
              Get.toNamed(Routes.settings);
            },
          ),
          AppActionsHeaderModel(
            title: 'Clusters',
            icon: CustomIcons.clusters,
            onTap: () {
              Get.toNamed(Routes.settingsClusters);
            },
          ),
          AppActionsHeaderModel(
            title: 'Bookmarks',
            icon: Icons.bookmark,
            onTap: () {
              Get.toNamed(Routes.resourcesBookmarks);
            },
          ),
          AppActionsHeaderModel(
            title: 'GitHub',
            icon: CustomIcons.github,
            onTap: () {
              openUrl('https://github.com/kubenav/kubenav');
            },
          ),
        ],
      ),
      const MetricsWidget(
        nodeName: null,
      ),
      const SizedBox(height: Constants.spacingMiddle),
      const EventsWidget(),
      const SizedBox(height: Constants.spacingSmall),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(CustomIcons.clusters),
            tooltip: 'Select active cluster',
            onPressed: () {
              controller.showClusters();
            },
          ),
        ],
        leading: const Padding(
          padding: EdgeInsets.only(left: Constants.spacingMiddle),
          child: Icon(
            CustomIcons.kubenav,
            size: 42,
          ),
        ),
        title: Obx(
          () {
            return Column(
              children: [
                const Text(
                  'kubenav',
                  textAlign: TextAlign.center,
                  style: TextStyle(
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
          children: buildContent(context),
        ),
      ),
    );
  }
}
