import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kubenav/pages/clusters/clusters_controller.dart';
import 'package:kubenav/pages/clusters/widgets/cluster_item_widget.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/app_horizontal_list_cards_widget.dart';

class Clusters extends GetView<ClustersController> {
  const Clusters({Key? key}) : super(key: key);

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
        title: const Text('Clusters'),
      ),
      bottomNavigationBar: const AppBottomNavigationBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: Constants.spacingSmall),
            AppHorizontalListCardsWidget(
              title: 'Add Cluster',
              cards: List.generate(
                controller.providers.length,
                (index) => AppHorizontalListCardsModel(
                  title: controller.providers[index].title,
                  subtitle: controller.providers[index].subtitle,
                  image: controller.providers[index].image250x140,
                  onTap: () {
                    controller.showAddClusterBottomSheet(index);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(
                Constants.spacingMiddle,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Clusters',
                      style: primaryTextStyle(size: 18),
                    ),
                  ),
                ],
              ),
            ),
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
                    controller.clusterController.reorder(start, current);
                  },
                  proxyDecorator: _proxyDecorator,
                  itemCount: controller.clusterController.clusters.length,
                  itemBuilder: (
                    context,
                    index,
                  ) {
                    return Container(
                      key: Key(
                        controller.clusterController.clusters[index].value.name,
                      ),
                      child: Obx(
                        () {
                          return ClusterItemWidget(
                            key: Key(
                              controller
                                  .clusterController.clusters[index].value.name,
                            ),
                            cluster: controller
                                .clusterController.clusters[index].value,
                            isActiveCluster: index ==
                                controller
                                    .clusterController.activeClusterIndex.value,
                            provider: controller.getProvider(controller
                                .clusterController
                                .clusters[index]
                                .value
                                .provider),
                            onTap: () {
                              controller.clusterController
                                  .setActiveCluster(index);
                            },
                            onDoubleTap: () {
                              controller.showClusterActionsBottomSheet(index);
                            },
                          );
                        },
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
