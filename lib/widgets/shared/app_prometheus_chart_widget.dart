import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:kubenav/models/plugins/prometheus.dart';
import 'package:kubenav/models/plugins/time.dart';
import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/themes.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';
import 'package:kubenav/widgets/shared/app_error_widget.dart';

/// The [AppPrometheusChartWidget] widget renders the chart with the metrics
/// returned by Prometheus for a list of PromQL [queries].
class AppPrometheusChartWidget extends StatefulWidget {
  const AppPrometheusChartWidget({
    super.key,
    required this.title,
    required this.unit,
    required this.manifest,
    required this.queries,
    required this.time,
  });

  final String title;
  final String unit;
  final Map<String, dynamic> manifest;
  final List<Query> queries;
  final Time time;

  @override
  State<AppPrometheusChartWidget> createState() =>
      _AppPrometheusChartWidgetState();
}

class _AppPrometheusChartWidgetState extends State<AppPrometheusChartWidget> {
  late Future<List<Metric>> _futureFetchMetrics;
  String _selectedLabel = '';

  Future<List<Metric>> _fetchMetrics() async {
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

    return await KubernetesService(
      cluster: cluster!,
      proxy: appRepository.settings.proxy,
      timeout: appRepository.settings.timeout,
    ).prometheusGetData(
      appRepository.settings.prometheus.toJson(),
      widget.manifest,
      widget.queries,
      widget.time.start,
      widget.time.end,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      _futureFetchMetrics = _fetchMetrics();
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ClustersRepository>(context, listen: true);

    return AppBottomSheetWidget(
      title: widget.title,
      subtitle: 'Unit: ${widget.unit}',
      icon: Icons.area_chart,
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
            builder: (BuildContext context, AsyncSnapshot<List<Metric>> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.primary,
                  );
                default:
                  if (snapshot.hasError) {
                    return AppErrorWidget(
                      message: 'Failed to Load Metrics',
                      details: snapshot.error.toString(),
                      icon: 'assets/plugins/prometheus.svg',
                    );
                  }

                  return Container(
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
                                        '${_selectedLabel == '' ? snapshot.data![touchedSpot.barIndex].label : _selectedLabel}: ${NumberFormat.compact(locale: "en_US").format(touchedSpot.y)} ${widget.unit}',
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
                              lineBarsData: snapshot.data!
                                  .where(
                                    (e) =>
                                        _selectedLabel == '' ||
                                        e.label == _selectedLabel,
                                  )
                                  .map(
                                    (e) => LineChartBarData(
                                      spots: e.toSpots(),
                                      dotData: const FlDotData(show: false),
                                      color: Theme.of(
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
                                    reservedSize: 96,
                                    getTitlesWidget:
                                        (double value, TitleMeta meta) {
                                          return Text(
                                            '${NumberFormat.compact(locale: "en_US").format(value)} ${widget.unit}',
                                            style: secondaryTextStyle(context),
                                          );
                                        },
                                  ),
                                ),
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    interval:
                                        (widget.time.end - widget.time.start) /
                                        3 *
                                        1000,
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
                                          '${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}',
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
                                    color: Theme.of(
                                      context,
                                    ).extension<CustomColors>()!.textSecondary,
                                    strokeWidth: 0.4,
                                    dashArray: [8, 4],
                                  );
                                },
                                getDrawingVerticalLine: (value) {
                                  return FlLine(
                                    color: Theme.of(
                                      context,
                                    ).extension<CustomColors>()!.textSecondary,
                                    strokeWidth: 0.4,
                                    dashArray: [8, 4],
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: Constants.spacingMiddle),
                        ...snapshot.data!.map(
                          (e) => InkWell(
                            onTap: () {
                              if (_selectedLabel == e.label) {
                                setState(() {
                                  _selectedLabel = '';
                                });
                              } else {
                                setState(() {
                                  _selectedLabel = e.label ?? '';
                                });
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    Characters(e.label ?? '')
                                        .replaceAll(
                                          Characters(''),
                                          Characters('\u{200B}'),
                                        )
                                        .toString(),
                                    style: normalTextStyle(
                                      context,
                                      size: Constants.sizeTextSecondary,
                                      decoration: _selectedLabel == e.label
                                          ? TextDecoration.underline
                                          : null,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  e.data != null &&
                                          e.data!.isNotEmpty &&
                                          e.data![e.data!.length - 1].y != null
                                      ? '${NumberFormat.compact(locale: "en_US").format(e.data![e.data!.length - 1].y!)} ${widget.unit}'
                                      : '',
                                  style: secondaryTextStyle(
                                    context,
                                    decoration: _selectedLabel == e.label
                                        ? TextDecoration.underline
                                        : null,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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
