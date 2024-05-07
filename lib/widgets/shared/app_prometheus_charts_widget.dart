import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:yaml/yaml.dart';

import 'package:kubenav/models/plugins/prometheus.dart';
import 'package:kubenav/models/plugins/time.dart';
import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/shared/app_list_item.dart';
import 'package:kubenav/widgets/shared/app_prometheus_chart_widget.dart';
import 'package:kubenav/widgets/shared/app_time_range_selector_widget.dart';

List<Chart> _getChartsFromAnnotation(String annotation) {
  final List<Chart> additionalCharts = [];

  final parsedCharts = loadYaml(annotation);

  for (var parsedChart in parsedCharts as List<dynamic>) {
    additionalCharts.add(
      Chart.fromYaml(
        parsedChart,
      ),
    );
  }

  return additionalCharts;
}

/// The [AppPrometheusChartsWidget] checks if the given [manifest] contains
/// a `kubenav.io/prometheus` annotation and merges the charts from the
/// annotation with the provided [defaultCharts]. It then renderes a list with
/// all charts where the user can select a chart to view the metrics from the
/// queries of the chart.
class AppPrometheusChartsWidget extends StatefulWidget {
  const AppPrometheusChartsWidget({
    super.key,
    required this.item,
    required this.toJson,
    required this.defaultCharts,
  });

  final dynamic item;
  final Map<String, dynamic> Function(dynamic item)? toJson;
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
  dynamic _manifest;
  List<Chart> _charts = <Chart>[];

  /// [_getCharts] is used to check if the given [widget.manifest] contains a
  /// `kubenav.io/prometheus` annotation with additional charts. If this is the
  /// case the user defined charts are added to the list of default charts. If
  /// we could not parse the value of the annotation we just use the default
  /// charts and log an error.
  Future<void> _getCharts() async {
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: false,
    );

    if (appRepository.settings.prometheus.enabled == true) {
      try {
        if (widget.item != null && widget.toJson != null) {
          final manifest = await compute(widget.toJson!, widget.item);

          if (manifest.containsKey('metadata') &&
              manifest['metadata'].containsKey('annotations') &&
              manifest['metadata']['annotations']
                  .containsKey('kubenav.io/prometheus') &&
              manifest['metadata']['annotations']['kubenav.io/prometheus'] !=
                  'dashboard') {
            Logger.log(
              'AppPrometheusChartsWidget _getCharts',
              'Metadata Contains "kubenav.io/prometheus" Annotation',
              manifest['metadata']['annotations']['kubenav.io/prometheus'],
            );

            final additionalCharts = await compute(
              _getChartsFromAnnotation,
              manifest['metadata']['annotations']['kubenav.io/prometheus']
                  as String,
            );

            setState(() {
              _manifest = manifest;
              _charts = [...widget.defaultCharts, ...additionalCharts];
            });
          } else {
            setState(() {
              _manifest = manifest;
              _charts = widget.defaultCharts;
            });
          }
        } else {
          setState(() {
            _manifest = null;
            _charts = widget.defaultCharts;
          });
        }
      } catch (err) {
        Logger.log(
          'AppPrometheusChartsWidget _getCharts',
          'Failed to Parse "kubenav.io/prometheus" Annotation',
          err,
        );
        setState(() {
          _manifest = null;
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

    if (appRepository.settings.prometheus.enabled == false || _charts.isEmpty) {
      return Container();
    }

    return Column(
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
                child: Row(
                  children: [
                    Icon(
                      Icons.schedule,
                      color: Theme.of(context).colorScheme.primary,
                      size: 16,
                    ),
                    const SizedBox(width: Constants.spacingExtraSmall),
                    Text(
                      'Time Range',
                      style: secondaryTextStyle(
                        context,
                        color: Theme.of(context).colorScheme.primary,
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
                  manifest: _manifest,
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
        const SizedBox(height: Constants.spacingMiddle),
      ],
    );
  }
}
