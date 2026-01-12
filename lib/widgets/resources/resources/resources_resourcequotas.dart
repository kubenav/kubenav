import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/resourcequotalist_v1.dart';
import 'package:kubenav/models/plugins/prometheus.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/widgets/resources/helpers/details_item.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_metadata.dart'
    as details_item_metadata;
import 'package:kubenav/widgets/resources/helpers/details_resources_preview.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/resources/resources/resources_events.dart';
import 'package:kubenav/widgets/resources/resources_list.dart';
import 'package:kubenav/widgets/shared/app_prometheus_charts_widget.dart';

final resourceResourceQuota = Resource(
  category: ResourceCategories.configAndStorage,
  plural: 'ResourceQuotas',
  singular: 'ResourceQuota',
  description:
      'Resource quotas are used to allocate and limit compute resources for individual namespaces within a cluster.',
  path: '/api/v1',
  resource: 'resourcequotas',
  scope: ResourceScope.namespaced,
  additionalPrinterColumns: [],
  icon: 'resourcequotas',
  template: resourceDefaultTemplate,
  decodeListData: (ResourcesListData data) {
    final parsed = json.decode(data.list);
    final items = ResourcequotalistV1.fromJson(parsed).items;

    return items
        .map(
          (e) => ResourceItem(
            item: e,
            metrics: null,
            status: ResourceStatus.undefined,
          ),
        )
        .toList();
  },
  decodeList: (String data) {
    final parsed = json.decode(data);
    return ResourcequotalistV1.fromJson(parsed).items;
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
            'Request: ${_getRequest(item.status)}',
            'Age: ${getAge(item.metadata?.creationTimestamp)}',
          ],
        );
      },
  previewItemBuilder: (dynamic listItem) {
    final item = listItem as Item;

    return [
      'Namespace: ${item.metadata?.namespace ?? '-'}',
      'Request: ${_getRequest(item.status)}',
      'Age: ${getAge(item.metadata?.creationTimestamp)}',
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
        const SizedBox(height: Constants.spacingMiddle),
        DetailsItem(
          title: 'Request',
          details:
              item.status?.hard?.keys.map((key) {
                return DetailsItemModel(
                  name: key,
                  values:
                      '${item.status?.used != null && item.status!.used!.containsKey(key) ? item.status?.used![key] : '-'}/${item.status?.hard![key]}',
                );
              }).toList() ??
              [],
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
          defaultCharts:
              item.status?.hard?.keys
                  .map(
                    (e) => Chart(
                      title: e,
                      unit: '',
                      queries: [
                        Query(
                          query:
                              'sum(kube_resourcequota{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", resourcequota="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}", resource="$e"}) by (resource, type)',
                          label: '{{ .type }}',
                        ),
                      ],
                    ),
                  )
                  .toList() ??
              [],
        ),
      ],
    );
  },
);

/// [_getRequest] returns a formated string with the set quota and the used
/// quota, which can be used in the list and preview items.
String _getRequest(Status? status) {
  final hard = status?.hard ?? {};
  final used = status?.used ?? {};

  if (hard.keys.isEmpty) {
    return '';
  }

  return hard.keys
      .map(
        (key) =>
            '$key: ${used.containsKey(key) ? used[key] : '-'}/${hard[key]}',
      )
      .join(', ');
}
