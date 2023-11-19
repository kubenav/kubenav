import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_pod.dart';
import 'package:kubenav/models/resource.dart';
import 'package:kubenav/utils/resources/pods.dart';
import 'package:kubenav/widgets/resources/list/list_item.dart';

class PodListItem extends StatelessWidget implements IListItemWidget {
  const PodListItem({
    super.key,
    required this.title,
    required this.resource,
    required this.path,
    required this.scope,
    required this.additionalPrinterColumns,
    required this.item,
    required this.metrics,
  });

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
    final pod = IoK8sApiCoreV1Pod.fromJson(item);
    var info = buildInfoText(pod);
    final podResources = getResources(pod);
    final podMetrics = getMetricsFromList(pod, metrics);
    final status = getStatus(pod);

    info.add(
      'CPU: ${podMetrics != null ? podMetrics.cpu : '-'} ${podResources?.cpu ?? '/ - / -'}',
    );
    info.add(
      'Memory: ${podMetrics != null ? podMetrics.memory : '-'} ${podResources?.memory ?? '/ - / -'}',
    );

    return ListItemWidget(
      title: title,
      resource: resource,
      path: path,
      scope: scope,
      additionalPrinterColumns: additionalPrinterColumns,
      name: pod?.metadata?.name ?? '',
      namespace: pod?.metadata?.namespace,
      item: item,
      info: info,
      status: status,
    );
  }
}
