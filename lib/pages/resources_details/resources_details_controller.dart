import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:kubenav/controllers/cluster_controller.dart';
import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/services/cluster_service.dart';
import 'package:kubenav/widgets/resources/delete_resource_widget.dart';
import 'package:kubenav/widgets/resources/show_yaml_widget.dart';
import 'package:kubenav/utils/constants.dart';

class ResourcesDetailsController extends GetxController {
  ClusterController clusterController = Get.find();

  String? title = Get.parameters['title'];
  String? resource = Get.parameters['resource'];
  String? path = Get.parameters['path'];
  ResourceScope? scope = resourceScopeFromString(Get.parameters['scope']);
  String? name = Get.parameters['name'];
  String? namespace = Get.parameters['namespace'];

  RxMap<String, dynamic> item = <String, dynamic>{}.obs;
  RxString error = ''.obs;
  RxBool loading = false.obs;

  @override
  void onInit() {
    // Get the resource for the specified resource name and the name and namespace of the resource. The namespace
    // parameter is optional and only required for namespaced resources.
    getResource();

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

  void getResource() async {
    if (title == null ||
        resource == null ||
        path == null ||
        scope == null ||
        name == null) {
      debugPrint(
          'title: $title, resource: $resource, path: $path, scope: $scope, name: $name, namespace: $namespace');
      error.value = 'The requested resource was not found';
    } else {
      loading.value = true;
      final cluster = clusterController
          .clusters[clusterController.activeClusterIndex.value].value;

      final url = namespace == null
          ? '$path/$resource/$name'
          : '$path/namespaces/$namespace/$resource/$name';

      try {
        final resource = await ClusterService(cluster: cluster).getRequest(url);

        debugPrint('getResource success: ${resource.toString()}');
        item.value = resource;
        loading.value = false;
      } catch (err) {
        debugPrint('getResources error: $err');
        error.value = err.toString();
        loading.value = false;
      }
    }
  }

  void showYaml() {
    Get.bottomSheet(
      BottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.sizeBorderRadius),
        ),
        onClosing: () {},
        enableDrag: false,
        builder: (builder) {
          return ShowYamlWidget(item: item);
        },
      ),
      isScrollControlled: true,
    );
  }

  void deleteResource() async {
    if (resource != null && path != null && name != null) {
      Get.bottomSheet(
        BottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Constants.sizeBorderRadius),
          ),
          onClosing: () {},
          enableDrag: false,
          builder: (builder) {
            return DeleteResourceWidget(
              resource: resource!,
              path: path!,
              name: name!,
              namespace: namespace,
            );
          },
        ),
        isScrollControlled: true,
      );
    }
  }
}
