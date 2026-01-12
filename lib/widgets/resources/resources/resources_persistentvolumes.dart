import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/persistentvolumelist_v1.dart';
import 'package:kubenav/models/plugins/prometheus.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/navigate.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/widgets/resources/helpers/details_item.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_metadata.dart'
    as details_item_metadata;
import 'package:kubenav/widgets/resources/helpers/details_resources_preview.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/resources/resources/resources_events.dart';
import 'package:kubenav/widgets/resources/resources/resources_persistentvolumeclaims.dart';
import 'package:kubenav/widgets/resources/resources/resources_storageclasses.dart';
import 'package:kubenav/widgets/resources/resources_details.dart';
import 'package:kubenav/widgets/resources/resources_list.dart';
import 'package:kubenav/widgets/shared/app_prometheus_charts_widget.dart';

final Resource resourcePersistentVolume = Resource(
  category: ResourceCategories.configAndStorage,
  plural: 'PersistentVolumes',
  singular: 'PersistentVolume',
  description:
      'A PersistentVolume (PV) is a piece of storage in the cluster that has been provisioned by an administrator or dynamically provisioned using Storage Classes.',
  path: '/api/v1',
  resource: 'persistentvolumes',
  scope: ResourceScope.cluster,
  additionalPrinterColumns: [],
  icon: 'persistentvolumes',
  template: resourceDefaultTemplate,
  decodeListData: (ResourcesListData data) {
    final parsed = json.decode(data.list);
    final items = PersistentvolumelistV1.fromJson(parsed).items;

    return items
        .map(
          (e) => ResourceItem(
            item: e,
            metrics: null,
            status: e?.status?.phase != Phase.BOUND
                ? ResourceStatus.danger
                : ResourceStatus.success,
          ),
        )
        .toList();
  },
  decodeList: (String data) {
    final parsed = json.decode(data);
    return PersistentvolumelistV1.fromJson(parsed).items;
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
      namespace: item.metadata?.namespace,
      resource: resource,
      item: item,
      status: status,
      details: [
        'Capacity: ${item.spec?.capacity != null && item.spec!.capacity!.containsKey('storage') ? item.spec?.capacity!['storage'] : '-'}',
        'Access Modes: ${item.spec?.accessModes?.join(', ') ?? '-'}',
        'Reclaim Policy: ${item.spec?.persistentVolumeReclaimPolicy ?? '-'}',
        'Status: ${item.status?.phase ?? '-'}',
        'Claim: ${item.spec?.claimRef?.namespace ?? '-'}/${item.spec?.claimRef?.name ?? '-'}',
        'Storage Class: ${item.spec?.storageClassName ?? '-'}',
        'Reason: ${item.status?.reason ?? '-'}',
        'Age: ${getAge(item.metadata?.creationTimestamp)}',
      ],
    );
  },
  previewItemBuilder: (dynamic listItem) {
    final item = listItem as Item;

    return [
      'Capacity: ${item.spec?.capacity != null && item.spec!.capacity!.containsKey('storage') ? item.spec?.capacity!['storage'] : '-'}',
      'Access Modes: ${item.spec?.accessModes?.join(', ') ?? '-'}',
      'Reclaim Policy: ${item.spec?.persistentVolumeReclaimPolicy ?? '-'}',
      'Status: ${item.status?.phase ?? '-'}',
      'Claim: ${item.spec?.claimRef?.namespace ?? '-'}/${item.spec?.claimRef?.name ?? '-'}',
      'Storage Class: ${item.spec?.storageClassName ?? '-'}',
      'Reason: ${item.status?.reason ?? '-'}',
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
        const SizedBox(height: Constants.spacingMiddle),
        DetailsItem(
          title: 'Configuration',
          details: [
            DetailsItemModel(
              name: 'Storage Class',
              values: item.spec?.storageClassName,
              onTap: item.spec?.storageClassName == null
                  ? null
                  : (index) {
                      navigate(
                        context,
                        ResourcesDetails(
                          name: item.spec!.storageClassName!,
                          namespace: null,
                          resource: resourceStorageClass,
                        ),
                      );
                    },
            ),
            DetailsItemModel(
              name: 'Reclaim Policy',
              values: item.spec?.persistentVolumeReclaimPolicy,
            ),
            DetailsItemModel(
              name: 'Access Modes',
              values: item.spec?.accessModes,
            ),
            DetailsItemModel(
              name: 'Storage',
              values:
                  item.spec?.capacity != null &&
                      item.spec!.capacity!.containsKey('storage')
                  ? item.spec?.capacity!['storage']
                  : null,
            ),
            DetailsItemModel(
              name: 'Mount Options',
              values: item.spec?.mountOptions,
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsItem(
          title: 'Status',
          details: [
            DetailsItemModel(name: 'Status', values: item.status?.phase),
            DetailsItemModel(
              name: 'Claim',
              values:
                  '${item.spec?.claimRef?.namespace ?? '-'}/${item.spec?.claimRef?.name ?? '-'}',
              onTap:
                  item.spec?.claimRef?.namespace == null ||
                      item.spec?.claimRef?.name == null
                  ? null
                  : (index) {
                      navigate(
                        context,
                        ResourcesDetails(
                          name: item.spec!.claimRef!.name!,
                          namespace: item.spec!.claimRef!.namespace,
                          resource: resourcePersistentVolumeClaim,
                        ),
                      );
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
          defaultCharts: [
            Chart(
              title: 'Capacity',
              unit: 'GiB',
              queries: [
                Query(
                  query:
                      'kube_persistentvolume_capacity_bytes{persistentvolume="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"} / 1024 / 1024 / 1024',
                  label: 'Capacity',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  },
);
