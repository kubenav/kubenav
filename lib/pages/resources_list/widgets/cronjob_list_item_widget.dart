import 'package:flutter/material.dart';

import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/models/kubernetes/api.dart' show IoK8sApiBatchV1CronJob;
import 'package:kubenav/pages/resources_list/widgets/list_item_widget.dart';
import 'package:kubenav/utils/resources/general.dart';

class CronJobListItemWidget extends StatelessWidget implements IListItemWidget {
  const CronJobListItemWidget({
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
    final cronJob = IoK8sApiBatchV1CronJob.fromJson(item);
    final age = getAge(cronJob?.metadata?.creationTimestamp);
    final schedule = cronJob?.spec?.schedule;
    final suspend =
        cronJob?.spec?.suspend == null || cronJob?.spec?.suspend == false
            ? 'False'
            : 'True';
    final active = cronJob?.status?.active.length ?? 0;
    final lastSchedule = getAge(cronJob?.status?.lastScheduleTime);

    return ListItemWidget(
      title: title,
      resource: resource,
      path: path,
      scope: scope,
      name: cronJob?.metadata?.name ?? '',
      namespace: cronJob?.metadata?.namespace,
      info:
          'Namespace: ${cronJob?.metadata?.namespace ?? '-'} \nSchedule: $schedule \nSuspend: $suspend \nActive: $active \nLast Schedule: $lastSchedule \nAge: $age',
      status: suspend == 'True' ? Status.warning : Status.success,
    );
  }
}
