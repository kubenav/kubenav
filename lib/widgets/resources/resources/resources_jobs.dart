import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/joblist_batch_v1.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/widgets/resources/helpers/details_item.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_conditions.dart'
    as details_item_conditions;
import 'package:kubenav/widgets/resources/helpers/details_item_metadata.dart'
    as details_item_metadata;
import 'package:kubenav/widgets/resources/helpers/details_resources_preview.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/resources/resources/resources_events.dart';
import 'package:kubenav/widgets/resources/resources/resources_pods.dart';
import 'package:kubenav/widgets/resources/resources_list.dart';
import 'package:kubenav/widgets/shared/app_prometheus_charts_widget.dart';

final resourceJob = Resource(
  category: ResourceCategories.workload,
  plural: 'Jobs',
  singular: 'Job',
  description:
      'A Job creates one or more Pods and will continue to retry execution of the Pods until a specified number of them successfully terminate.',
  path: '/apis/batch/v1',
  resource: 'jobs',
  scope: ResourceScope.namespaced,
  additionalPrinterColumns: [],
  icon: 'jobs',
  template:
      '{"apiVersion":"batch/v1","kind":"Job","metadata":{"name":"","namespace":""},"spec":{"backoffLimit":0,"completions":1,"parallelism":1,"template":{"spec":{"containers":[{"name":"nginx","image":"nginx:1.14.2"}]}}}}',
  decodeListData: (ResourcesListData data) {
    final parsed = json.decode(data.list);
    final items = JoblistBatchV1.fromJson(parsed).items;

    return items.map((e) {
      final completions = e?.spec?.completions ?? 0;
      final succeeded = e?.status?.succeeded ?? 0;
      final unhealthy =
          e?.status?.conditions
              ?.where(
                (c) =>
                    c?.reason == 'BackoffLimitExceeded' ||
                    c?.reason == 'DeadlineExceeded',
              )
              .length ??
          0;

      return ResourceItem(
        item: e,
        metrics: null,
        status: unhealthy > 0
            ? ResourceStatus.danger
            : succeeded < completions
            ? ResourceStatus.warning
            : ResourceStatus.success,
      );
    }).toList();
  },
  decodeList: (String data) {
    final parsed = json.decode(data);
    return JoblistBatchV1.fromJson(parsed).items;
  },
  getName: (dynamic item) {
    return (item as JoblistBatchV1Item).metadata?.name ?? '';
  },
  getNamespace: (dynamic item) {
    return (item as JoblistBatchV1Item).metadata?.namespace;
  },
  decodeItem: (String data) {
    final parsed = json.decode(data);
    return JoblistBatchV1Item.fromJson(parsed);
  },
  encodeItem: (dynamic item) {
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    return encoder.convert(item);
  },
  toJson: (dynamic item) {
    return json.decode(json.encode(item));
  },
  listItemBuilder: (BuildContext context, Resource resource, ResourceItem listItem) {
    final item = listItem.item as JoblistBatchV1Item;
    final status = listItem.status;

    return ResourcesListItem(
      name: item.metadata?.name ?? '',
      namespace: item.metadata?.namespace,
      resource: resource,
      item: item,
      status: status,
      details: [
        'Namespace: ${item.metadata?.namespace ?? '-'}',
        'Completions: ${item.status?.succeeded ?? 0}/${item.spec?.completions ?? 0}',
        'Duration: ${timeDiff(item.status?.startTime, item.status?.completionTime)}',
        'Age: ${getAge(item.metadata?.creationTimestamp)}',
      ],
    );
  },
  previewItemBuilder: (dynamic listItem) {
    final item = listItem as JoblistBatchV1Item;

    return [
      'Namespace: ${item.metadata?.namespace ?? '-'}',
      'Completions: ${item.status?.succeeded ?? 0}/${item.spec?.completions ?? 0}',
      'Duration: ${timeDiff(item.status?.startTime, item.status?.completionTime)}',
      'Age: ${getAge(item.metadata?.creationTimestamp)}',
    ];
  },
  detailsItemBuilder:
      (BuildContext context, Resource resource, dynamic detailsItem) {
        final item = detailsItem as JoblistBatchV1Item;

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
            details_item_conditions.DetailsItemConditions(
              conditions: item.status?.conditions
                  ?.map(
                    (condition) => details_item_conditions.Condition(
                      type: condition?.type ?? '',
                      status: condition?.status ?? '',
                      lastTransitionTime:
                          condition?.lastTransitionTime ?? DateTime.now(),
                      reason: condition?.reason ?? '',
                      message: condition?.message ?? '',
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: Constants.spacingMiddle),
            DetailsItem(
              title: 'Configuration',
              details: [
                DetailsItemModel(
                  name: 'Backoff Limit',
                  values: item.spec?.backoffLimit,
                ),
                DetailsItemModel(
                  name: 'Completions',
                  values: item.spec?.completions,
                ),
                DetailsItemModel(
                  name: 'Parallelism',
                  values: item.spec?.parallelism,
                ),
              ],
            ),
            const SizedBox(height: Constants.spacingMiddle),
            DetailsItem(
              title: 'Status',
              details: [
                DetailsItemModel(
                  name: 'Start Time',
                  values: formatTime(item.status?.startTime),
                ),
                DetailsItemModel(
                  name: 'Completion Time',
                  values: formatTime(item.status?.completionTime),
                ),
                DetailsItemModel(
                  name: 'Duration',
                  values: timeDiff(
                    item.status?.startTime,
                    item.status?.completionTime,
                  ),
                ),
                DetailsItemModel(
                  name: 'Succeeded',
                  values: item.status?.succeeded,
                ),
                DetailsItemModel(name: 'Failed', values: item.status?.failed),
              ],
            ),
            const SizedBox(height: Constants.spacingMiddle),
            DetailsResourcesPreview(
              resource: resourcePod,
              namespace: item.metadata?.namespace,
              selector: getSelector(
                Selector(
                  matchLabels: item.spec?.selector?.matchLabels,
                  matchExpressions: item.spec?.selector?.matchExpressions
                      ?.map(
                        (e) => MatchExpression(
                          key: e!.key,
                          matchExpressionOperator: e.matchExpressionOperator,
                          values: e.values,
                        ),
                      )
                      .toList(),
                ),
              ),
              filter: null,
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
