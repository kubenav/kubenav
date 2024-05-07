import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_persistent_volume.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_persistent_volume_list.dart';
import 'package:kubenav/models/plugins/prometheus.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/navigate.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/widgets/resources/helpers/details_item.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_metadata.dart';
import 'package:kubenav/widgets/resources/helpers/details_resources_preview.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/resources/resources/resources_events.dart';
import 'package:kubenav/widgets/resources/resources/resources_persistentvolumeclaims.dart';
import 'package:kubenav/widgets/resources/resources/resources_storageclasses.dart';
import 'package:kubenav/widgets/resources/resources_details.dart';
import 'package:kubenav/widgets/resources/resources_list.dart';
import 'package:kubenav/widgets/shared/app_prometheus_charts_widget.dart';

final Resource resourcePersistentVolume = Resource(
  category: ResourceCategory.configandstorage,
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
    final items =
        IoK8sApiCoreV1PersistentVolumeList.fromJson(parsed)?.items ?? [];

    return items
        .map(
          (e) => ResourceItem(
            item: e,
            metrics: null,
            status: e.status?.phase != 'Bound'
                ? ResourceStatus.danger
                : ResourceStatus.success,
          ),
        )
        .toList();
  },
  decodeList: (String data) {
    final parsed = json.decode(data);
    return IoK8sApiCoreV1PersistentVolumeList.fromJson(parsed)?.items ?? [];
  },
  getName: (dynamic item) {
    return (item as IoK8sApiCoreV1PersistentVolume).metadata?.name ?? '';
  },
  getNamespace: (dynamic item) {
    return (item as IoK8sApiCoreV1PersistentVolume).metadata?.namespace;
  },
  decodeItem: (String data) {
    final parsed = json.decode(data);
    return IoK8sApiCoreV1PersistentVolume.fromJson(parsed);
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
    final item = listItem.item as IoK8sApiCoreV1PersistentVolume;
    final status = listItem.status;

    return ResourcesListItem(
      name: item.metadata?.name ?? '',
      namespace: item.metadata?.namespace,
      resource: resource,
      item: item,
      status: status,
      details: [
        'Capacity: ${item.spec?.capacity != null && item.spec!.capacity.containsKey('storage') ? item.spec?.capacity['storage'] : '-'}',
        'Access Modes: ${item.spec?.accessModes.join(', ') ?? '-'}',
        'Reclaim Policy: ${item.spec?.persistentVolumeReclaimPolicy ?? '-'}',
        'Status: ${item.status?.phase ?? '-'}',
        'Claim: ${item.spec?.claimRef?.namespace ?? '-'}/${item.spec?.claimRef?.name ?? '-'}',
        'Storage Class: ${item.spec?.storageClassName ?? '-'}',
        'Reason: ${item.status?.reason ?? '-'}',
        'Age: ${getAge(item.metadata?.creationTimestamp)}',
      ],
    );
  },
  previewItemBuilder: (
    dynamic listItem,
  ) {
    final item = listItem as IoK8sApiCoreV1PersistentVolume;

    return [
      'Capacity: ${item.spec?.capacity != null && item.spec!.capacity.containsKey('storage') ? item.spec?.capacity['storage'] : '-'}',
      'Access Modes: ${item.spec?.accessModes.join(', ') ?? '-'}',
      'Reclaim Policy: ${item.spec?.persistentVolumeReclaimPolicy ?? '-'}',
      'Status: ${item.status?.phase ?? '-'}',
      'Claim: ${item.spec?.claimRef?.namespace ?? '-'}/${item.spec?.claimRef?.name ?? '-'}',
      'Storage Class: ${item.spec?.storageClassName ?? '-'}',
      'Reason: ${item.status?.reason ?? '-'}',
      'Age: ${getAge(item.metadata?.creationTimestamp)}',
    ];
  },
  detailsItemBuilder: (
    BuildContext context,
    Resource resource,
    dynamic detailsItem,
  ) {
    final item = detailsItem as IoK8sApiCoreV1PersistentVolume;

    return Column(
      children: [
        DetailsItemMetadata(metadata: item.metadata),
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
              values: item.spec?.capacity != null &&
                      item.spec!.capacity.containsKey('storage')
                  ? item.spec?.capacity['storage']
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
            DetailsItemModel(
              name: 'Status',
              values: item.status?.phase,
            ),
            DetailsItemModel(
              name: 'Claim',
              values:
                  '${item.spec?.claimRef?.namespace ?? '-'}/${item.spec?.claimRef?.name ?? '-'}',
              onTap: item.spec?.claimRef?.namespace == null ||
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
