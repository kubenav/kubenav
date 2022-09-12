import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

import 'package:kubenav/controllers/cluster_controller.dart';
import 'package:kubenav/models/kubernetes-extensions/pod_metrics.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/widgets/app_bottom_sheet_widget.dart';

class ContainerMetric {
  RxList<FlSpot> cpu;
  RxList<FlSpot> memory;

  ContainerMetric({
    required int initTime,
    required double initCPU,
    required double initMemory,
  })  : cpu = [FlSpot(initTime.toDouble(), initCPU)].obs,
        memory = [FlSpot(initTime.toDouble(), initMemory)].obs;

  void add(int newTime, double newCPU, double newMemory) {
    if (cpu.length > 25 || memory.length > 25) {
      cpu.removeAt(0);
      memory.removeAt(0);
    }

    cpu.add(FlSpot(newTime.toDouble(), newCPU));
    memory.add(FlSpot(newTime.toDouble(), newMemory));
  }
}

class DetailsLiveMetricsController extends GetxController {
  final String name;
  final String namespace;
  late Timer timer;

  RxMap containerMetrics = <String, ContainerMetric>{}.obs;

  ClusterController clusterController = Get.find();

  DetailsLiveMetricsController({
    required this.name,
    required this.namespace,
  });

  @override
  void onInit() {
    getMetrics();
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      getMetrics();
    });

    super.onInit();
  }

  @override
  void onClose() {
    timer.cancel();

    super.onClose();
  }

  void getMetrics() async {
    try {
      final cluster = clusterController
          .clusters[clusterController.activeClusterIndex.value].value;
      final url =
          '/apis/metrics.k8s.io/v1beta1/namespaces/$namespace/pods/$name';

      final metricsData =
          await KubernetesService(cluster: cluster).getRequest(url);

      final parsedMetricsData =
          ApisMetricsV1beta1PodMetricsItem.fromJson(metricsData).containers;
      if (parsedMetricsData != null) {
        for (var container in parsedMetricsData) {
          if (container.name != null &&
              container.usage != null &&
              container.usage!.cpu != null &&
              container.usage!.memory != null) {
            if (containerMetrics.containsKey(container.name)) {
              containerMetrics[container.name].add(
                DateTime.now().millisecondsSinceEpoch,
                cpuMetricsStringToDouble(container.usage!.cpu!),
                memoryMetricsStringToDouble(container.usage!.memory!),
              );
            } else {
              containerMetrics[container.name] = ContainerMetric(
                initTime: DateTime.now().millisecondsSinceEpoch,
                initCPU: cpuMetricsStringToDouble(container.usage!.cpu!),
                initMemory:
                    memoryMetricsStringToDouble(container.usage!.memory!),
              );
            }
          }
        }
      }
    } catch (err) {
      Logger.log(
        'DetailsLiveMetricsController getMetrics',
        'An error was returned getting metrics',
        err,
      );
    }
  }
}

class DetailsLiveMetricsWidget extends StatelessWidget {
  const DetailsLiveMetricsWidget({
    Key? key,
    required this.name,
    required this.namespace,
  }) : super(key: key);

  final String name;
  final String namespace;

