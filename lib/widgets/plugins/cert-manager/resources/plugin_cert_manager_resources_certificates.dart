import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/certificatelist_cert_manager_v1.dart';
import 'package:kubenav/models/kubernetes/certificaterequestlist_cert_manager_v1.dart'
    as crlist;
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/navigate.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/widgets/plugins/cert-manager/resources/plugin_cert_manager_resources.dart';
import 'package:kubenav/widgets/plugins/cert-manager/resources/plugin_cert_manager_resources_certificaterequests.dart';
import 'package:kubenav/widgets/plugins/cert-manager/resources/plugin_cert_manager_resources_clusterissuers.dart';
import 'package:kubenav/widgets/plugins/cert-manager/resources/plugin_cert_manager_resources_issuers.dart';
import 'package:kubenav/widgets/resources/helpers/details_item.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_conditions.dart'
    as details_item_conditions;
import 'package:kubenav/widgets/resources/helpers/details_item_metadata.dart'
    as details_item_metadata;
import 'package:kubenav/widgets/resources/helpers/details_resources_preview.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/resources/resources/resources_events.dart';
import 'package:kubenav/widgets/resources/resources/resources_secrets.dart';
import 'package:kubenav/widgets/resources/resources_details.dart';
import 'package:kubenav/widgets/resources/resources_list.dart';

