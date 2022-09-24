import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_batch_v1_cron_job.dart';
import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/pages/resources_details/widgets/details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/details_resources_preview_widget.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/widgets/app_prometheus_metrics_widget.dart';

class CronJobDetailsItemWidget extends StatelessWidget
    implements IDetailsItemWidget {
  const CronJobDetailsItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    final cronJob = IoK8sApiBatchV1CronJob.fromJson(item);

    if (cronJob == null || cronJob.spec == null) {
      return Container();
    }

    return Column(
      children: [
        DetailsItemWidget(
          title: 'Configuration',
          details: [
            DetailsItemModel(
              name: 'Schedule',
              values: cronJob.spec!.schedule,
            ),
            DetailsItemModel(
              name: 'Concurrency Policy',
              values: cronJob.spec!.concurrencyPolicy ?? '-',
            ),
            DetailsItemModel(
              name: 'Suspend',
              values: cronJob.spec!.suspend == null ||
                      cronJob.spec!.suspend == false
                  ? 'False'
                  : 'True',
            ),
            DetailsItemModel(
              name: 'Successful Job History Limit',
              values: cronJob.spec!.successfulJobsHistoryLimit ?? '-',
            ),
            DetailsItemModel(
              name: 'Failed Job History Limit',
              values: cronJob.spec!.failedJobsHistoryLimit ?? '-',
            ),
            DetailsItemModel(
              name: 'Starting Deadline Seconds',
              values: cronJob.spec!.startingDeadlineSeconds ?? '-',
            ),
            DetailsItemModel(
              name: 'Selector',
              values: cronJob
                      .spec!.jobTemplate.spec?.selector?.matchLabels.entries
                      .map((matchLabel) =>
                          '${matchLabel.key}=${matchLabel.value}')
                      .toList() ??
                  '-',
            ),
            DetailsItemModel(
              name: 'Parallelism',
              values: cronJob.spec!.jobTemplate.spec?.parallelism ?? '-',
            ),
            DetailsItemModel(
              name: 'Completions',
              values: cronJob.spec!.jobTemplate.spec?.completions ?? '-',
            ),
            DetailsItemModel(
              name: 'Active Deadline Seconds',
              values:
                  cronJob.spec!.jobTemplate.spec?.activeDeadlineSeconds ?? '-',
            ),
            DetailsItemModel(
              name: 'Backoff Limit',
              values: cronJob.spec!.jobTemplate.spec?.backoffLimit ?? '-',
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsItemWidget(
          title: 'Status',
          details: [
            DetailsItemModel(
              name: 'Last Schedule',
              values: getAge(cronJob.status?.lastScheduleTime),
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreviewWidget(
          title: Resources.map['jobs']!.title,
          resource: Resources.map['jobs']!.resource,
          path: Resources.map['jobs']!.path,
          scope: Resources.map['jobs']!.scope,
          namespace: cronJob.metadata?.namespace,
          selector: '',
          filter: (items) {
            return items
                .where((item) =>
                    item['metadata'] != null &&
                    item['metadata']['ownerReferences'] != null &&
                    item['metadata']['ownerReferences'] is List<dynamic> &&
                    item['metadata']['ownerReferences'].length == 1 &&
                    item['metadata']['ownerReferences'][0]['name'] != null &&
                    item['metadata']['ownerReferences'][0]['name'] ==
                        cronJob.metadata?.name)
                .toList();
          },
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreviewWidget(
          title: Resources.map['events']!.title,
          resource: Resources.map['events']!.resource,
          path: Resources.map['events']!.path,
          scope: Resources.map['events']!.scope,
          namespace: cronJob.metadata?.namespace,
          selector:
              'fieldSelector=involvedObject.name=${cronJob.metadata?.name ?? ''}',
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
