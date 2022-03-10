import 'dart:io' show Platform;

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/pages/settings/settings_controller.dart';
import 'package:kubenav/pages/settings/widgets/help_widget.dart';
import 'package:kubenav/pages/settings/widgets/info_widget.dart';
import 'package:kubenav/pages/settings/widgets/sponsor_widget.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/custom_icons.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/app_floating_action_buttons_widget.dart';

class Settings extends GetView<SettingsController> {
  const Settings({Key? key}) : super(key: key);

  /// [buildSponsors] is used to decided if we can show the sponsors section or not. This is required because Apple
  /// doesn't like it, when you are not using their In-App Purchase API.
  /// See https://github.com/kubenav/kubenav/commit/6b4932a313a55366fa5b4674800a3cf40df23647
  Widget buildSponsors() {
    if (!Platform.isIOS) {
      return const SponsorWidget();
    }

    return Container();
  }

  Widget buildClusters(BuildContext context) {
    if (controller.clusterController.clusters.isEmpty) {
      return Container(
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
                    style: primaryTextStyle(),
                  ),
                ),
                const SizedBox(height: Constants.spacingExtraSmall),
                Padding(
                  padding: const EdgeInsets.only(
                    left: Constants.spacingSmall,
                  ),
                  child: Text(
                    'Add your fist cluster and start using kubenav',
                    style: secondaryTextStyle(),
                  ),
                ),
                const SizedBox(height: Constants.spacingSmall),
              ],
            ),
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.only(
        left: Constants.spacingMiddle,
        right: Constants.spacingMiddle,
      ),
      height: 128,
      child: Obx(
        () {
          return GridView.count(
            scrollDirection: Axis.horizontal,
            crossAxisCount: 2,
            childAspectRatio: 0.25,
            mainAxisSpacing: 16.0,
            children: List.generate(
              controller.clusterController.clusters.length <= 6
                  ? controller.clusterController.clusters.length
                  : 6,
              (index) {
                return Container(
                  margin: const EdgeInsets.only(
                    top: Constants.spacingSmall,
                    bottom: Constants.spacingSmall,
                    left: Constants.spacingSmall,
                    right: Constants.spacingSmall,
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
                      controller.clusterController.setActiveCluster(index);
                    },
                    child: Row(
                      children: [
                        Icon(
                          index ==
                                  controller.clusterController
                                      .activeClusterIndex.value
                              ? Icons.radio_button_checked
                              : Icons.radio_button_unchecked,
                          size: 24,
                          color: Constants.colorPrimary,
                        ),
                        const SizedBox(width: Constants.spacingSmall),
                        Expanded(
                          child: Text(
                            controller.clusterController.getActiveClusterName(),
                            style: noramlTextStyle(),
                            overflow: TextOverflow.ellipsis,
                          ),
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Settings"),
      ),
      bottomNavigationBar: const AppBottomNavigationBarWidget(),
      floatingActionButton: const AppFloatingActionButtonsWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: Constants.spacingSmall),
            Padding(
              padding: const EdgeInsets.only(
                top: Constants.spacingMiddle,
                left: Constants.spacingMiddle,
                right: Constants.spacingMiddle,
                bottom: Constants.spacingSmall,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text('Clusters', style: primaryTextStyle(size: 18)),
                    flex: 1,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed('/settings/clusters');
                    },
                    child: Wrap(
                      children: [
                        Text('View all',
                            style: secondaryTextStyle(
                              color: Constants.colorPrimary,
                            )),
                        const SizedBox(width: Constants.spacingExtraSmall),
                        const Icon(
                          Icons.keyboard_arrow_right,
                          color: Constants.colorPrimary,
                          size: 16,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Obx(() {
              return buildClusters(context);
            }),
            Padding(
              padding: const EdgeInsets.all(
                Constants.spacingMiddle,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Settings',
                      style: primaryTextStyle(size: 18),
                    ),
                  ),
                ],
              ),
            ),
            const HelpWidget(),
            const InfoWidget(),
            buildSponsors(),
            const SizedBox(height: Constants.spacingMiddle),
          ],
        ),
      ),
    );
  }
}
