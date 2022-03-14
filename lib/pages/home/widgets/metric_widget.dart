import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

import 'package:kubenav/controllers/cluster_controller.dart';
import 'package:kubenav/models/kubernetes-extensions/node_metrics.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_node_list.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_pod_list.dart';
import 'package:kubenav/pages/resources_details/widgets/details_item_widget.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/widgets/app_bottom_sheet_widget.dart';
import 'package:kubenav/widgets/app_error_widget.dart';

const texts = {
  MetricType.cpu: {
    'title': 'CPU Metrics',
    'subtitle': 'Allocatable, Usage, Requests and Limits',
  },
  MetricType.memory: {
    'title': 'Memory Metrics',
    'subtitle': 'Allocatable, Usage, Requests and Limits',
  },
  MetricType.pods: {
    'title': 'Pod Metrics',
    'subtitle': 'Allocatable and Usage',
  },
};

enum MetricType {
  cpu,
  memory,
  pods,
}

class Metric {
  int allocatable;
  int usage;
  int requests;
  int limits;

  Metric({
    required this.allocatable,
    required this.usage,
    required this.requests,
    required this.limits,
  });
}

class Metrics {
  Map<MetricType, Metric> metrics;

  Metrics({
    required this.metrics,
  });

  Metric getMetric(MetricType metric) {
    return metrics[metric]!;
  }
}

/// [MetricWidgetController] is the controller for the [MetricWidget] widget. It is responsible to load the
/// metrics for the overall cluster resources.
class MetricWidgetController extends GetxController {
  ClusterController clusterController = Get.find();
  RxList<Metrics> metrics = <Metrics>[].obs;
  RxString error = ''.obs;
  RxBool loading = false.obs;

  final String? nodeName;

  MetricWidgetController({
    required this.nodeName,
  });

  @override
  void onInit() {
    getMetrics();
    super.onInit();
  }

  void getMetrics() async {
    loading.value = true;

    try {
      final nodesData = await KubernetesService(
              cluster: clusterController
                  .clusters[clusterController.activeClusterIndex.value].value)
          .getRequest(
              '/api/v1/nodes${nodeName != null ? '?fieldSelector=metadata.name=$nodeName' : ''}');
      final nodesList = IoK8sApiCoreV1NodeList.fromJson(nodesData);

      final podsData = await KubernetesService(
              cluster: clusterController
                  .clusters[clusterController.activeClusterIndex.value].value)
          .getRequest(
              '/api/v1/pods${nodeName != null ? '?fieldSelector=spec.nodeName=$nodeName' : ''}');
      final podsList = IoK8sApiCoreV1PodList.fromJson(podsData);

      final nodeMetricsData = await KubernetesService(
              cluster: clusterController
                  .clusters[clusterController.activeClusterIndex.value].value)
          .getRequest(
              '/apis/metrics.k8s.io/v1beta1/nodes${nodeName != null ? '?fieldSelector=metadata.name=$nodeName' : ''}');
      final nodeMetricsList =
          ApisMetricsV1beta1NodeMetricsList.fromJson(nodeMetricsData);

      var cpuAllocatable = 0;
      var cpuUsage = 0;
      var cpuRequests = 0;
      var cpuLimits = 0;

      var memoryAllocatable = 0;
      var memoryUsage = 0;
      var memoryRequests = 0;
      var memoryLimits = 0;

      var podsAllocatable = 0;
      var podsUsage = 0;

      if (nodesList != null &&
          podsList != null &&
          nodeMetricsList.items != null) {
        for (var node in nodesList.items) {
          if (node.status != null &&
              node.status!.allocatable.containsKey('cpu')) {
            cpuAllocatable = cpuAllocatable +
                cpuMetricsStringToInt(node.status!.allocatable['cpu']!);
          }

          if (node.status != null &&
              node.status!.allocatable.containsKey('memory')) {
            memoryAllocatable = memoryAllocatable +
                memoryMetricsStringToInt(node.status!.allocatable['memory']!);
          }

          if (node.status != null &&
              node.status!.allocatable.containsKey('pods')) {
            podsAllocatable =
                podsAllocatable + int.parse(node.status!.allocatable['pods']!);
          }
        }

        for (var usage in nodeMetricsList.items!) {
          if (usage.usage != null && usage.usage!.cpu != null) {
            cpuUsage = cpuUsage + cpuMetricsStringToInt(usage.usage!.cpu!);
          }

          if (usage.usage != null && usage.usage!.memory != null) {
            memoryUsage =
                memoryUsage + memoryMetricsStringToInt(usage.usage!.memory!);
          }

          podsUsage = podsList.items.length;
        }

        for (var pod in podsList.items) {
          if (pod.spec != null) {
            for (var container in pod.spec!.containers) {
              if (container.resources != null &&
                  container.resources!.requests.containsKey('cpu')) {
                cpuRequests = cpuRequests +
                    cpuMetricsStringToInt(
                        container.resources!.requests['cpu']!);
              }

              if (container.resources != null &&
                  container.resources!.requests.containsKey('memory')) {
                memoryRequests = memoryRequests +
                    memoryMetricsStringToInt(
                        container.resources!.requests['memory']!);
              }

              if (container.resources != null &&
                  container.resources!.limits.containsKey('cpu')) {
                cpuLimits = cpuLimits +
                    cpuMetricsStringToInt(container.resources!.limits['cpu']!);
              }

              if (container.resources != null &&
                  container.resources!.limits.containsKey('memory')) {
                memoryLimits = memoryLimits +
                    memoryMetricsStringToInt(
                        container.resources!.limits['memory']!);
              }
            }
          }
        }
      }

      metrics.value = [
        Metrics(metrics: {
          MetricType.cpu: Metric(
            allocatable: cpuAllocatable,
            usage: cpuUsage,
            requests: cpuRequests,
            limits: cpuLimits,
          ),
          MetricType.memory: Metric(
            allocatable: memoryAllocatable,
            usage: memoryUsage,
            requests: memoryRequests,
            limits: memoryLimits,
          ),
          MetricType.pods: Metric(
            allocatable: podsAllocatable,
            usage: podsUsage,
            requests: 0,
            limits: 0,
          ),
        })
      ];

      loading.value = false;
    } on PlatformException catch (err) {
      Logger.log(
        'MetricWidgetController getMetrics',
        'Could not get metrics',
        'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}',
      );
      error.value =
          'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}';
      loading.value = false;
    } catch (err) {
      Logger.log(
        'MetricWidgetController getMetrics',
        'Could not get metrics',
        err,
      );
      error.value = err.toString();
      loading.value = false;
    }
  }
}

