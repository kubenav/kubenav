import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'package:kubenav/controllers/cluster_controller.dart';
import 'package:kubenav/models/helm_model.dart';
import 'package:kubenav/pages/plugins/pages/helm_details/widgets/details_values_widget.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/logger.dart';

class HelmDetailsController extends GetxController {
  ClusterController clusterController = Get.find();

  String? name;
  String? namespace;
  String? version;

  HelmDetailsController({
    required this.name,
    required this.namespace,
    required this.version,
  });

  Rx<Release>? item;
  RxList<Release> history = <Release>[].obs;
  RxString error = ''.obs;
  RxBool loading = false.obs;

  /// When [onInit] is called, we get the resource for the specified resource [name] and [namespace] of the resource.
  /// The [namespace] parameter is optional and only required for namespaced resources.
  @override
  void onInit() {
    getHelmChart();
    getHistory();

    super.onInit();
  }

  void getHelmChart() async {
    if (namespace == null || name == null || version == null) {
      Logger.log(
        'HelmDetailsController getHelmChart',
        'The Helm chart was not found',
        'namespace: $namespace, name: $name, version: $version',
      );
      error.value = 'The requested resource was not found';
    } else {
      loading.value = true;
      final cluster = clusterController
          .clusters[clusterController.activeClusterIndex.value].value;

      try {
        final parsedVersion = int.parse(version!);
        final release = await KubernetesService(cluster: cluster)
            .helmGetChart(namespace!, name!, parsedVersion);

        Logger.log(
          'HelmDetailsController getHelmChart',
          'Helm chart was returned',
          release,
        );
        item = release.obs;
        loading.value = false;
      } on PlatformException catch (err) {
        Logger.log(
          'HelmDetailsController getHelmChart',
          'An error was returned while getting the Helm chart',
          'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}',
        );
        error.value =
            'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}';
        loading.value = false;
      } catch (err) {
        Logger.log(
          'HelmDetailsController getHelmChart',
          'An error was returned while getting the Helm chart',
          err,
        );
        error.value = err.toString();
        loading.value = false;
      }
    }
  }

  void getHistory() async {
    if (namespace != null && name != null) {
      final cluster = clusterController
          .clusters[clusterController.activeClusterIndex.value].value;

      try {
        final releases = await KubernetesService(cluster: cluster)
            .helmGetHistory(namespace!, name!);

        history.value = releases;
        loading.value = false;
      } on PlatformException catch (err) {
        Logger.log(
          'HelmDetailsController getHistory',
          'An error was returned while getting the Helm chart history',
          'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}',
        );
      } catch (err) {
        Logger.log(
          'HelmDetailsController getHistory',
          'An error was returned while getting the Helm chart history',
          err,
        );
      }
    }
  }

  void showValues() {
    Get.bottomSheet(
      BottomSheet(
        onClosing: () {},
        enableDrag: false,
        builder: (builder) {
          return DetailsValuesWidget(item: item!.value);
        },
      ),
      isScrollControlled: true,
    );
  }
}
