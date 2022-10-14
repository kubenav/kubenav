import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:yaml/yaml.dart';

import 'package:kubenav/controllers/cluster_controller.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_config_map.dart';
import 'package:kubenav/models/prometheus_model.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/logger.dart';

class PrometheusDetailsController extends GetxController {
  ClusterController clusterController = Get.find();

  String? name;
  String? namespace;

  PrometheusDetailsController({
    required this.name,
    required this.namespace,
  });

  RxList<Chart> items = <Chart>[].obs;
  RxString error = ''.obs;
  RxBool loading = false.obs;

  /// When [onInit] is called we get a list of resource items.
  @override
  void onInit() {
    getDashboard();

    super.onInit();
  }

  /// [getDashboard] returns all dashboards for the selected namespace.
  void getDashboard() async {
    loading.value = true;
    error.value = '';

    final cluster = clusterController.getActiveCluster();

    if (cluster == null) {
      error.value = 'No active cluster';
    } else {
      try {
        final url = '/api/v1/namespaces/$namespace/configmaps/$name';

        final result =
            await KubernetesService(cluster: cluster).getRequest(url);
        final configMap = IoK8sApiCoreV1ConfigMap.fromJson(result);

        if (configMap != null &&
            configMap.metadata != null &&
            configMap.metadata!.name != null) {
          Logger.log(
            'PrometheusDetailsController getDashboard',
            'ConfigMap  ${configMap.metadata?.name} was returned',
            configMap,
          );

          if (configMap.data.containsKey('charts')) {
            final parsedCharts = json.decode(
              json.encode(
                loadYaml(
                  configMap.data['charts']!,
                ),
              ),
            );

            Logger.log(
              'PrometheusDetailsController getDashboard',
              'Charts were loaded from ConfigMap ${configMap.metadata?.name}',
              parsedCharts,
            );

            final List<Chart> charts = [];
            for (var parsedChart in parsedCharts) {
              charts.add(Chart.fromJson(parsedChart));
            }
            items.value = charts;
          }
        }

        loading.value = false;
      } on PlatformException catch (err) {
        Logger.log(
          'PrometheusDetailsController getDashboard',
          'An error was returned while getting ConfigMap',
          'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}',
        );
        error.value =
            'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}';
        loading.value = false;
      } catch (err) {
        Logger.log(
          'PrometheusDetailsController getDashboard',
          'An error was returned while getting ConfigMap',
          err,
        );
        error.value = err.toString();
        loading.value = false;
      }
    }
  }
}
