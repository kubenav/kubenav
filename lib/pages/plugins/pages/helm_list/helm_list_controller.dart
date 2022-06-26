import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'package:kubenav/controllers/cluster_controller.dart';
import 'package:kubenav/models/helm_model.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/widgets/app_namespaces_widget.dart';

class HelmListController extends GetxController {
  ClusterController clusterController = Get.find();

  HelmListController();

  RxList<Release> items = <Release>[].obs;
  RxString error = ''.obs;
  RxBool loading = false.obs;
  Worker? worker;

  /// When [onInit] is called we get a list of resource items.
  @override
  void onInit() {
    getHelmCharts();

    /// Whenever the active cluster changes, e.g. the user selects a new namespace, we reload the list of resource
    /// items. To not get the resources when the user changed the resource, we have to call `worker.dispose()` in the
    /// [onClose] method of the controller.
    if (clusterController.clusters.isNotEmpty &&
        clusterController.activeClusterIndex.value != -1) {
      worker = ever(
          clusterController
              .clusters[clusterController.activeClusterIndex.value], (_) {
        getHelmCharts();
      });
    }

    super.onInit();
  }

  @override
  void onClose() {
    if (worker != null) {
      worker!.dispose();
    }

    super.onClose();
  }

  /// [getHelmCharts] returns a list of Helm charts for the selected namespace or all namespaces.
  void getHelmCharts() async {
    loading.value = true;

    final cluster = clusterController.getActiveCluster();
    if (cluster == null) {
      error.value = 'No active cluster';
    } else {
      try {
        final releases = await KubernetesService(cluster: cluster)
            .helmListCharts(cluster.namespace);

        Logger.log(
          'HelmListController getHelmCharts',
          'Helm charts were returned',
        );
        items.value = releases;
        loading.value = false;
      } on PlatformException catch (err) {
        Logger.log(
          'HelmListController getHelmCharts',
          'An error was returned while getting Helm charts',
          'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}',
        );
        error.value =
            'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}';
        loading.value = false;
      } catch (err) {
        Logger.log(
          'HelmListController getHelmCharts',
          'An error was returned while getting Helm charts',
          err,
        );
        error.value = err.toString();
        loading.value = false;
      }
    }
  }

  /// [showNamespaces] shows a bottom sheet to select the namespace for the active cluster. This allows a user to
  /// quickly change the namespace within the resource list page, so that he haven't to go to the settings page to edit
  /// the current cluster configuration.
  void showNamespaces() {
    Get.bottomSheet(
      BottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.sizeBorderRadius),
        ),
        onClosing: () {},
        enableDrag: false,
        builder: (builder) {
          return const AppNamespacesWidget();
        },
      ),
      isScrollControlled: true,
    );
  }
}
