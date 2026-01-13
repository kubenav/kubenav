import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/schema.models.swagger.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/widgets/resources/helpers/details_item.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_metadata.dart';
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
    final items = IoK8sApiNetworkingV1NetworkPolicyList.fromJson(parsed).items;

    return items.map((e) {
      final podSelector = e.spec?.podSelector?.matchLabels?.entries
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
    return IoK8sApiNetworkingV1NetworkPolicyList.fromJson(parsed).items;
  },
  getName: (dynamic item) {
    return (item as IoK8sApiNetworkingV1NetworkPolicy).metadata?.name ?? '';
  },
  getNamespace: (dynamic item) {
    return (item as IoK8sApiNetworkingV1NetworkPolicy).metadata?.namespace;
  },
  decodeItem: (String data) {
    final parsed = json.decode(data);
    return IoK8sApiNetworkingV1NetworkPolicy.fromJson(parsed);
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
        final item = listItem.item as IoK8sApiNetworkingV1NetworkPolicy;
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
    final item = listItem as IoK8sApiNetworkingV1NetworkPolicy;

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
        final item = detailsItem as IoK8sApiNetworkingV1NetworkPolicy;

        return Column(
          children: [
            DetailsItemMetadata(kind: item.kind, metadata: item.metadata),
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
                  values: item.spec?.policyTypes?.map((e) => e.value).toList(),
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
              selector: getSelector(item.spec?.podSelector),
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
