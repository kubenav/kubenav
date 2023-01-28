import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_storage_v1_storage_class.dart';
import 'package:kubenav/models/resource.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/widgets/resources/list/list_item.dart';

class StorageClassListItem extends StatelessWidget implements IListItemWidget {
  const StorageClassListItem({
    Key? key,
    required this.title,
    required this.resource,
    required this.path,
    required this.scope,
    required this.item,
    required this.additionalPrinterColumns,
  }) : super(key: key);

  @override
  final String title;
  @override
  final String resource;
  @override
  final String path;
  @override
  final ResourceScope scope;
  @override
  final List<AdditionalPrinterColumns> additionalPrinterColumns;
  @override
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    final sc = IoK8sApiStorageV1StorageClass.fromJson(item);
    final age = getAge(sc?.metadata?.creationTimestamp);
    final provisioner = sc?.provisioner ?? '-';
    final reclaimPolicy = sc?.reclaimPolicy ?? '-';
    final volumeBindingMode = sc?.volumeBindingMode ?? '-';
    final allowVolumeExpansion =
        sc?.allowVolumeExpansion != null && sc?.allowVolumeExpansion == true
            ? 'True'
            : 'False';

    return ListItemWidget(
      title: title,
      resource: resource,
      path: path,
      scope: scope,
      additionalPrinterColumns: additionalPrinterColumns,
      name: sc?.metadata?.name ?? '',
      namespace: null,
      item: item,
      info: [
        'Provisioner: $provisioner',
        'Reclaim Policy: $reclaimPolicy',
        'Volume Binding Mode: $volumeBindingMode',
        'Allow Volume Expansion: $allowVolumeExpansion',
        'Age: $age',
      ],
    );
  }
}
