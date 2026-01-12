import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/persistentvolumeclaimlist_v1.dart';
import 'package:kubenav/models/plugins/prometheus.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/navigate.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/widgets/resources/helpers/details_item.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_conditions.dart'
    as details_item_conditions;
import 'package:kubenav/widgets/resources/helpers/details_item_metadata.dart'
    as details_item_metadata;
import 'package:kubenav/widgets/resources/helpers/details_resources_preview.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/resources/resources/resources_events.dart';
import 'package:kubenav/widgets/resources/resources/resources_persistentvolumes.dart';
import 'package:kubenav/widgets/resources/resources/resources_storageclasses.dart';
import 'package:kubenav/widgets/resources/resources_details.dart';
import 'package:kubenav/widgets/resources/resources_list.dart';
import 'package:kubenav/widgets/shared/app_prometheus_charts_widget.dart';

final Resource resourcePersistentVolumeClaim = Resource(
  category: ResourceCategories.configAndStorage,
  plural: 'PersistentVolumeClaims',
  singular: 'PersistentVolumeClaim',
  description:
      'A PersistentVolumeClaim (PVC) is a request for storage by a user.',
  path: '/api/v1',
  resource: 'persistentvolumeclaims',
  scope: ResourceScope.namespaced,
  additionalPrinterColumns: [],
  icon: 'persistentvolumeclaims',
  template: resourceDefaultTemplate,
  decodeListData: (ResourcesListData data) {
    final parsed = json.decode(data.list);
    final items = PersistentvolumeclaimlistV1.fromJson(parsed).items;

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
    return PersistentvolumeclaimlistV1.fromJson(parsed).items;
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
            'Namespace: ${item.metadata?.namespace ?? '-'}',
            'Status: ${item.status?.phase ?? '-'}',
            'Volume: ${item.spec?.volumeName ?? '-'}',
            'Capacity: ${item.status?.capacity?['storage'] ?? '-'}',
            'Access Mode: ${item.spec?.accessModes?.join(', ') ?? '-'}',
            'Storage Class: ${item.spec?.storageClassName ?? '-'}',
            'Age: ${getAge(item.metadata?.creationTimestamp)}',
          ],
        );
      },
  previewItemBuilder: (dynamic listItem) {
    final item = listItem as Item;

    return [
      'Namespace: ${item.metadata?.namespace ?? '-'}',
      'Status: ${item.status?.phase ?? '-'}',
      'Volume: ${item.spec?.volumeName ?? '-'}',
      'Capacity: ${item.status?.capacity?['storage'] ?? '-'}',
      'Access Mode: ${item.spec?.accessModes?.join(', ') ?? '-'}',
      'Storage Class: ${item.spec?.storageClassName ?? '-'}',
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
              name: 'Access Modes',
              values: item.spec?.accessModes,
            ),
            DetailsItemModel(
              name: 'Requested Storage',
              values:
                  item.spec?.resources?.requests != null &&
                      item.spec!.resources!.requests!.containsKey('storage')
                  ? item.spec?.resources!.requests!['storage']
                  : null,
            ),
            DetailsItemModel(
              name: 'Volume Mode',
              values: item.spec?.volumeMode,
            ),
            DetailsItemModel(
              name: 'Volume Name',
              values: item.spec?.volumeName,
              onTap: item.spec?.volumeName == null
                  ? null
                  : (index) {
                      navigate(
                        context,
                        ResourcesDetails(
                          name: item.spec!.volumeName!,
                          namespace: null,
                          resource: resourcePersistentVolume,
                        ),
                      );
                    },
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsItem(
          title: 'Status',
          details: [
            DetailsItemModel(name: 'Status', values: item.status?.phase),
            DetailsItemModel(
              name: 'Access Modes',
              values: item.status?.accessModes,
            ),
            DetailsItemModel(
              name: 'Storage',
              values:
                  item.status?.capacity != null &&
                      item.status!.capacity!.containsKey('storage')
                  ? item.status?.capacity!['storage']
                  : null,
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
              title: 'Volume Space Usage',
              unit: 'GiB',
              queries: [
                Query(
                  query:
                      '(sum without(instance, node) (topk(1, (kubelet_volume_stats_capacity_bytes{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", persistentvolumeclaim="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}))) - sum without(instance, node) (topk(1, (kubelet_volume_stats_available_bytes{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", persistentvolumeclaim="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"})))) / 1024 / 1024 / 1024',
                  label: 'Used',
                ),
                Query(
                  query:
                      'sum without(instance, node) (topk(1, (kubelet_volume_stats_available_bytes{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", persistentvolumeclaim="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}))) / 1024 / 1024 / 1024',
                  label: 'Free',
                ),
              ],
            ),
            Chart(
              title: 'Volume inodes Usage',
              unit: '',
              queries: [
                Query(
                  query:
                      'sum without(instance, node) (topk(1, (kubelet_volume_stats_inodes_used{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", persistentvolumeclaim="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"})))',
                  label: 'Used',
                ),
                Query(
                  query:
                      '(sum without(instance, node) (topk(1, (kubelet_volume_stats_inodes{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", persistentvolumeclaim="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}))) - sum without(instance, node) (topk(1, (kubelet_volume_stats_inodes_used{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", persistentvolumeclaim="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}))))',
                  label: 'Free',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  },
);
