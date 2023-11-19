import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_event.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/widgets/resources/details/details_item.dart';
import 'package:kubenav/widgets/shared/app_prometheus_charts_widget.dart';

class EventDetailsItem extends StatelessWidget implements IDetailsItemWidget {
  const EventDetailsItem({
    super.key,
    required this.item,
  });

  @override
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    final event = IoK8sApiCoreV1Event.fromJson(item);

    if (event == null) {
      return Container();
    }

    return Column(
      children: [
        DetailsItemWidget(
          title: 'Details',
          details: [
            DetailsItemModel(
              name: 'Type',
              values: event.type ?? '-',
            ),
            DetailsItemModel(
              name: 'Reason',
              values: event.reason ?? '-',
            ),
            DetailsItemModel(
              name: 'Message',
              values: event.message ?? '-',
            ),
            DetailsItemModel(
              name: 'Last Seen',
              values: getAge(event.lastTimestamp),
            ),
            DetailsItemModel(
              name: 'First Seen',
              values: getAge(event.firstTimestamp),
            ),
            DetailsItemModel(
              name: 'Count',
              values: event.count ?? '-',
            ),
            DetailsItemModel(
              name: 'Source',
              values: event.source_?.component ?? '-',
            ),
            DetailsItemModel(
              name: 'Reporting Component',
              values: event.reportingComponent ?? '-',
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsItemWidget(
          title: 'Involved Object',
          goTo: 'View',
          goToOnTap: goToReference(
            context,
            event.involvedObject,
            null,
          ),
          details: [
            DetailsItemModel(
              name: 'API Version',
              values: event.involvedObject.apiVersion ?? '-',
            ),
            DetailsItemModel(
              name: 'Kind',
              values: event.involvedObject.kind ?? '-',
            ),
            DetailsItemModel(
              name: 'name',
              values: event.involvedObject.name ?? '-',
            ),
            DetailsItemModel(
              name: 'Namespace',
              values: event.involvedObject.namespace ?? '-',
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        AppPrometheusChartsWidget(
          manifest: item,
          defaultCharts: const [],
        ),
      ],
    );
  }
}