final Resource certManagerResourceCertificate = Resource(
  category: CertManagerResourceCategories.certificates,
  plural: 'Certificates',
  singular: 'Certificate',
  description:
      'A Certificate resource should be created to ensure an up to date and signed X.509 certificate is stored in the Kubernetes Secret resource named in spec.secretName',
  path: '/apis/cert-manager.io/v1',
  resource: 'certificates',
  scope: ResourceScope.namespaced,
  additionalPrinterColumns: [],
  icon: 'cert-manager',
  template: resourceDefaultTemplate,
  decodeListData: (ResourcesListData data) {
    final parsed = json.decode(data.list);
    final items = CertificatelistCertManagerV1.fromJson(parsed).items;

    return items.map((e) {
      final status =
          e!.status?.conditions != null && e.status!.conditions!.isNotEmpty
          ? e.status!.conditions!
                .where((e) => e!.type == 'Ready')
                .firstOrNull
                ?.status
                .name
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
    }).toList();
  },
  decodeList: (String data) {
    final parsed = json.decode(data);
    return CertificatelistCertManagerV1.fromJson(parsed).items;
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
          namespace: item.metadata?.namespace ?? '',
          resource: resource,
          item: item,
          status: status,
          details: [
            'Namespace: ${item.metadata?.namespace ?? '-'}',
            'Ready: ${item.status?.conditions != null && item.status!.conditions!.isNotEmpty ? (item.status!.conditions!.where((e) => e!.type == 'Ready').firstOrNull?.status ?? '-') : '-'}',
            'Secret Name: ${item.spec?.secretName ?? '-'}',
            'Age: ${getAge(item.metadata?.creationTimestamp)}',
          ],
        );
      },
  previewItemBuilder: (dynamic listItem) {
    final item = listItem as Item;

    return [
      'Namespace: ${item.metadata?.namespace ?? '-'}',
      'Ready: ${item.status?.conditions != null && item.status!.conditions!.isNotEmpty ? (item.status!.conditions!.where((e) => e!.type == 'Ready').firstOrNull?.status ?? '-') : '-'}',
      'Secret Name: ${item.spec?.secretName ?? '-'}',
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
            DetailsItemModel(
              name: 'Secret Name',
              values: item.spec?.secretName,
              onTap: item.spec?.secretName == null
                  ? null
                  : (index) {
                      navigate(
                        context,
                        ResourcesDetails(
                          name: item.spec!.secretName,
                          namespace: item.metadata?.namespace,
                          resource: resourceSecret,
                        ),
                      );
                    },
            ),
            DetailsItemModel(
              name: 'Literal Subject',
              values: item.spec?.literalSubject,
            ),
            DetailsItemModel(
              name: 'Common Name',
              values: item.spec?.commonName,
            ),
            DetailsItemModel(name: 'Duration', values: item.spec?.duration),
            DetailsItemModel(
              name: 'Renew Before',
              values: item.spec?.renewBefore,
            ),
            DetailsItemModel(name: 'DNS Names', values: item.spec?.dnsNames),
            DetailsItemModel(
              name: 'IP Addresses',
              values: item.spec?.ipAddresses,
            ),
            DetailsItemModel(name: 'Uris', values: item.spec?.uris),
            DetailsItemModel(
              name: 'Email Addresses',
              values: item.spec?.emailAddresses,
            ),
            DetailsItemModel(
              name: 'CA',
              values: item.spec?.isCa == null
                  ? null
                  : item.spec!.isCa!
                  ? 'True'
                  : 'False',
            ),
            DetailsItemModel(
              name: 'Usages',
              values: item.spec?.usages?.map((e) => e.name).toList(),
            ),
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
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        _buildX509Subject(item.spec?.subject),
        _buildPrivateKey(item.spec?.privateKey),
        DetailsItem(
          title: 'Status',
          details: [
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
              name: 'Not Before',
              values: item.status?.notBefore,
            ),
            DetailsItemModel(name: 'Not After', values: item.status?.notAfter),
            DetailsItemModel(
              name: 'Renewal Time',
              values: item.status?.renewalTime,
            ),
            DetailsItemModel(
              name: 'Last Failure Time',
              values: item.status?.lastFailureTime,
            ),
            DetailsItemModel(
              name: 'Failed Issuance Attempts',
              values: item.status?.failedIssuanceAttempts,
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreview(
          resource: certManagerResourceCertificateRequest,
          namespace: item.metadata?.namespace,
          selector: '',
          filter: (List<dynamic> previewItems) {
            final crs = previewItems as List<crlist.Item>;

            return crs
                .where(
                  (cr) =>
                      cr.metadata?.ownerReferences != null &&
                      cr.metadata?.ownerReferences!.length == 1 &&
                      cr.metadata?.ownerReferences![0]?.name ==
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

Widget _buildX509Subject(Subject? subject) {
  if (subject == null) {
    return Container();
  }

  return Column(
    children: [
      DetailsItem(
        title: 'X509 Subject',
        details: [
          DetailsItemModel(
            name: 'Organizations',
            values: subject.organizations,
          ),
          DetailsItemModel(name: 'Countries', values: subject.countries),
          DetailsItemModel(
            name: 'Organizational Units',
            values: subject.organizationalUnits,
          ),
          DetailsItemModel(name: 'Localities', values: subject.localities),
          DetailsItemModel(name: 'Provinces', values: subject.provinces),
          DetailsItemModel(
            name: 'Street Addresses',
            values: subject.streetAddresses,
          ),
          DetailsItemModel(name: 'Postal Codes', values: subject.postalCodes),
          DetailsItemModel(name: 'Serial Number', values: subject.serialNumber),
        ],
      ),
      const SizedBox(height: Constants.spacingMiddle),
    ],
  );
}

Widget _buildPrivateKey(PrivateKey? privateKey) {
  if (privateKey == null) {
    return Container();
  }

  return Column(
    children: [
      DetailsItem(
        title: 'Private Key',
        details: [
          DetailsItemModel(
            name: 'Rotation Policy',
            values: privateKey.rotationPolicy?.name,
          ),
          DetailsItemModel(name: 'Encoding', values: privateKey.encoding?.name),
          DetailsItemModel(
            name: 'Algorithm',
            values: privateKey.algorithm?.name,
          ),
          DetailsItemModel(name: 'Size', values: privateKey.size),
        ],
      ),
      const SizedBox(height: Constants.spacingMiddle),
    ],
  );
}
