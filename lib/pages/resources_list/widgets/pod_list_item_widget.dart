import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/api.dart' show IoK8sApiCoreV1Pod;
import 'package:kubenav/utils/resources/pods.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/pages/resources_list/widgets/list_item_widget.dart';

class PodListItemWidget extends StatelessWidget implements IListItemWidget {
  const PodListItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    final pod = IoK8sApiCoreV1Pod.fromJson(item);
    final age = getAge(pod?.metadata?.creationTimestamp);
    final ready =
        '${pod?.status?.containerStatuses.where((containerStatus) => containerStatus.ready).length ?? '0'}/${pod?.spec?.containers.length ?? '0'}';
    final statusText = getStatusText(pod);
    final restarts = getRestarts(pod);
    final status = getStatus(pod);

    return ListItemWidget(
      name: pod?.metadata?.name ?? '',
      namespace: pod?.metadata?.namespace,
      info:
          'Namespace: ${pod?.metadata?.namespace ?? '-'} \nReady: $ready \nStatus: $statusText \nRestarts: $restarts \nAge: $age',
      status: status,
    );
  }
}