  @override
  Widget build(BuildContext context) {
    DetailsLiveMetricsController controller = Get.put(
      DetailsLiveMetricsController(
        name: name,
        namespace: namespace,
      ),
    );

    return AppBottomSheetWidget(
      title: 'Live Metrics',
      subtitle: name,
      icon: Icons.insights,
      onClosePressed: () {
        finish(context);
      },
      actionText: 'Close',
      onActionPressed: () {
        finish(context);
      },
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(Constants.sizeBorderRadius),
              ),
              child: TabBar(
                isScrollable: false,
                labelColor: Colors.white,
                unselectedLabelColor: Constants.colorPrimary,
                labelPadding: EdgeInsets.zero,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  color: Constants.colorPrimary,
                ),
                tabs: [
                  Tab(text: 'CPU'),
                  Tab(text: 'Memory'),
                ],
              ),
            ),
            // const SizedBox(height: Constants.spacingLarge),
            const SizedBox(height: Constants.spacingMiddle),
            Expanded(
              child: TabBarView(
                children: [
                  Obx(
                    () {
                      return SingleChildScrollView(
                        child: Container(
                          margin: const EdgeInsets.only(
                            top: Constants.spacingSmall,
                            bottom: Constants.spacingMiddle,
                            left: Constants.spacingExtraSmall,
                            right: Constants.spacingExtraSmall,
                          ),
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context).shadowColor,
                                blurRadius: Constants.sizeBorderBlurRadius,
                                spreadRadius: Constants.sizeBorderSpreadRadius,
                                offset: const Offset(0.0, 0.0),
                              ),
                            ],
                            color: Theme.of(context).cardColor,
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
                                    lineTouchData:
                                        LineTouchData(enabled: false),
                                    clipData: FlClipData.all(),
                                    lineBarsData:
                                        controller.containerMetrics.entries
                                            .map((e) => LineChartBarData(
                                                  spots: e.value.cpu,
                                                  dotData: FlDotData(
                                                    show: false,
                                                  ),
                                                  color: Constants.colorPrimary,
                                                  barWidth: 4,
                                                  isCurved: false,
                                                ))
                                            .toList(),
                                    titlesData: FlTitlesData(
                                      show: true,
                                      rightTitles: AxisTitles(
                                        sideTitles: SideTitles(
                                          showTitles: false,
                                        ),
                                      ),
                                      topTitles: AxisTitles(
                                        sideTitles: SideTitles(
                                          showTitles: false,
                                        ),
                                      ),
                                      leftTitles: AxisTitles(
                                        sideTitles: SideTitles(
                                          showTitles: true,
                                          reservedSize: 42,
                                          getTitlesWidget:
                                              (double value, TitleMeta meta) {
                                            return Text(
                                              formatCpuMetric(value, 0),
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
                                            final timestamp = DateTime
                                                .fromMillisecondsSinceEpoch(
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
                              const SizedBox(
                                height: Constants.spacingMiddle,
                              ),
                              ...controller.containerMetrics.entries
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
                                            e.value.cpu[e.value.cpu.length - 1]
                                                .y
                                                .toDouble(),
                                          ),
                                          style: secondaryTextStyle(
                                            context,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                  .toList(),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  Obx(
                    () {
                      return SingleChildScrollView(
                        child: Container(
                          margin: const EdgeInsets.only(
                            top: Constants.spacingSmall,
                            bottom: Constants.spacingMiddle,
                            left: Constants.spacingExtraSmall,
                            right: Constants.spacingExtraSmall,
                          ),
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context).shadowColor,
                                blurRadius: Constants.sizeBorderBlurRadius,
                                spreadRadius: Constants.sizeBorderSpreadRadius,
                                offset: const Offset(0.0, 0.0),
                              ),
                            ],
                            color: Theme.of(context).cardColor,
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
                                    lineTouchData:
                                        LineTouchData(enabled: false),
                                    clipData: FlClipData.all(),
                                    lineBarsData:
                                        controller.containerMetrics.entries
                                            .map((e) => LineChartBarData(
                                                  spots: e.value.memory,
                                                  dotData: FlDotData(
                                                    show: false,
                                                  ),
                                                  color: Constants.colorPrimary,
                                                  barWidth: 4,
                                                  isCurved: false,
                                                ))
                                            .toList(),
                                    titlesData: FlTitlesData(
                                      show: true,
                                      rightTitles: AxisTitles(
                                        sideTitles: SideTitles(
                                          showTitles: false,
                                        ),
                                      ),
                                      topTitles: AxisTitles(
                                        sideTitles: SideTitles(
                                          showTitles: false,
                                        ),
                                      ),
                                      leftTitles: AxisTitles(
                                        sideTitles: SideTitles(
                                          showTitles: true,
                                          reservedSize: 42,
                                          getTitlesWidget:
                                              (double value, TitleMeta meta) {
                                            return Text(
                                              formatMemoryMetric(value, 0),
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
                                            final timestamp = DateTime
                                                .fromMillisecondsSinceEpoch(
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
                              const SizedBox(
                                height: Constants.spacingMiddle,
                              ),
                              ...controller.containerMetrics.entries
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
                                          formatMemoryMetric(e
                                              .value
                                              .memory[e.value.memory.length - 1]
                                              .y
                                              .toDouble()),
                                          style: secondaryTextStyle(
                                            context,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                  .toList(),
                            ],
                          ),
                        ),
                      );
                    },
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
