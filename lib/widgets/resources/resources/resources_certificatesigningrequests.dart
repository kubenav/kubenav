import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:kubenav/widgets/resources/helpers/details_item_conditions.dart'
    as details_item_conditions;
import 'package:kubenav/widgets/resources/helpers/details_item_metadata.dart'
    as details_item_metadata;
import 'package:kubenav/models/kubernetes/certificatesigningrequestlist_certificates_v1.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/widgets/resources/helpers/details_item.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/resources/resources_list.dart';
import 'package:kubenav/widgets/shared/app_prometheus_charts_widget.dart';

final resourceCertificateSigningRequest = Resource(
  category: ResourceCategories.cluster,
  plural: 'CertificateSigningRequests',
  singular: 'CertificateSigningRequest',
  description:
      'A CertificateSigningRequest (CSR) resource is used to request that a certificate be signed by a denoted signer, after which the request may be approved or denied before finally being signed.',
  path: '/apis/certificates.k8s.io/v1',
  resource: 'certificatesigningrequests',
  scope: ResourceScope.cluster,
  additionalPrinterColumns: [],
  icon: 'certificatesigningrequests',
  template: resourceDefaultTemplate,
  decodeListData: (ResourcesListData data) {
    final parsed = json.decode(data.list);
    final items = CertificatesigningrequestlistCertificatesV1.fromJson(
      parsed,
    ).items;

    return items.map((e) {
      final condition = _getCondition(e?.status?.conditions);

      return ResourceItem(
        item: e,
        metrics: null,
        status: condition == 'Approved'
            ? ResourceStatus.success
            : condition == 'Pending'
            ? ResourceStatus.warning
            : ResourceStatus.danger,
      );
    }).toList();
  },
  decodeList: (String data) {
    final parsed = json.decode(data);
    return CertificatesigningrequestlistCertificatesV1.fromJson(parsed).items;
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
            'Signer Name: ${item.spec.signerName}',
            'Requestor: ${item.spec.username ?? '-'}',
            'Requested Duration: ${formatSeconds(item.spec.expirationSeconds)}',
            'Condition: ${_getCondition(item.status?.conditions)}',
            'Age: ${getAge(item.metadata?.creationTimestamp)}',
          ],
        );
      },
  previewItemBuilder: (dynamic listItem) {
    final item = listItem as Item;

    return [
      'Signer Name: ${item.spec.signerName}',
      'Requestor: ${item.spec.username ?? '-'}',
      'Requested Duration: ${formatSeconds(item.spec.expirationSeconds)}',
      'Condition: ${_getCondition(item.status?.conditions)}',
      'Age: ${getAge(item.metadata?.creationTimestamp)}',
    ];
  },
  detailsItemBuilder:
      (BuildContext context, Resource resource, dynamic detailsItem) {
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
                      status: condition?.status ?? '',
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
                DetailsItemModel(
                  name: 'Signer Name',
                  values: item.spec.signerName,
                ),
                DetailsItemModel(name: 'Requestor', values: item.spec.username),
                DetailsItemModel(
                  name: 'Requested Duration',
                  values: formatSeconds(item.spec.expirationSeconds),
                ),
                DetailsItemModel(name: 'Request', values: item.spec.request),
                DetailsItemModel(name: 'Groups', values: item.spec.groups),
                DetailsItemModel(name: 'Usages', values: item.spec.usages),
              ],
            ),
            const SizedBox(height: Constants.spacingMiddle),
            DetailsItem(
              title: 'Status',
              details: [
                DetailsItemModel(
                  name: 'Condition',
                  values: _getCondition(item.status?.conditions),
                ),
                DetailsItemModel(
                  name: 'Certificate',
                  values: item.status?.certificate,
                ),
              ],
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

String _getCondition(List<Condition?>? conditions) {
  if (conditions == null || conditions.isEmpty) {
    return 'Pending';
  }

  for (final condition in conditions) {
    if (condition?.type == 'Approved') {
      return 'Approved';
    } else if (condition?.type == 'Denied') {
      return 'Denied';
    } else if (condition?.type == 'Failed') {
      return 'Failed';
    }
  }

  return 'Pending';
}
