import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_node_list.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_pod_list.dart';
import 'package:kubenav/models/kubernetes_extensions/node_metrics.dart';
import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/utils/themes.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';
import 'package:kubenav/widgets/shared/app_error_widget.dart';

/// [texts] are the title and subtitle we can use for the specified [MetricType]
/// in the bottom sheet where we display the metric values.
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

/// [MetricType] is our enum value, which is used to specify which metrics we
/// want to show in the bottom sheet. The possible values are [cpu], [memory]
/// and [pods].
enum MetricType {
  cpu,
  memory,
  pods,
}

/// The [Metric] model is used to represent all metrics for a [MetricType]. We
/// collect the [allocatable], [usage], [requests] and [limits] for each
/// [MetricType].
class Metric {
  double allocatable;
  double usage;
  double requests;
  double limits;

  Metric({
    required this.allocatable,
    required this.usage,
    required this.requests,
    required this.limits,
  });
}

/// The [Metrics] model is used to combine the [Metric] models for each
/// [MetricType] into one model. The [metrics] contain a map with the
/// [MetricType] as key and the corresponding [Metric] as value.
class Metrics {
  Map<MetricType, Metric> metrics;

  Metrics({
    required this.metrics,
  });

  Metric getMetric(MetricType metric) {
    return metrics[metric]!;
  }
}

Metrics _getMetrics(List<String> results) {
  final nodesList = IoK8sApiCoreV1NodeList.fromJson(
    json.decode(results[0]),
  );

  final podsList = IoK8sApiCoreV1PodList.fromJson(
    json.decode(results[1]),
  );

  final nodeMetricsList = ApisMetricsV1beta1NodeMetricsList.fromJson(
    json.decode(results[2]),
  );

  var cpuAllocatable = 0.0;
  var cpuUsage = 0.0;
  var cpuRequests = 0.0;
  var cpuLimits = 0.0;

  var memoryAllocatable = 0.0;
  var memoryUsage = 0.0;
  var memoryRequests = 0.0;
  var memoryLimits = 0.0;

  var podsAllocatable = 0.0;
  var podsUsage = 0.0;

  if (nodesList != null && podsList != null && nodeMetricsList.items != null) {
    for (var node in nodesList.items) {
      if (node.status != null && node.status!.allocatable.containsKey('cpu')) {
        cpuAllocatable = cpuAllocatable +
            cpuMetricsStringToDouble(node.status!.allocatable['cpu']!);
      }

      if (node.status != null &&
          node.status!.allocatable.containsKey('memory')) {
        memoryAllocatable = memoryAllocatable +
            memoryMetricsStringToDouble(node.status!.allocatable['memory']!);
      }

      if (node.status != null && node.status!.allocatable.containsKey('pods')) {
        podsAllocatable =
            podsAllocatable + int.parse(node.status!.allocatable['pods']!);
      }
    }

    for (var usage in nodeMetricsList.items!) {
      if (usage.usage != null && usage.usage!.cpu != null) {
        cpuUsage = cpuUsage + cpuMetricsStringToDouble(usage.usage!.cpu!);
      }

      if (usage.usage != null && usage.usage!.memory != null) {
        memoryUsage =
            memoryUsage + memoryMetricsStringToDouble(usage.usage!.memory!);
      }

      podsUsage = podsList.items.length.toDouble();
    }

    for (var pod in podsList.items) {
      if (pod.spec != null) {
        for (var container in pod.spec!.containers) {
          if (container.resources != null &&
              container.resources!.requests.containsKey('cpu')) {
            cpuRequests = cpuRequests +
                cpuMetricsStringToDouble(
                  container.resources!.requests['cpu']!,
                );
          }

          if (container.resources != null &&
              container.resources!.requests.containsKey('memory')) {
            memoryRequests = memoryRequests +
                memoryMetricsStringToDouble(
                  container.resources!.requests['memory']!,
                );
          }

          if (container.resources != null &&
              container.resources!.limits.containsKey('cpu')) {
            cpuLimits = cpuLimits +
                cpuMetricsStringToDouble(container.resources!.limits['cpu']!);
          }

          if (container.resources != null &&
              container.resources!.limits.containsKey('memory')) {
            memoryLimits = memoryLimits +
                memoryMetricsStringToDouble(
                  container.resources!.limits['memory']!,
                );
          }
        }
      }
    }
  }

  return Metrics(
    metrics: {
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
    },
  );
}

/// The [OverviewMetric] widget can be used to show the CPU, Memory or Pod
/// metrics of the whole cluster or a single node in a bottom sheet. The bottom
/// sheet contains a graph with the allocatable, usage, requests and limit
/// metrics.
///
/// The metric which should be displayed can be selected via the [metricType]
/// argument. If the metrics should only be shown for a single node the
/// [nodeName] can be specified.
class OverviewMetric extends StatefulWidget {
  const OverviewMetric({
    super.key,
    required this.metricType,
    required this.icon,
    required this.nodeName,
  });

