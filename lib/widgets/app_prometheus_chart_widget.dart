import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

import 'package:kubenav/controllers/cluster_controller.dart';
import 'package:kubenav/models/prometheus_model.dart';
import 'package:kubenav/models/time_model.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/widgets/app_bottom_sheet_widget.dart';

class AppPrometheusChartController extends GetxController {
  ClusterController clusterController = Get.find();

  final Map<String, dynamic> manifest;
  final List<Query> queries;
  final Time time;

  AppPrometheusChartController({
    required this.manifest,
    required this.queries,
    required this.time,
  });

  RxList<Metric> metrics = <Metric>[].obs;
  RxBool loading = true.obs;

  @override
  void onInit() {
    getMetrics();

    super.onInit();
  }

  void getMetrics() async {
    try {
      final cluster = clusterController
          .clusters[clusterController.activeClusterIndex.value].value;

      final metricsData = await KubernetesService(cluster: cluster)
          .prometheusGetData(manifest, queries, time.start, time.end);

      metrics.value = metricsData;
      loading.value = false;
    } catch (err) {
      Logger.log(
        'AppPrometheusChartController getMetrics',
        'An error was returned getting metrics',
        err,
      );

      loading.value = false;
    }
  }
}

class AppPrometheusChartWidget extends StatelessWidget {
  const AppPrometheusChartWidget({
    Key? key,
    required this.title,
    required this.unit,
    required this.manifest,
    required this.queries,
    required this.time,
  }) : super(key: key);

  final String title;
  final String unit;
  final Map<String, dynamic> manifest;
  final List<Query> queries;
  final Time time;

  @override
  Widget build(BuildContext context) {
    AppPrometheusChartController controller = Get.put(
      AppPrometheusChartController(
        manifest: manifest,
        queries: queries,
        time: time,
      ),
    );

    return AppBottomSheetWidget(
      title: title,
      subtitle: 'Unit $unit',
      icon: Icons.area_chart,
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
            return ListView(
              children: const [
                Center(
                  child: CircularProgressIndicator(
                    color: Constants.colorPrimary,
                  ),
                ),
              ],
            );
          }

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
                        lineTouchData: LineTouchData(enabled: false),
                        clipData: FlClipData.all(),
                        lineBarsData: controller.metrics
                            .map((e) => LineChartBarData(
                                  spots: e.toSpots(),
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
                              reservedSize: 96,
                              getTitlesWidget: (double value, TitleMeta meta) {
                                return Text(
                                  '${value.toStringAsFixed(2)} $unit',
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
                              interval: (time.end - time.start) / 5 * 1000,
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
                  ...controller.metrics
                      .map(
                        (e) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              e.label ?? '',
                              style: noramlTextStyle(
                                context,
                                size: Constants.sizeTextSecondary,
                              ),
                            ),
                            Text(
                              e.data != null && e.data!.isNotEmpty
                                  ? '${e.data![e.data!.length - 1].y} $unit'
                                  : '-',
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
    );
  }
}
