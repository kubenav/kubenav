import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_batch_v1_job.dart';
import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/pages/resources_details/widgets/details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/details_resources_preview_widget.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/widgets/app_prometheus_metrics_widget.dart';

class JobDetailsItemWidget extends StatelessWidget
    implements IDetailsItemWidget {
  const JobDetailsItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    final job = IoK8sApiBatchV1Job.fromJson(item);

    if (job == null || job.spec == null || job.status == null) {
      return Container();
    }

    return Column(
      children: [
        DetailsItemWidget(
          title: 'Configuration',
          details: [
            DetailsItemModel(
              name: 'Backoff Limit',
              values: job.spec!.backoffLimit ?? '-',
            ),
            DetailsItemModel(
              name: 'Completions',
              values: job.spec!.completions ?? '-',
            ),
            DetailsItemModel(
              name: 'Parallelism',
              values: job.spec!.parallelism ?? '-',
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsItemWidget(
          title: 'Status',
          details: [
            DetailsItemModel(
              name: 'Start Time',
              values: formatTime(job.status!.startTime),
            ),
            DetailsItemModel(
              name: 'Completion Time',
              values: formatTime(job.status!.completionTime),
            ),
            DetailsItemModel(
              name: 'Duration',
              values:
                  timeDiff(job.status!.startTime, job.status!.completionTime),
            ),
            DetailsItemModel(
              name: 'Succeeded',
              values: job.status!.succeeded ?? '-',
            ),
            DetailsItemModel(
              name: 'Failed',
              values: job.status!.failed ?? '-',
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreviewWidget(
          title: Resources.map['pods']!.title,
          resource: Resources.map['pods']!.resource,
          path: Resources.map['pods']!.path,
          scope: Resources.map['pods']!.scope,
          namespace: job.metadata?.namespace,
          selector: getSelector(job.spec!.selector),
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreviewWidget(
          title: Resources.map['events']!.title,
          resource: Resources.map['events']!.resource,
          path: Resources.map['events']!.path,
          scope: Resources.map['events']!.scope,
          namespace: job.metadata?.namespace,
          selector:
              'fieldSelector=involvedObject.name=${job.metadata?.name ?? ''}',
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
