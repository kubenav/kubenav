import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_apimachinery_pkg_apis_meta_v1_condition.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_cluster_issuer.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_cluster_issuer_list.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_cluster_issuer_spec_acme.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_cluster_issuer_spec_ca.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_cluster_issuer_spec_self_signed.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_cluster_issuer_spec_vault.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_v1_cluster_issuer_spec_venafi.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/navigate.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/widgets/plugins/cert-manager/resources/plugin_cert_manager_resources.dart';
import 'package:kubenav/widgets/resources/helpers/details_item.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_conditions.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_metadata.dart';
import 'package:kubenav/widgets/resources/helpers/details_resources_preview.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/resources/resources/resources_events.dart';
import 'package:kubenav/widgets/resources/resources/resources_secrets.dart';
import 'package:kubenav/widgets/resources/resources_details.dart';
import 'package:kubenav/widgets/resources/resources_list.dart';

final Resource certManagerResourceClusterIssuer = Resource(
  category: CertManagerResourceCategories.certificates,
  plural: 'ClusterIssuers',
  singular: 'ClusterIssuer',
  description:
      'A ClusterIssuer represents a certificate issuing authority which can be referenced as part of issuerRef fields',
  path: '/apis/cert-manager.io/v1',
  resource: 'clusterissuers',
  scope: ResourceScope.cluster,
  additionalPrinterColumns: [],
  icon: 'cert-manager',
  template: resourceDefaultTemplate,
  decodeListData: (ResourcesListData data) {
    final parsed = json.decode(data.list);
    final items =
        IoCertManagerV1ClusterIssuerList.fromJson(parsed)?.items ?? [];

    return items.map((e) {
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
    }).toList();
  },
  decodeList: (String data) {
    final parsed = json.decode(data);
    return IoCertManagerV1ClusterIssuerList.fromJson(parsed)?.items ?? [];
  },
  getName: (dynamic item) {
    return (item as IoCertManagerV1ClusterIssuer).metadata?.name ?? '';
  },
  getNamespace: (dynamic item) {
    return (item as IoCertManagerV1ClusterIssuer).metadata?.namespace;
  },
  decodeItem: (String data) {
    final parsed = json.decode(data);
    return IoCertManagerV1ClusterIssuer.fromJson(parsed);
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
        final item = listItem.item as IoCertManagerV1ClusterIssuer;
        final status = listItem.status;

        return ResourcesListItem(
          name: item.metadata?.name ?? '',
          namespace: item.metadata?.namespace ?? '',
          resource: resource,
          item: item,
          status: status,
          details: [
            'Ready: ${item.status?.conditions != null && item.status!.conditions.isNotEmpty ? (item.status!.conditions.where((e) => e.type == 'Ready').firstOrNull?.status ?? '-') : '-'}',
            'Age: ${getAge(item.metadata?.creationTimestamp)}',
          ],
        );
      },
  previewItemBuilder: (dynamic listItem) {
    final item = listItem as IoCertManagerV1ClusterIssuer;

    return [
      'Ready: ${item.status?.conditions != null && item.status!.conditions.isNotEmpty ? (item.status!.conditions.where((e) => e.type == 'Ready').firstOrNull?.status ?? '-') : '-'}',
      'Age: ${getAge(item.metadata?.creationTimestamp)}',
    ];
  },
  detailsItemBuilder:
      (BuildContext context, Resource resource, dynamic detailsItem) {
        final item = detailsItem as IoCertManagerV1ClusterIssuer;

        return Column(
          children: [
            DetailsItemMetadata(kind: item.kind, metadata: item.metadata),
            DetailsItemConditions(
              conditions: item.status?.conditions
                  .map(
                    (e) => IoK8sApimachineryPkgApisMetaV1Condition(
                      lastTransitionTime:
                          e.lastTransitionTime ?? DateTime.now(),
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
            buildACME(context, 'cert-manager', item.spec.acme),
            buildCA(context, 'cert-manager', item.spec.ca),
            buildSelfSigned(context, 'cert-manager', item.spec.selfSigned),
            buildVault(context, 'cert-manager', item.spec.vault),
            buildVenafi(context, 'cert-manager', item.spec.venafi),
            DetailsItem(
              title: 'Status',
              details: [
                DetailsItemModel(
                  name: 'Ready',
                  values:
                      item.status?.conditions != null &&
                          item.status!.conditions.isNotEmpty
                      ? item.status!.conditions
                            .where((e) => e.type == 'Ready')
                            .firstOrNull
                            ?.status
                      : null,
                ),
                DetailsItemModel(
                  name: 'Status',
                  values:
                      item.status?.conditions != null &&
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

Widget buildACME(
  BuildContext context,
  String namespace,
  IoCertManagerV1ClusterIssuerSpecAcme? acme,
) {
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
          DetailsItemModel(name: 'Skip TLS Verify', values: acme.skipTLSVerify),
          DetailsItemModel(
            name: 'Solvers',
            values: acme.solvers
                .map((e) => e.dns01 != null ? 'DNS01' : 'HTTP01')
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

Widget buildCA(
  BuildContext context,
  String namespace,
  IoCertManagerV1ClusterIssuerSpecCa? ca,
) {
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
            values: ca.issuingCertificateURLs,
          ),
        ],
      ),
      const SizedBox(height: Constants.spacingMiddle),
    ],
  );
}

Widget buildSelfSigned(
  BuildContext context,
  String namespace,
  IoCertManagerV1ClusterIssuerSpecSelfSigned? selfSigned,
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
            values: selfSigned.crlDistributionPoints.isNotEmpty
                ? selfSigned.crlDistributionPoints
                : '-',
          ),
        ],
      ),
      const SizedBox(height: Constants.spacingMiddle),
    ],
  );
}

Widget buildVault(
  BuildContext context,
  String namespace,
  IoCertManagerV1ClusterIssuerSpecVault? vault,
) {
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

Widget buildVenafi(
  BuildContext context,
  String namespace,
  IoCertManagerV1ClusterIssuerSpecVenafi? venafi,
) {
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
