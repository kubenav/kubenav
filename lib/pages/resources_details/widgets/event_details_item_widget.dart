import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_event.dart';
import 'package:kubenav/pages/resources_details/widgets/details_item_widget.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/widgets/app_prometheus_metrics_widget.dart';

class EventDetailsItemWidget extends StatelessWidget
    implements IDetailsItemWidget {
  const EventDetailsItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

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
        AppPrometheusMetricsWidget(
          manifest: item,
          defaultCharts: const [],
        ),
      ],
    );
  }
}
