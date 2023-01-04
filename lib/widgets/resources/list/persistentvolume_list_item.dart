import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_persistent_volume.dart';
import 'package:kubenav/models/resource.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/widgets/resources/list/list_item.dart';

class PersistentVolumeListItem extends StatelessWidget
    implements IListItemWidget {
  const PersistentVolumeListItem({
    Key? key,
    required this.title,
    required this.resource,
    required this.path,
    required this.scope,
    required this.item,
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
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    final pv = IoK8sApiCoreV1PersistentVolume.fromJson(item);
    final age = getAge(pv?.metadata?.creationTimestamp);
    final capacity =
        pv?.spec?.capacity != null && pv!.spec!.capacity.containsKey('storage')
            ? pv.spec?.capacity['storage']
            : '-';
    final accessMode = pv?.spec?.accessModes.join(', ') ?? '-';
    final reclaimPolicy = pv?.spec?.persistentVolumeReclaimPolicy ?? '-';
    final status = pv?.status?.phase ?? '-';
    final claim =
        '${pv?.spec?.claimRef?.namespace ?? '-'}/${pv?.spec?.claimRef?.name ?? '-'}';
    final storageClass = pv?.spec?.storageClassName ?? '-';
    final reason = pv?.status?.reason ?? '-';

    return ListItemWidget(
      title: title,
      resource: resource,
      path: path,
      scope: scope,
      name: pv?.metadata?.name ?? '',
      namespace: null,
      info: [
        'Capacity: $capacity',
        'Access Modes: $accessMode',
        'Reclaim Policy: $reclaimPolicy',
        'Status: $status',
        'Claim: $claim',
        'Storage Class: $storageClass',
        'Reason: $reason',
        'Age: $age',
      ],
      status: status == 'Bound' ? Status.success : Status.warning,
    );
  }
}