/// [MetricWidget] renders a chart with the overall cluster metrics for the given [metricType].
class MetricWidget extends StatelessWidget {
  const MetricWidget({
    Key? key,
    required this.metricType,
    required this.icon,
    required this.nodeName,
  }) : super(key: key);

  final MetricType metricType;
  final IconData icon;
  final String? nodeName;

  String formatValue(int value) {
    if (metricType == MetricType.cpu) {
      return formatCpuMetric(value);
    } else if (metricType == MetricType.memory) {
      return formatMemoryMetric(value);
    } else {
      return '$value';
    }
  }

  @override
  Widget build(BuildContext context) {
    MetricWidgetController controller = Get.put(
      MetricWidgetController(nodeName: nodeName),
    );

    return AppBottomSheetWidget(
      title: texts[metricType]!['title']!,
      subtitle: texts[metricType]!['subtitle']!,
      icon: icon,
      onClosePressed: () {
        finish(context);
      },
      actionText: 'Close',
      onActionPressed: () {
        finish(context);
      },
      child: Obx(
        () {
          if (controller.loading.value) {
            return Flex(
              direction: Axis.vertical,
              children: [
                Expanded(
                  child: Wrap(
                    children: const [
                      CircularProgressIndicator(color: Constants.colorPrimary),
                    ],
                  ),
                ),
              ],
            );
          }

          if (controller.error.value != '') {
            return Flex(
              direction: Axis.vertical,
              children: [
                Expanded(
                  child: Wrap(
                    children: [
                      AppErrorWidget(
                        message: 'Could not load metrics',
                        details: controller.error.value,
                        icon: icon,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }

          if (controller.metrics.length != 1) {
            return Flex(
              direction: Axis.vertical,
              children: [
                Expanded(
                  child: Wrap(
                    children: [
                      AppErrorWidget(
                        message: 'Could not load metrics',
                        details:
                            'We were not able to load all the required metrics',
                        icon: icon,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }

          return ListView(
            shrinkWrap: false,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: Constants.spacingMiddle,
                  left: Constants.spacingExtraSmall,
                  right: Constants.spacingExtraSmall,
                  bottom: Constants.spacingMiddle,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Chart',
                        style: primaryTextStyle(size: 18),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 320,
                width: double.infinity,
                margin: const EdgeInsets.only(
                  left: Constants.spacingExtraSmall,
                  right: Constants.spacingExtraSmall,
                ),
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Constants.shadowColorGlobal,
                      blurRadius: Constants.sizeBorderBlurRadius,
                      spreadRadius: Constants.sizeBorderSpreadRadius,
                      offset: const Offset(0.0, 0.0),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(Constants.sizeBorderRadius),
                  ),
                ),
                child: BarChart(
                  BarChartData(
                    barGroups: [
                      BarChartGroupData(
                        x: 0,
                        barRods: [
                          BarChartRodData(
                            toY: controller
                                .metrics[0].metrics[metricType]!.allocatable
                                .toDouble(),
                            colors: [Constants.colorPrimary],
                            width: 25,
                            borderRadius: const BorderRadius.all(Radius.zero),
                          ),
                        ],
                      ),
                      BarChartGroupData(
                        x: 1,
                        barRods: [
                          BarChartRodData(
                            toY: controller
                                .metrics[0].metrics[metricType]!.usage
                                .toDouble(),
                            colors: [Constants.colorPrimary],
                            width: 25,
                            borderRadius: const BorderRadius.all(Radius.zero),
                          ),
                        ],
                      ),
                      BarChartGroupData(
                        x: 2,
                        barRods: [
                          BarChartRodData(
                            toY: controller
                                .metrics[0].metrics[metricType]!.requests
                                .toDouble(),
                            colors: [Constants.colorPrimary],
                            width: 25,
                            borderRadius: const BorderRadius.all(Radius.zero),
                          ),
                        ],
                      ),
                      BarChartGroupData(
                        x: 3,
                        barRods: [
                          BarChartRodData(
                            toY: controller
                                .metrics[0].metrics[metricType]!.limits
                                .toDouble(),
                            colors: [Constants.colorPrimary],
                            width: 25,
                            borderRadius: const BorderRadius.all(Radius.zero),
                          ),
                        ],
                      ),
                    ],
                    barTouchData: BarTouchData(
                      touchTooltipData: BarTouchTooltipData(
                        tooltipBgColor: Colors.black,
                        getTooltipItem: (group, groupIndex, rod, rodIndex) {
                          String label;
                          switch (group.x.toInt()) {
                            case 0:
                              label = 'Allocatable';
                              break;
                            case 1:
                              label = 'Usage';
                              break;
                            case 2:
                              label = 'Requests';
                              break;
                            case 3:
                              label = 'Limits';
                              break;
                            default:
                              label = '';
                              break;
                          }
                          return BarTooltipItem(
                            label + '\n',
                            const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                            children: [
                              TextSpan(
                                text: rod.toY.toStringAsFixed(0),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      rightTitles: SideTitles(showTitles: false),
                      topTitles: SideTitles(showTitles: false),
                      leftTitles: SideTitles(showTitles: false),
                      bottomTitles: SideTitles(
                        showTitles: true,
                        getTextStyles: (context, value) => secondaryTextStyle(),
                        margin: 16,
                        getTitles: (double value) {
                          switch (value.toInt()) {
                            case 0:
                              return 'Allocatable';
                            case 1:
                              return 'Usage';
                            case 2:
                              return 'Requests';
                            case 3:
                              return 'Limits';
                            default:
                              return '';
                          }
                        },
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    gridData: FlGridData(
                      show: true,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: Constants.colorTextSecondary,
                          strokeWidth: 0.4,
                          dashArray: [8, 4],
                        );
                      },
                      getDrawingVerticalLine: (value) {
                        return FlLine(
                          color: Constants.colorTextSecondary,
                          strokeWidth: 0.4,
                          dashArray: [8, 4],
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: Constants.spacingMiddle),
              DetailsItemWidget(
                smallPadding: true,
                title: 'Legend',
                details: [
                  DetailsItemModel(
                    name: 'Allocatable',
                    values: formatValue(
                        controller.metrics[0].metrics[metricType]!.allocatable),
                  ),
                  DetailsItemModel(
                    name: 'Usage',
                    values: formatValue(
                        controller.metrics[0].metrics[metricType]!.usage),
                  ),
                  DetailsItemModel(
                    name: 'Requests',
                    values: formatValue(
                        controller.metrics[0].metrics[metricType]!.requests),
                  ),
                  DetailsItemModel(
                    name: 'Limits',
                    values: formatValue(
                        controller.metrics[0].metrics[metricType]!.limits),
                  ),
                ],
              ),
              const SizedBox(height: Constants.spacingMiddle),
            ],
          );
        },
      ),
    );
  }
}

class MetricSerie {
  final String name;
  final int value;

  MetricSerie(this.name, this.value);
}
