import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_config_map.dart';
import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/pages/resources_list/widgets/list_item_widget.dart';
import 'package:kubenav/utils/resources/general.dart';

class ConfigMapListItemWidget extends StatelessWidget
    implements IListItemWidget {
  const ConfigMapListItemWidget({
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
    final configMap = IoK8sApiCoreV1ConfigMap.fromJson(item);
    final age = getAge(configMap?.metadata?.creationTimestamp);
    final data = configMap?.data.entries.length ?? 0;

    return ListItemWidget(
      title: title,
      resource: resource,
      path: path,
      scope: scope,
      name: configMap?.metadata?.name ?? '',
      namespace: configMap?.metadata?.namespace,
      info:
          'Namespace: ${configMap?.metadata?.namespace ?? '-'} \nData: $data \nAge: $age',
    );
  }
}
