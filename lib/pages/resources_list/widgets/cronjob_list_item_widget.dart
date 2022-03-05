import 'package:flutter/material.dart';

import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/models/kubernetes/api.dart' show IoK8sApiBatchV1CronJob;
import 'package:kubenav/pages/resources_list/widgets/list_item_widget.dart';
import 'package:kubenav/utils/resources/cronjobs.dart';

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
    final info = buildInfoText(cronJob);
    final suspend =
        cronJob?.spec?.suspend == null || cronJob?.spec?.suspend == false
            ? 'False'
            : 'True';

    return ListItemWidget(
      title: title,
      resource: resource,
      path: path,
      scope: scope,
      name: cronJob?.metadata?.name ?? '',
      namespace: cronJob?.metadata?.namespace,
      info: info,
      status: suspend == 'True' ? Status.warning : Status.success,
    );
  }
}
