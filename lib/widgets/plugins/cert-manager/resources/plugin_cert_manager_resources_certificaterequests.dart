import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/certificaterequestlist_cert_manager_v1.dart';
import 'package:kubenav/models/kubernetes/orderlist_acme_v1.dart' as orderlist;
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/navigate.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/widgets/plugins/cert-manager/resources/plugin_cert_manager_resources.dart';
import 'package:kubenav/widgets/plugins/cert-manager/resources/plugin_cert_manager_resources_clusterissuers.dart';
import 'package:kubenav/widgets/plugins/cert-manager/resources/plugin_cert_manager_resources_issuers.dart';
import 'package:kubenav/widgets/plugins/cert-manager/resources/plugin_cert_manager_resources_orders.dart';
import 'package:kubenav/widgets/resources/helpers/details_item.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_conditions.dart'
    as details_item_conditions;
import 'package:kubenav/widgets/resources/helpers/details_item_metadata.dart'
    as details_item_metadata;
import 'package:kubenav/widgets/resources/helpers/details_resources_preview.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/resources/resources/resources_events.dart';
import 'package:kubenav/widgets/resources/resources_details.dart';
import 'package:kubenav/widgets/resources/resources_list.dart';

final Resource certManagerResourceCertificateRequest = Resource(
  category: CertManagerResourceCategories.certificates,
  plural: 'CertificateRequests',
  singular: 'CertificateRequest',
  description:
      'A CertificateRequest is used to request a signed certificate from one of the configured issuers',
  path: '/apis/cert-manager.io/v1',
  resource: 'certificaterequests',
  scope: ResourceScope.namespaced,
  additionalPrinterColumns: [],
  icon: 'cert-manager',
  template: resourceDefaultTemplate,
  decodeListData: (ResourcesListData data) {
    final parsed = json.decode(data.list);
    final items = CertificaterequestlistCertManagerV1.fromJson(parsed).items;

    return items.map((e) {
      final ready =
          e!.status?.conditions != null && e.status!.conditions!.isNotEmpty
          ? e.status!.conditions!
                .where((e) => e!.type == 'Ready')
                .firstOrNull
                ?.status
                .name
          : 'Unknown';
      final approved =
          e.status?.conditions != null && e.status!.conditions!.isNotEmpty
          ? e.status!.conditions!
                .where((e) => e!.type == 'Approved')
                .firstOrNull
                ?.status
                .name
          : 'Unknown';
      final denied =
          e.status?.conditions != null && e.status!.conditions!.isNotEmpty
          ? e.status!.conditions!
                .where((e) => e!.type == 'Denied')
                .firstOrNull
                ?.status
                .name
          : 'Unknown';

      return ResourceItem(
        item: e,
        metrics: null,
        status: ready == 'True'
            ? ResourceStatus.success
            : approved == 'True'
            ? ResourceStatus.warning
            : ready == 'False' || denied == 'True'
            ? ResourceStatus.danger
            : ResourceStatus.warning,
      );
    }).toList();
  },
  decodeList: (String data) {
    final parsed = json.decode(data);
    return CertificaterequestlistCertManagerV1.fromJson(parsed).items;
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
  listItemBuilder: (BuildContext context, Resource resource, ResourceItem listItem) {
    final item = listItem.item as Item;
    final status = listItem.status;

    return ResourcesListItem(
      name: item.metadata?.name ?? '',
      namespace: item.metadata?.namespace ?? '',
      resource: resource,
      item: item,
      status: status,
      details: [
        'Namespace: ${item.metadata?.namespace ?? '-'}',
        'Approved: ${item.status?.conditions != null && item.status!.conditions!.isNotEmpty ? (item.status!.conditions!.where((e) => e!.type == 'Approved').firstOrNull?.status ?? '-') : '-'}',
        'Denied: ${item.status?.conditions != null && item.status!.conditions!.isNotEmpty ? (item.status!.conditions!.where((e) => e!.type == 'Denied').firstOrNull?.status ?? '-') : '-'}',
        'Ready: ${item.status?.conditions != null && item.status!.conditions!.isNotEmpty ? (item.status!.conditions!.where((e) => e!.type == 'Ready').firstOrNull?.status ?? '-') : '-'}',
        'Issuer: ${item.spec?.issuerRef.name ?? '-'}',
        'Requestor: ${item.spec?.username ?? '-'}',
        'Age: ${getAge(item.metadata?.creationTimestamp)}',
      ],
    );
  },
  previewItemBuilder: (dynamic listItem) {
    final item = listItem as Item;

    return [
      'Namespace: ${item.metadata?.namespace ?? '-'}',
      'Approved: ${item.status?.conditions != null && item.status!.conditions!.isNotEmpty ? (item.status!.conditions!.where((e) => e!.type == 'Approved').firstOrNull?.status ?? '-') : '-'}',
      'Denied: ${item.status?.conditions != null && item.status!.conditions!.isNotEmpty ? (item.status!.conditions!.where((e) => e!.type == 'Denied').firstOrNull?.status ?? '-') : '-'}',
      'Ready: ${item.status?.conditions != null && item.status!.conditions!.isNotEmpty ? (item.status!.conditions!.where((e) => e!.type == 'Ready').firstOrNull?.status ?? '-') : '-'}',
      'Issuer: ${item.spec?.issuerRef.name ?? '-'}',
      'Requestor: ${item.spec?.username ?? '-'}',
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
        details_item_conditions.DetailsItemConditions(
          conditions: item.status?.conditions
              ?.map(
                (condition) => details_item_conditions.Condition(
                  type: condition?.type ?? '',
                  status: condition?.status.name ?? '',
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
            DetailsItemModel(name: 'Requestor', values: item.spec?.username),
            DetailsItemModel(
              name: 'Issuer',
              values: item.spec?.issuerRef == null
                  ? null
                  : '${item.spec!.issuerRef.kind} (${item.spec!.issuerRef.name})',
              onTap: item.spec?.issuerRef == null
                  ? null
                  : (index) {
                      navigate(
                        context,
                        ResourcesDetails(
                          name: item.spec!.issuerRef.name,
                          namespace:
                              item.spec!.issuerRef.kind == 'ClusterIssuer'
                              ? null
                              : item.metadata?.namespace,
                          resource: item.spec!.issuerRef.kind == 'ClusterIssuer'
                              ? certManagerResourceClusterIssuer
                              : certManagerResourceIssuer,
                        ),
                      );
                    },
            ),
            DetailsItemModel(name: 'Groups', values: item.spec?.groups),
            DetailsItemModel(name: 'Request', values: item.spec?.request),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsItem(
          title: 'Status',
          details: [
            DetailsItemModel(
              name: 'Approved',
              values:
                  item.status?.conditions != null &&
                      item.status!.conditions!.isNotEmpty
                  ? item.status!.conditions!
                        .where((e) => e!.type == 'Approved')
                        .first
                        ?.status
                  : null,
            ),
            DetailsItemModel(
              name: 'Denied',
              values:
                  item.status?.conditions != null &&
                      item.status!.conditions!.isNotEmpty
                  ? item.status!.conditions!
                        .where((e) => e!.type == 'Denied')
                        .firstOrNull
                        ?.status
                  : null,
            ),
            DetailsItemModel(
              name: 'Ready',
              values:
                  item.status?.conditions != null &&
                      item.status!.conditions!.isNotEmpty
                  ? item.status!.conditions!
                        .where((e) => e!.type == 'Ready')
                        .firstOrNull
                        ?.status
                  : null,
            ),
            DetailsItemModel(
              name: 'Status',
              values:
                  item.status?.conditions != null &&
                      item.status!.conditions!.isNotEmpty
                  ? item.status!.conditions!
                        .where((e) => e!.type == 'Ready')
                        .firstOrNull
                        ?.message
                  : null,
            ),
            DetailsItemModel(
              name: 'Certificate',
              values: item.status?.certificate,
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreview(
          resource: certManagerResourceOrder,
          namespace: item.metadata?.namespace,
          selector: '',
          filter: (List<dynamic> previewItems) {
            final orders = previewItems as List<orderlist.Item>;

            return orders
                .where(
                  (order) =>
                      order.metadata.ownerReferences != null &&
                      order.metadata.ownerReferences!.length == 1 &&
                      order.metadata.ownerReferences![0]?.name ==
                          item.metadata?.name,
                )
                .toList();
          },
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
      ],
    );
  },
);
