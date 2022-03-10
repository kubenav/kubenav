import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'package:kubenav/controllers/cluster_controller.dart';
import 'package:kubenav/models/kubernetes/io_k8s_apiextensions_apiserver_pkg_apis_apiextensions_v1_custom_resource_definition_list.dart';
import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/logger.dart';

class ResourcesListCRDsController extends GetxController {
  ClusterController clusterController = Get.find();
  final search = TextEditingController();
  RxString filter = ''.obs;

  RxList<Resource> items = <Resource>[].obs;
  RxString error = ''.obs;
  RxBool loading = false.obs;
  Worker? worker;

  @override
  void onInit() {
    getResources();

    super.onInit();
  }

  @override
  void onClose() {
    if (worker != null) {
      worker!.dispose();
    }

    super.onClose();
  }

  /// [getItems] returns a list of items, where the resource name contains the user provided [filter] value. The
  /// [filter] is set from the [search] text field when a user submits this field.
  List<Resource> getItems() {
    if (filter.value == '') {
      return items.toList();
    }

    return items
        .where((item) =>
            item.title.toLowerCase().contains(filter.value.toLowerCase()))
        .toList();
  }

  /// [getResources] returns a list of CRDs. For that the returned CustomResourceDefinitionList from the Kubernetes API
  /// is converted into our internal `Resource` type.
  void getResources() async {
    loading.value = true;
    final cluster = clusterController.getActiveCluster();
    if (cluster == null) {
      error.value = 'No active cluster';
    } else {
      final url =
          '${Resources.map['customresourcedefinitions']!.path}/${Resources.map['customresourcedefinitions']!.resource}';

      try {
        final data = await KubernetesService(cluster: cluster).getRequest(url);
        final crds =
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionList
                .fromJson(data);
        if (crds != null) {
          Logger.log(
            'ResourcesListCRDsController getResources',
            '${crds.items.length} items were returned',
            'Request URL: $url\nManifest: ${crds.toString()}',
          );

          final List<Resource> resources = [];
          for (final crd in crds.items) {
            for (final version in crd.spec.versions) {
              resources.add(Resource(
                resourceType: ResourceType.cluster,
                title: crd.spec.names.kind,
                description: '${crd.spec.group}/${version.name}',
                resource: crd.spec.names.plural,
                path: '/apis/${crd.spec.group}/${version.name}',
                scope: resourceScopeFromString(crd.spec.scope) ??
                    ResourceScope.cluster,
                template: '',
                buildDetailsItem: (dynamic item) => const Text('test'),
              ));
            }
          }

          items.value = resources;
        }

        loading.value = false;
      } on PlatformException catch (err) {
        Logger.log(
          'ResourcesListCRDsController getResources',
          'An error was returned while getting resources',
          'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}',
        );
        error.value =
            'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}';
        loading.value = false;
      } catch (err) {
        Logger.log(
          'ResourcesListCRDsController getResources',
          'An error was returned while getting resources',
          err,
        );
        error.value = err.toString();
        loading.value = false;
      }
    }
  }
}
