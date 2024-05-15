import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_apimachinery_pkg_apis_meta_v1_condition.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_issuer.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_issuer_list.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/widgets/plugins/cert-manager/resources/plugin_cert_manager_resources.dart';
import 'package:kubenav/widgets/plugins/cert-manager/resources/plugin_cert_manager_resources_clusterissuers.dart';
import 'package:kubenav/widgets/resources/helpers/details_item.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_conditions.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_metadata.dart';
import 'package:kubenav/widgets/resources/helpers/details_resources_preview.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/resources/resources/resources_events.dart';
import 'package:kubenav/widgets/resources/resources_list.dart';

final Resource certManagerResourceIssuer = Resource(
  category: CertManagerResourceCategories.certificates,
  plural: 'Issuers',
  singular: 'Issuer',
  description:
      'An Issuer represents a certificate issuing authority which can be referenced as part of issuerRef fields',
  path: '/apis/cert-manager.io/v1',
  resource: 'issuers',
  scope: ResourceScope.namespaced,
  additionalPrinterColumns: [],
  icon: 'cert-manager',
  template: resourceDefaultTemplate,
  decodeListData: (ResourcesListData data) {
    final parsed = json.decode(data.list);
    final items = IoCertManagerV1IssuerList.fromJson(parsed)?.items ?? [];

    return items.map(
      (e) {
        final status =
            e.status?.conditions != null && e.status!.conditions.isNotEmpty
                ? e.status!.conditions
                    .where((e) => e.type == 'Ready')
                    .firstOrNull
                    ?.status
                    .value
                : 'Unknown';

        return ResourceItem(
          item: e,
          metrics: null,
          status: status == 'True'
              ? ResourceStatus.success
              : status == 'False'
                  ? ResourceStatus.danger
                  : ResourceStatus.warning,
        );
      },
    ).toList();
  },
  decodeList: (String data) {
    final parsed = json.decode(data);
    return IoCertManagerV1IssuerList.fromJson(parsed)?.items ?? [];
  },
  getName: (dynamic item) {
    return (item as IoCertManagerV1Issuer).metadata?.name ?? '';
  },
  getNamespace: (dynamic item) {
    return (item as IoCertManagerV1Issuer).metadata?.namespace;
  },
  decodeItem: (String data) {
    final parsed = json.decode(data);
    return IoCertManagerV1Issuer.fromJson(parsed);
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
    final item = listItem.item as IoCertManagerV1Issuer;
    final status = listItem.status;

    return ResourcesListItem(
      name: item.metadata?.name ?? '',
      namespace: item.metadata?.namespace ?? '',
      resource: resource,
      item: item,
      status: status,
      details: [
        'Namespace: ${item.metadata?.namespace ?? '-'}',
        'Ready: ${item.status?.conditions != null && item.status!.conditions.isNotEmpty ? (item.status!.conditions.where((e) => e.type == 'Ready').firstOrNull?.status ?? '-') : '-'}',
        'Age: ${getAge(item.metadata?.creationTimestamp)}',
      ],
    );
  },
  previewItemBuilder: (
    dynamic listItem,
  ) {
    final item = listItem as IoCertManagerV1Issuer;

    return [
      'Namespace: ${item.metadata?.namespace ?? '-'}',
      'Ready: ${item.status?.conditions != null && item.status!.conditions.isNotEmpty ? (item.status!.conditions.where((e) => e.type == 'Ready').firstOrNull?.status ?? '-') : '-'}',
      'Age: ${getAge(item.metadata?.creationTimestamp)}',
    ];
  },
  detailsItemBuilder: (
    BuildContext context,
    Resource resource,
    dynamic detailsItem,
  ) {
    final item = detailsItem as IoCertManagerV1Issuer;

    return Column(
      children: [
        DetailsItemMetadata(
          kind: item.kind,
          metadata: item.metadata,
        ),
        DetailsItemConditions(
          conditions: item.status?.conditions
              .map(
                (e) => IoK8sApimachineryPkgApisMetaV1Condition(
                  lastTransitionTime: e.lastTransitionTime ?? DateTime.now(),
                  message: e.message ?? '',
                  observedGeneration: e.observedGeneration,
                  reason: e.reason ?? '',
                  status: e.status.value,
                  type: e.type,
                ),
              )
              .toList(),
        ),
        const SizedBox(height: Constants.spacingMiddle),
        buildACME(
          context,
          item.metadata?.namespace ?? 'cert-manager',
          item.spec.acme,
        ),
        buildCA(
          context,
          item.metadata?.namespace ?? 'cert-manager',
          item.spec.ca,
        ),
        buildSelfSigned(
          context,
          item.metadata?.namespace ?? 'cert-manager',
          item.spec.selfSigned,
        ),
        buildVault(
          context,
          item.metadata?.namespace ?? 'cert-manager',
          item.spec.vault,
        ),
        buildVenafi(
          context,
          item.metadata?.namespace ?? 'cert-manager',
          item.spec.venafi,
        ),
        DetailsItem(
          title: 'Status',
          details: [
            DetailsItemModel(
              name: 'Ready',
              values: item.status?.conditions != null &&
                      item.status!.conditions.isNotEmpty
                  ? item.status!.conditions
                      .where((e) => e.type == 'Ready')
                      .firstOrNull
                      ?.status
                  : null,
            ),
            DetailsItemModel(
              name: 'ACME Uri',
              values: item.status?.acme?.uri,
            ),
            DetailsItemModel(
              name: 'ACME Last Registered Email',
              values: item.status?.acme?.lastRegisteredEmail,
            ),
            DetailsItemModel(
              name: 'ACME Last Private Key Hash',
              values: item.status?.acme?.lastPrivateKeyHash,
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
      ],
    );
  },
);