  final MetricType metricType;
  final IconData icon;
  final String? nodeName;

  @override
  State<OverviewMetric> createState() => _OverviewMetricState();
}

class _OverviewMetricState extends State<OverviewMetric> {
  late Future<Metrics> _futureFetchMetrics;

  /// [_fetchMetrics] fetches all nodes, pods and node metrics or when a
  /// [widget.nodeName] is specified only the metrics for this single node. Once
  /// the data and metrics are fetched it will create a [Metrics] list which is
  /// then returned.
  ///
  /// NOTE: Also when we are fetching and creating the data for CPU, Memory and
  /// Pods, only one of them is used via the [widget.metricType] value.
  Future<Metrics> _fetchMetrics() async {
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: false,
    );
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: false,
    );

    final cluster = await clustersRepository.getClusterWithCredentials(
      clustersRepository.activeClusterId,
    );

    final nodesData = await KubernetesService(
      cluster: cluster!,
      proxy: appRepository.settings.proxy,
      timeout: appRepository.settings.timeout,
    ).getRequest(
      '/api/v1/nodes${widget.nodeName != null ? '?fieldSelector=metadata.name=${widget.nodeName}' : ''}',
    );

    final podsData = await KubernetesService(
      cluster: cluster,
      proxy: appRepository.settings.proxy,
      timeout: appRepository.settings.timeout,
    ).getRequest(
      '/api/v1/pods${widget.nodeName != null ? '?fieldSelector=spec.nodeName=${widget.nodeName}' : ''}',
    );

    final nodeMetricsData = await KubernetesService(
      cluster: cluster,
      proxy: appRepository.settings.proxy,
      timeout: appRepository.settings.timeout,
    ).getRequest(
      '/apis/metrics.k8s.io/v1beta1/nodes${widget.nodeName != null ? '?fieldSelector=metadata.name=${widget.nodeName}' : ''}',
    );

    return compute(_getMetrics, [nodesData, podsData, nodeMetricsData]);
  }

  /// [formatValue] format the provided [value] depending on the [metricType]
  /// which was requested by the user. This means that we add a unit for the
  /// CPU and Memory metrics to the value.
  String formatValue(double value) {
    if (widget.metricType == MetricType.cpu) {
      return formatCpuMetric(value);
    } else if (widget.metricType == MetricType.memory) {
      return formatMemoryMetric(value);
    } else {
      return '$value';
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      _futureFetchMetrics = _fetchMetrics();
    });
  }

  /// [buildBarGroups] returns the rows for the bar groups for the chart. If the
  /// selected metric type ([widget.metricType]) is `pods` we do not return the
  /// requests and limits groups, since they are always zero. For the `cpu` and
  /// `memory` type we return all groups for the chart.
  List<BarChartGroupData> buildBarGroups(Metrics data) {
    final List<BarChartGroupData> barGroups = [
      BarChartGroupData(
        x: 0,
        barRods: [
          BarChartRodData(
            toY: data.metrics[widget.metricType]!.allocatable.toDouble(),
            color: Theme.of(context).colorScheme.primary,
            width: 25,
            borderRadius: const BorderRadius.all(
              Radius.zero,
            ),
          ),
        ],
      ),
      BarChartGroupData(
        x: 1,
        barRods: [
          BarChartRodData(
            toY: data.metrics[widget.metricType]!.usage.toDouble(),
            color: Theme.of(context).colorScheme.primary,
            width: 25,
            borderRadius: const BorderRadius.all(
              Radius.zero,
            ),
          ),
        ],
      ),
    ];

    if (widget.metricType != MetricType.pods) {
      barGroups.addAll(
        [
          BarChartGroupData(
            x: 2,
            barRods: [
              BarChartRodData(
                toY: data.metrics[widget.metricType]!.requests.toDouble(),
                color: Theme.of(context).colorScheme.primary,
                width: 25,
                borderRadius: const BorderRadius.all(
                  Radius.zero,
                ),
              ),
            ],
          ),
          BarChartGroupData(
            x: 3,
            barRods: [
              BarChartRodData(
                toY: data.metrics[widget.metricType]!.limits.toDouble(),
                color: Theme.of(context).colorScheme.primary,
                width: 25,
                borderRadius: const BorderRadius.all(
                  Radius.zero,
                ),
              ),
            ],
          ),
        ],
      );
    }

    return barGroups;
  }

  /// [buildLegend] returns the rows for the legend in the chart. If the
  /// selected metric type ([widget.metricType]) is `pods` we do not return the
  /// requests and limits items for the legends, since they are always zero. For
  /// the `cpu` and `memory` type we return all items for the legend.
  List<Widget> buildLegend(Metrics data) {
    final List<Widget> legend = [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Allocatable',
            style: noramlTextStyle(
              context,
              size: Constants.sizeTextSecondary,
            ),
          ),
          Text(
            formatValue(
              data.metrics[widget.metricType]!.allocatable,
            ),
            style: secondaryTextStyle(
              context,
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Usage',
            style: noramlTextStyle(
              context,
              size: Constants.sizeTextSecondary,
            ),
          ),
          Text(
            formatValue(
              data.metrics[widget.metricType]!.usage,
            ),
            style: secondaryTextStyle(
              context,
            ),
          ),
        ],
      ),
    ];

    if (widget.metricType != MetricType.pods) {
      legend.addAll(
        [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Requests',
                style: noramlTextStyle(
                  context,
                  size: Constants.sizeTextSecondary,
                ),
              ),
              Text(
                formatValue(
                  data.metrics[widget.metricType]!.requests,
                ),
                style: secondaryTextStyle(
                  context,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Limits',
                style: noramlTextStyle(
                  context,
                  size: Constants.sizeTextSecondary,
                ),
              ),
              Text(
                formatValue(
                  data.metrics[widget.metricType]!.limits,
                ),
                style: secondaryTextStyle(
                  context,
                ),
              ),
            ],
          ),
        ],
      );
    }

    return legend;
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ClustersRepository>(
      context,
      listen: true,
    );

    return AppBottomSheetWidget(
      title: texts[widget.metricType]!['title']!,
      subtitle: texts[widget.metricType]!['subtitle']!,
      icon: widget.icon,
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Close',
      actionPressed: () {
        Navigator.pop(context);
      },
      actionIsLoading: false,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: Constants.spacingMiddle,
            bottom: Constants.spacingMiddle,
            left: Constants.spacingMiddle,
            right: Constants.spacingMiddle,
          ),
          child: FutureBuilder(
            future: _futureFetchMetrics,
            builder: (
              BuildContext context,
              AsyncSnapshot<Metrics> snapshot,
            ) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.primary,
                  );
                default:
                  if (snapshot.hasError) {
                    return AppErrorWidget(
                      message: 'Could not load metrics',
                      details: snapshot.error.toString(),
                      icon: widget.icon,
                    );
                  }

                  return Container(
                    padding: const EdgeInsets.all(
                      Constants.spacingListItemContent,
                    ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context)
                              .extension<CustomColors>()!
                              .shadow,
                          blurRadius: Constants.sizeBorderBlurRadius,
                          spreadRadius: Constants.sizeBorderSpreadRadius,
                          offset: const Offset(0.0, 0.0),
                        ),
                      ],
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(Constants.sizeBorderRadius),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 320,
                          width: double.infinity,
                          child: BarChart(
                            BarChartData(
                              barGroups: buildBarGroups(snapshot.data!),
                              barTouchData: BarTouchData(
                                touchTooltipData: BarTouchTooltipData(
                                  fitInsideHorizontally: true,
                                  fitInsideVertically: true,
                                  getTooltipColor: (BarChartGroupData group) {
                                    return Theme.of(context)
                                        .extension<CustomColors>()!
                                        .message;
                                  },
                                  getTooltipItem:
                                      (group, groupIndex, rod, rodIndex) {
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
                                      '$label\n',
                                      TextStyle(
                                        color: Theme.of(context)
                                            .extension<CustomColors>()!
                                            .onMessage,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: formatValue(rod.toY),
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .extension<CustomColors>()!
                                                .onMessage,
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
                                rightTitles: const AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: false,
                                  ),
                                ),
                                topTitles: const AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: false,
                                  ),
                                ),
                                leftTitles: const AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: false,
                                  ),
                                ),
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 32,
                                    getTitlesWidget: (value, titleMeta) {
                                      var title = '';
                                      if (value.toInt() == 0) {
                                        title = 'Allocatable';
                                      } else if (value.toInt() == 1) {
                                        title = 'Usage';
                                      } else if (value.toInt() == 2) {
                                        title = 'Requests';
                                      } else if (value.toInt() == 3) {
                                        title = 'Limits';
                                      }

                                      return Padding(
                                        padding: const EdgeInsets.only(top: 16),
                                        child: Text(
                                          title,
                                          style: secondaryTextStyle(
                                            context,
                                          ),
                                          textDirection: TextDirection.rtl,
                                          textAlign: TextAlign.center,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              borderData: FlBorderData(show: false),
                              gridData: FlGridData(
                                show: true,
                                getDrawingHorizontalLine: (value) {
                                  return FlLine(
                                    color: Theme.of(context)
                                        .extension<CustomColors>()!
                                        .textSecondary,
                                    strokeWidth: 0.4,
                                    dashArray: [8, 4],
                                  );
                                },
                                getDrawingVerticalLine: (value) {
                                  return FlLine(
                                    color: Theme.of(context)
                                        .extension<CustomColors>()!
                                        .textSecondary,
                                    strokeWidth: 0.4,
                                    dashArray: [8, 4],
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: Constants.spacingMiddle),
                        ...buildLegend(snapshot.data!),
                      ],
                    ),
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
