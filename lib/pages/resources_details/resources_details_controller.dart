import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'package:kubenav/controllers/bookmark_controller.dart';
import 'package:kubenav/controllers/cluster_controller.dart';
import 'package:kubenav/controllers/global_settings_controller.dart';
import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/pages/resources_details/widgets/details_create_job_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/details_delete_resource_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/details_edit_resource_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/details_get_logs_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/details_live_metrics_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/details_restart_resource_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/details_scale_resource_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/details_show_yaml_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/details_terminal_widget.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/logger.dart';

class ResourcesDetailsController extends GetxController {
  GlobalSettingsController globalSettingsController = Get.find();
  BookmarkController bookmarkController = Get.find();
  ClusterController clusterController = Get.find();

  String? title;
  String? resource;
  String? path;
  ResourceScope? scope;
  String? name;
  String? namespace;

  ResourcesDetailsController({
    required this.title,
    required this.resource,
    required this.path,
    required this.scope,
    required this.name,
    required this.namespace,
  });

  RxMap<String, dynamic> item = <String, dynamic>{}.obs;
  RxString error = ''.obs;
  RxBool loading = false.obs;

  /// When [onInit] is called, we get the resource for the specified resource [name] and [namespace] of the resource.
  /// The [namespace] parameter is optional and only required for namespaced resources.
  @override
  void onInit() {
    getResource();

    super.onInit();
  }

  void getResource() async {
    if (title == null ||
        resource == null ||
        path == null ||
        scope == null ||
        name == null) {
      Logger.log(
        'ResourcesDetailsController getResource',
        'The requested resource was not found',
        'title: $title, resource: $resource, path: $path, scope: $scope, name: $name, namespace: $namespace',
      );
      error.value = 'The requested resource was not found';
    } else {
      loading.value = true;
      final cluster = clusterController
          .clusters[clusterController.activeClusterIndex.value].value;

      final url = namespace == null
          ? '$path/$resource/$name'
          : '$path/namespaces/$namespace/$resource/$name';

      try {
        final resource =
            await KubernetesService(cluster: cluster).getRequest(url);

        Logger.log(
          'ResourcesDetailsController getResources',
          'Get resource result was returned',
          resource,
        );
        item.value = resource;
        loading.value = false;
      } on PlatformException catch (err) {
        Logger.log(
          'ResourcesDetailsController getResources',
          'An error was returned while getting a resource',
          'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}',
        );
        error.value =
            'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}';
        loading.value = false;
      } catch (err) {
        Logger.log(
          'ResourcesDetailsController getResources',
          'An error was returned while getting a resource',
          err,
        );
        error.value = err.toString();
        loading.value = false;
      }
    }
  }

  void showYaml() {
    Get.bottomSheet(
      BottomSheet(
        onClosing: () {},
        enableDrag: false,
        builder: (builder) {
          return DetailsShowYamlWidget(item: item);
        },
      ),
      isScrollControlled: true,
    );
  }

  void editResource() {
    if (resource != null && path != null && name != null) {
      Get.bottomSheet(
        BottomSheet(
          onClosing: () {},
          enableDrag: false,
          builder: (builder) {
            return DetailsEditResourceWidget(
              resource: resource!,
              path: path!,
              name: name!,
              namespace: namespace,
              item: item,
            );
          },
        ),
        isScrollControlled: true,
      );
    }
  }

  void deleteResource() async {
    if (resource != null && path != null && name != null) {
      Get.bottomSheet(
        BottomSheet(
          onClosing: () {},
          enableDrag: false,
          builder: (builder) {
            return DetailsDeleteResourceWidget(
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

  void scaleResource() async {
    if (resource != null && path != null && name != null && namespace != null) {
      Get.bottomSheet(
        BottomSheet(
          onClosing: () {},
          enableDrag: false,
          builder: (builder) {
            return DetailsScaleResourceWidget(
              resource: resource!,
              path: path!,
              name: name!,
              namespace: namespace!,
              item: item,
            );
          },
        ),
        isScrollControlled: true,
      );
    }
  }

  void restartResource() async {
    if (resource != null && path != null && name != null && namespace != null) {
      Get.bottomSheet(
        BottomSheet(
          onClosing: () {},
          enableDrag: false,
          builder: (builder) {
            return DetailsRestartResourceWidget(
              resource: resource!,
              path: path!,
              name: name!,
              namespace: namespace!,
              item: item,
            );
          },
        ),
        isScrollControlled: true,
      );
    }
  }

  void createJob() async {
    if (name != null && namespace != null) {
      Get.bottomSheet(
        BottomSheet(
          onClosing: () {},
          enableDrag: false,
          builder: (builder) {
            return DetailsCreateJobWidget(
              name: name!,
              namespace: namespace!,
              item: item,
            );
          },
        ),
        isScrollControlled: true,
      );
    }
  }

  void getLogs() async {
    if (name != null && namespace != null) {
      Get.bottomSheet(
        BottomSheet(
          onClosing: () {},
          enableDrag: false,
          builder: (builder) {
            return DetailsGetLogsWidget(
              name: name!,
              namespace: namespace!,
              item: item,
            );
          },
        ),
        isScrollControlled: true,
      );
    }
  }

  void getTerminal() async {
    if (name != null && namespace != null) {
      Get.bottomSheet(
        BottomSheet(
          onClosing: () {},
          enableDrag: false,
          builder: (builder) {
            return DetailsTerminalWidget(
              name: name!,
              namespace: namespace!,
              item: item,
            );
          },
        ),
        isScrollControlled: true,
      );
    }
  }

  void showLiveMetrics() {
    if (name != null && namespace != null) {
      Get.bottomSheet(
        BottomSheet(
          onClosing: () {},
          enableDrag: false,
          builder: (builder) {
            return DetailsLiveMetricsWidget(
              name: name!,
              namespace: namespace!,
            );
          },
        ),
        isScrollControlled: true,
      );
    }
  }
}
