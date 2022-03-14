import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/pages/home/widgets/metric_widget.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';

class MetricsWidget extends StatelessWidget {
  const MetricsWidget({
    Key? key,
    required this.nodeName,
  }) : super(key: key);

  final String? nodeName;

  Widget buildCard(String title, IconData icon, [void Function()? onTap]) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(
          Constants.spacingMiddle,
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Constants.shadowColorGlobal,
              blurRadius: Constants.sizeBorderBlurRadius,
              spreadRadius: Constants.sizeBorderSpreadRadius,
              offset: const Offset(0.0, 0.0),
            ),
          ],
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(Constants.sizeBorderRadius),
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: Constants.colorPrimary,
              size: 64,
            ),
            const SizedBox(height: Constants.spacingSmall),
            Text(
              title,
              style: primaryTextStyle(),
            ),
          ],
        ),
      ),
    );
  }

  void showMetrics(MetricType metricType, IconData icon) {
    Get.bottomSheet(
      BottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.sizeBorderRadius),
        ),
        onClosing: () {},
        enableDrag: false,
        builder: (builder) {
          return MetricWidget(
            metricType: metricType,
            icon: icon,
            nodeName: nodeName,
          );
        },
      ),
      isScrollControlled: true,
    );
  }

  @override
  Widget build(BuildContext context) {
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
                child: Text(
                  'Metrics',
                  style: primaryTextStyle(size: 18),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildCard(
              'CPU',
              Icons.bar_chart,
              () {
                showMetrics(
                  MetricType.cpu,
                  Icons.bar_chart,
                );
              },
            ),
            buildCard(
              'Memory',
              Icons.area_chart,
              () {
                showMetrics(
                  MetricType.memory,
                  Icons.area_chart,
                );
              },
            ),
            buildCard(
              'Pods',
              Icons.pie_chart,
              () {
                showMetrics(
                  MetricType.pods,
                  Icons.pie_chart,
                );
              },
            ),
          ],
        )
      ],
    );
  }
}
