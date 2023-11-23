import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_batch_v1_job.dart';
import 'package:kubenav/models/resource.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/widgets/resources/details/details_item.dart';
import 'package:kubenav/widgets/resources/details/details_resources_preview.dart';
import 'package:kubenav/widgets/shared/app_prometheus_charts_widget.dart';

class JobDetailsItem extends StatelessWidget implements IDetailsItemWidget {
  const JobDetailsItem({
    super.key,
    required this.item,
  });

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
        DetailsResourcesPreview(
          title: Resources.map['pods']!.title,
          resource: Resources.map['pods']!.resource,
          path: Resources.map['pods']!.path,
          scope: Resources.map['pods']!.scope,
          additionalPrinterColumns:
              Resources.map['pods']!.additionalPrinterColumns,
          namespace: job.metadata?.namespace,
          selector: getSelector(job.spec!.selector),
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreview(
          title: Resources.map['events']!.title,
          resource: Resources.map['events']!.resource,
          path: Resources.map['events']!.path,
          scope: Resources.map['events']!.scope,
          additionalPrinterColumns:
              Resources.map['events']!.additionalPrinterColumns,
          namespace: job.metadata?.namespace,
          selector:
              'fieldSelector=involvedObject.name=${job.metadata?.name ?? ''}',
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
