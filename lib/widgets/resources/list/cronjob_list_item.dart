import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_batch_v1_cron_job.dart';
import 'package:kubenav/models/resource.dart';
import 'package:kubenav/utils/resources/cronjobs.dart';
import 'package:kubenav/widgets/resources/list/list_item.dart';

class CronJobListItem extends StatelessWidget implements IListItemWidget {
  const CronJobListItem({
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
      additionalPrinterColumns: additionalPrinterColumns,
      name: cronJob?.metadata?.name ?? '',
      namespace: cronJob?.metadata?.namespace,
      info: info,
      status: suspend == 'True' ? Status.warning : Status.success,
    );
  }
}
