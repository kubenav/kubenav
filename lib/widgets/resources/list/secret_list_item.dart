import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_secret.dart';
import 'package:kubenav/models/resource.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/widgets/resources/list/list_item.dart';

class SecretListItem extends StatelessWidget implements IListItemWidget {
  const SecretListItem({
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
    int desiredHealthy,
    int currentHealthy,
  ) {
    if (desiredHealthy == 0) {
      return Status.warning;
    }

    if (currentHealthy < desiredHealthy) {
      return Status.danger;
    }

    return Status.success;
  }

  @override
  Widget build(BuildContext context) {
    final secret = IoK8sApiCoreV1Secret.fromJson(item);
    final age = getAge(secret?.metadata?.creationTimestamp);
    final type = secret?.type ?? '-';
    final data = secret?.data.entries.length ?? 0;

    return ListItemWidget(
      title: title,
      resource: resource,
      path: path,
      scope: scope,
      additionalPrinterColumns: additionalPrinterColumns,
      name: secret?.metadata?.name ?? '',
      namespace: secret?.metadata?.namespace,
      info: [
        'Namespace: ${secret?.metadata?.namespace ?? '-'}',
        'Type: $type',
        'Data: $data',
        'Age: $age',
      ],
    );
  }
}
