import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'package:kubenav/controllers/cluster_controller.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_namespace.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_namespace_list.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/custom_icons.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/widgets/app_bottom_sheet_widget.dart';
import 'package:kubenav/widgets/app_error_widget.dart';

/// [AppNamespacesController] is the controller for the [AppNamespacesWidget] widget. It is responsible to load the
/// namespaces of the currently active cluster.
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

  /// [getNamespaces] can be used to get a list of the [namespaces] of an cluster. While the request is executed it sets
  /// the [loading] variable to true. If an error occures it will be set via the [error] variable. If the requests
  /// completes successfully the [namespaces] variable will contain the list of namespaces.
  void getNamespaces() async {
    loading.value = true;

    try {
      final data = await KubernetesService(
              cluster: clusterController
                  .clusters[clusterController.activeClusterIndex.value].value)
          .getRequest('/api/v1/namespaces');
      final namespaceList = IoK8sApiCoreV1NamespaceList.fromJson(data);

      Logger.log(
        'AppNamespacesController getNamespaces',
        '${namespaceList!.items.length} namespaces were returned',
        namespaceList,
      );
      namespaces.value = namespaceList.items;
      loading.value = false;
    } on PlatformException catch (err) {
      Logger.log(
        'AppNamespacesController getNamespaces',
        'Could not get namespaces',
        'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}',
      );
      error.value =
          'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}';
      loading.value = false;
    } catch (err) {
      Logger.log(
        'AppNamespacesController getNamespaces',
        'Could not get namespaces',
        err,
      );
      error.value = err.toString();
      loading.value = false;
    }
  }
}

/// [AppNamespacesWidget] is a widget which can be used to switch the namespace of the currently active cluster. It
/// should be used within a bottom sheet as follows:
///
/// ```
/// Get.bottomSheet(
///   BottomSheet(
///     shape: RoundedRectangleBorder(
///       borderRadius: BorderRadius.circular(Constants.sizeBorderRadius),
///     ),
///     onClosing: () {},
///     enableDrag: false,
///     builder: (builder) {
///       return const AppNamespacesWidget();
///     },
///   ),
///   isScrollControlled: true,
/// );
/// ```
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
                      AppErrorWidget(
                        message: 'Could not load Namespaces',
                        details: controller.error.value,
                        icon: CustomIcons.namespaces,
                      ),
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
                        flex: 1,
                        child: Text(
                          'All Namespaces',
                          style: noramlTextStyle(),
                          overflow: TextOverflow.ellipsis,
                        ),
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
                            flex: 1,
                            child: Text(
                              name ?? '',
                              style: noramlTextStyle(),
                              overflow: TextOverflow.ellipsis,
                            ),
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
