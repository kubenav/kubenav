import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_apps_v1_replica_set.dart';
import 'package:kubenav/models/resource.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/widgets/resources/list/list_item.dart';

class ReplicaSetListItem extends StatelessWidget implements IListItemWidget {
  const ReplicaSetListItem({
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

  Status getStatus(
    int desired,
    int current,
    int ready,
  ) {
    if (desired == 0) {
      return Status.undefined;
    }

    if (desired == current && desired == ready) {
      return Status.success;
    }

    return Status.danger;
  }

  @override
  Widget build(BuildContext context) {
    final replicaSet = IoK8sApiAppsV1ReplicaSet.fromJson(item);
    final age = getAge(replicaSet?.metadata?.creationTimestamp);
    final desired = replicaSet?.status?.replicas ?? 0;
    final current = replicaSet?.status?.availableReplicas ?? 0;
    final ready = replicaSet?.status?.readyReplicas ?? 0;

    return ListItemWidget(
      title: title,
      resource: resource,
      path: path,
      scope: scope,
      additionalPrinterColumns: additionalPrinterColumns,
      name: replicaSet?.metadata?.name ?? '',
      namespace: replicaSet?.metadata?.namespace,
      info: [
        'Namespace: ${replicaSet?.metadata?.namespace ?? '-'}',
        'Desired: $desired',
        'Current: $current',
        'Ready: $ready',
        'Age: $age',
      ],
      status: getStatus(
        desired,
        current,
        ready,
      ),
    );
  }
}
