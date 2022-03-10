import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_networking_v1_network_policy.dart';
import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/pages/resources_list/widgets/list_item_widget.dart';
import 'package:kubenav/utils/resources/general.dart';

class NetworkPolicyListItemWidget extends StatelessWidget
    implements IListItemWidget {
  const NetworkPolicyListItemWidget({
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
      name: np?.metadata?.name ?? '',
      namespace: np?.metadata?.namespace,
      info:
          'Namespace: ${np?.metadata?.namespace ?? '-'} \nPod Selector: ${podSelector != null && podSelector.isNotEmpty ? podSelector.join(', ') : '-'} \nAge: $age',
      status: podSelector == null || podSelector.isEmpty
          ? Status.warning
          : Status.success,
    );
  }
}
