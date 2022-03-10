import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_apps_v1_stateful_set.dart';
import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/pages/resources_list/widgets/list_item_widget.dart';
import 'package:kubenav/utils/resources/statefulsets.dart';

class StatefulSetListItemWidget extends StatelessWidget
    implements IListItemWidget {
  const StatefulSetListItemWidget({
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
    int replicas,
    int ready,
    int upToDate,
  ) {
    if (replicas == 0) {
      return Status.warning;
    }

    if (replicas == ready && replicas == upToDate) {
      return Status.success;
    }

    if (ready == 0 || upToDate == 0) {
      return Status.danger;
    }

    return Status.warning;
  }

  @override
  Widget build(BuildContext context) {
    final sts = IoK8sApiAppsV1StatefulSet.fromJson(item);
    final info = buildInfoText(sts);
    final replicas = sts?.status?.replicas ?? 0;
    final ready = sts?.status?.readyReplicas ?? 0;
    final upToDate = sts?.status?.updatedReplicas ?? 0;

    return ListItemWidget(
      title: title,
      resource: resource,
      path: path,
      scope: scope,
      name: sts?.metadata?.name ?? '',
      namespace: sts?.metadata?.namespace,
      info: info,
      status: getStatus(
        replicas,
        ready,
        upToDate,
      ),
    );
  }
}
