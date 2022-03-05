import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:kubenav/controllers/cluster_controller.dart';
import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/widgets/app_namespaces_widget.dart';

class ResourcesListController extends GetxController {
  ClusterController clusterController = Get.find();

  String? title;
  String? resource;
  String? path;
  ResourceScope? scope;
  String? namespace;
  String? selector;

  ResourcesListController({
    required this.title,
    required this.resource,
    required this.path,
    required this.scope,
    required this.namespace,
    required this.selector,
  });

  RxList<dynamic> items = <dynamic>[].obs;
  dynamic metrics;
  RxString error = ''.obs;
  RxBool loading = false.obs;
  Worker? worker;

  /// When [onInit] is called we get a list of resource items.
  @override
  void onInit() {
    getResources();

    /// Whenever the active cluster changes, e.g. the user selects a new namespace, we reload the list of resource
    /// items. To not get the resources when the user changed the resource, we have to call `worker.dispose()` in the
    /// [onClose] method of the controller.
    if (namespace == null &&
        clusterController.clusters.isNotEmpty &&
        clusterController.activeClusterIndex.value != -1) {
      worker = ever(
          clusterController
              .clusters[clusterController.activeClusterIndex.value], (_) {
        getResources();
      });
    }

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    if (worker != null) {
      worker!.dispose();
    }

    super.onClose();
  }

  /// [getResources] returns all items for the requested [resource], [path] and [scope]. If the optional [namespace] and
  /// [selector] properties are defined, the will also be used to get the resource. If not we will use the namespace
  /// from the active cluster when the resource hasn't a namespaced scope.
  void getResources() async {
    if (title == null || resource == null || path == null || scope == null) {
      Logger.log(
        'ResourcesListController getResources',
        'The requested resource was not found',
        'title: $title, resource: $resource, path: $path, scope: $scope',
      );
      error.value = 'The requested resource was not found';
    } else {
      loading.value = true;
      await getMetrics();

      final cluster = clusterController.getActiveCluster();
      if (cluster == null) {
        error.value = 'No active cluster';
      } else {
        final url = scope == ResourceScope.cluster
            ? '$path/$resource?${selector ?? ''}'
            : namespace != null
                ? '$path/namespaces/$namespace/$resource?${selector ?? ''}'
                : '$path${cluster.namespace != '' ? '/namespaces/${cluster.namespace}' : ''}/$resource?${selector ?? ''}';

        try {
          final resourcesList =
              await KubernetesService(cluster: cluster).getRequest(url);

          Logger.log(
            'ResourcesListController getResources',
            '${resourcesList['items'].length} items were returned',
            'Request URL: $url\nManifest: $resourcesList',
          );
          items.value = resourcesList['items'];
          loading.value = false;
        } on PlatformException catch (err) {
          Logger.log(
            'ResourcesListController getResources',
            'An error was returned while getting resources',
            'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}',
          );
          error.value =
              'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}';
          loading.value = false;
        } catch (err) {
          Logger.log(
            'ResourcesListController getResources',
            'An error was returned while getting resources',
            err,
          );
          error.value = err.toString();
          loading.value = false;
        }
      }
    }
  }

  /// [getMetrics] returns the metrics for Pods and Nodes. The returned list can be used to show the CPU / Memory usage
  /// of a Pod / Node within the list item. We try to get the metrics within the list screen so that we do not have to
  /// make one API call per returned Pod / Node.
  Future getMetrics() async {
    if (title == null || resource == null || path == null || scope == null) {
      Logger.log(
        'ResourcesListController getMetrics',
        'The requested resource was not found',
        'title: $title, resource: $resource, path: $path, scope: $scope',
      );
    } else {
      final cluster = clusterController.getActiveCluster();
      if (cluster == null) {
        error.value = 'No active cluster';
      } else {
        if ((resource == Resources.map['pods']!.resource &&
                path == Resources.map['pods']!.path) ||
            (resource == Resources.map['nodes']!.resource &&
                path == Resources.map['nodes']!.path)) {
          final url = scope == ResourceScope.cluster
              ? '/apis/metrics.k8s.io/v1beta1/$resource?${selector ?? ''}'
              : namespace != null
                  ? '/apis/metrics.k8s.io/v1beta1/namespaces/$namespace/$resource?${selector ?? ''}'
                  : '/apis/metrics.k8s.io/v1beta1${cluster.namespace != '' ? '/namespaces/${cluster.namespace}' : ''}/$resource?${selector ?? ''}';

          try {
            final resourcesList =
                await KubernetesService(cluster: cluster).getRequest(url);

            Logger.log(
              'ResourcesListController getMetrics',
              '${resourcesList['items'].length} items were returned',
              'Request URL: $url\nManifest: $resourcesList',
            );
            metrics = resourcesList;
          } on PlatformException catch (err) {
            Logger.log(
              'ResourcesListController getMetrics',
              'An error was returned while getting metrics',
              'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}',
            );
          } catch (err) {
            Logger.log(
              'ResourcesListController getMetrics',
              'An error was returned while getting metrics',
              err,
            );
          }
        } else {
          Logger.log(
            'ResourcesListController getMetrics',
            'Metrics are only supported for Pods and Nodes',
          );
        }
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
