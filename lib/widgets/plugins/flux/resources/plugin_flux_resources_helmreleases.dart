import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/helmreleaselist_helm_v2.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/navigate.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/plugins/flux/resources/plugin_flux_resources.dart';
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

final Resource fluxResourceHelmRelease = Resource(
  category: FluxResourceCategories.helmController,
  plural: 'Helm Releases',
  singular: 'Helm Release',
  description:
      'The HelmRelease API allows for controller-driven reconciliation of Helm releases via Helm actions such as install, upgrade, test, uninstall, and rollback',
  path: '/apis/helm.toolkit.fluxcd.io/v2',
  resource: 'helmreleases',
  scope: ResourceScope.namespaced,
  additionalPrinterColumns: [],
  icon: 'flux',
  template: resourceDefaultTemplate,
  decodeListData: (ResourcesListData data) {
    final parsed = json.decode(data.list);
    final items = HelmreleaselistHelmV2.fromJson(parsed).items;

    return items.map((e) {
      final status =
          e!.status?.conditions != null && e.status!.conditions!.isNotEmpty
          ? e.status!.conditions!
                .where((e) => e!.type == 'Ready')
                .firstOrNull
                ?.status
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
    return HelmreleaselistHelmV2.fromJson(parsed).items;
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
        'Ready: ${item.status?.conditions != null && item.status!.conditions!.isNotEmpty ? item.status!.conditions!.where((e) => e!.type == 'Ready').firstOrNull?.status : '-'}',
        'Status: ${item.status?.conditions != null && item.status!.conditions!.isNotEmpty ? item.status!.conditions!.where((e) => e!.type == 'Ready').firstOrNull?.message : '-'}',
        'Age: ${getAge(item.metadata?.creationTimestamp)}',
      ],
    );
  },
  previewItemBuilder: (dynamic listItem) {
    final item = listItem as Item;

    return [
      'Namespace: ${item.metadata?.namespace ?? '-'}',
      'Ready: ${item.status?.conditions != null && item.status!.conditions!.isNotEmpty ? item.status!.conditions!.where((e) => e!.type == 'Ready').firstOrNull?.status : '-'}',
      'Status: ${item.status?.conditions != null && item.status!.conditions!.isNotEmpty ? item.status!.conditions!.where((e) => e!.type == 'Ready').firstOrNull?.message : '-'}',
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
              name: 'Chart',
              values: item.spec?.chart?.spec.chart,
            ),
            DetailsItemModel(
              name: 'Source',
              values: item.spec?.chart?.spec.sourceRef != null
                  ? '${item.spec?.chart?.spec.sourceRef.kind} (${item.spec?.chart?.spec.sourceRef.namespace ?? item.metadata?.namespace}/${item.spec?.chart?.spec.sourceRef.name})'
                  : null,
              onTap:
                  item.spec?.chart?.spec.sourceRef.kind != null &&
                      kindToFluxResource.containsKey(
                        item.spec!.chart?.spec.sourceRef.kind.name,
                      )
                  ? (int index) {
                      final resource =
                          kindToFluxResource[item
                              .spec!
                              .chart
                              ?.spec
                              .sourceRef
                              .kind
                              .name];

                      if (resource != null) {
                        navigate(
                          context,
                          ResourcesDetails(
                            name: item.spec?.chart?.spec.sourceRef.name ?? '',
                            namespace:
                                item.spec?.chart?.spec.sourceRef.namespace ??
                                item.metadata?.namespace ??
                                '',
                            resource: resource,
                          ),
                        );
                      } else {
                        showSnackbar(
                          context,
                          'Source',
                          '${item.spec!.chart?.spec.sourceRef.kind.name} (${item.spec?.chart?.spec.sourceRef.namespace ?? item.metadata?.namespace ?? ''}/${item.spec?.chart?.spec.sourceRef.name ?? ''})',
                        );
                      }
                    }
                  : null,
            ),
            DetailsItemModel(name: 'Interval', values: item.spec?.interval),
            DetailsItemModel(
              name: 'Suspended',
              values: item.spec?.suspend == true ? 'True' : 'False',
            ),
            DetailsItemModel(name: 'Timeout', values: item.spec?.timeout),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsItem(
          title: 'Status',
          details: [
            DetailsItemModel(
              name: 'Helm Chart',
              values: item.status?.helmChart,
              onTap: item.status?.helmChart != null
                  ? (int index) {
                      final resource = kindToFluxResource['HelmChart'];
                      final namespacename = item.status?.helmChart!.split('/');

                      if (resource != null) {
                        navigate(
                          context,
                          ResourcesDetails(
                            name: namespacename != null ? namespacename[1] : '',
                            namespace: namespacename != null
                                ? namespacename[0]
                                : '',
                            resource: resource,
                          ),
                        );
                      } else {
                        showSnackbar(
                          context,
                          'Helm Chart',
                          'HelmChart (${namespacename != null ? namespacename[0] : ''}/${namespacename != null ? namespacename[1] : ''})',
                        );
                      }
                    }
                  : null,
            ),
            DetailsItemModel(
              name: 'Last Applied Revision',
              values: item.status?.history?.firstOrNull?.chartVersion,
            ),
            DetailsItemModel(
              name: 'Last Attempted Revision',
              values: item.status?.lastAttemptedRevision,
            ),
            DetailsItemModel(name: 'Failures', values: item.status?.failures),
            DetailsItemModel(
              name: 'Install Failures',
              values: item.status?.installFailures,
            ),
            DetailsItemModel(
              name: 'Upgrade Failures',
              values: item.status?.upgradeFailures,
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
