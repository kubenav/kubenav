import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:kubenav/controllers/cluster_controller.dart';
import 'package:kubenav/models/kubernetes/api.dart'
    show IoK8sApiCoreV1Namespace, IoK8sApiCoreV1NamespaceList;
import 'package:kubenav/services/cluster_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/custom_icons.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/app_bottom_sheet_widget.dart';
import 'package:kubenav/widgets/app_error_widget.dart';

class AppNamespacesController extends GetxController {
  ClusterController clusterController = Get.find();
  RxList<IoK8sApiCoreV1Namespace> namespaces = <IoK8sApiCoreV1Namespace>[].obs;
  RxString error = ''.obs;
  RxBool loading = false.obs;

  @override
  void onInit() {
    getNamespaces();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getNamespaces() async {
    loading.value = true;

    try {
      final data = await ClusterService(
              cluster: clusterController
                  .clusters[clusterController.activeClusterIndex.value].value)
          .getRequest('/api/v1/namespaces');
      final namespaceList = IoK8sApiCoreV1NamespaceList.fromJson(data);

      debugPrint(
          'getNamespaces success: ${namespaceList!.items.length} namespaces were returned');

      namespaces.value = namespaceList.items;
      loading.value = false;
    } catch (err) {
      debugPrint('getNamespaces error: $err');
      error.value = err.toString();
      loading.value = false;
    }
  }
}

class AppNamespacesWidget extends StatelessWidget {
  const AppNamespacesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppNamespacesController controller = Get.put(
      AppNamespacesController(),
    );

    return AppBottomSheetWidget(
      title: 'Namespaces',
      subtitle: 'Select the active namespace',
      icon: CustomIcons.namespaces,
      onClosePressed: () {
        debugPrint('Close app namespaces widget buttom sheet');
        finish(context);
      },
      actionText: 'Close',
      onActionPressed: () {
        finish(context);
      },
      child: Obx(
        () {
          if (controller.loading.value) {
            return Flex(
              direction: Axis.vertical,
              children: [
                Expanded(
                  child: Wrap(
                    children: const [
                      CircularProgressIndicator(color: Constants.colorPrimary),
                    ],
                  ),
                ),
              ],
            );
          }

          if (controller.error.value != '') {
            return Flex(
              direction: Axis.vertical,
              children: [
                Expanded(
                  child: Wrap(
                    children: [
                      AppErrorWidget(error: controller.error.value),
                    ],
                  ),
                ),
              ],
            );
          }

          return ListView(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: Constants.spacingSmall,
                  bottom: Constants.spacingSmall,
                  left: Constants.spacingExtraSmall,
                  right: Constants.spacingExtraSmall,
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
                    controller.clusterController.setNamespace('');
                    finish(context);
                  },
                  child: Row(
                    children: [
                      Icon(
                        controller
                                    .clusterController
                                    .clusters[controller.clusterController
                                        .activeClusterIndex.value]
                                    .value
                                    .namespace ==
                                ''
                            ? Icons.radio_button_checked
                            : Icons.radio_button_unchecked,
                        size: 24,
                        color: Constants.colorPrimary,
                      ),
                      const SizedBox(width: Constants.spacingSmall),
                      Expanded(
                        child: Text(
                          'All Namespaces',
                          style: noramlTextStyle(),
                          overflow: TextOverflow.ellipsis,
                        ),
                        flex: 1,
                      ),
                    ],
                  ),
                ),
              ),
              ...List.generate(
                controller.namespaces.length,
                (index) {
                  final name = controller.namespaces[index].metadata?.name;

                  return Container(
                    margin: const EdgeInsets.only(
                      top: Constants.spacingSmall,
                      bottom: Constants.spacingSmall,
                      left: Constants.spacingExtraSmall,
                      right: Constants.spacingExtraSmall,
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
                        controller.clusterController
                            .setNamespace(name ?? 'default');
                        finish(context);
                      },
                      child: Row(
                        children: [
                          Icon(
                            name != null &&
                                    name ==
                                        controller
                                            .clusterController
                                            .clusters[controller
                                                .clusterController
                                                .activeClusterIndex
                                                .value]
                                            .value
                                            .namespace
                                ? Icons.radio_button_checked
                                : Icons.radio_button_unchecked,
                            size: 24,
                            color: Constants.colorPrimary,
                          ),
                          const SizedBox(width: Constants.spacingSmall),
                          Expanded(
                            child: Text(
                              name ?? '',
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
            ],
          );
        },
      ),
    );
  }
}
