import 'package:flutter/material.dart';

import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/models/kubernetes/api.dart'
    show IoK8sApiAppsV1ReplicaSet;
import 'package:kubenav/pages/resources_list/widgets/list_item_widget.dart';
import 'package:kubenav/utils/resources/general.dart';

class ReplicaSetListItemWidget extends StatelessWidget
    implements IListItemWidget {
  const ReplicaSetListItemWidget({
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
      name: replicaSet?.metadata?.name ?? '',
      namespace: replicaSet?.metadata?.namespace,
      info:
          'Namespace: ${replicaSet?.metadata?.namespace ?? '-'} \nDesired: $desired \nCurrent: $current \nReady: $ready \nAge: $age',
      status: getStatus(
        desired,
        current,
        ready,
      ),
    );
  }
}
