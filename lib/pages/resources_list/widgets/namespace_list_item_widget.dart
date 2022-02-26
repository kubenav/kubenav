import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/api.dart'
    show IoK8sApiCoreV1Namespace;
import 'package:kubenav/pages/resources_list/widgets/list_item_widget.dart';
import 'package:kubenav/utils/resources/general.dart';

class NamespaceListItemWidget extends StatelessWidget
    implements IListItemWidget {
  const NamespaceListItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    final namespace = IoK8sApiCoreV1Namespace.fromJson(item);
    final age = getAge(namespace?.metadata?.creationTimestamp);
    final status = namespace?.status?.phase ?? '-';

    return ListItemWidget(
      name: namespace?.metadata?.name ?? '',
      namespace: null,
      info: 'Status: $status \nAge: $age',
    );
  }
}
