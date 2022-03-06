import 'package:flutter/material.dart';

import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/models/kubernetes/api.dart'
    show IoK8sApiStorageV1StorageClass;
import 'package:kubenav/pages/resources_list/widgets/list_item_widget.dart';
import 'package:kubenav/utils/resources/general.dart';

class StorageClassListItemWidget extends StatelessWidget
    implements IListItemWidget {
  const StorageClassListItemWidget({
    Key? key,
    required this.title,
    required this.resource,
    required this.path,
    required this.scope,
    required this.item,
  }) : super(key: key);

  @override
  final String? title;
  @override
  final String? resource;
  @override
  final String? path;
  @override
  final ResourceScope? scope;
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
      name: sc?.metadata?.name ?? '',
      namespace: null,
      info:
          'Provisioner: $provisioner \nReclaim Policy: $reclaimPolicy \nVolume Binding Mode: $volumeBindingMode \nAllow Volume Expansion: $allowVolumeExpansion \nAge: $age',
    );
  }
}