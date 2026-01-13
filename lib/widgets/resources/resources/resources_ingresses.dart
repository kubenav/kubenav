import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/schema.models.swagger.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/navigate.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/widgets/resources/helpers/details_item.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_metadata.dart';
import 'package:kubenav/widgets/resources/helpers/details_resources_preview.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/resources/resources/resources_events.dart';
import 'package:kubenav/widgets/resources/resources/resources_ingressclasses.dart';
import 'package:kubenav/widgets/resources/resources_details.dart';
import 'package:kubenav/widgets/resources/resources_list.dart';
import 'package:kubenav/widgets/shared/app_prometheus_charts_widget.dart';

final resourceIngress = Resource(
  category: ResourceCategories.discoveryandloadbalancing,
  plural: 'Ingresses',
  singular: 'Ingress',
  description:
      'An API object that manages external access to the services in a cluster, typically HTTP.',
  path: '/apis/networking.k8s.io/v1',
  resource: 'ingresses',
  scope: ResourceScope.namespaced,
  additionalPrinterColumns: [],
  icon: 'ingresses',
  template: resourceDefaultTemplate,
  decodeListData: (ResourcesListData data) {
    final parsed = json.decode(data.list);
    final items = IoK8sApiNetworkingV1IngressList.fromJson(parsed).items;

    return items.map((e) {
      final hosts = e.spec?.rules?.map((rule) => rule.host).toList();
      final address = e.status?.loadBalancer?.ingress
          ?.where((e) => e.ip != null)
          .map((e) => e.ip)
          .toList();

      return ResourceItem(
        item: e,
        metrics: null,
        status:
            hosts == null || hosts.isEmpty || address == null || address.isEmpty
            ? ResourceStatus.warning
            : ResourceStatus.success,
      );
    }).toList();
  },
  decodeList: (String data) {
    final parsed = json.decode(data);
    return IoK8sApiNetworkingV1IngressList.fromJson(parsed).items;
  },
  getName: (dynamic item) {
    return (item as IoK8sApiNetworkingV1Ingress).metadata?.name ?? '';
  },
  getNamespace: (dynamic item) {
    return (item as IoK8sApiNetworkingV1Ingress).metadata?.namespace;
  },
  decodeItem: (String data) {
    final parsed = json.decode(data);
    return IoK8sApiNetworkingV1Ingress.fromJson(parsed);
  },
  encodeItem: (dynamic item) {
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    return encoder.convert(item);
  },
  toJson: (dynamic item) {
    return json.decode(json.encode(item));
  },
  listItemBuilder: (BuildContext context, Resource resource, ResourceItem listItem) {
    final item = listItem.item as IoK8sApiNetworkingV1Ingress;
    final status = listItem.status;

    final hosts = item.spec?.rules?.map((rule) => rule.host).toList();
    final address = item.status?.loadBalancer?.ingress
        ?.where((e) => e.ip != null)
        .map((e) => e.ip)
        .toList();

    return ResourcesListItem(
      name: item.metadata?.name ?? '',
      namespace: item.metadata?.namespace,
      resource: resource,
      item: item,
      status: status,
      details: [
        'Namespace: ${item.metadata?.namespace ?? '-'}',
        'Hosts: ${hosts != null && hosts.isNotEmpty ? hosts.join(', ') : '-'}',
        'Address: ${address != null && address.isNotEmpty ? address.join(', ') : '-'}',
        'Age: ${getAge(item.metadata?.creationTimestamp)}',
      ],
    );
  },
  previewItemBuilder: (dynamic listItem) {
    final item = listItem as IoK8sApiNetworkingV1Ingress;

    final hosts = item.spec?.rules?.map((rule) => rule.host).toList();
    final address = item.status?.loadBalancer?.ingress
        ?.where((e) => e.ip != null)
        .map((e) => e.ip)
        .toList();

    return [
      'Namespace: ${item.metadata?.namespace ?? '-'}',
      'Hosts: ${hosts != null && hosts.isNotEmpty ? hosts.join(', ') : '-'}',
      'Address: ${address != null && address.isNotEmpty ? address.join(', ') : '-'}',
      'Age: ${getAge(item.metadata?.creationTimestamp)}',
    ];
  },
  detailsItemBuilder:
      (BuildContext context, Resource resource, dynamic detailsItem) {
        final item = detailsItem as IoK8sApiNetworkingV1Ingress;

        return Column(
          children: [
            DetailsItemMetadata(kind: item.kind, metadata: item.metadata),
            const SizedBox(height: Constants.spacingMiddle),
            DetailsItem(
              title: 'Configuration',
              details: [
                DetailsItemModel(
                  name: 'Default Backend',
                  values: item.spec?.defaultBackend?.service?.name,
                ),
                DetailsItemModel(
                  name: 'Ingress Class',
                  values: item.spec?.ingressClassName,
                  onTap: item.spec?.ingressClassName == null
                      ? null
                      : (int index) {
                          navigate(
                            context,
                            ResourcesDetails(
                              name: item.spec!.ingressClassName!,
                              namespace: null,
                              resource: resourceIngressClass,
                            ),
                          );
                        },
                ),
                DetailsItemModel(
                  name: 'Address',
                  values: item.status?.loadBalancer?.ingress
                      ?.where((e) => e.ip != null)
                      .map((e) => e.ip ?? '-')
                      .toList(),
                ),
              ],
            ),
            ..._buildRules(item),
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

List<Widget> _buildRules(IoK8sApiNetworkingV1Ingress ingress) {
  if (ingress.spec?.rules == null || ingress.spec!.rules!.isEmpty) {
    return [Container()];
  }

  final List<Widget> ruleWidgets = [];

  for (var i = 0; i < ingress.spec!.rules!.length; i++) {
    ruleWidgets.add(const SizedBox(height: Constants.spacingMiddle));
    ruleWidgets.add(
      DetailsItem(
        title: 'Rule ${i + 1}',
        details: [
          DetailsItemModel(name: 'Host', values: ingress.spec!.rules![i].host),
          DetailsItemModel(
            name: 'Paths',
            values: ingress.spec!.rules![i].http?.paths
                .map((e) => e.path ?? '-')
                .toList(),
          ),
          DetailsItemModel(
            name: 'Backend',
            values: ingress.spec!.rules![i].http?.paths
                .map((e) => e.backend.service?.name ?? '-')
                .toList(),
          ),
        ],
      ),
    );
  }

  return ruleWidgets;
}
