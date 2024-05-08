import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_apps_v1_deployment.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_apps_v1_deployment_list.dart';
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

final resourceDeployment = Resource(
  category: ResourceCategories.workload,
  plural: 'Deployments',
  singular: 'Deployment',
  description:
      'A Deployment provides declarative updates for Pods and ReplicaSets.',
  path: '/apis/apps/v1',
  resource: 'deployments',
  scope: ResourceScope.namespaced,
  additionalPrinterColumns: [],
  icon: 'deployments',
  template:
      '{"apiVersion":"apps/v1","kind":"Deployment","metadata":{"name":"","namespace":""},"spec":{"replicas":1,"selector":{"matchLabels":{"app":"nginx"}},"template":{"metadata":{"labels":{"app":"nginx"}},"spec":{"containers":[{"name":"nginx","image":"nginx:1.14.2"}]}}}}',
  decodeListData: (ResourcesListData data) {
    final parsed = json.decode(data.list);
    final items = IoK8sApiAppsV1DeploymentList.fromJson(parsed)?.items ?? [];

    return items
        .map(
          (e) => ResourceItem(
            item: e,
            metrics: null,
            status: e.status!.replicas == 0
                ? ResourceStatus.warning
                : e.status!.replicas != e.status!.readyReplicas ||
                        e.status!.replicas != e.status!.updatedReplicas ||
                        e.status!.replicas != e.status!.availableReplicas
                    ? ResourceStatus.danger
                    : ResourceStatus.success,
          ),
        )
        .toList();
  },
  decodeList: (String data) {
    final parsed = json.decode(data);
    return IoK8sApiAppsV1DeploymentList.fromJson(parsed)?.items ?? [];
  },
  getName: (dynamic item) {
    return (item as IoK8sApiAppsV1Deployment).metadata?.name ?? '';
  },
  getNamespace: (dynamic item) {
    return (item as IoK8sApiAppsV1Deployment).metadata?.namespace;
  },
  decodeItem: (String data) {
    final parsed = json.decode(data);
    return IoK8sApiAppsV1Deployment.fromJson(parsed);
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
    final item = listItem.item as IoK8sApiAppsV1Deployment;
    final status = listItem.status;

    return ResourcesListItem(
      name: item.metadata?.name ?? '',
      namespace: item.metadata?.namespace,
      resource: resource,
      item: item,
      status: status,
      details: [
        'Namespace: ${item.metadata?.namespace ?? '-'}',
        'Replicas: ${item.status?.replicas ?? 0}',
        'Ready: ${item.status?.readyReplicas ?? 0}',
        'Updated: ${item.status?.updatedReplicas ?? 0}',
        'Available: ${item.status?.availableReplicas ?? 0}',
        'Age: ${getAge(item.metadata?.creationTimestamp)}',
      ],
    );
  },
  previewItemBuilder: (
    dynamic listItem,
  ) {
    final item = listItem as IoK8sApiAppsV1Deployment;

    return [
      'Namespace: ${item.metadata?.namespace ?? '-'}',
      'Replicas: ${item.status?.replicas ?? 0}',
      'Ready: ${item.status?.readyReplicas ?? 0}',
      'Updated: ${item.status?.updatedReplicas ?? 0}',
      'Available: ${item.status?.availableReplicas ?? 0}',
      'Age: ${getAge(item.metadata?.creationTimestamp)}',
    ];
  },
  detailsItemBuilder: (
    BuildContext context,
    Resource resource,
    dynamic detailsItem,
  ) {
    final item = detailsItem as IoK8sApiAppsV1Deployment;

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
              name: 'Revision History Limit',
              values: item.spec?.revisionHistoryLimit,
            ),
            DetailsItemModel(
              name: 'Progress Deadline Seconds',
              values: item.spec?.progressDeadlineSeconds,
            ),
            DetailsItemModel(
              name: 'Min. Ready Seconds',
              values: item.spec?.minReadySeconds,
            ),
            DetailsItemModel(
              name: 'Update Strategy',
              values: item.spec?.strategy?.type,
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
              name: 'Unavailable Replicas',
              values: item.status?.unavailableReplicas,
            ),
            DetailsItemModel(
              name: 'Updated Replicas',
              values: item.status?.updatedReplicas,
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
                      'kube_deployment_spec_replicas{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", deployment="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}',
                  label: 'Desired',
                ),
                Query(
                  query:
                      'kube_deployment_status_replicas{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", deployment="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}',
                  label: 'Current',
                ),
                Query(
                  query:
                      'kube_deployment_status_replicas_available{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", deployment="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}',
                  label: 'Available',
                ),
                Query(
                  query:
                      'kube_deployment_status_replicas_updated{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", deployment="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}',
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
