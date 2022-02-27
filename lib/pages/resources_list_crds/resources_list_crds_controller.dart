import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:kubenav/controllers/cluster_controller.dart';
import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/models/kubernetes/api.dart'
    show
        IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionList;

class ResourcesListCRDsController extends GetxController {
  ClusterController clusterController = Get.find();

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
          debugPrint(
              'getResourcesCRDs success: ${crds.items.length} CRDs were returned');

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
                buildDetailsItem: (dynamic item) => const Text('test'),
              ));
            }
          }

          items.value = resources;
        }

        loading.value = false;
      } catch (err) {
        debugPrint('getResourcesCRDs error: $err');
        error.value = err.toString();
        loading.value = false;
      }
    }
  }
}
