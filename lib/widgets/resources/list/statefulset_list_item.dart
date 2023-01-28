import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_apps_v1_stateful_set.dart';
import 'package:kubenav/models/resource.dart';
import 'package:kubenav/utils/resources/statefulsets.dart';
import 'package:kubenav/widgets/resources/list/list_item.dart';

class StatefulSetListItem extends StatelessWidget implements IListItemWidget {
  const StatefulSetListItem({
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
      additionalPrinterColumns: additionalPrinterColumns,
      name: sts?.metadata?.name ?? '',
      namespace: sts?.metadata?.namespace,
      item: item,
      info: info,
      status: getStatus(
        replicas,
        ready,
        upToDate,
      ),
    );
  }
}
