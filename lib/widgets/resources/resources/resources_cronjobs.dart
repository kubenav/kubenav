import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/cronjoblist_batch_v1.dart';
import 'package:kubenav/models/kubernetes/joblist_batch_v1.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/widgets/resources/helpers/details_item.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_metadata.dart'
    as details_item_metadata;
import 'package:kubenav/widgets/resources/helpers/details_resources_preview.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/resources/resources/resources_events.dart';
import 'package:kubenav/widgets/resources/resources/resources_jobs.dart';
import 'package:kubenav/widgets/resources/resources_list.dart';
import 'package:kubenav/widgets/shared/app_prometheus_charts_widget.dart';

final resourceCronJob = Resource(
  category: ResourceCategories.workload,
  plural: 'CronJobs',
  singular: 'CronJob',
  description: 'A CronJob creates Jobs on a repeating schedule.',
  path: '/apis/batch/v1',
  resource: 'cronjobs',
  scope: ResourceScope.namespaced,
  additionalPrinterColumns: [],
  icon: 'cronjobs',
  template:
      '{"apiVersion":"batch/v1","kind":"CronJob","metadata":{"name":"","namespace":""},"spec":{"schedule":"5 4 * * *","suspend":false,"successfulJobsHistoryLimit":1,"failedJobsHistoryLimit":1,"jobTemplate":{"spec":{"backoffLimit":0,"template":{"spec":{"containers":[{"name":"nginx","image":"nginx:1.14.2"}]}}}}}}',
  decodeListData: (ResourcesListData data) {
    final parsed = json.decode(data.list);
    final items = CronjoblistBatchV1.fromJson(parsed).items;

    return items
        .map(
          (e) => ResourceItem(
            item: e,
            metrics: null,
            status: e?.spec?.suspend == false
                ? ResourceStatus.success
                : ResourceStatus.warning,
          ),
        )
        .toList();
  },
  decodeList: (String data) {
    final parsed = json.decode(data);
    return CronjoblistBatchV1.fromJson(parsed).items;
  },
  getName: (dynamic item) {
    return (item as CronjoblistBatchV1Item).metadata?.name ?? '';
  },
  getNamespace: (dynamic item) {
    return (item as CronjoblistBatchV1Item).metadata?.namespace;
  },
  decodeItem: (String data) {
    final parsed = json.decode(data);
    return CronjoblistBatchV1Item.fromJson(parsed);
  },
  encodeItem: (dynamic item) {
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    return encoder.convert(item);
  },
  toJson: (dynamic item) {
    return json.decode(json.encode(item));
  },
  listItemBuilder:
      (BuildContext context, Resource resource, ResourceItem listItem) {
        final item = listItem.item as CronjoblistBatchV1Item;
        final status = listItem.status;

        return ResourcesListItem(
          name: item.metadata?.name ?? '',
          namespace: item.metadata?.namespace,
          resource: resource,
          item: item,
          status: status,
          details: [
            'Namespace: ${item.metadata?.namespace ?? '-'}',
            'Schedule: ${item.spec?.schedule ?? '-'}',
            'Suspend: ${item.spec?.suspend == false ? 'False' : 'True'}',
            'Active: ${item.status?.active?.length ?? 0}',
            'Last Schedule: ${getAge(item.status?.lastScheduleTime)}',
            'Age: ${getAge(item.metadata?.creationTimestamp)}',
          ],
        );
      },
  previewItemBuilder: (dynamic listItem) {
    final item = listItem as CronjoblistBatchV1Item;

    return [
      'Namespace: ${item.metadata?.namespace ?? '-'}',
      'Schedule: ${item.spec?.schedule ?? '-'}',
      'Suspend: ${item.spec?.suspend == false ? 'False' : 'True'}',
      'Active: ${item.status?.active?.length ?? 0}',
      'Last Schedule: ${getAge(item.status?.lastScheduleTime)}',
      'Age: ${getAge(item.metadata?.creationTimestamp)}',
    ];
  },
  detailsItemBuilder:
      (BuildContext context, Resource resource, dynamic detailsItem) {
        final item = detailsItem as CronjoblistBatchV1Item;

        return Column(
          children: [
            details_item_metadata.DetailsItemMetadata(
              kind: item.kind?.name,
              metadata: details_item_metadata.Metadata(
                name: item.metadata?.name,
                namespace: item.metadata?.namespace,
                labels: item.metadata?.labels,
                annotations: item.metadata?.annotations,
                creationTimestamp: item.metadata?.creationTimestamp,
                ownerReferences: item.metadata?.ownerReferences
                    ?.map(
                      (ownerReference) => details_item_metadata.OwnerReference(
                        apiVersion: ownerReference?.apiVersion ?? '',
                        blockOwnerDeletion: ownerReference?.blockOwnerDeletion,
                        controller: ownerReference?.controller,
                        kind: ownerReference?.kind ?? '',
                        name: ownerReference?.name ?? '',
                        uid: ownerReference?.uid ?? '',
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: Constants.spacingMiddle),
            DetailsItem(
              title: 'Configuration',
              details: [
                DetailsItemModel(name: 'Schedule', values: item.spec?.schedule),
                DetailsItemModel(
                  name: 'Concurrency Policy',
                  values: item.spec?.concurrencyPolicy,
                ),
                DetailsItemModel(
                  name: 'Suspend',
                  values:
                      item.spec?.suspend == null || item.spec?.suspend == false
                      ? 'False'
                      : 'True',
                ),
                DetailsItemModel(
                  name: 'Successful Job History Limit',
                  values: item.spec?.successfulJobsHistoryLimit,
                ),
                DetailsItemModel(
                  name: 'Failed Job History Limit',
                  values: item.spec?.failedJobsHistoryLimit,
                ),
                DetailsItemModel(
                  name: 'Starting Deadline Seconds',
                  values: item.spec?.startingDeadlineSeconds,
                ),
                DetailsItemModel(
                  name: 'Selector',
                  values: item
                      .spec
                      ?.jobTemplate
                      .spec
                      ?.selector
                      ?.matchLabels
                      ?.entries
                      .map(
                        (matchLabel) => '${matchLabel.key}=${matchLabel.value}',
                      )
                      .toList(),
                ),
                DetailsItemModel(
                  name: 'Parallelism',
                  values: item.spec?.jobTemplate.spec?.parallelism,
                ),
                DetailsItemModel(
                  name: 'Completions',
                  values: item.spec?.jobTemplate.spec?.completions,
                ),
                DetailsItemModel(
                  name: 'Active Deadline Seconds',
                  values: item.spec?.jobTemplate.spec?.activeDeadlineSeconds,
                ),
                DetailsItemModel(
                  name: 'Backoff Limit',
                  values: item.spec?.jobTemplate.spec?.backoffLimit,
                ),
              ],
            ),
            const SizedBox(height: Constants.spacingMiddle),
            DetailsItem(
              title: 'Status',
              details: [
                DetailsItemModel(
                  name: 'Last Schedule',
                  values: getAge(item.status?.lastScheduleTime),
                ),
              ],
            ),
            const SizedBox(height: Constants.spacingMiddle),
            DetailsResourcesPreview(
              resource: resourceJob,
              namespace: item.metadata?.namespace,
              selector: '',
              filter: (List<dynamic> previewItems) {
                final jobs = previewItems as List<JoblistBatchV1Item>;

                return jobs
                    .where(
                      (job) =>
                          job.metadata?.ownerReferences != null &&
                          job.metadata?.ownerReferences!.length == 1 &&
                          job.metadata?.ownerReferences![0]?.name ==
                              item.metadata?.name,
                    )
                    .toList();
              },
            ),
            const SizedBox(height: Constants.spacingMiddle),
            DetailsResourcesPreview(
              resource: resourceEvent,
              namespace: item.metadata?.namespace,
              selector:
                  'fieldSelector=involvedObject.name=${item.metadata?.name ?? ''}',
              filter: null,
            ),
            const SizedBox(height: Constants.spacingMiddle),
            AppPrometheusChartsWidget(
              item: item,
              toJson: resource.toJson,
              defaultCharts: const [],
            ),
          ],
        );
      },
);
