import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_persistent_volume.dart';
import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/pages/resources_list/widgets/list_item_widget.dart';
import 'package:kubenav/utils/resources/general.dart';

class PersistentVolumeListItemWidget extends StatelessWidget
    implements IListItemWidget {
  const PersistentVolumeListItemWidget({
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
    final pv = IoK8sApiCoreV1PersistentVolume.fromJson(item);
    final age = getAge(pv?.metadata?.creationTimestamp);
    final capacity =
        pv?.spec?.capacity != null && pv!.spec!.capacity.containsKey('storage')
            ? pv.spec?.capacity['storage']
            : '-';
    final accessMode = pv?.spec?.accessModes.join(', ') ?? '-';
    final reclaimPolicy = pv?.spec?.persistentVolumeReclaimPolicy ?? '-';
    final status = pv?.status?.phase?.value ?? '-';
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
      info:
          'Capacity: $capacity \nAccess Modes: $accessMode \nReclaim Policy: $reclaimPolicy \nStatus: $status \nClaim: $claim \nStorage Class: $storageClass \nReason: $reason \nAge: $age',
      status: status == 'Bound' ? Status.success : Status.warning,
    );
  }
}
