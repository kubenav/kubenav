import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/models/helm_model.dart';
import 'package:kubenav/pages/plugins/pages/helm_details/helm_details_controller.dart';
import 'package:kubenav/pages/plugins/pages/helm_details/widgets/details_template_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/details_item_widget.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/widgets/app_actions_header_widget.dart';
import 'package:kubenav/widgets/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/app_error_widget.dart';
import 'package:kubenav/widgets/app_floating_action_buttons_widget.dart';
import 'package:kubenav/widgets/app_vertical_list_simple_widget.dart';

class HelmDetails extends GetView {
  const HelmDetails({Key? key}) : super(key: key);

  Widget buildDetails(Release? release) {
    if (release != null) {
      return DetailsItemWidget(
        title: 'Details',
        details: [
          DetailsItemModel(
            name: 'Name',
            values: release.name,
          ),
          DetailsItemModel(
            name: 'Namespace',
            values: release.namespace,
          ),
          DetailsItemModel(
            name: 'Version',
            values: release.version,
          ),
          DetailsItemModel(
            name: 'Staus',
            values: release.info?.status,
          ),
          DetailsItemModel(
            name: 'Description',
            values: release.info?.description,
          ),
          DetailsItemModel(
            name: 'First Deployed',
            values:
                formatTime(DateTime.parse(release.info?.firstDeployed ?? '')),
          ),
          DetailsItemModel(
            name: 'Last Deployed',
            values:
                formatTime(DateTime.parse(release.info?.lastDeployed ?? '')),
          ),
          DetailsItemModel(
            name: 'Notes',
            values: release.info?.notes,
          ),
        ],
      );
    }

    return Container();
  }

  Widget buildTemplates(BuildContext context, Release? release) {
    if (release != null &&
        release.chart != null &&
        release.chart!.templates != null) {
      return AppVertialListSimpleWidget(
        title: 'Templates',
        items: release.chart!.templates!
            .map(
              (template) => AppVertialListSimpleModel(
                onTap: () {
                  Get.bottomSheet(
                    BottomSheet(
                      onClosing: () {},
                      enableDrag: false,
                      builder: (builder) {
                        return DetailsTemplateWidget(
                          name: template.name ?? '',
                          template: template.data != null
                              ? utf8.decode(base64.decode(template.data!))
                              : '',
                        );
                      },
                    ),
                    isScrollControlled: true,
                  );
                },
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Characters(template.name ?? '')
                              .replaceAll(
                                  Characters(''), Characters('\u{200B}'))
                              .toString(),
                          style: primaryTextStyle(
                            context,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
            .toList(),
      );
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    HelmDetailsController controller = Get.put(
      HelmDetailsController(
        namespace: Get.parameters['namespace'],
        name: Get.parameters['name'],
        version: Get.parameters['version'],
      ),
      tag:
          '${Get.parameters['namespace']} ${Get.parameters['name']} ${Get.parameters['version']}',
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Text(
              Characters('${controller.name} v${controller.version}')
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
              Characters(controller.namespace ?? 'No Namespace')
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
                            message: 'Could not load Helm chart',
                            details: controller.error.value,
                            icon: 'assets/plugins/image108x108/helm.png',
                          ),
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
                          title: 'Values',
                          icon: Icons.description,
                          onTap: () {
                            controller.showValues();
                          },
                        ),
                        AppActionsHeaderModel(
                          title: 'Refresh',
                          icon: Icons.refresh,
                          onTap: () {
                            controller.getHelmChart();
                          },
                        ),
                      ],
                    ),
                    buildDetails(controller.item?.value),
                    const SizedBox(height: Constants.spacingMiddle),
                    AppVertialListSimpleWidget(
                      title: 'History',
                      items: controller.history
                          .map(
                            (release) => AppVertialListSimpleModel(
                              onTap: () {
                                Get.toNamed(
                                  '/plugins/helm/details?namespace=${release.namespace}&name=${release.name}&version=${release.version}',
                                  preventDuplicates: false,
                                );
                              },
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        Characters(
                                                'Revision: ${release.version ?? ''}')
                                            .replaceAll(Characters(''),
                                                Characters('\u{200B}'))
                                            .toString(),
                                        style: primaryTextStyle(
                                          context,
                                        ),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        Characters(
                                                'Updated: ${formatTime(DateTime.parse(release.info?.lastDeployed ?? ''))}')
                                            .replaceAll(Characters(''),
                                                Characters('\u{200B}'))
                                            .toString(),
                                        style: secondaryTextStyle(
                                          context,
                                        ),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        Characters(
                                                'Status: ${release.info?.status}')
                                            .replaceAll(Characters(''),
                                                Characters('\u{200B}'))
                                            .toString(),
                                        style: secondaryTextStyle(
                                          context,
                                        ),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        Characters(
                                                'Chart: ${release.chart?.metadata?.version}')
                                            .replaceAll(Characters(''),
                                                Characters('\u{200B}'))
                                            .toString(),
                                        style: secondaryTextStyle(
                                          context,
                                        ),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        Characters(
                                                'Chart: ${release.chart?.metadata?.appVersion}')
                                            .replaceAll(Characters(''),
                                                Characters('\u{200B}'))
                                            .toString(),
                                        style: secondaryTextStyle(
                                          context,
                                        ),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: Constants.spacingMiddle),
                    buildTemplates(context, controller.item?.value),
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
