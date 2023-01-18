import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:yaml/yaml.dart';

import 'package:kubenav/models/plugins/prometheus.dart';
import 'package:kubenav/models/plugins/time.dart';
import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/shared/app_list_item.dart';
import 'package:kubenav/widgets/shared/app_prometheus_chart_widget.dart';
import 'package:kubenav/widgets/shared/app_time_range_selector_widget.dart';

/// The [AppPrometheusChartsWidget] checks if the given [manifest] contains
/// a `kubenav.io/prometheus` annotation and merges the charts from the
/// annotation with the provided [defaultCharts]. It then renderes a list with
/// all charts where the user can select a chart to view the metrics from the
/// queries of the chart.
class AppPrometheusChartsWidget extends StatefulWidget {
  const AppPrometheusChartsWidget({
    super.key,
    required this.manifest,
    required this.defaultCharts,
  });

  final Map<String, dynamic> manifest;
  final List<Chart> defaultCharts;

  @override
  State<AppPrometheusChartsWidget> createState() =>
      _AppPrometheusChartsWidgetState();
}

class _AppPrometheusChartsWidgetState extends State<AppPrometheusChartsWidget> {
  Time _time = Time(
    time: 'Last 15 Minutes',
    start: (DateTime.now().millisecondsSinceEpoch ~/ 1000) - 900,
    end: DateTime.now().millisecondsSinceEpoch ~/ 1000,
  );
  List<Chart> _charts = <Chart>[];

  /// [_getCharts] is used to check if the given [widget.manifest] contains a
  /// `kubenav.io/prometheus` annotation with additional charts. If this is the
  /// case the user defined charts are added to the list of default charts. If
  /// we could not parse the value of the annotation we just use the default
  /// charts and log an error.
  void _getCharts() {
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: false,
    );

    if (appRepository.settings.prometheus.enabled == true) {
      try {
        final List<Chart> additionalCharts = [];

        if (widget.manifest.containsKey('metadata') &&
            widget.manifest['metadata'].containsKey('annotations') &&
            widget.manifest['metadata']['annotations']
                .containsKey('kubenav.io/prometheus') &&
            widget.manifest['metadata']['annotations']
                    ['kubenav.io/prometheus'] !=
                'dashboard') {
          Logger.log(
            'AppPrometheusChartsController _getCharts',
            'Manifest contains kubenav.io/prometheus annotation',
            widget.manifest['metadata']['annotations']['kubenav.io/prometheus'],
          );

          final parsedCharts = loadYaml(
            widget.manifest['metadata']['annotations']['kubenav.io/prometheus'],
          );

          for (var parsedChart in parsedCharts as List<dynamic>) {
            additionalCharts.add(
              Chart.fromYaml(
                parsedChart,
              ),
            );
          }
        }

        setState(() {
          _charts = [...widget.defaultCharts, ...additionalCharts];
        });
      } catch (err) {
        Logger.log(
          'AppPrometheusChartsController _getCharts',
          'Could not parse kubenav.io/prometheus annotation',
          err,
        );
        setState(() {
          _charts = widget.defaultCharts;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _getCharts();
  }

  @override
  Widget build(BuildContext context) {
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: true,
    );

    if (appRepository.settings.prometheus.enabled == false) {
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
                  showModal(
                    context,
                    AppTimeRangeSelectorWidget(
                      time: _time,
                      selectTime: (Time time) {
                        setState(() {
                          _time = time;
                        });
                      },
                    ),
                  );
                },
                child: Wrap(
                  children: [
                    Icon(
                      Icons.schedule,
                      color: theme(context).colorPrimary,
                      size: 16,
                    ),
                    const SizedBox(width: Constants.spacingExtraSmall),
                    Text(
                      'Time Range',
                      style: secondaryTextStyle(
                        context,
                        color: theme(context).colorPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.only(
            left: Constants.spacingMiddle,
            right: Constants.spacingMiddle,
          ),
          separatorBuilder: (context, index) => const SizedBox(
            height: Constants.spacingMiddle,
          ),
          itemCount: _charts.length,
          itemBuilder: (context, index) => AppListItem(
            onTap: () {
              showModal(
                context,
                AppPrometheusChartWidget(
                  title: _charts[index].title,
                  unit: _charts[index].unit,
                  manifest: widget.manifest,
                  queries: _charts[index].queries,
                  time: _time,
                ),
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
                        _charts[index].title,
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
      ],
    );
  }
}
