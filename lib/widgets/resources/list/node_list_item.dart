import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_node.dart';
import 'package:kubenav/models/resource.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/utils/resources/nodes.dart';
import 'package:kubenav/widgets/resources/list/list_item.dart';

class NodeListItem extends StatelessWidget implements IListItemWidget {
  const NodeListItem({
    Key? key,
    required this.title,
    required this.resource,
    required this.path,
    required this.scope,
    required this.additionalPrinterColumns,
    required this.item,
    required this.metrics,
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
  final dynamic metrics;

  @override
  Widget build(BuildContext context) {
    final node = IoK8sApiCoreV1Node.fromJson(item);
    final age = getAge(node?.metadata?.creationTimestamp);
    final status = node?.status?.conditions
        .where((condition) => condition.status == 'True')
        .map((condition) => condition.type);
    final roles = node?.metadata?.labels['kubernetes.azure.com/role'] ?? '-';
    final version = node?.status?.nodeInfo?.kubeletVersion ?? '-';
    final nodeMetrics = getMetricsFromList(node, metrics);
    final nodeAllocatableResources = getAllocatableResources(node);

    final info = [
      'Status: ${status != null && status.isNotEmpty ? status.join(', ') : '-'}',
      'Roles: $roles',
      'Version: $version',
      'Age: $age',
    ];

    info.add(
        'CPU: ${nodeMetrics != null ? nodeMetrics.cpu : '-'} / ${nodeAllocatableResources != null ? nodeAllocatableResources.cpu : '-'}');
    info.add(
      'Memory: ${nodeMetrics != null ? nodeMetrics.memory : '-'} / ${nodeAllocatableResources != null ? nodeAllocatableResources.memory : '-'}',
    );

    return ListItemWidget(
      title: title,
      resource: resource,
      path: path,
      scope: scope,
      additionalPrinterColumns: additionalPrinterColumns,
      name: node?.metadata?.name ?? '',
      namespace: null,
      info: info,
      status: status != null && status.where((e) => e == 'Ready').isNotEmpty
          ? Status.success
          : Status.warning,
    );
  }
}
