import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_networking_v1_network_policy.dart';
import 'package:kubenav/models/resource.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/widgets/resources/list/list_item.dart';

class NetworkPolicyListItem extends StatelessWidget implements IListItemWidget {
  const NetworkPolicyListItem({
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
    final np = IoK8sApiNetworkingV1NetworkPolicy.fromJson(item);
    final age = getAge(np?.metadata?.creationTimestamp);
    final podSelector = np?.spec?.podSelector.matchLabels.entries
        .map((e) => '${e.key}=${e.value}')
        .toList();

    return ListItemWidget(
      title: title,
      resource: resource,
      path: path,
      scope: scope,
      additionalPrinterColumns: additionalPrinterColumns,
      name: np?.metadata?.name ?? '',
      namespace: np?.metadata?.namespace,
      info: [
        'Namespace: ${np?.metadata?.namespace ?? '-'}',
        'Pod Selector: ${podSelector != null && podSelector.isNotEmpty ? podSelector.join(', ') : '-'}',
        'Age: $age',
      ],
      status: podSelector == null || podSelector.isEmpty
          ? Status.warning
          : Status.success,
    );
  }
}
