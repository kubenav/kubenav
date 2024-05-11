import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_resource_quota.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_resource_quota_list.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_resource_quota_status.dart';
import 'package:kubenav/models/plugins/prometheus.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/widgets/resources/helpers/details_item.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_metadata.dart';
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
    final items = IoK8sApiCoreV1ResourceQuotaList.fromJson(parsed)?.items ?? [];

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
    return IoK8sApiCoreV1ResourceQuotaList.fromJson(parsed)?.items ?? [];
  },
  getName: (dynamic item) {
    return (item as IoK8sApiCoreV1ResourceQuota).metadata?.name ?? '';
  },
  getNamespace: (dynamic item) {
    return (item as IoK8sApiCoreV1ResourceQuota).metadata?.namespace;
  },
  decodeItem: (String data) {
    final parsed = json.decode(data);
    return IoK8sApiCoreV1ResourceQuota.fromJson(parsed);
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
    final item = listItem.item as IoK8sApiCoreV1ResourceQuota;
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
  previewItemBuilder: (
    dynamic listItem,
  ) {
    final item = listItem as IoK8sApiCoreV1ResourceQuota;

    return [
      'Namespace: ${item.metadata?.namespace ?? '-'}',
      'Request: ${_getRequest(item.status)}',
      'Age: ${getAge(item.metadata?.creationTimestamp)}',
    ];
  },
  detailsItemBuilder: (
    BuildContext context,
    Resource resource,
    dynamic detailsItem,
  ) {
    final item = detailsItem as IoK8sApiCoreV1ResourceQuota;

    return Column(
      children: [
        DetailsItemMetadata(
          kind: item.kind,
          metadata: item.metadata,
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsItem(
          title: 'Request',
          details: item.status?.hard.keys.map((key) {
                return DetailsItemModel(
                  name: key,
                  values:
                      '${item.status!.used.containsKey(key) ? item.status?.used[key] : '-'}/${item.status?.hard[key]}',
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
          defaultCharts: [
            Chart(
              title: 'Quotas',
              unit: '',
              queries: [
                Query(
                  query:
                      'sum(kube_resourcequota{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", resourcequota="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}) by (resource, type)',
                  label: '{{ .resource }} - {{ .type }}',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  },
);

/// [_getRequest] returns a formated string with the set quota and the used
/// quota, which can be used in the list and preview items.
String _getRequest(IoK8sApiCoreV1ResourceQuotaStatus? status) {
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
