import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_object_reference.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_networking_v1_ingress_class.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_networking_v1_ingress_class_list.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/widgets/resources/helpers/details_item.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_metadata.dart';
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
    final items =
        IoK8sApiNetworkingV1IngressClassList.fromJson(parsed)?.items ?? [];

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
    return IoK8sApiNetworkingV1IngressClassList.fromJson(parsed)?.items ?? [];
  },
  getName: (dynamic item) {
    return (item as IoK8sApiNetworkingV1IngressClass).metadata?.name ?? '';
  },
  getNamespace: (dynamic item) {
    return (item as IoK8sApiNetworkingV1IngressClass).metadata?.namespace;
  },
  decodeItem: (String data) {
    final parsed = json.decode(data);
    return IoK8sApiNetworkingV1IngressClass.fromJson(parsed);
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
    final item = listItem.item as IoK8sApiNetworkingV1IngressClass;
    final status = listItem.status;

    return ResourcesListItem(
      name: item.metadata?.name ?? '',
      namespace: item.metadata?.namespace,
      resource: resource,
      item: item,
      status: status,
      details: [
        'Namespace: ${item.metadata?.namespace ?? '-'}',
        'Controller: ${item.spec?.controller ?? '-'}',
        'Parameters: ${item.spec?.parameters != null ? '${item.spec?.parameters?.namespace != null ? '${item.spec?.parameters?.namespace}/' : ''}${item.spec?.parameters?.name}' : '-'}',
        'Age: ${getAge(item.metadata?.creationTimestamp)}',
      ],
    );
  },
  previewItemBuilder: (
    dynamic listItem,
  ) {
    final item = listItem as IoK8sApiNetworkingV1IngressClass;

    return [
      'Namespace: ${item.metadata?.namespace ?? '-'}',
      'Controller: ${item.spec?.controller ?? '-'}',
      'Parameters: ${item.spec?.parameters != null ? '${item.spec?.parameters?.namespace != null ? '${item.spec?.parameters?.namespace}/' : ''}${item.spec?.parameters?.name}' : '-'}',
      'Age: ${getAge(item.metadata?.creationTimestamp)}',
    ];
  },
  detailsItemBuilder: (
    BuildContext context,
    Resource resource,
    dynamic detailsItem,
  ) {
    final item = detailsItem as IoK8sApiNetworkingV1IngressClass;

    return Column(
      children: [
        DetailsItemMetadata(
          kind: item.kind,
          metadata: item.metadata,
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsItem(
          title: 'Configuration',
          details: [
            DetailsItemModel(
              name: 'Controller',
              values: item.spec?.controller,
            ),
            DetailsItemModel(
              name: 'Parameters',
              values: item.spec?.parameters == null
                  ? null
                  : '${item.spec?.parameters?.kind} (${item.spec?.parameters?.namespace != null ? '${item.spec?.parameters?.namespace}/' : ''}${item.spec?.parameters?.name})',
              onTap: item.spec?.parameters == null
                  ? null
                  : (int index) {
                      final goToFunc = goToReference(
                        context,
                        IoK8sApiCoreV1ObjectReference(
                          apiVersion: item.spec?.parameters?.apiGroup,
                          kind: item.spec?.parameters?.kind,
                          name: item.spec?.parameters?.name,
                          namespace: item.spec?.parameters?.namespace,
                        ),
                        item.spec?.parameters?.namespace,
                      );

                      goToFunc();
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
