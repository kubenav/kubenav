import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/daemonsetlist_apps_v1.dart';
import 'package:kubenav/models/plugins/prometheus.dart';
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

final resourceDaemonSet = Resource(
  category: ResourceCategories.workload,
  plural: 'DaemonSets',
  singular: 'DaemonSet',
  description:
      'A DaemonSet ensures that all (or some) Nodes run a copy of a Pod.',
  path: '/apis/apps/v1',
  resource: 'daemonsets',
  scope: ResourceScope.namespaced,
  additionalPrinterColumns: [],
  icon: 'daemonsets',
  template:
      '{"apiVersion":"apps/v1","kind":"DaemonSet","metadata":{"name":"","namespace":""},"spec":{"selector":{"matchLabels":{"app":"nginx"}},"template":{"metadata":{"labels":{"app":"nginx"}},"spec":{"containers":[{"name":"nginx","image":"nginx:1.14.2"}]}}}}',
  decodeListData: (ResourcesListData data) {
    final parsed = json.decode(data.list);
    final items = DaemonsetlistAppsV1.fromJson(parsed).items;

    return items
        .map(
          (e) => ResourceItem(
            item: e,
            metrics: null,
            status: e!.status!.desiredNumberScheduled == 0
                ? ResourceStatus.warning
                : e.status!.desiredNumberScheduled !=
                          e.status!.currentNumberScheduled ||
                      e.status!.desiredNumberScheduled !=
                          e.status!.numberReady ||
                      e.status!.desiredNumberScheduled !=
                          e.status!.updatedNumberScheduled ||
                      e.status!.desiredNumberScheduled !=
                          e.status!.numberAvailable ||
                      e.status!.numberMisscheduled > 0
                ? ResourceStatus.danger
                : ResourceStatus.success,
          ),
        )
        .toList();
  },
  decodeList: (String data) {
    final parsed = json.decode(data);
    return DaemonsetlistAppsV1.fromJson(parsed).items;
  },
  getName: (dynamic item) {
    return (item as DaemonsetlistAppsV1Item).metadata?.name ?? '';
  },
  getNamespace: (dynamic item) {
    return (item as DaemonsetlistAppsV1Item).metadata?.namespace;
  },
  decodeItem: (String data) {
    final parsed = json.decode(data);
    return DaemonsetlistAppsV1Item.fromJson(parsed);
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
        final item = listItem.item as DaemonsetlistAppsV1Item;
        final status = listItem.status;

        final nodeSelector =
            item.spec?.template.spec?.nodeSelector?.entries
                .map((e) => '${e.key}=${e.value}')
                .toList() ??
            [];

        return ResourcesListItem(
          name: item.metadata?.name ?? '',
          namespace: item.metadata?.namespace,
          resource: resource,
          item: item,
          status: status,
          details: [
            'Namespace: ${item.metadata?.namespace ?? '-'}',
            'Desired: ${item.status?.desiredNumberScheduled ?? 0}',
            'Current: ${item.status?.currentNumberScheduled ?? 0}',
            'Ready: ${item.status?.numberReady ?? 0}',
            'Up to Date: ${item.status?.updatedNumberScheduled ?? 0}',
            'Available: ${item.status?.numberAvailable ?? 0}',
            'Misscheduled: ${item.status?.numberMisscheduled ?? 0}',
            'Node Selector: ${nodeSelector.isEmpty ? '-' : nodeSelector.join(', ')}',
            'Age: ${getAge(item.metadata?.creationTimestamp)}',
          ],
        );
      },
  previewItemBuilder: (dynamic listItem) {
    final item = listItem as DaemonsetlistAppsV1Item;

    final nodeSelector =
        item.spec?.template.spec?.nodeSelector?.entries
            .map((e) => '${e.key}=${e.value}')
            .toList() ??
        [];

    return [
      'Namespace: ${item.metadata?.namespace ?? '-'}',
      'Desired: ${item.status?.desiredNumberScheduled ?? 0}',
      'Current: ${item.status?.currentNumberScheduled ?? 0}',
      'Ready: ${item.status?.numberReady ?? 0}',
      'Up to Date: ${item.status?.updatedNumberScheduled ?? 0}',
      'Available: ${item.status?.numberAvailable ?? 0}',
      'Misscheduled: ${item.status?.numberMisscheduled ?? 0}',
      'Node Selector: ${nodeSelector.isEmpty ? '-' : nodeSelector.join(', ')}',
      'Age: ${getAge(item.metadata?.creationTimestamp)}',
    ];
  },
  detailsItemBuilder: (BuildContext context, Resource resource, dynamic detailsItem) {
    final item = detailsItem as DaemonsetlistAppsV1Item;

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
              name: 'Revision History Limit',
              values: item.spec?.revisionHistoryLimit,
            ),
            DetailsItemModel(
              name: 'Update Strategy',
              values: item.spec?.updateStrategy?.type,
            ),
            DetailsItemModel(
              name: 'Selector',
              values: item.spec?.selector.matchLabels?.entries
                  .map((matchLabel) => '${matchLabel.key}=${matchLabel.value}')
                  .toList(),
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsItem(
          title: 'Status',
          details: [
            DetailsItemModel(
              name: 'Desired',
              values: item.status?.desiredNumberScheduled,
            ),
            DetailsItemModel(
              name: 'Current',
              values: item.status?.currentNumberScheduled,
            ),
            DetailsItemModel(name: 'Ready', values: item.status?.numberReady),
            DetailsItemModel(
              name: 'Available',
              values: item.status?.numberAvailable,
            ),
            DetailsItemModel(
              name: 'Up to Date',
              values: item.status?.updatedNumberScheduled,
            ),
            DetailsItemModel(
              name: 'Misscheduled',
              values: item.status?.numberMisscheduled,
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreview(
          resource: resourcePod,
          namespace: item.metadata?.namespace,
          selector: getSelector(
            Selector(
              matchLabels: item.spec?.selector.matchLabels,
              matchExpressions: item.spec?.selector.matchExpressions
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
          defaultCharts: [
            Chart(
              title: 'Pods',
              unit: '',
              queries: [
                Query(
                  query:
                      'kube_daemonset_status_desired_number_scheduled{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", daemonset="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}',
                  label: 'Desired',
                ),
                Query(
                  query:
                      'kube_daemonset_status_current_number_scheduled{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", daemonset="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}',
                  label: 'Current',
                ),
                Query(
                  query:
                      'kube_daemonset_status_number_ready{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", daemonset="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}',
                  label: 'Ready',
                ),
                Query(
                  query:
                      'kube_daemonset_status_number_misscheduled{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", daemonset="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}',
                  label: 'Misscheduled',
                ),
                Query(
                  query:
                      'kube_daemonset_updated_number_scheduled{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", daemonset="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}',
                  label: 'Updated',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  },
);
