import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/ingressclasslist_networking_v1.dart';
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

final resourceIngressClass = Resource(
  category: ResourceCategories.discoveryandloadbalancing,
  plural: 'IngressClasses',
  singular: 'IngressClass',
  description:
      'Ingresses can be implemented by different controllers, often with different configuration. Each Ingress should specify a class, a reference to an IngressClass resource.',
  path: '/apis/networking.k8s.io/v1',
  resource: 'ingressclasses',
  scope: ResourceScope.cluster,
  additionalPrinterColumns: [],
  icon: 'ingresses',
  template: resourceDefaultTemplate,
  decodeListData: (ResourcesListData data) {
    final parsed = json.decode(data.list);
    final items = IngressclasslistNetworkingV1.fromJson(parsed).items;

    return items.map((e) {
      return ResourceItem(
        item: e,
        metrics: null,
        status: ResourceStatus.undefined,
      );
    }).toList();
  },
  decodeList: (String data) {
    final parsed = json.decode(data);
    return IngressclasslistNetworkingV1.fromJson(parsed).items;
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
            'Controller: ${item.spec?.controller ?? '-'}',
            'Parameters: ${item.spec?.parameters != null ? '${item.spec?.parameters?.namespace != null ? '${item.spec?.parameters?.namespace}/' : ''}${item.spec?.parameters?.name}' : '-'}',
            'Age: ${getAge(item.metadata?.creationTimestamp)}',
          ],
        );
      },
  previewItemBuilder: (dynamic listItem) {
    final item = listItem as Item;

    return [
      'Controller: ${item.spec?.controller ?? '-'}',
      'Parameters: ${item.spec?.parameters != null ? '${item.spec?.parameters?.namespace != null ? '${item.spec?.parameters?.namespace}/' : ''}${item.spec?.parameters?.name}' : '-'}',
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
          title: 'Configuration',
          details: [
            DetailsItemModel(name: 'Controller', values: item.spec?.controller),
            DetailsItemModel(
              name: 'Parameters',
              values: item.spec?.parameters == null
                  ? null
                  : '${item.spec?.parameters?.kind} (${item.spec?.parameters?.namespace != null ? '${item.spec?.parameters?.namespace}/' : ''}${item.spec?.parameters?.name})',
              onTap: item.spec?.parameters == null
                  ? null
                  : (int index) {
                      goToReference(
                        context,
                        Reference(
                          apiVersion: item.spec?.parameters?.apiGroup,
                          kind: item.spec?.parameters?.kind,
                          name: item.spec?.parameters?.name,
                          namespace: item.spec?.parameters?.namespace,
                        ),
                        item.spec?.parameters?.namespace,
                      );
                    },
            ),
          ],
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
