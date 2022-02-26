import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/api.dart' show IoK8sApiCoreV1Node;
import 'package:kubenav/pages/resources_list/widgets/list_item_widget.dart';
import 'package:kubenav/utils/resources/general.dart';

class NodeListItemWidget extends StatelessWidget implements IListItemWidget {
  const NodeListItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    final node = IoK8sApiCoreV1Node.fromJson(item);
    final age = getAge(node?.metadata?.creationTimestamp);
    final status = node?.status?.conditions
        .where((condition) => condition.status == 'True')
        .map((condition) => condition.type.value);
    final roles = node?.metadata?.labels['kubernetes.azure.com/role'] ?? '-';
    final version = node?.status?.nodeInfo?.kubeletVersion ?? '-';

    return ListItemWidget(
      name: node?.metadata?.name ?? '',
      namespace: null,
      info:
          'Status: ${status != null && status.isNotEmpty ? status.join(', ') : '-'} \nRoles: $roles \nVersion: $version \nAge: $age',
      status: status != null && status.where((e) => e == 'Ready').isNotEmpty
          ? Status.success
          : Status.warning,
    );
  }
}
