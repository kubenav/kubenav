import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/challengelist_acme_v1.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/navigate.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/widgets/plugins/cert-manager/resources/plugin_cert_manager_resources.dart';
import 'package:kubenav/widgets/plugins/cert-manager/resources/plugin_cert_manager_resources_clusterissuers.dart';
import 'package:kubenav/widgets/plugins/cert-manager/resources/plugin_cert_manager_resources_issuers.dart';
import 'package:kubenav/widgets/resources/helpers/details_item.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_metadata.dart'
    as details_item_metadata;
import 'package:kubenav/widgets/resources/helpers/details_resources_preview.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/resources/resources/resources_events.dart';
import 'package:kubenav/widgets/resources/resources_details.dart';
import 'package:kubenav/widgets/resources/resources_list.dart';

final Resource certManagerResourceChallenge = Resource(
  category: CertManagerResourceCategories.acme,
  plural: 'Challenges',
  singular: 'Challenge',
  description:
      'Challenge is a type to represent a Challenge request with an ACME server',
  path: '/apis/acme.cert-manager.io/v1',
  resource: 'challenges',
  scope: ResourceScope.namespaced,
  additionalPrinterColumns: [],
  icon: 'cert-manager',
  template: resourceDefaultTemplate,
  decodeListData: (ResourcesListData data) {
    final parsed = json.decode(data.list);
    final items = ChallengelistAcmeV1.fromJson(parsed).items;

    return items.map((e) {
      final state = e!.status?.state?.name;

      return ResourceItem(
        item: e,
        metrics: null,
        status: state == 'valid'
            ? ResourceStatus.success
            : state == 'ready'
            ? ResourceStatus.warning
            : ResourceStatus.danger,
      );
    }).toList();
  },
  decodeList: (String data) {
    final parsed = json.decode(data);
    return ChallengelistAcmeV1.fromJson(parsed).items;
  },
  getName: (dynamic item) {
    return (item as Item).metadata.name ?? '';
  },
  getNamespace: (dynamic item) {
    return (item as Item).metadata.namespace;
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
          name: item.metadata.name ?? '',
          namespace: item.metadata.namespace ?? '',
          resource: resource,
          item: item,
          status: status,
          details: [
            'Namespace: ${item.metadata.namespace ?? '-'}',
            'State: ${item.status?.state?.name ?? '-'}',
            'Reason: ${item.status?.reason ?? '-'}',
            'DNS Name: ${item.spec.dnsName}',
            'Age: ${getAge(item.metadata.creationTimestamp)}',
          ],
        );
      },
  previewItemBuilder: (dynamic listItem) {
    final item = listItem as Item;

    return [
      'Namespace: ${item.metadata.namespace ?? '-'}',
      'State: ${item.status?.state?.name ?? '-'}',
      'Reason: ${item.status?.reason ?? '-'}',
      'DNS Name: ${item.spec.dnsName}',
      'Age: ${getAge(item.metadata.creationTimestamp)}',
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
                name: item.metadata.name,
                namespace: item.metadata.namespace,
                labels: item.metadata.labels,
                annotations: item.metadata.annotations,
                creationTimestamp: item.metadata.creationTimestamp,
                ownerReferences: item.metadata.ownerReferences
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
                DetailsItemModel(
                  name: 'Issuer',
                  values:
                      '${item.spec.issuerRef.kind} (${item.spec.issuerRef.name})',
                  onTap: (index) {
                    navigate(
                      context,
                      ResourcesDetails(
                        name: item.spec.issuerRef.name,
                        namespace: item.spec.issuerRef.kind == 'ClusterIssuer'
                            ? null
                            : item.metadata.namespace,
                        resource: item.spec.issuerRef.kind == 'ClusterIssuer'
                            ? certManagerResourceClusterIssuer
                            : certManagerResourceIssuer,
                      ),
                    );
                  },
                ),
                DetailsItemModel(name: 'DNS Name', values: item.spec.dnsName),
                DetailsItemModel(name: 'Url', values: item.spec.url),
                DetailsItemModel(
                  name: 'Authorization Url',
                  values: item.spec.authorizationUrl,
                ),
                DetailsItemModel(name: 'Wildcard', values: item.spec.wildcard),
                DetailsItemModel(name: 'Token', values: item.spec.token),
                DetailsItemModel(name: 'Key', values: item.spec.key),
              ],
            ),
            const SizedBox(height: Constants.spacingMiddle),
            DetailsItem(
              title: 'Status',
              details: [
                DetailsItemModel(
                  name: 'State',
                  values: item.status?.state?.name,
                ),
                DetailsItemModel(name: 'Reason', values: item.status?.reason),
              ],
            ),
            const SizedBox(height: Constants.spacingMiddle),
            DetailsResourcesPreview(
              resource: resourceEvent,
              namespace: item.metadata.namespace,
              selector:
                  'fieldSelector=involvedObject.name=${item.metadata.name ?? ''}',
              filter: null,
            ),
            const SizedBox(height: Constants.spacingMiddle),
          ],
        );
      },
);
