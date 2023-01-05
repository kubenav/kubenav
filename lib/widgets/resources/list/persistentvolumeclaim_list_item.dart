import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_persistent_volume_claim.dart';
import 'package:kubenav/models/resource.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/widgets/resources/list/list_item.dart';

class PersistentVolumeClaimListItem extends StatelessWidget
    implements IListItemWidget {
  const PersistentVolumeClaimListItem({
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
    final pvc = IoK8sApiCoreV1PersistentVolumeClaim.fromJson(item);
    final age = getAge(pvc?.metadata?.creationTimestamp);
    final status = pvc?.status?.phase ?? '-';
    final volume = pvc?.spec?.volumeName ?? '-';
    final capacity = pvc?.status?.capacity['storage'] ?? '-';
    final accessMode = pvc?.spec?.accessModes.join(', ') ?? '-';
    final storageClass = pvc?.spec?.storageClassName ?? '-';

    return ListItemWidget(
      title: title,
      resource: resource,
      path: path,
      scope: scope,
      additionalPrinterColumns: additionalPrinterColumns,
      name: pvc?.metadata?.name ?? '',
      namespace: pvc?.metadata?.namespace,
      info: [
        'Namespace: ${pvc?.metadata?.namespace ?? '-'}',
        'Status: $status',
        'Volume: $volume',
        'Capacity: $capacity',
        'Access Mode: $accessMode',
        'Storage Class: $storageClass',
        'Age: $age',
      ],
      status: status == 'Bound' ? Status.success : Status.warning,
    );
  }
}
