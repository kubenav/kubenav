import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/api.dart'
    show IoK8sApiCoreV1ConfigMap;
import 'package:kubenav/pages/resources_list/widgets/list_item_widget.dart';
import 'package:kubenav/utils/resources/general.dart';

class ConfigMapListItemWidget extends StatelessWidget
    implements IListItemWidget {
  const ConfigMapListItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    final configMap = IoK8sApiCoreV1ConfigMap.fromJson(item);
    final age = getAge(configMap?.metadata?.creationTimestamp);
    final data = configMap?.data.entries.length ?? 0;

    return ListItemWidget(
      name: configMap?.metadata?.name ?? '',
      namespace: configMap?.metadata?.namespace,
      info:
          'Namespace: ${configMap?.metadata?.namespace ?? '-'} \nData: $data \nAge: $age',
    );
  }
}
