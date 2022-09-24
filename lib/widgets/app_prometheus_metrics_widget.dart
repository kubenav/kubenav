import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yaml/yaml.dart';

import 'package:kubenav/controllers/global_settings_controller.dart';
import 'package:kubenav/models/prometheus_model.dart';
import 'package:kubenav/models/time_model.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/widgets/app_prometheus_chart_widget.dart';
import 'package:kubenav/widgets/app_time_range_selector_widget.dart';

class AppPrometheusMetricsController extends GetxController {
  GlobalSettingsController globalSettingsController = Get.find();

  Time time = Time(
    time: 'Last 15 Minutes',
    start: (DateTime.now().millisecondsSinceEpoch ~/ 1000) - 900,
    end: DateTime.now().millisecondsSinceEpoch ~/ 1000,
  );
  Map<String, dynamic> manifest;
  List<Chart> defaultCharts;

  AppPrometheusMetricsController({
    required this.manifest,
    required this.defaultCharts,
  });

  RxList<Chart> charts = <Chart>[].obs;
  RxBool loading = true.obs;

  @override
  void onInit() {
    getCharts();

    super.onInit();
  }

  /// [getCharts] is used to check if the given [manifest] contains a `kubenav.io/prometheus` annotation with additional
  /// charts. If this is the case the user defined charts are added to the list of default charts. If we could not parse
  /// the value of the annotation we just use the default charts and log an error.
  void getCharts() async {
    if (globalSettingsController.prometheusEnabled.value == true) {
      try {
        final List<Chart> additionalCharts = [];

        if (manifest.containsKey('metadata') &&
            manifest['metadata'].containsKey('annotations') &&
            manifest['metadata']['annotations']
                .containsKey('kubenav.io/prometheus')) {
          Logger.log(
            'AppPrometheusMetricsController getCharts',
            'Manifest contains kubenav.io/prometheus annotation',
            manifest['metadata']['annotations']['kubenav.io/prometheus'],
          );

          final parsedCharts = json.decode(
            json.encode(
              loadYaml(
                manifest['metadata']['annotations']['kubenav.io/prometheus'],
              ),
            ),
          );

          for (var parsedChart in parsedCharts) {
            additionalCharts.add(Chart.fromJson(parsedChart));
          }
        }

        charts.value = [...defaultCharts, ...additionalCharts];
        loading.value = false;
      } catch (err) {
        charts.value = defaultCharts;
        loading.value = false;
      }
    }
  }
}

class AppPrometheusMetricsWidget extends StatelessWidget {
  const AppPrometheusMetricsWidget({
    Key? key,
    required this.manifest,
    required this.defaultCharts,
  }) : super(key: key);

  final Map<String, dynamic> manifest;
  final List<Chart> defaultCharts;

  @override
  Widget build(BuildContext context) {
    AppPrometheusMetricsController controller = Get.put(
      AppPrometheusMetricsController(
        manifest: manifest,
        defaultCharts: defaultCharts,
      ),
    );

    if (controller.globalSettingsController.prometheusEnabled.value == false ||
        controller.loading.value == true) {
      return Container();
    }

    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: Constants.spacingMiddle,
            left: Constants.spacingMiddle,
            right: Constants.spacingMiddle,
            bottom: Constants.spacingMiddle,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  'Prometheus Metrics',
                  style: primaryTextStyle(context, size: 18),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.bottomSheet(
                    BottomSheet(
                      onClosing: () {},
                      enableDrag: false,
                      builder: (builder) {
                        return AppTimeRangeSelectorWidget(
                          time: controller.time,
                          selectTime: (Time newTime) =>
                              controller.time = newTime,
                        );
                      },
                    ),
                    isScrollControlled: true,
                  );
                },
                child: Wrap(
                  children: [
                    const Icon(
                      Icons.schedule,
                      color: Constants.colorPrimary,
                      size: 16,
                    ),
                    const SizedBox(width: Constants.spacingExtraSmall),
                    Text(
                      'Time Range',
                      style: secondaryTextStyle(
                        context,
                        color: Constants.colorPrimary,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            left: Constants.spacingMiddle,
            right: Constants.spacingMiddle,
          ),
          child: Obx(
            () {
              return Column(
                children: List.generate(
                  controller.charts.length,
                  (index) => Container(
                    margin: const EdgeInsets.only(
                      bottom: Constants.spacingMiddle,
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
                    child: InkWell(
                      onTap: () {
                        Get.bottomSheet(
                          BottomSheet(
                            onClosing: () {},
                            enableDrag: false,
                            builder: (builder) {
                              return AppPrometheusChartWidget(
                                title: controller.charts[index].title,
                                unit: controller.charts[index].unit,
                                manifest: manifest,
                                queries: controller.charts[index].queries,
                                time: controller.time,
                              );
                            },
                          ),
                          isScrollControlled: true,
                        );
                      },
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.charts[index].title,
                                  style: primaryTextStyle(
                                    context,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
