import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/networkpolicylist_networking_v1.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/widgets/resources/helpers/details_item.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_metadata.dart'
    as details_item_metadata;
import 'package:kubenav/widgets/resources/helpers/details_resources_preview.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/resources/resources/resources_events.dart';
import 'package:kubenav/widgets/resources/resources/resources_pods.dart';
import 'package:kubenav/widgets/resources/resources_list.dart';
import 'package:kubenav/widgets/shared/app_prometheus_charts_widget.dart';

final resourceNetworkPolicy = Resource(
  category: ResourceCategories.discoveryandloadbalancing,
  plural: 'NetworkPolicies',
  singular: 'NetworkPolicy',
  description:
      'NetworkPolicies are an application-centric construct which allow you to specify how a pod is allowed to communicate with various network "entities" over the network.',
  path: '/apis/networking.k8s.io/v1',
  resource: 'networkpolicies',
  scope: ResourceScope.namespaced,
  additionalPrinterColumns: [],
  icon: 'networkpolicies',
  template: resourceDefaultTemplate,
  decodeListData: (ResourcesListData data) {
    final parsed = json.decode(data.list);
    final items = NetworkpolicylistNetworkingV1.fromJson(parsed).items;

    return items.map((e) {
      final podSelector = e?.spec?.podSelector?.matchLabels?.entries
          .map((e) => '${e.key}=${e.value}')
          .toList();

      return ResourceItem(
        item: e,
        metrics: null,
        status: podSelector == null || podSelector.isEmpty
            ? ResourceStatus.warning
            : ResourceStatus.success,
      );
    }).toList();
  },
  decodeList: (String data) {
    final parsed = json.decode(data);
    return NetworkpolicylistNetworkingV1.fromJson(parsed).items;
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

        final podSelector = item.spec?.podSelector?.matchLabels?.entries
            .map((e) => '${e.key}=${e.value}')
            .toList();

        return ResourcesListItem(
          name: item.metadata?.name ?? '',
          namespace: item.metadata?.namespace,
          resource: resource,
          item: item,
          status: status,
          details: [
            'Namespace: ${item.metadata?.namespace ?? '-'}',
            'Pod Selector: ${podSelector != null && podSelector.isNotEmpty ? podSelector.join(', ') : '-'}',
            'Age: ${getAge(item.metadata?.creationTimestamp)}',
          ],
        );
      },
  previewItemBuilder: (dynamic listItem) {
    final item = listItem as Item;

    final podSelector = item.spec?.podSelector?.matchLabels?.entries
        .map((e) => '${e.key}=${e.value}')
        .toList();

    return [
      'Namespace: ${item.metadata?.namespace ?? '-'}',
      'Pod Selector: ${podSelector != null && podSelector.isNotEmpty ? podSelector.join(', ') : '-'}',
      'Age: ${getAge(item.metadata?.creationTimestamp)}',
    ];
  },
  detailsItemBuilder:
      (BuildContext context, Resource resource, dynamic detailsItem) {
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
            const SizedBox(height: Constants.spacingMiddle),
            DetailsItem(
              title: 'Configuration',
              details: [
                DetailsItemModel(
                  name: 'Pod Selector',
                  values: item.spec?.podSelector?.matchLabels?.entries
                      .map((e) => '${e.key}=${e.value}')
                      .toList(),
                ),
                DetailsItemModel(
                  name: 'Policy Types',
                  values: item.spec?.policyTypes,
                ),
                DetailsItemModel(
                  name: 'Egress Rules',
                  values: item.spec?.egress?.length,
                ),
                DetailsItemModel(
                  name: 'Ingress Rules',
                  values: item.spec?.ingress?.length,
                ),
              ],
            ),
            const SizedBox(height: Constants.spacingMiddle),
            DetailsResourcesPreview(
              resource: resourcePod,
              namespace: item.metadata?.namespace,
              selector: getSelector(
                Selector(
                  matchLabels: item.spec?.podSelector?.matchLabels,
                  matchExpressions: item.spec?.podSelector?.matchExpressions
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
