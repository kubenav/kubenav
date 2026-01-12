import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/applicationlist_argoproj_v1alpha1.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/navigate.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/widgets/plugins/argo/resources/plugin_argo_resources.dart';
import 'package:kubenav/widgets/resources/helpers/details_item.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_metadata.dart'
    as details_item_metadata;
import 'package:kubenav/widgets/resources/helpers/details_resources_preview.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/resources/resources/resources_events.dart';
import 'package:kubenav/widgets/resources/resources_details.dart';
import 'package:kubenav/widgets/resources/resources_list.dart';

final Resource argoResourceApplication = Resource(
  category: ArgoResourceCategories.resources,
  plural: 'Applications',
  singular: 'Application',
  description: 'A group of Kubernetes resources as defined by a manifest.',
  path: '/apis/argoproj.io/v1alpha1',
  resource: 'applications',
  scope: ResourceScope.namespaced,
  additionalPrinterColumns: [],
  icon: 'argo',
  template: resourceDefaultTemplate,
  decodeListData: (ResourcesListData data) {
    final parsed = json.decode(data.list);
    final items = ApplicationlistArgoprojV1Alpha1.fromJson(parsed).items;

    return items.map((e) {
      final status = e!.status?.health?.status ?? 'Unknown';

      return ResourceItem(
        item: e,
        metrics: null,
        status: status == 'Healthy'
            ? ResourceStatus.success
            : status == 'Degraded'
            ? ResourceStatus.danger
            : ResourceStatus.warning,
      );
    }).toList();
  },
  decodeList: (String data) {
    final parsed = json.decode(data);
    return ApplicationlistArgoprojV1Alpha1.fromJson(parsed).items;
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
            'AppHealth: ${item.status?.health?.status ?? '-'}',
            'SyncStatus: ${item.status?.sync?.status ?? '-'}',
            'CreatedAt: ${getAge(item.metadata.creationTimestamp)}',
            'LastSync: ${getAge(item.status?.operationState?.finishedAt)}',
          ],
        );
      },
  previewItemBuilder: (dynamic listItem) {
    final item = listItem as Item;

    return [
      'Namespace: ${item.metadata.namespace ?? '-'}',
      'AppHealth: ${item.status?.health?.status ?? '-'}',
      'SyncStatus: ${item.status?.sync?.status ?? '-'}',
      'CreatedAt: ${getAge(item.metadata.creationTimestamp)}',
      'LastSync: ${getAge(item.status?.operationState?.finishedAt)}',
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
                DetailsItemModel(name: 'Project', values: item.spec.project),
                DetailsItemModel(
                  name: 'Info',
                  values: item.spec.info != null && item.spec.info!.isNotEmpty
                      ? item.spec.info
                      : null,
                ),
                DetailsItemModel(
                  name: 'Cluster',
                  values:
                      item.spec.destination.server ??
                      item.spec.destination.name,
                ),
                DetailsItemModel(
                  name: 'SourceType',
                  values: item.status?.sourceType ?? '-',
                ),
                DetailsItemModel(
                  name: 'RepoURL',
                  values: item.spec.source?.repoUrl ?? '-',
                ),
                DetailsItemModel(
                  name: 'TargetRevision',
                  values: item.spec.source?.targetRevision ?? '-',
                ),
                DetailsItemModel(
                  name: 'Path',
                  values: item.spec.source?.path ?? '-',
                ),
                DetailsItemModel(
                  name: 'SyncPolicy',
                  values: item.spec.syncPolicy != null
                      ? 'Auto sync enabled'
                      : 'Auto sync disabled',
                ),
                DetailsItemModel(
                  name: 'Prune',
                  values: item.spec.syncPolicy?.automated?.prune,
                ),
                DetailsItemModel(
                  name: 'SelfHeal',
                  values: item.spec.syncPolicy?.automated?.selfHeal,
                ),
              ],
            ),
            const SizedBox(height: Constants.spacingMiddle),
            DetailsItem(
              title: 'Status',
              details: [
                DetailsItemModel(
                  name: 'AppHealth',
                  values: item.status?.health?.status,
                ),
                DetailsItemModel(
                  name: 'SyncStatus',
                  values: item.status?.sync?.status,
                ),
                DetailsItemModel(
                  name: 'LastSync',
                  values: getAge(item.status?.operationState?.finishedAt),
                ),
                DetailsItemModel(
                  name: 'LastReconcile',
                  values: getAge(item.status?.reconciledAt),
                ),
                DetailsItemModel(
                  name: 'Images',
                  values: item.status?.summary?.images,
                ),
                DetailsItemModel(
                  name: 'URLs',
                  values: item.status?.summary?.externalUrLs,
                ),
                // TODO: this list should link to the customResource widgets for
                // non-supported resource kinds, it would also be useful to see
                // health and sync status per resource.
                DetailsItemModel(
                  name: 'Resources',
                  values: item.status?.resources?.map((e) {
                    return '${e!.kind}/${e.name}';
                  }).toList(),
                  onTap: (index) {
                    final res = item.status!.resources?[index];
                    if (kindToResource.containsKey(res?.kind)) {
                      navigate(
                        context,
                        ResourcesDetails(
                          name: res?.name ?? '',
                          namespace: res?.namespace,
                          resource: kindToResource[res?.kind]!,
                        ),
                      );
                      return;
                    }
                  },
                ),
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
