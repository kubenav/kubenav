import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_apps_v1_daemon_set.dart';
import 'package:kubenav/models/resource.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/widgets/resources/list/list_item.dart';

class DaemonSetListItem extends StatelessWidget implements IListItemWidget {
  const DaemonSetListItem({
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
    int desired,
    int current,
    int ready,
    int upToDate,
    int available,
    int numberMisscheduled,
  ) {
    if (numberMisscheduled > 0) {
      return Status.danger;
    }

    if (desired != 0 &&
        desired == current &&
        desired == ready &&
        desired == upToDate &&
        desired == available) {
      return Status.success;
    }

    return Status.warning;
  }

  @override
  Widget build(BuildContext context) {
    final daemonSet = IoK8sApiAppsV1DaemonSet.fromJson(item);
    final age = getAge(daemonSet?.metadata?.creationTimestamp);
    final desired = daemonSet?.status?.desiredNumberScheduled ?? 0;
    final current = daemonSet?.status?.currentNumberScheduled ?? 0;
    final ready = daemonSet?.status?.numberReady ?? 0;
    final upToDate = daemonSet?.status?.updatedNumberScheduled ?? 0;
    final available = daemonSet?.status?.numberAvailable ?? 0;
    final numberMisscheduled = daemonSet?.status?.numberMisscheduled ?? 0;
    final nodeSelector = daemonSet?.spec?.template.spec?.nodeSelector.entries
            .map((e) => '${e.key}=${e.value}')
            .toList() ??
        [];

    return ListItemWidget(
      title: title,
      resource: resource,
      path: path,
      scope: scope,
      additionalPrinterColumns: additionalPrinterColumns,
      name: daemonSet?.metadata?.name ?? '',
      namespace: daemonSet?.metadata?.namespace,
      item: item,
      info: [
        'Namespace: ${daemonSet?.metadata?.namespace ?? '-'}',
        'Desired: $desired',
        'Current: $current',
        'Ready: $ready',
        'Up to date: $upToDate',
        'Available: $available',
        'Node Selector: ${nodeSelector.isEmpty ? '-' : nodeSelector.join(', ')}',
        'Age: $age',
      ],
      status: getStatus(
        desired,
        current,
        ready,
        upToDate,
        available,
        numberMisscheduled,
      ),
    );
  }
}
