import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_pod.dart';
import 'package:kubenav/models/kubernetes_extensions/pod_metrics.dart';
import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/utils/themes.dart';
import 'package:kubenav/widgets/shared/app_actions_widget.dart';
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
  }) : cpu = [FlSpot(initTime.toDouble(), initCPU)],
       memory = [FlSpot(initTime.toDouble(), initMemory)];

  void add(int newTime, double newCPU, double newMemory) {
    if (cpu.length > 25 || memory.length > 25) {
      cpu.removeAt(0);
      memory.removeAt(0);
    }

    cpu.add(FlSpot(newTime.toDouble(), newCPU));
    memory.add(FlSpot(newTime.toDouble(), newMemory));
  }
}

class PodResourceForLiveMetrics {
  double cpuRequests;
  double cpuLimits;
  double memoryRequests;
  double memoryLimits;

  PodResourceForLiveMetrics({
    required this.cpuRequests,
    required this.cpuLimits,
    required this.memoryRequests,
    required this.memoryLimits,
  });
}

PodResourceForLiveMetrics? getResourcesForLiveMetrics(
  IoK8sApiCoreV1Pod? pod,
  String selectedContainer,
) {
  try {
    if (pod == null || pod.spec == null || pod.spec!.containers.isEmpty) {
      return null;
    }

    var cpuRequests = 0.0;
    var cpuLimits = 0.0;
    var memoryRequests = 0.0;
    var memoryLimits = 0.0;

    for (var i = 0; i < pod.spec!.containers.length; i++) {
      if (pod.spec!.containers[i].resources != null) {
        if (selectedContainer == '' ||
            selectedContainer == pod.spec!.containers[i].name) {
          if (pod.spec!.containers[i].resources!.requests.containsKey('cpu')) {
            cpuRequests =
                cpuRequests +
                cpuMetricsStringToDouble(
                  pod.spec!.containers[i].resources!.requests['cpu']!,
                );
          }

          if (pod.spec!.containers[i].resources!.requests.containsKey(
            'memory',
          )) {
            memoryRequests =
                memoryRequests +
                memoryMetricsStringToDouble(
                  pod.spec!.containers[i].resources!.requests['memory']!,
                );
          }

          if (pod.spec!.containers[i].resources!.limits.containsKey('cpu')) {
            cpuLimits =
                cpuLimits +
                cpuMetricsStringToDouble(
                  pod.spec!.containers[i].resources!.limits['cpu']!,
                );
          }

          if (pod.spec!.containers[i].resources!.limits.containsKey('memory')) {
            memoryLimits =
                memoryLimits +
                memoryMetricsStringToDouble(
                  pod.spec!.containers[i].resources!.limits['memory']!,
                );
          }
        }
      }
    }

    return PodResourceForLiveMetrics(
      cpuRequests: cpuRequests,
      cpuLimits: cpuLimits,
      memoryRequests: memoryRequests,
      memoryLimits: memoryLimits,
    );
  } catch (err) {
    return null;
  }
}

/// The [_parseMetricsResult] function parses the metrics result from the
/// Kubernetes API and returns a list of container metrics. The function is used
/// in the [LiveMetrics] widget. The function is executed in an Isolate.
List<ApisMetricsV1beta1PodMetricsItemContainer>? _parseMetricsResult(
  String result,
) {
  final parsed = json.decode(result);
  return ApisMetricsV1beta1PodMetricsItem.fromJson(parsed).containers;
}

