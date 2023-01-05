import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_apps_v1_deployment.dart';
import 'package:kubenav/models/resource.dart';
import 'package:kubenav/utils/resources/deployments.dart';
import 'package:kubenav/widgets/resources/list/list_item.dart';

class DeploymentListItem extends StatelessWidget implements IListItemWidget {
  const DeploymentListItem({
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
    int available,
  ) {
    if (replicas == 0) {
      return Status.warning;
    }

    if (replicas == ready && replicas == upToDate && replicas == available) {
      return Status.success;
    }

    if (ready == 0 || upToDate == 0 || available == 0) {
      return Status.danger;
    }

    return Status.warning;
  }

  @override
  Widget build(BuildContext context) {
    final deplyoment = IoK8sApiAppsV1Deployment.fromJson(item);
    final info = buildInfoText(deplyoment);
    final replicas = deplyoment?.status?.replicas ?? 0;
    final ready = deplyoment?.status?.readyReplicas ?? 0;
    final upToDate = deplyoment?.status?.updatedReplicas ?? 0;
    final available = deplyoment?.status?.availableReplicas ?? 0;

    return ListItemWidget(
      title: title,
      resource: resource,
      path: path,
      scope: scope,
      additionalPrinterColumns: additionalPrinterColumns,
      name: deplyoment?.metadata?.name ?? '',
      namespace: deplyoment?.metadata?.namespace,
      info: info,
      status: getStatus(
        replicas,
        ready,
        upToDate,
        available,
      ),
    );
  }
}
