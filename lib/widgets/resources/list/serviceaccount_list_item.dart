import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_service_account.dart';
import 'package:kubenav/models/resource.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/widgets/resources/list/list_item.dart';

class ServiceAccountListItem extends StatelessWidget
    implements IListItemWidget {
  const ServiceAccountListItem({
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
    final sa = IoK8sApiCoreV1ServiceAccount.fromJson(item);
    final age = getAge(sa?.metadata?.creationTimestamp);
    final secrets = sa?.secrets.length ?? 0;

    return ListItemWidget(
      title: title,
      resource: resource,
      path: path,
      scope: scope,
      additionalPrinterColumns: additionalPrinterColumns,
      name: sa?.metadata?.name ?? '',
      namespace: sa?.metadata?.namespace,
      item: item,
      info: [
        'Namespace: ${sa?.metadata?.namespace ?? '-'}',
        'Secrets: $secrets',
        'Age: $age',
      ],
    );
  }
}
