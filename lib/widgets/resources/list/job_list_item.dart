import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_batch_v1_job.dart';
import 'package:kubenav/models/resource.dart';
import 'package:kubenav/utils/resources/jobs.dart';
import 'package:kubenav/widgets/resources/list/list_item.dart';

class JobListItem extends StatelessWidget implements IListItemWidget {
  const JobListItem({
    super.key,
    required this.title,
    required this.resource,
    required this.path,
    required this.scope,
    required this.item,
    required this.additionalPrinterColumns,
  });

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
    final job = IoK8sApiBatchV1Job.fromJson(item);
    final completions = job?.spec?.completions ?? 0;
    final succeeded = job?.status?.succeeded ?? 0;
    final info = buildInfoText(job);

    return ListItemWidget(
      title: title,
      resource: resource,
      path: path,
      scope: scope,
      additionalPrinterColumns: additionalPrinterColumns,
      name: job?.metadata?.name ?? '',
      namespace: job?.metadata?.namespace,
      item: item,
      info: info,
      status: completions != 0 && completions != succeeded
          ? Status.danger
          : Status.success,
    );
  }
}
