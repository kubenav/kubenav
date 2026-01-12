import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/issuerlist_cert_manager_v1.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/navigate.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/widgets/plugins/cert-manager/resources/plugin_cert_manager_resources.dart';
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
    final items = IssuerlistCertManagerV1.fromJson(parsed).items;

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
    return IssuerlistCertManagerV1.fromJson(parsed).items;
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
            'Age: ${getAge(item.metadata?.creationTimestamp)}',
          ],
        );
      },
  previewItemBuilder: (dynamic listItem) {
    final item = listItem as Item;

    return [
      'Namespace: ${item.metadata?.namespace ?? '-'}',
      'Ready: ${item.status?.conditions != null && item.status!.conditions!.isNotEmpty ? (item.status!.conditions!.where((e) => e!.type == 'Ready').firstOrNull?.status ?? '-') : '-'}',
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
            _buildACME(
              context,
              item.metadata?.namespace ?? 'cert-manager',
              item.spec.acme,
            ),
            _buildCA(
              context,
              item.metadata?.namespace ?? 'cert-manager',
              item.spec.ca,
            ),
            _buildSelfSigned(
              context,
              item.metadata?.namespace ?? 'cert-manager',
              item.spec.selfSigned,
            ),
            _buildVault(
              context,
              item.metadata?.namespace ?? 'cert-manager',
              item.spec.vault,
            ),
            _buildVenafi(
              context,
              item.metadata?.namespace ?? 'cert-manager',
              item.spec.venafi,
            ),
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

Widget _buildACME(BuildContext context, String namespace, SpecAcme? acme) {
  if (acme == null) {
    return Container();
  }

  return Column(
    children: [
      DetailsItem(
        title: 'Configuration',
        details: [
          DetailsItemModel(name: 'Email', values: acme.email),
          DetailsItemModel(name: 'Server', values: acme.server),
          DetailsItemModel(
            name: 'Preferred Chain',
            values: acme.preferredChain,
          ),
          DetailsItemModel(name: 'CA Bundle', values: acme.caBundle),
          DetailsItemModel(name: 'Skip TLS Verify', values: acme.skipTlsVerify),
          DetailsItemModel(
            name: 'Solvers',
            values: acme.solvers
                ?.map((e) => e?.dns01 != null ? 'DNS01' : 'HTTP01')
                .toList(),
          ),
          DetailsItemModel(
            name: 'Private Key Secret',
            values: acme.privateKeySecretRef.name,
            onTap: (index) {
              navigate(
                context,
                ResourcesDetails(
                  name: acme.privateKeySecretRef.name,
                  namespace: namespace,
                  resource: resourceSecret,
                ),
              );
            },
          ),
        ],
      ),
      const SizedBox(height: Constants.spacingMiddle),
    ],
  );
}

Widget _buildCA(BuildContext context, String namespace, Ca? ca) {
  if (ca == null) {
    return Container();
  }

  return Column(
    children: [
      DetailsItem(
        title: 'Configuration',
        details: [
          DetailsItemModel(
            name: 'Secret Name',
            values: ca.secretName,
            onTap: (index) {
              navigate(
                context,
                ResourcesDetails(
                  name: ca.secretName,
                  namespace: namespace,
                  resource: resourceSecret,
                ),
              );
            },
          ),
          DetailsItemModel(
            name: 'CRL Distribution Points',
            values: ca.crlDistributionPoints,
          ),
          DetailsItemModel(name: 'OCSP Servers', values: ca.ocspServers),
          DetailsItemModel(
            name: 'Issuing Certificate Urls',
            values: ca.issuingCertificateUrLs,
          ),
        ],
      ),
      const SizedBox(height: Constants.spacingMiddle),
    ],
  );
}

Widget _buildSelfSigned(
  BuildContext context,
  String namespace,
  SelfSigned? selfSigned,
) {
  if (selfSigned == null) {
    return Container();
  }

  return Column(
    children: [
      DetailsItem(
        title: 'Configuration',
        details: [
          DetailsItemModel(
            name: 'CRL Distribution Points',
            values:
                selfSigned.crlDistributionPoints != null &&
                    selfSigned.crlDistributionPoints!.isNotEmpty
                ? selfSigned.crlDistributionPoints
                : '-',
          ),
        ],
      ),
      const SizedBox(height: Constants.spacingMiddle),
    ],
  );
}

Widget _buildVault(BuildContext context, String namespace, Vault? vault) {
  if (vault == null) {
    return Container();
  }

  return Column(
    children: [
      DetailsItem(
        title: 'Configuration',
        details: [
          DetailsItemModel(name: 'Server', values: vault.server),
          DetailsItemModel(name: 'Path', values: vault.path),
          DetailsItemModel(name: 'Namespace', values: vault.namespace),
          DetailsItemModel(name: 'CA Bundle', values: vault.caBundle),
          DetailsItemModel(
            name: 'CA Bundle Secret',
            values: vault.caBundleSecretRef?.name,
            onTap: vault.caBundleSecretRef?.name == null
                ? null
                : (index) {
                    navigate(
                      context,
                      ResourcesDetails(
                        name: vault.caBundleSecretRef!.name,
                        namespace: namespace,
                        resource: resourceSecret,
                      ),
                    );
                  },
          ),
        ],
      ),
      const SizedBox(height: Constants.spacingMiddle),
    ],
  );
}

Widget _buildVenafi(BuildContext context, String namespace, Venafi? venafi) {
  if (venafi == null) {
    return Container();
  }

  return Column(
    children: [
      DetailsItem(
        title: 'Configuration',
        details: [DetailsItemModel(name: 'Zone', values: venafi.zone)],
      ),
      const SizedBox(height: Constants.spacingMiddle),
    ],
  );
}
