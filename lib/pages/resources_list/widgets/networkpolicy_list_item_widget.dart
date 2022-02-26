import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/api.dart'
    show IoK8sApiNetworkingV1NetworkPolicy;
import 'package:kubenav/pages/resources_list/widgets/list_item_widget.dart';
import 'package:kubenav/utils/resources/general.dart';

class NetworkPolicyListItemWidget extends StatelessWidget
    implements IListItemWidget {
  const NetworkPolicyListItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

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
