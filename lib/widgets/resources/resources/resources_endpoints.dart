import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_endpoints.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_endpoints_list.dart';
import 'package:kubenav/models/plugins/prometheus.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/resources/helpers/details_item.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_metadata.dart';
import 'package:kubenav/widgets/resources/helpers/details_resources_preview.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/resources/resources/resources_events.dart';
import 'package:kubenav/widgets/resources/resources_list.dart';
import 'package:kubenav/widgets/shared/app_prometheus_charts_widget.dart';

final resourceEndpoint = Resource(
  category: ResourceCategory.discoveryandloadbalancing,
  plural: 'Endpoints',
  singular: 'Endpoint',
  description:
      'An Endpoint is an resource that gets IP addresses of one or more pods dynamically assigned to it, along with a port.',
  path: '/api/v1',
  resource: 'endpoints',
  scope: ResourceScope.namespaced,
  additionalPrinterColumns: [],
  icon: 'endpoints',
  template: resourceDefaultTemplate,
  decodeListData: (ResourcesListData data) {
    final parsed = json.decode(data.list);
    final items = IoK8sApiCoreV1EndpointsList.fromJson(parsed)?.items ?? [];

    return items.map((e) {
      final ips = e.subsets
          .map(
            (subset) => subset.addresses.map((address) => address.ip).toList(),
          )
          .expand((e) => e)
          .toList();

      return ResourceItem(
        item: e,
        metrics: null,
        status:
            ips.isNotEmpty ? ResourceStatus.success : ResourceStatus.warning,
      );
    }).toList();
  },
  decodeList: (String data) {
    final parsed = json.decode(data);
    return IoK8sApiCoreV1EndpointsList.fromJson(parsed)?.items ?? [];
  },
  getName: (dynamic item) {
    return (item as IoK8sApiCoreV1Endpoints).metadata?.name ?? '';
  },
  getNamespace: (dynamic item) {
    return (item as IoK8sApiCoreV1Endpoints).metadata?.namespace;
  },
  decodeItem: (String data) {
    final parsed = json.decode(data);
    return IoK8sApiCoreV1Endpoints.fromJson(parsed);
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
    final item = listItem.item as IoK8sApiCoreV1Endpoints;
    final status = listItem.status;

    final ips = item.subsets
        .map((subset) => subset.addresses.map((address) => address.ip).toList())
        .expand((e) => e)
        .toList();

    return ResourcesListItem(
      name: item.metadata?.name ?? '',
      namespace: item.metadata?.namespace,
      resource: resource,
      item: item,
      status: status,
      details: [
        'Namespace: ${item.metadata?.namespace ?? '-'}',
        'Endpoints: ${ips.isNotEmpty ? ips.join(', ') : '-'}',
        'Age: ${getAge(item.metadata?.creationTimestamp)}',
      ],
    );
  },
  previewItemBuilder: (
    dynamic listItem,
  ) {
    final item = listItem as IoK8sApiCoreV1Endpoints;

    final ips = item.subsets
        .map((subset) => subset.addresses.map((address) => address.ip).toList())
        .expand((e) => e)
        .toList();

    return [
      'Namespace: ${item.metadata?.namespace ?? '-'}',
      'Endpoints: ${ips.isNotEmpty ? ips.join(', ') : '-'}',
      'Age: ${getAge(item.metadata?.creationTimestamp)}',
    ];
  },
  detailsItemBuilder: (
    BuildContext context,
    Resource resource,
    dynamic detailsItem,
  ) {
    final item = detailsItem as IoK8sApiCoreV1Endpoints;

    return Column(
      children: [
        DetailsItemMetadata(metadata: item.metadata),
        ..._buildSubsets(context, item),
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
              title: 'Addresses',
              unit: '',
              queries: [
                Query(
                  query:
                      'kube_endpoint_address_available{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", endpoint="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}',
                  label: 'Available',
                ),
                Query(
                  query:
                      'kube_endpoint_address_not_ready{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", endpoint="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}',
                  label: 'Not Ready',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  },
);

List<Widget> _buildSubsets(
  BuildContext context,
  IoK8sApiCoreV1Endpoints endpoint,
) {
  final List<Widget> ruleWidgets = [];

  for (var i = 0; i < endpoint.subsets.length; i++) {
    ruleWidgets.add(
      const SizedBox(height: Constants.spacingMiddle),
    );
    ruleWidgets.add(
      DetailsItem(
        title: 'Subset ${i + 1}',
        details: [
          DetailsItemModel(
            name: 'Addresses',
            values: endpoint.subsets[i].addresses
                .map(
                  (address) =>
                      '${address.ip}${address.hostname != null ? ' (${address.hostname})' : ''}',
                )
                .toList(),
            onTap: (index) {
              showSnackbar(
                context,
                endpoint.subsets[i].addresses[i].ip,
                'Hostname: ${endpoint.subsets[i].addresses[i].hostname ?? '-'}\nNode Name: ${endpoint.subsets[i].addresses[i].nodeName ?? '-'}\nTarget: ${endpoint.subsets[i].addresses[i].targetRef != null ? '${endpoint.subsets[i].addresses[i].targetRef!.kind ?? '-'}/${endpoint.subsets[i].addresses[i].targetRef!.name ?? '-'}' : '-'}',
              );
            },
          ),
          DetailsItemModel(
            name: 'Ports',
            values: endpoint.subsets[i].ports
                .map(
                  (port) =>
                      '${port.port}${port.protocol != null ? '/${port.protocol}' : ''}${port.name != null ? ' (${port.name})' : ''}',
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  return ruleWidgets;
}
