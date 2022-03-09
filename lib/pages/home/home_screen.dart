import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kubenav/pages/home/home_controller.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/custom_icons.dart';
import 'package:kubenav/widgets/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/app_actions_header_widget.dart';
import 'package:kubenav/widgets/app_floating_action_buttons_widget.dart';

class Home extends GetView<HomeController> {
  const Home({Key? key}) : super(key: key);

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
          children: [
            AppActionsHeaderWidget(
              actions: [
                AppActionsHeaderModel(
                  title: 'Refresh',
                  icon: Icons.refresh,
                  onTap: () {},
                ),
                AppActionsHeaderModel(
                  title: 'Bookmark',
                  icon: Icons.bookmark_border,
                  onTap: () {},
                ),
                AppActionsHeaderModel(
                  title: 'Create',
                  icon: Icons.create,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
