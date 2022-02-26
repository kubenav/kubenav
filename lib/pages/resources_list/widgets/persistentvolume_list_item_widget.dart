import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/api.dart'
    show IoK8sApiCoreV1PersistentVolume;
import 'package:kubenav/pages/resources_list/widgets/list_item_widget.dart';
import 'package:kubenav/utils/resources/general.dart';

class PersistentVolumeListItemWidget extends StatelessWidget
    implements IListItemWidget {
  const PersistentVolumeListItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    final pv = IoK8sApiCoreV1PersistentVolume.fromJson(item);
    final age = getAge(pv?.metadata?.creationTimestamp);
    final capacity = pv?.spec?.capacity['storage'] ?? '-';
    final accessMode = pv?.spec?.accessModes.join(', ') ?? '-';
    final reclaimPolicy = pv?.spec?.persistentVolumeReclaimPolicy ?? '-';
    final status = pv?.status?.phase?.value ?? '-';
    final claim =
        '${pv?.spec?.claimRef?.namespace ?? '-'}/${pv?.spec?.claimRef?.name ?? '-'}';
    final storageClass = pv?.spec?.storageClassName ?? '-';
    final reason = pv?.status?.reason ?? '-';

    return ListItemWidget(
      name: pv?.metadata?.name ?? '',
      namespace: null,
      info:
          'Capacity: $capacity \nAccess Mode: $accessMode \nReclaim Policy: $reclaimPolicy \nStatus: $status \nClaim: $claim \nStorage Class: $storageClass \nReason: $reason \nAge: $age',
      status: status == 'Bound' ? Status.success : Status.warning,
    );
  }
}
