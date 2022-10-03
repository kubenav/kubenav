import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'package:kubenav/controllers/cluster_controller.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_config_map.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_config_map_list.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/widgets/app_namespaces_widget.dart';

class PrometheusListController extends GetxController {
  ClusterController clusterController = Get.find();

  PrometheusListController();

  RxList<IoK8sApiCoreV1ConfigMap> items = <IoK8sApiCoreV1ConfigMap>[].obs;
  RxString error = ''.obs;
  RxBool loading = false.obs;
  Worker? worker;

  /// When [onInit] is called we get a list of resource items.
  @override
  void onInit() {
    getDashboards();

    /// Whenever the active cluster changes, e.g. the user selects a new namespace, we reload the list of resource
    /// items. To not get the resources when the user changed the resource, we have to call `worker.dispose()` in the
    /// [onClose] method of the controller.
    if (clusterController.clusters.isNotEmpty &&
        clusterController.activeClusterIndex.value != -1) {
      worker = ever(
          clusterController
              .clusters[clusterController.activeClusterIndex.value], (_) {
        getDashboards();
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

  /// [getDashboards] returns all dashboards for the selected namespace.
  void getDashboards() async {
    loading.value = true;
    error.value = '';

    final cluster = clusterController.getActiveCluster();

    if (cluster == null) {
      error.value = 'No active cluster';
    } else {
      try {
        final url =
            '/api/v1${cluster.namespace != '' ? '/namespaces/${cluster.namespace}' : ''}/configmaps?labelSelector=kubenav.io/prometheus=dashboard';

        final result =
            await KubernetesService(cluster: cluster).getRequest(url);
        final configMapsList = IoK8sApiCoreV1ConfigMapList.fromJson(result);

        Logger.log(
          'PrometheusListController getDashboards',
          '${configMapsList?.items.length} ConfigMaps were returned',
        );

        final List<IoK8sApiCoreV1ConfigMap> configMaps = [];
        if (configMapsList != null && configMapsList.items.isNotEmpty) {
          for (var item in configMapsList.items) {
            configMaps.add(item);
          }
        }

        items.value = configMaps;
        loading.value = false;
      } on PlatformException catch (err) {
        Logger.log(
          'PrometheusListController getDashboards',
          'An error was returned while getting ConfigMaps',
          'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}',
        );
        error.value =
            'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}';
        loading.value = false;
      } catch (err) {
        Logger.log(
          'PrometheusListController getDashboards',
          'An error was returned while getting ConfigMaps',
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
