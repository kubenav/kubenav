import 'package:flutter/material.dart';

import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/models/kubernetes/api.dart' show IoK8sApiBatchV1Job;
import 'package:kubenav/pages/resources_list/widgets/list_item_widget.dart';
import 'package:kubenav/utils/resources/general.dart';

class JobListItemWidget extends StatelessWidget implements IListItemWidget {
  const JobListItemWidget({
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
    final job = IoK8sApiBatchV1Job.fromJson(item);
    final age = getAge(job?.metadata?.creationTimestamp);
    final completions = job?.spec?.completions ?? 0;
    final succeeded = job?.status?.succeeded ?? 0;
    final duration =
        timeDiff(job?.status?.startTime, job?.status?.completionTime);

    return ListItemWidget(
      title: title,
      resource: resource,
      path: path,
      scope: scope,
      name: job?.metadata?.name ?? '',
      namespace: job?.metadata?.namespace,
      info:
          'Namespace: ${job?.metadata?.namespace ?? '-'} \nCompletions: $succeeded/$completions \nDuration: $duration \nAge: $age',
      status: completions != 0 && completions != succeeded
          ? Status.danger
          : Status.success,
    );
  }
}