/// The [LiveMetrics] widget shows a modal with the live metrics for a
/// Pod and the selected container.
class LiveMetrics extends StatefulWidget {
  const LiveMetrics({
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
  State<LiveMetrics> createState() => _LiveMetricsState();
}

class _LiveMetricsState extends State<LiveMetrics> {
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

      final result = await KubernetesService(
        cluster: cluster!,
        proxy: appRepository.settings.proxy,
        timeout: appRepository.settings.timeout,
      ).getRequest(url);

      Logger.log(
        'LiveMetrics _fetchMetrics',
        'Metrics Returned',
        'Request URL: $url\nResult: $result',
      );

      final parsedMetricsData = await compute(_parseMetricsResult, result);

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
                    cpuMetricsStringToDouble(container.usage!.cpu!),
                    memoryMetricsStringToDouble(container.usage!.memory!),
                  );
                });
              } else {
                setState(() {
                  _containerMetrics[container.name!] = ContainerMetric(
                    initTime: DateTime.now().millisecondsSinceEpoch,
                    initCPU: cpuMetricsStringToDouble(container.usage!.cpu!),
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
        'LiveMetrics _fetchMetrics',
        'Failed to Fetch Metrics',
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
      subtitle: '${widget.namespace}/${widget.name}',
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
            Padding(
              padding: const EdgeInsets.only(
                top: Constants.spacingMiddle,
                bottom: Constants.spacingMiddle,
                left: Constants.spacingMiddle,
                right: Constants.spacingMiddle,
              ),
              child: SizedBox(
                height: 32,
                child: TabBar(
                  isScrollable: false,
                  tabAlignment: TabAlignment.fill,
                  dividerHeight: 0,
                  labelColor: Theme.of(context).colorScheme.onPrimary,
                  unselectedLabelColor: Theme.of(context).colorScheme.primary,
                  labelPadding: EdgeInsets.zero,
                  indicatorPadding: const EdgeInsets.symmetric(horizontal: 5),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      Constants.sizeBorderRadius,
                    ),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  tabs: const [
                    Tab(text: 'CPU'),
                    Tab(text: 'Memory'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.only(
                        bottom: Constants.spacingMiddle,
                        left: Constants.spacingMiddle,
                        right: Constants.spacingMiddle,
                      ),
                      padding: const EdgeInsets.all(
                        Constants.spacingListItemContent,
                      ),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(
                              context,
                            ).extension<CustomColors>()!.shadow,
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
                            child: LineChart(
                              LineChartData(
                                minY: 0,
                                lineTouchData: LineTouchData(
                                  enabled: true,
                                  handleBuiltInTouches: true,
                                  touchTooltipData: LineTouchTooltipData(
                                    fitInsideHorizontally: true,
                                    fitInsideVertically: true,
                                    maxContentWidth: MediaQuery.of(
                                      context,
                                    ).size.width,
                                    getTooltipColor: (LineBarSpot touchedSpot) {
                                      return Theme.of(
                                        context,
                                      ).extension<CustomColors>()!.message;
                                    },
                                    getTooltipItems: (touchedSpots) {
                                      return touchedSpots.map((
                                        LineBarSpot touchedSpot,
                                      ) {
                                        return LineTooltipItem(
                                          '${_containerMetrics.keys.elementAt(touchedSpot.barIndex)}: ${touchedSpot.y > 1000000000 ? formatCpuMetric(touchedSpot.y) : formatCpuMetric(touchedSpot.y, 0)}',
                                          TextStyle(
                                            color: Theme.of(context)
                                                .extension<CustomColors>()!
                                                .onMessage,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14,
                                          ),
                                        );
                                      }).toList();
                                    },
                                  ),
                                ),
                                clipData: const FlClipData.all(),
                                lineBarsData: _containerMetrics.entries
                                    .map(
                                      (e) => LineChartBarData(
                                        spots: e.value.cpu,
                                        dotData: const FlDotData(show: false),
                                        color: e.key == 'Requests'
                                            ? Theme.of(context)
                                                  .extension<CustomColors>()!
                                                  .warning
                                            : e.key == 'Limits'
                                            ? Theme.of(
                                                context,
                                              ).extension<CustomColors>()!.error
                                            : Theme.of(
                                                context,
                                              ).colorScheme.primary,
                                        barWidth: 4,
                                        isCurved: false,
                                      ),
                                    )
                                    .toList(),
                                titlesData: FlTitlesData(
                                  show: true,
                                  rightTitles: const AxisTitles(
                                    sideTitles: SideTitles(showTitles: false),
                                  ),
                                  topTitles: const AxisTitles(
                                    sideTitles: SideTitles(showTitles: false),
                                  ),
                                  leftTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      reservedSize: 64,
                                      getTitlesWidget:
                                          (double value, TitleMeta meta) {
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
                                              value.round(),
                                            );

                                        return Container(
                                          padding: const EdgeInsets.only(
                                            top: 16,
                                            right: 42,
                                          ),
                                          child: Text(
                                            '${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}:${timestamp.second.toString().padLeft(2, '0')}',
                                            style: secondaryTextStyle(context),
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
                          ..._containerMetrics.entries.map(
                            (e) => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    Characters(e.key)
                                        .replaceAll(
                                          Characters(''),
                                          Characters('\u{200B}'),
                                        )
                                        .toString(),
                                    style: normalTextStyle(
                                      context,
                                      size: Constants.sizeTextSecondary,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  formatCpuMetric(
                                    e.value.cpu[e.value.cpu.length - 1].y
                                        .toDouble(),
                                  ),
                                  style: secondaryTextStyle(context),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.only(
                        bottom: Constants.spacingMiddle,
                        left: Constants.spacingMiddle,
                        right: Constants.spacingMiddle,
                      ),
                      padding: const EdgeInsets.all(
                        Constants.spacingListItemContent,
                      ),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(
                              context,
                            ).extension<CustomColors>()!.shadow,
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
                            child: LineChart(
                              LineChartData(
                                minY: 0,
                                lineTouchData: LineTouchData(
                                  enabled: true,
                                  handleBuiltInTouches: true,
                                  touchTooltipData: LineTouchTooltipData(
                                    fitInsideHorizontally: true,
                                    fitInsideVertically: true,
                                    maxContentWidth: MediaQuery.of(
                                      context,
                                    ).size.width,
                                    getTooltipColor: (LineBarSpot touchedSpot) {
                                      return Theme.of(
                                        context,
                                      ).extension<CustomColors>()!.message;
                                    },
                                    getTooltipItems: (touchedSpots) {
                                      return touchedSpots.map((
                                        LineBarSpot touchedSpot,
                                      ) {
                                        return LineTooltipItem(
                                          '${_containerMetrics.keys.elementAt(touchedSpot.barIndex)}: ${touchedSpot.y > 1048576 ? formatMemoryMetric(touchedSpot.y, 2) : formatMemoryMetric(touchedSpot.y, 0)}',
                                          TextStyle(
                                            color: Theme.of(context)
                                                .extension<CustomColors>()!
                                                .onMessage,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14,
                                          ),
                                        );
                                      }).toList();
                                    },
                                  ),
                                ),
                                clipData: const FlClipData.all(),
                                lineBarsData: _containerMetrics.entries
                                    .map(
                                      (e) => LineChartBarData(
                                        spots: e.value.memory,
                                        dotData: const FlDotData(show: false),
                                        color: e.key == 'Requests'
                                            ? Theme.of(context)
                                                  .extension<CustomColors>()!
                                                  .warning
                                            : e.key == 'Limits'
                                            ? Theme.of(
                                                context,
                                              ).extension<CustomColors>()!.error
                                            : Theme.of(
                                                context,
                                              ).colorScheme.primary,
                                        barWidth: 4,
                                        isCurved: false,
                                      ),
                                    )
                                    .toList(),
                                titlesData: FlTitlesData(
                                  show: true,
                                  rightTitles: const AxisTitles(
                                    sideTitles: SideTitles(showTitles: false),
                                  ),
                                  topTitles: const AxisTitles(
                                    sideTitles: SideTitles(showTitles: false),
                                  ),
                                  leftTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      reservedSize: 64,
                                      getTitlesWidget:
                                          (double value, TitleMeta meta) {
                                            return Text(
                                              value > 1048576
                                                  ? formatMemoryMetric(value, 2)
                                                  : formatMemoryMetric(
                                                      value,
                                                      0,
                                                    ),
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
                                              value.round(),
                                            );

                                        return Container(
                                          padding: const EdgeInsets.only(
                                            top: 16,
                                            right: 42,
                                          ),
                                          child: Text(
                                            '${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}:${timestamp.second.toString().padLeft(2, '0')}',
                                            style: secondaryTextStyle(context),
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
                          ..._containerMetrics.entries.map(
                            (e) => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    Characters(e.key)
                                        .replaceAll(
                                          Characters(''),
                                          Characters('\u{200B}'),
                                        )
                                        .toString(),
                                    style: normalTextStyle(
                                      context,
                                      size: Constants.sizeTextSecondary,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  formatMemoryMetric(
                                    e.value.memory[e.value.memory.length - 1].y
                                        .toDouble(),
                                  ),
                                  style: secondaryTextStyle(context),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// The [LiveMetricsContainers] widget returns an actions menu, where a user can
/// select the container for which he wants to view the live metrics for CPU and
/// Memory usage. The actions menu also contains an item to view the live
/// metrics for all contains in of a Pod.
class LiveMetricsContainers extends StatelessWidget {
  const LiveMetricsContainers({
    super.key,
    required this.name,
    required this.namespace,
    required this.pod,
  });

  final String name;
  final String namespace;
  final IoK8sApiCoreV1Pod pod;

  @override
  Widget build(BuildContext context) {
    return AppActionsWidget(
      actions: List.generate(
        pod.spec != null ? pod.spec!.containers.length + 1 : 1,
        (index) => AppActionsWidgetAction(
          title: index == pod.spec!.containers.length
              ? 'All Containers'
              : pod.spec?.containers[index].name ?? '',
          color: Theme.of(context).colorScheme.primary,
          onTap: () {
            Navigator.pop(context);
            showModal(
              context,
              LiveMetrics(
                name: name,
                namespace: namespace,
                pod: pod,
                selectedContainer: index == pod.spec!.containers.length
                    ? ''
                    : pod.spec?.containers[index].name ?? '',
              ),
            );
          },
        ),
      ),
    );
  }
}
