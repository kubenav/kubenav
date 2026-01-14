import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/schema.models.swagger.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/widgets/resources/helpers/details_item.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_metadata.dart';
import 'package:kubenav/widgets/resources/helpers/details_resources_preview.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/resources/resources/resources_events.dart';
import 'package:kubenav/widgets/resources/resources_list.dart';
import 'package:kubenav/widgets/shared/app_prometheus_charts_widget.dart';

final resourceStorageClass = Resource(
  category: ResourceCategories.configAndStorage,
  plural: 'StorageClasses',
  singular: 'StorageClass',
  description:
      'A StorageClass provides a way for administrators to describe the "classes" of storage they offer.',
  path: '/apis/storage.k8s.io/v1',
  resource: 'storageclasses',
  scope: ResourceScope.cluster,
  additionalPrinterColumns: [],
  icon: 'storageclasses',
  template: resourceDefaultTemplate,
  decodeListData: (ResourcesListData data) {
    final parsed = json.decode(data.list);
    final items = IoK8sApiStorageV1StorageClassList.fromJson(parsed).items;

    return items
        .map(
          (e) => ResourceItem(
            item: e,
            metrics: null,
            status: ResourceStatus.undefined,
          ),
        )
        .toList();
  },
  decodeList: (String data) {
    final parsed = json.decode(data);
    return IoK8sApiStorageV1StorageClassList.fromJson(parsed).items;
  },
  getName: (dynamic item) {
    return (item as IoK8sApiStorageV1StorageClass).metadata?.name ?? '';
  },
  getNamespace: (dynamic item) {
    return (item as IoK8sApiStorageV1StorageClass).metadata?.namespace;
  },
  decodeItem: (String data) {
    final parsed = json.decode(data);
    return IoK8sApiStorageV1StorageClass.fromJson(parsed);
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
        final item = listItem.item as IoK8sApiStorageV1StorageClass;
        final status = listItem.status;

        return ResourcesListItem(
          name: item.metadata?.name ?? '',
          namespace: item.metadata?.namespace,
          resource: resource,
          item: item,
          status: status,
          details: [
            'Provisioner: ${item.provisioner}',
            'Reclaim Policy: ${item.reclaimPolicy?.value ?? '-'}',
            'Volume Binding Mode: ${item.volumeBindingMode?.value ?? '-'}',
            'Allow Volume Expansion: ${item.allowVolumeExpansion != null && item.allowVolumeExpansion == true ? 'True' : 'False'}',
            'Age: ${getAge(item.metadata?.creationTimestamp)}',
          ],
        );
      },
  previewItemBuilder: (dynamic listItem) {
    final item = listItem as IoK8sApiStorageV1StorageClass;

    return [
      'Provisioner: ${item.provisioner}',
      'Reclaim Policy: ${item.reclaimPolicy?.value ?? '-'}',
      'Volume Binding Mode: ${item.volumeBindingMode?.value ?? '-'}',
      'Allow Volume Expansion: ${item.allowVolumeExpansion != null && item.allowVolumeExpansion == true ? 'True' : 'False'}',
      'Age: ${getAge(item.metadata?.creationTimestamp)}',
    ];
  },
  detailsItemBuilder: (BuildContext context, Resource resource, dynamic detailsItem) {
    final item = detailsItem as IoK8sApiStorageV1StorageClass;

    return Column(
      children: [
        DetailsItemMetadata(kind: item.kind, metadata: item.metadata),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsItem(
          title: 'Configuration',
          details: [
            DetailsItemModel(
              name: 'Default',
              values:
                  item.metadata?.annotations != null &&
                      item.metadata!.annotations!.containsKey(
                        'storageclass.kubernetes.io/is-default-class',
                      ) &&
                      item
                              .metadata!
                              .annotations!['storageclass.kubernetes.io/is-default-class']!
                              .toLowerCase() ==
                          'true'
                  ? 'Yes'
                  : 'No',
            ),
            DetailsItemModel(name: 'Provisioner', values: item.provisioner),
            DetailsItemModel(
              name: 'Parameters',
              values: item.parameters?.entries
                  .map((e) => '${e.key}=${e.value}')
                  .toList(),
            ),
            DetailsItemModel(
              name: 'Allow Volume Expansion',
              values:
                  item.allowVolumeExpansion != null &&
                      item.allowVolumeExpansion == true
                  ? 'True'
                  : 'False',
            ),
            DetailsItemModel(name: 'Mount Options', values: item.mountOptions),
            DetailsItemModel(
              name: 'Reclaim Policy',
              values: item.reclaimPolicy?.value,
            ),
            DetailsItemModel(
              name: 'Volume Bind Mode',
              values: item.volumeBindingMode?.value,
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
          defaultCharts: const [],
        ),
      ],
    );
  },
);
