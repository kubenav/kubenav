import 'dart:async';

import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_pod.dart';
import 'package:kubenav/models/kubernetes_extensions/pod_metrics.dart';
import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/utils/resources/pods.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

/// The [ContainerMetric] model is used to store the list of data points for the
/// container metrics.
class ContainerMetric {
  List<FlSpot> cpu;
  List<FlSpot> memory;

  ContainerMetric({
    required int initTime,
    required double initCPU,
    required double initMemory,
  })  : cpu = [
          FlSpot(
            initTime.toDouble(),
            initCPU,
          ),
        ],
        memory = [
          FlSpot(
            initTime.toDouble(),
            initMemory,
          ),
        ];

  void add(
    int newTime,
    double newCPU,
    double newMemory,
  ) {
    if (cpu.length > 25 || memory.length > 25) {
      cpu.removeAt(0);
      memory.removeAt(0);
    }

    cpu.add(FlSpot(newTime.toDouble(), newCPU));
    memory.add(FlSpot(newTime.toDouble(), newMemory));
  }
}

/// The [DetailsLiveMetrics] widget shows a modal with the live metrics for a
/// Pod or selected container.
class DetailsLiveMetrics extends StatefulWidget {
  const DetailsLiveMetrics({
    super.key,
    required this.name,
    required this.namespace,
    required this.pod,
    required this.selectedContainer,
  });

  final String name;
  final String namespace;
  final IoK8sApiCoreV1Pod pod;
  final String selectedContainer;

  @override
  State<DetailsLiveMetrics> createState() => _DetailsLiveMetricsState();
}

class _DetailsLiveMetricsState extends State<DetailsLiveMetrics> {
  late Timer _timer;
  final Map<String, ContainerMetric> _containerMetrics = {};

  /// [_fetchMetrics] fetches the metrics for the selected container or all
  /// containers of a Pod and adds the result to the [_containerMetrics]
  /// variable.
  Future<void> _fetchMetrics() async {
    try {
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

      final url =
          '/apis/metrics.k8s.io/v1beta1/namespaces/${widget.namespace}/pods/${widget.name}';

      final metricsData = await KubernetesService(
        cluster: cluster!,
        proxy: appRepository.settings.proxy,
        timeout: appRepository.settings.timeout,
      ).getRequest(url);

      Logger.log(
        'DetailsLiveMetricsRepository _fetchMetrics',
        'Metrics were returned',
        'Request URL: $url\nManifest: $metricsData',
      );

      final parsedMetricsData = ApisMetricsV1beta1PodMetricsItem.fromJson(
        metricsData,
      ).containers;

      if (parsedMetricsData != null) {
        for (var container in parsedMetricsData) {
          if (container.name != null &&
              container.usage != null &&
              container.usage!.cpu != null &&
              container.usage!.memory != null) {
            if (widget.selectedContainer == '' ||
                widget.selectedContainer == container.name) {
              if (_containerMetrics.containsKey(container.name)) {
                setState(() {
                  _containerMetrics[container.name]!.add(
                    DateTime.now().millisecondsSinceEpoch,
                    cpuMetricsStringToDouble(
                      container.usage!.cpu!,
                    ),
                    memoryMetricsStringToDouble(
                      container.usage!.memory!,
                    ),
                  );
                });
              } else {
                setState(() {
                  _containerMetrics[container.name!] = ContainerMetric(
                    initTime: DateTime.now().millisecondsSinceEpoch,
                    initCPU: cpuMetricsStringToDouble(
                      container.usage!.cpu!,
                    ),
                    initMemory: memoryMetricsStringToDouble(
                      container.usage!.memory!,
                    ),
                  );
                });
              }
            }
          }
        }
      }

      final podResources = getResourcesForLiveMetrics(
        widget.pod,
        widget.selectedContainer,
      );
      if (podResources != null) {
        if (_containerMetrics.containsKey('Requests')) {
          setState(() {
            _containerMetrics['Requests']!.add(
              DateTime.now().millisecondsSinceEpoch,
              podResources.cpuRequests,
              podResources.memoryRequests,
            );
          });
        } else {
          setState(() {
            _containerMetrics['Requests'] = ContainerMetric(
              initTime: DateTime.now().millisecondsSinceEpoch,
              initCPU: podResources.cpuRequests,
              initMemory: podResources.memoryRequests,
            );
          });
        }

        if (_containerMetrics.containsKey('Limits')) {
          setState(() {
            _containerMetrics['Limits']!.add(
              DateTime.now().millisecondsSinceEpoch,
              podResources.cpuLimits,
              podResources.memoryLimits,
            );
          });
        } else {
          setState(() {
            _containerMetrics['Limits'] = ContainerMetric(
              initTime: DateTime.now().millisecondsSinceEpoch,
              initCPU: podResources.cpuLimits,
              initMemory: podResources.memoryLimits,
            );
          });
        }
      }
    } catch (err) {
      Logger.log(
        'DetailsLiveMetricsRepository fetchMetrics',
        'Could not fetch metrics',
        err.toString(),
      );
    }
  }

