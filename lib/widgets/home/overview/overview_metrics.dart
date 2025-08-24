import 'package:flutter/material.dart';

import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/utils/themes.dart';
import 'package:kubenav/widgets/home/overview/overview_metric.dart';

/// The [OverviewMetrics] widget shows three icons, one for the CPU, one for the
/// Memory and one for the Pod metrics. A user can then click on one of the
/// icons to get the corresponding metrics. The metrics will be loaded and shown
/// via the [OverviewMetric] widget.
///
/// If the metrics should only be displayed for a single node instead of for the
/// whole cluster the optional [nodeName] argument can be set.
class OverviewMetrics extends StatelessWidget {
  const OverviewMetrics({super.key, required this.nodeName});

  final String? nodeName;

  /// [buildCard] builds the card widget for a single metric. Each card must
  /// contain a [title], [icon] and an [onTap] function, which is executed when
  /// the user clicks on the card.
  Widget buildCard(
    BuildContext context,
    String title,
    IconData icon, [
    void Function()? onTap,
  ]) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(Constants.spacingMiddle),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).extension<CustomColors>()!.shadow,
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
            Icon(icon, color: Theme.of(context).colorScheme.primary, size: 64),
            const SizedBox(height: Constants.spacingSmall),
            Text(title, style: primaryTextStyle(context)),
          ],
        ),
      ),
    );
  }

  /// [showMetrics] opens the [OverviewMetric] widget in a modal to display the
  /// metrics for the requested [metricType] (CPU, Memory or Pods).
  void showMetrics(BuildContext context, MetricType metricType, IconData icon) {
    showModal(
      context,
      OverviewMetric(metricType: metricType, icon: icon, nodeName: nodeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(Constants.spacingMiddle),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Metrics',
                  style: primaryTextStyle(context, size: 18),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: Constants.spacingMiddle,
            right: Constants.spacingMiddle,
          ),
          child: Row(
            mainAxisAlignment: isTablet(context)
                ? MainAxisAlignment.spaceEvenly
                : MainAxisAlignment.spaceBetween,
            children: [
              buildCard(context, 'CPU', Icons.bar_chart, () {
                showMetrics(context, MetricType.cpu, Icons.bar_chart);
              }),
              buildCard(context, 'Memory', Icons.area_chart, () {
                showMetrics(context, MetricType.memory, Icons.area_chart);
              }),
              buildCard(context, 'Pods', Icons.pie_chart, () {
                showMetrics(context, MetricType.pods, Icons.pie_chart);
              }),
            ],
          ),
        ),
      ],
    );
  }
}
