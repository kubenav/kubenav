import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_apps_v1_replica_set.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_apps_v1_replica_set_list.dart';
import 'package:kubenav/models/kubernetes/io_k8s_apimachinery_pkg_apis_meta_v1_condition.dart';
import 'package:kubenav/models/plugins/prometheus.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/widgets/resources/helpers/details_item.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_conditions.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_metadata.dart';
import 'package:kubenav/widgets/resources/helpers/details_resources_preview.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/resources/resources/resources_events.dart';
import 'package:kubenav/widgets/resources/resources/resources_pods.dart';
import 'package:kubenav/widgets/resources/resources_list.dart';
import 'package:kubenav/widgets/shared/app_prometheus_charts_widget.dart';

final resourceReplicaSet = Resource(
  category: ResourceCategories.workload,
  plural: 'ReplicaSets',
  singular: 'ReplicaSet',
  description:
      'A ReplicaSet\'s purpose is to maintain a stable set of replica Pods running at any given time.',
  path: '/apis/apps/v1',
  resource: 'replicasets',
  scope: ResourceScope.namespaced,
  additionalPrinterColumns: [],
  icon: 'replicasets',
  template: resourceDefaultTemplate,
  decodeListData: (ResourcesListData data) {
    final parsed = json.decode(data.list);
    final items = IoK8sApiAppsV1ReplicaSetList.fromJson(parsed)?.items ?? [];

    return items
        .map(
          (e) => ResourceItem(
            item: e,
            metrics: null,
            status: e.status!.replicas == 0
                ? ResourceStatus.undefined
                : e.status!.replicas != e.status!.availableReplicas ||
                        e.status!.replicas != e.status!.readyReplicas
                    ? ResourceStatus.danger
                    : ResourceStatus.success,
          ),
        )
        .toList();
  },
  decodeList: (String data) {
    final parsed = json.decode(data);
    return IoK8sApiAppsV1ReplicaSetList.fromJson(parsed)?.items ?? [];
  },
  getName: (dynamic item) {
    return (item as IoK8sApiAppsV1ReplicaSet).metadata?.name ?? '';
  },
  getNamespace: (dynamic item) {
    return (item as IoK8sApiAppsV1ReplicaSet).metadata?.namespace;
  },
  decodeItem: (String data) {
    final parsed = json.decode(data);
    return IoK8sApiAppsV1ReplicaSet.fromJson(parsed);
  },
  encodeItem: (dynamic item) {
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    return encoder.convert(item);
  },
  toJson: (dynamic item) {
    return json.decode(json.encode(item));
  },
  listItemBuilder: (
    BuildContext context,
    Resource resource,
    ResourceItem listItem,
  ) {
    final item = listItem.item as IoK8sApiAppsV1ReplicaSet;
    final status = listItem.status;

    return ResourcesListItem(
      name: item.metadata?.name ?? '',
      namespace: item.metadata?.namespace,
      resource: resource,
      item: item,
      status: status,
      details: [
        'Namespace: ${item.metadata?.namespace ?? '-'}',
        'Desired: ${item.status?.replicas ?? 0}',
        'Current: ${item.status?.availableReplicas ?? 0}',
        'Ready: ${item.status?.readyReplicas ?? 0}',
        'Age: ${getAge(item.metadata?.creationTimestamp)}',
      ],
    );
  },
  previewItemBuilder: (
    dynamic listItem,
  ) {
    final item = listItem as IoK8sApiAppsV1ReplicaSet;

    return [
      'Namespace: ${item.metadata?.namespace ?? '-'}',
      'Desired: ${item.status?.replicas ?? 0}',
      'Current: ${item.status?.availableReplicas ?? 0}',
      'Ready: ${item.status?.readyReplicas ?? 0}',
      'Age: ${getAge(item.metadata?.creationTimestamp)}',
    ];
  },
  detailsItemBuilder: (
    BuildContext context,
    Resource resource,
    dynamic detailsItem,
  ) {
    final item = detailsItem as IoK8sApiAppsV1ReplicaSet;

    return Column(
      children: [
        DetailsItemMetadata(metadata: item.metadata),
        DetailsItemConditions(
          conditions: item.status?.conditions
              .map(
                (e) => IoK8sApimachineryPkgApisMetaV1Condition(
                  lastTransitionTime: e.lastTransitionTime ?? DateTime.now(),
                  message: e.message ?? '',
                  observedGeneration: null,
                  reason: e.reason ?? '',
                  status: e.status,
                  type: e.type,
                ),
              )
              .toList(),
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsItem(
          title: 'Configuration',
          details: [
            DetailsItemModel(
              name: 'Replicas',
              values: item.spec?.replicas,
            ),
            DetailsItemModel(
              name: 'Selector',
              values: item.spec?.selector.matchLabels.entries
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
              name: 'Desired Replicas',
              values: item.status?.replicas,
            ),
            DetailsItemModel(
              name: 'Ready Replicas',
              values: item.status?.readyReplicas,
            ),
            DetailsItemModel(
              name: 'Available Replicas',
              values: item.status?.availableReplicas,
            ),
            DetailsItemModel(
              name: 'Fully Labeled Replicas',
              values: item.status?.fullyLabeledReplicas,
            ),
            DetailsItemModel(
              name: 'Observed Generation',
              values: item.status?.observedGeneration,
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreview(
          resource: resourcePod,
          namespace: item.metadata?.namespace,
          selector: getSelector(item.spec?.selector),
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
                      'sum(kube_replicaset_spec_replicas{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", replicaset="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"})',
                  label: 'Desired',
                ),
                Query(
                  query:
                      'sum(kube_replicaset_status_replicas{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", replicaset="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"})',
                  label: 'Current',
                ),
                Query(
                  query:
                      'sum(kube_replicaset_status_ready_replicas{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", replicaset="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"})',
                  label: 'Ready',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  },
);