  @override
  void initState() {
    _fetchMetrics();

    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      _fetchMetrics();
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: 'Live Metrics',
      subtitle: widget.name,
      icon: Icons.insights,
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Close',
      actionPressed: () {
        Navigator.pop(context);
      },
      actionIsLoading: false,
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(Constants.sizeBorderRadius),
              ),
              child: SizedBox(
                height: 32,
                child: TabBar(
                  isScrollable: false,
                  labelColor: Colors.white,
                  unselectedLabelColor: theme(context).colorPrimary,
                  labelPadding: EdgeInsets.zero,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    color: theme(context).colorPrimary,
                  ),
                  tabs: const [
                    Tab(text: 'CPU'),
                    Tab(text: 'Memory'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: Constants.spacingMiddle),
            Expanded(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: Constants.spacingSmall,
                        bottom: Constants.spacingMiddle,
                        left: Constants.spacingExtraSmall,
                        right: Constants.spacingExtraSmall,
                      ),
                      padding: const EdgeInsets.all(
                        Constants.spacingListItemContent,
                      ),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: theme(context).colorShadow,
                            blurRadius: Constants.sizeBorderBlurRadius,
                            spreadRadius: Constants.sizeBorderSpreadRadius,
                            offset: const Offset(0.0, 0.0),
                          ),
                        ],
                        color: theme(context).colorCard,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(Constants.sizeBorderRadius),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 320,
                            width: double.infinity,
                            child: LineChart(
                              LineChartData(
                                minY: 0,
                                lineTouchData: const LineTouchData(enabled: false),
                                clipData: const FlClipData.all(),
                                lineBarsData: _containerMetrics.entries
                                    .map(
                                      (e) => LineChartBarData(
                                        spots: e.value.cpu,
                                        dotData: const FlDotData(
                                          show: false,
                                        ),
                                        color: e.key == 'Requests'
                                            ? theme(context).colorWarning
                                            : e.key == 'Limits'
                                                ? theme(context).colorDanger
                                                : theme(context).colorPrimary,
                                        barWidth: 4,
                                        isCurved: false,
                                      ),
                                    )
                                    .toList(),
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
                                  leftTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      reservedSize: 42,
                                      getTitlesWidget: (
                                        double value,
                                        TitleMeta meta,
                                      ) {
                                        return Text(
                                          value > 1000000000
                                              ? formatCpuMetric(value)
                                              : formatCpuMetric(value, 0),
                                          style: secondaryTextStyle(
                                            context,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  bottomTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      interval: 500000,
                                      reservedSize: 32,
                                      getTitlesWidget: (value, titleMeta) {
                                        final timestamp =
                                            DateTime.fromMillisecondsSinceEpoch(
                                                value.round());

                                        return Container(
                                          padding: const EdgeInsets.only(
                                            top: 16,
                                            right: 42,
                                          ),
                                          child: Text(
                                            '${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}:${timestamp.second.toString().padLeft(2, '0')}',
                                            style: secondaryTextStyle(
                                              context,
                                            ),
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
                                      color: theme(context).colorTextSecondary,
                                      strokeWidth: 0.4,
                                      dashArray: [8, 4],
                                    );
                                  },
                                  getDrawingVerticalLine: (value) {
                                    return FlLine(
                                      color: theme(context).colorTextSecondary,
                                      strokeWidth: 0.4,
                                      dashArray: [8, 4],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: Constants.spacingMiddle,
                          ),
                          ..._containerMetrics.entries
                              .map(
                                (e) => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      e.key,
                                      style: noramlTextStyle(
                                        context,
                                        size: Constants.sizeTextSecondary,
                                      ),
                                    ),
                                    Text(
                                      formatCpuMetric(
                                        e.value.cpu[e.value.cpu.length - 1].y
                                            .toDouble(),
                                      ),
                                      style: secondaryTextStyle(
                                        context,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                              ,
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: Constants.spacingSmall,
                        bottom: Constants.spacingMiddle,
                        left: Constants.spacingExtraSmall,
                        right: Constants.spacingExtraSmall,
                      ),
                      padding: const EdgeInsets.all(
                        Constants.spacingListItemContent,
                      ),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: theme(context).colorShadow,
                            blurRadius: Constants.sizeBorderBlurRadius,
                            spreadRadius: Constants.sizeBorderSpreadRadius,
                            offset: const Offset(0.0, 0.0),
                          ),
                        ],
                        color: theme(context).colorCard,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(Constants.sizeBorderRadius),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 320,
                            width: double.infinity,
                            child: LineChart(
                              LineChartData(
                                minY: 0,
                                lineTouchData: const LineTouchData(enabled: false),
                                clipData: const FlClipData.all(),
                                lineBarsData: _containerMetrics.entries
                                    .map((e) => LineChartBarData(
                                          spots: e.value.memory,
                                          dotData: const FlDotData(
                                            show: false,
                                          ),
                                          color: e.key == 'Requests'
                                              ? theme(context).colorWarning
                                              : e.key == 'Limits'
                                                  ? theme(context).colorDanger
                                                  : theme(context).colorPrimary,
                                          barWidth: 4,
                                          isCurved: false,
                                        ))
                                    .toList(),
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
                                  leftTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      reservedSize: 42,
                                      getTitlesWidget: (
                                        double value,
                                        TitleMeta meta,
                                      ) {
                                        return Text(
                                          value > 1048576
                                              ? formatMemoryMetric(value, 2)
                                              : formatMemoryMetric(value, 0),
                                          style: secondaryTextStyle(
                                            context,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  bottomTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      interval: 500000,
                                      reservedSize: 32,
                                      getTitlesWidget: (value, titleMeta) {
                                        final timestamp =
                                            DateTime.fromMillisecondsSinceEpoch(
                                                value.round());

                                        return Container(
                                          padding: const EdgeInsets.only(
                                            top: 16,
                                            right: 42,
                                          ),
                                          child: Text(
                                            '${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}:${timestamp.second.toString().padLeft(2, '0')}',
                                            style: secondaryTextStyle(
                                              context,
                                            ),
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
                                      color: theme(context).colorTextSecondary,
                                      strokeWidth: 0.4,
                                      dashArray: [8, 4],
                                    );
                                  },
                                  getDrawingVerticalLine: (value) {
                                    return FlLine(
                                      color: theme(context).colorTextSecondary,
                                      strokeWidth: 0.4,
                                      dashArray: [8, 4],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: Constants.spacingMiddle,
                          ),
                          ..._containerMetrics.entries
                              .map(
                                (e) => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      e.key,
                                      style: noramlTextStyle(
                                        context,
                                        size: Constants.sizeTextSecondary,
                                      ),
                                    ),
                                    Text(
                                      formatMemoryMetric(e.value
                                          .memory[e.value.memory.length - 1].y
                                          .toDouble()),
                                      style: secondaryTextStyle(
                                        context,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                              ,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
