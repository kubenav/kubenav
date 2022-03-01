import 'package:flutter/material.dart';

import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/models/kubernetes/api.dart'
    show IoK8sApiCoreV1PersistentVolumeClaim;
import 'package:kubenav/pages/resources_list/widgets/list_item_widget.dart';
import 'package:kubenav/utils/resources/general.dart';

class PersistentVolumeClaimListItemWidget extends StatelessWidget
    implements IListItemWidget {
  const PersistentVolumeClaimListItemWidget({
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
    final pvc = IoK8sApiCoreV1PersistentVolumeClaim.fromJson(item);
    final age = getAge(pvc?.metadata?.creationTimestamp);
    final status = pvc?.status?.phase?.value ?? '-';
    final volume = pvc?.spec?.volumeName ?? '-';
    final capacity = pvc?.status?.capacity['storage'] ?? '-';
    final accessMode = pvc?.spec?.accessModes.join(', ') ?? '-';
    final storageClass = pvc?.spec?.storageClassName ?? '-';

    return ListItemWidget(
      title: title,
      resource: resource,
      path: path,
      scope: scope,
      name: pvc?.metadata?.name ?? '',
      namespace: pvc?.metadata?.namespace,
      info:
          'Namespace: ${pvc?.metadata?.namespace ?? '-'} \nStatus: $status \nVolume: $volume \nCapacity: $capacity \nAccess Mode: $accessMode \nStorage Class: $storageClass \nAge: $age',
      status: status == 'Bound' ? Status.success : Status.warning,
    );
  }
}
