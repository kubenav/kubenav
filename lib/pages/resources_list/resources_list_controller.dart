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
  RxString error = ''.obs;
  RxBool loading = false.obs;
  Worker? worker;

  @override
  void onInit() {
    // Get a list of resource items, when the controller is initialized.
    getResources();

    // Whenever the active cluster changes, e.g. the user selects a new namespace, we reload the list of resource items.
    // To not get the resources when the user changed the resource, we have to call 'worker.dispose()' in the 'onClose'
    // method of the controller.
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

  // getResources returns all items for the requested 'resource', 'path' and 'scope'. If the optional 'namespace' and
  // 'selector' properties are defined, the will also be used to get the resource. If not we will use the namespace from
  // the active cluster when the resource hasn't a namespaced scope.
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

  // showNamespaces shows a bottom sheet to select the namespace for the active cluster. This allows a user to quickly
  // change the namespace within the resource list page, so that he haven't to go to the settings page to edit the
  // current cluster configuration.
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
