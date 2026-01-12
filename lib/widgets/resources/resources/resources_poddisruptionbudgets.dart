import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/poddisruptionbudgetlist_policy_v1.dart';
import 'package:kubenav/models/plugins/prometheus.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/resources.dart' as resources;
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

final resourcePodDisruptionBudget = Resource(
  category: ResourceCategories.configAndStorage,
  plural: 'PodDisruptionBudgets',
  singular: 'PodDisruptionBudget',
  description:
      'PDBs provide a way to limit the number of concurrent disruptions that your application experiences.',
  path: '/apis/policy/v1',
  resource: 'poddisruptionbudgets',
  scope: ResourceScope.namespaced,
  additionalPrinterColumns: [],
  icon: 'poddisruptionbudgets',
  template: resourceDefaultTemplate,
  decodeListData: (ResourcesListData data) {
    final parsed = json.decode(data.list);
    final items = PoddisruptionbudgetlistPolicyV1.fromJson(parsed).items;

    return items
        .map(
          (e) => ResourceItem(
            item: e,
            metrics: null,
            status:
                e!.status!.desiredHealthy == 0 ||
                    e.status!.disruptionsAllowed == 0
                ? ResourceStatus.warning
                : e.status!.currentHealthy < e.status!.desiredHealthy
                ? ResourceStatus.danger
                : ResourceStatus.success,
          ),
        )
        .toList();
  },
  decodeList: (String data) {
    final parsed = json.decode(data);
    return PoddisruptionbudgetlistPolicyV1.fromJson(parsed).items;
  },
  getName: (dynamic item) {
    return (item as Item).metadata?.name ?? '';
  },
  getNamespace: (dynamic item) {
    return (item as Item).metadata?.namespace;
  },
  decodeItem: (String data) {
    final parsed = json.decode(data);
    return Item.fromJson(parsed);
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
        final item = listItem.item as Item;
        final status = listItem.status;

        return ResourcesListItem(
          name: item.metadata?.name ?? '',
          namespace: item.metadata?.namespace,
          resource: resource,
          item: item,
          status: status,
          details: [
            'Namespace: ${item.metadata?.namespace ?? '-'}',
            'Min. Available: ${item.spec?.minAvailable ?? '-'}',
            'Max. Unavailable: ${item.spec?.maxUnavailable ?? '-'}',
            'Allowed Disruptions: ${item.status?.disruptionsAllowed ?? 0}',
            'Age: ${resources.getAge(item.metadata?.creationTimestamp)}',
          ],
        );
      },
  previewItemBuilder: (dynamic listItem) {
    final item = listItem as Item;

    return [
      'Namespace: ${item.metadata?.namespace ?? '-'}',
      'Min. Available: ${item.spec?.minAvailable ?? '-'}',
      'Max. Unavailable: ${item.spec?.maxUnavailable ?? '-'}',
      'Allowed Disruptions: ${item.status?.disruptionsAllowed ?? 0}',
      'Age: ${resources.getAge(item.metadata?.creationTimestamp)}',
    ];
  },
  detailsItemBuilder: (BuildContext context, Resource resource, dynamic detailsItem) {
    final item = detailsItem as Item;

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
              name: 'Selector',
              values: item.spec?.selector?.matchLabels?.entries
                  .map(
                    (matchLabels) => '${matchLabels.key}=${matchLabels.value}',
                  )
                  .toList(),
            ),
            DetailsItemModel(
              name: 'Min. Available',
              values: item.spec?.minAvailable,
            ),
            DetailsItemModel(
              name: 'Max. Unavailable',
              values: item.spec?.maxUnavailable,
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsItem(
          title: 'Status',
          details: [
            DetailsItemModel(
              name: 'Current Healthy',
              values: item.status?.currentHealthy,
            ),
            DetailsItemModel(
              name: 'Desired Healthy',
              values: item.status?.desiredHealthy,
            ),
            DetailsItemModel(
              name: 'Disruptions Allowed',
              values: item.status?.disruptionsAllowed,
            ),
            DetailsItemModel(
              name: 'Expected Pods',
              values: item.status?.expectedPods,
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
          selector: resources.getSelector(
            resources.Selector(
              matchLabels: item.spec?.selector?.matchLabels,
              matchExpressions: item.spec?.selector?.matchExpressions
                  ?.map(
                    (e) => resources.MatchExpression(
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
                      'kube_poddisruptionbudget_status_desired_healthy{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", poddisruptionbudget="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}',
                  label: 'Desired',
                ),
                Query(
                  query:
                      'kube_poddisruptionbudget_status_current_healthy{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", poddisruptionbudget="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}',
                  label: 'Current',
                ),
                Query(
                  query:
                      'kube_poddisruptionbudget_status_pod_disruptions_allowed{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", poddisruptionbudget="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}',
                  label: 'Allowed Disruptions',
                ),
                Query(
                  query:
                      'kube_poddisruptionbudget_status_expected_pods{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", poddisruptionbudget="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}',
                  label: 'Expected',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  },
);
