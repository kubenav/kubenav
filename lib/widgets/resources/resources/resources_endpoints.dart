import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/endpointslist_v1.dart';
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

final resourceEndpoint = Resource(
  category: ResourceCategories.discoveryandloadbalancing,
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
    final items = EndpointslistV1.fromJson(parsed).items;

    return items.map((e) {
      final ips = e?.subsets
          ?.map(
            (subset) =>
                subset?.addresses?.map((address) => address?.ip).toList(),
          )
          .expand((e) => e!)
          .toList();

      return ResourceItem(
        item: e,
        metrics: null,
        status: ips == null || ips.isEmpty
            ? ResourceStatus.warning
            : ResourceStatus.success,
      );
    }).toList();
  },
  decodeList: (String data) {
    final parsed = json.decode(data);
    return EndpointslistV1.fromJson(parsed).items;
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

        final ips = item.subsets
            ?.map(
              (subset) =>
                  subset?.addresses?.map((address) => address?.ip).toList(),
            )
            .expand((e) => e!)
            .toList();

        return ResourcesListItem(
          name: item.metadata?.name ?? '',
          namespace: item.metadata?.namespace,
          resource: resource,
          item: item,
          status: status,
          details: [
            'Namespace: ${item.metadata?.namespace ?? '-'}',
            'Endpoints: ${ips == null || ips.isEmpty ? '-' : ips.join(', ')}',
            'Age: ${getAge(item.metadata?.creationTimestamp)}',
          ],
        );
      },
  previewItemBuilder: (dynamic listItem) {
    final item = listItem as Item;

    final ips = item.subsets
        ?.map(
          (subset) => subset?.addresses?.map((address) => address?.ip).toList(),
        )
        .expand((e) => e!)
        .toList();

    return [
      'Namespace: ${item.metadata?.namespace ?? '-'}',
      'Endpoints: ${ips == null || ips.isEmpty ? '-' : ips.join(', ')}',
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

List<Widget> _buildSubsets(BuildContext context, Item endpoint) {
  final List<Widget> ruleWidgets = [];

  if (endpoint.subsets != null) {
    for (var i = 0; i < endpoint.subsets!.length; i++) {
      ruleWidgets.add(const SizedBox(height: Constants.spacingMiddle));
      ruleWidgets.add(
        DetailsItem(
          title: 'Subset ${i + 1}',
          details: [
            DetailsItemModel(
              name: 'Addresses',
              values: endpoint.subsets?[i]?.addresses
                  ?.map(
                    (address) =>
                        '${address?.ip}${address?.hostname != null
                            ? ' (${address?.hostname})'
                            : address?.targetRef?.name != null
                            ? ' (${address?.targetRef!.name})'
                            : address?.nodeName != null
                            ? ' (${address?.nodeName})'
                            : ''}',
                  )
                  .toList(),
              onTap: (int index) {
                if (endpoint.subsets?[i]?.addresses?[index]?.targetRef !=
                    null) {
                  goToReference(
                    context,
                    Reference(
                      apiVersion: endpoint
                          .subsets?[i]
                          ?.addresses?[index]
                          ?.targetRef
                          ?.apiVersion,
                      fieldPath: endpoint
                          .subsets?[i]
                          ?.addresses?[index]
                          ?.targetRef
                          ?.fieldPath,
                      kind: endpoint
                          .subsets?[i]
                          ?.addresses?[index]
                          ?.targetRef
                          ?.kind,
                      name: endpoint
                          .subsets?[i]
                          ?.addresses?[index]
                          ?.targetRef
                          ?.name,
                      namespace: endpoint
                          .subsets?[i]
                          ?.addresses?[index]
                          ?.targetRef
                          ?.namespace,
                      resourceVersion: endpoint
                          .subsets?[i]
                          ?.addresses?[index]
                          ?.targetRef
                          ?.resourceVersion,
                      uid: endpoint
                          .subsets?[i]
                          ?.addresses?[index]
                          ?.targetRef
                          ?.uid,
                    ),
                    endpoint.metadata?.namespace,
                  );
                }
              },
            ),
            DetailsItemModel(
              name: 'Ports',
              values: endpoint.subsets?[i]?.ports
                  ?.map(
                    (port) =>
                        '${port?.port}${port?.protocol != null ? '/${port?.protocol}' : ''}${port?.name != null ? ' (${port?.name})' : ''}',
                  )
                  .toList(),
            ),
          ],
        ),
      );
    }
  }

  return ruleWidgets;
}
