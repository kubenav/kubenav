import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_config_map.dart';
import 'package:kubenav/models/resource.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/widgets/resources/list/list_item.dart';

class ConfigMapListItem extends StatelessWidget implements IListItemWidget {
  const ConfigMapListItem({
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
    final configMap = IoK8sApiCoreV1ConfigMap.fromJson(item);
    final age = getAge(configMap?.metadata?.creationTimestamp);
    final data = configMap?.data.entries.length ?? 0;

    return ListItemWidget(
      title: title,
      resource: resource,
      path: path,
      scope: scope,
      additionalPrinterColumns: additionalPrinterColumns,
      name: configMap?.metadata?.name ?? '',
      namespace: configMap?.metadata?.namespace,
      item: item,
      info: [
        'Namespace: ${configMap?.metadata?.namespace ?? '-'}',
        'Data: $data',
        'Age: $age',
      ],
    );
  }
}
