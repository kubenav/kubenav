import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/api.dart'
    show IoK8sApiCoreV1ServiceAccount;
import 'package:kubenav/pages/resources_list/widgets/list_item_widget.dart';
import 'package:kubenav/utils/resources/general.dart';

class ServiceAccountListItemWidget extends StatelessWidget
    implements IListItemWidget {
  const ServiceAccountListItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    final sa = IoK8sApiCoreV1ServiceAccount.fromJson(item);
    final age = getAge(sa?.metadata?.creationTimestamp);
    final secrets = sa?.secrets.length ?? 0;

    return ListItemWidget(
      name: sa?.metadata?.name ?? '',
      namespace: sa?.metadata?.namespace,
      info:
          'Namespace: ${sa?.metadata?.namespace ?? '-'} \nSecrets: $secrets \nAge: $age',
    );
  }
}
