import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/schema.models.swagger.dart';
import 'package:kubenav/models/plugins/prometheus.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/widgets/resources/helpers/details_item.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_conditions.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_metadata.dart';
import 'package:kubenav/widgets/resources/helpers/details_resources_preview.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/resources/resources/resources_events.dart';
import 'package:kubenav/widgets/resources/resources_list.dart';
import 'package:kubenav/widgets/shared/app_prometheus_charts_widget.dart';

final resourceHorizontalPodAutoscaler = Resource(
  category: ResourceCategories.discoveryandloadbalancing,
  plural: 'HorizontalPodAutoscalers',
  singular: 'HorizontalPodAutoscaler',
  description:
      'A HorizontalPodAutoscaler automatically updates a workload resource, with the aim of automatically scaling the workload to match demand.',
  path: '/apis/autoscaling/v2',
  resource: 'horizontalpodautoscalers',
  scope: ResourceScope.namespaced,
  additionalPrinterColumns: [],
  icon: 'horizontalpodautoscalers',
  template: resourceDefaultTemplate,
  decodeListData: (ResourcesListData data) {
    final parsed = json.decode(data.list);
    final items = IoK8sApiAutoscalingV2HorizontalPodAutoscalerList.fromJson(
      parsed,
    ).items;

    return items.map((e) {
      final currentReplicas = e.status!.currentReplicas ?? 0;
      final desiredReplicas = e.status!.desiredReplicas;
      final maxReplicas = e.spec?.maxReplicas ?? 0;
      final minReplicas = e.spec?.minReplicas ?? 0;

      return ResourceItem(
        item: e,
        metrics: null,
        status:
            currentReplicas == maxReplicas || currentReplicas != desiredReplicas
            ? ResourceStatus.warning
            : currentReplicas < minReplicas || currentReplicas > maxReplicas
            ? ResourceStatus.danger
            : ResourceStatus.success,
      );
    }).toList();
  },
  decodeList: (String data) {
    final parsed = json.decode(data);
    return IoK8sApiAutoscalingV2HorizontalPodAutoscalerList.fromJson(
      parsed,
    ).items;
  },
  getName: (dynamic item) {
    return (item as IoK8sApiAutoscalingV2HorizontalPodAutoscaler)
            .metadata
            ?.name ??
        '';
  },
  getNamespace: (dynamic item) {
    return (item as IoK8sApiAutoscalingV2HorizontalPodAutoscaler)
        .metadata
        ?.namespace;
  },
  decodeItem: (String data) {
    final parsed = json.decode(data);
    return IoK8sApiAutoscalingV2HorizontalPodAutoscaler.fromJson(parsed);
  },
  encodeItem: (dynamic item) {
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    return encoder.convert(item);
  },
  toJson: (dynamic item) {
    return json.decode(json.encode(item));
  },
  listItemBuilder: (BuildContext context, Resource resource, ResourceItem listItem) {
    final item = listItem.item as IoK8sApiAutoscalingV2HorizontalPodAutoscaler;
    final status = listItem.status;

    return ResourcesListItem(
      name: item.metadata?.name ?? '',
      namespace: item.metadata?.namespace,
      resource: resource,
      item: item,
      status: status,
      details: [
        'Namespace: ${item.metadata?.namespace ?? '-'}',
        'Reference: ${item.spec?.scaleTargetRef.kind ?? '-'}/${item.spec?.scaleTargetRef.name ?? '-'}',
        'Replicas: ${item.status?.currentReplicas ?? 0}/${item.status?.desiredReplicas}',
        'Min. Pods: ${item.spec?.minReplicas ?? 0}',
        'Max. Pods: ${item.spec?.maxReplicas ?? 0}',
        'Age: ${getAge(item.metadata?.creationTimestamp)}',
      ],
    );
  },
  previewItemBuilder: (dynamic listItem) {
    final item = listItem as IoK8sApiAutoscalingV2HorizontalPodAutoscaler;

    return [
      'Namespace: ${item.metadata?.namespace ?? '-'}',
      'Reference: ${item.spec?.scaleTargetRef.kind ?? '-'}/${item.spec?.scaleTargetRef.name ?? '-'}',
      'Replicas: ${item.status?.currentReplicas ?? 0}/${item.status?.desiredReplicas}',
      'Min. Pods: ${item.spec?.minReplicas ?? 0}',
      'Max. Pods: ${item.spec?.maxReplicas ?? 0}',
      'Age: ${getAge(item.metadata?.creationTimestamp)}',
    ];
  },
  detailsItemBuilder: (BuildContext context, Resource resource, dynamic detailsItem) {
    final item = detailsItem as IoK8sApiAutoscalingV2HorizontalPodAutoscaler;

    return Column(
      children: [
        DetailsItemMetadata(kind: item.kind, metadata: item.metadata),
        DetailsItemConditions(
          conditions: item.status?.conditions
              ?.map(
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
              name: 'Min. Replicas',
              values: item.spec?.minReplicas,
            ),
            DetailsItemModel(
              name: 'Max. Replicas',
              values: item.spec?.maxReplicas,
            ),
            DetailsItemModel(
              name: 'Reference',
              values:
                  '${item.spec?.scaleTargetRef.kind ?? '-'}/${item.spec?.scaleTargetRef.name ?? '-'}',
              onTap: (int index) {
                goToReference(
                  context,
                  IoK8sApimachineryPkgApisMetaV1OwnerReference(
                    apiVersion: item.spec?.scaleTargetRef.apiVersion ?? '',
                    kind: item.spec?.scaleTargetRef.kind ?? '',
                    name: item.spec?.scaleTargetRef.name ?? '',
                    uid: '',
                  ),
                  item.metadata?.namespace,
                );
              },
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsItem(
          title: 'Status',
          details: [
            DetailsItemModel(
              name: 'Desired Replicas',
              values: item.status?.desiredReplicas,
            ),
            DetailsItemModel(
              name: 'Current Replicas',
              values: item.status?.currentReplicas,
            ),
            DetailsItemModel(
              name: 'Last Scale Time',
              values: formatTime(item.status?.lastScaleTime),
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        ..._buildReference(item),
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
                      'kube_horizontalpodautoscaler_status_desired_replicas{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", horizontalpodautoscaler="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}',
                  label: 'Desired',
                ),
                Query(
                  query:
                      'kube_horizontalpodautoscaler_status_current_replicas{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", horizontalpodautoscaler="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}',
                  label: 'Current',
                ),
                Query(
                  query:
                      'kube_horizontalpodautoscaler_spec_min_replicas{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", horizontalpodautoscaler="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}',
                  label: 'Min',
                ),
                Query(
                  query:
                      'kube_horizontalpodautoscaler_spec_max_replicas{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", horizontalpodautoscaler="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}',
                  label: 'Max',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  },
);

List<Widget> _buildReference(IoK8sApiAutoscalingV2HorizontalPodAutoscaler hpa) {
  if (hpa.spec!.scaleTargetRef.kind != 'Deployment' &&
      hpa.spec!.scaleTargetRef.kind != 'StatefulSet') {
    return [Container()];
  }

  return [
    DetailsResourcesPreview(
      resource: kindToResource[hpa.spec!.scaleTargetRef.kind]!,
      namespace: hpa.metadata?.namespace,
      selector: 'fieldSelector=metadata.name=${hpa.spec!.scaleTargetRef.name}',
      filter: null,
    ),
    const SizedBox(height: Constants.spacingMiddle),
  ];
}
