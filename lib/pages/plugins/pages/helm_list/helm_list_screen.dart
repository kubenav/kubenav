import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/models/helm_model.dart';
import 'package:kubenav/pages/plugins/pages/helm_list/helm_list_controller.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/custom_icons.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/widgets/app_actions_header_widget.dart';
import 'package:kubenav/widgets/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/app_error_widget.dart';
import 'package:kubenav/widgets/app_floating_action_buttons_widget.dart';

class HelmList extends GetView {
  const HelmList({Key? key}) : super(key: key);

  Widget buildItem(BuildContext context, Release release) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: Constants.spacingMiddle,
      ),
      padding: const EdgeInsets.all(12.0),
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
          Get.toNamed(
            '/plugins/helm/details?name=${release.name}&namespace=${release.namespace}&version=${release.version}',
          );
        },
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Characters(release.name ?? '')
                        .replaceAll(Characters(''), Characters('\u{200B}'))
                        .toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: primaryTextStyle(
                      context,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Characters('Namespace: ${release.namespace}')
                            .replaceAll(Characters(''), Characters('\u{200B}'))
                            .toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: secondaryTextStyle(
                          context,
                        ),
                      ),
                      Text(
                        Characters('Revision: ${release.version}')
                            .replaceAll(Characters(''), Characters('\u{200B}'))
                            .toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: secondaryTextStyle(
                          context,
                        ),
                      ),
                      Text(
                        Characters(
                                'Updated: ${formatTime(DateTime.parse(release.info?.lastDeployed ?? ''))}')
                            .replaceAll(Characters(''), Characters('\u{200B}'))
                            .toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: secondaryTextStyle(
                          context,
                        ),
                      ),
                      Text(
                        Characters('Status: ${release.info?.status}')
                            .replaceAll(Characters(''), Characters('\u{200B}'))
                            .toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: secondaryTextStyle(
                          context,
                        ),
                      ),
                      Text(
                        Characters('Chart: ${release.chart?.metadata?.version}')
                            .replaceAll(Characters(''), Characters('\u{200B}'))
                            .toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: secondaryTextStyle(
                          context,
                        ),
                      ),
                      Text(
                        Characters(
                                'App Version: ${release.chart?.metadata?.appVersion}')
                            .replaceAll(Characters(''), Characters('\u{200B}'))
                            .toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: secondaryTextStyle(
                          context,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    HelmListController controller = Get.put(
      HelmListController(),
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(CustomIcons.namespaces),
            tooltip: 'Select active namespace',
            onPressed: () {
              controller.showNamespaces();
            },
          ),
        ],
        title: Column(
          children: [
            Text(
              Characters('Helm Charts')
                  .replaceAll(Characters(''), Characters('\u{200B}'))
                  .toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Obx(() {
              return Text(
                Characters(controller.clusterController
                                .getActiveClusterNamespace() ==
                            ''
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
              );
            })
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
                            message: 'Could not load Helm charts',
                            details: controller.error.value,
                            icon: 'assets/plugins/image108x108/helm.png',
                          ),
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
                          title: 'Refresh',
                          icon: Icons.refresh,
                          onTap: () {
                            controller.getHelmCharts();
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
                            itemCount: controller.items.length,
                            itemBuilder: (context, index) {
                              return buildItem(
                                  context, controller.items[index]);
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
