import 'package:flutter/material.dart';

import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/models/kubernetes/api.dart'
    show IoK8sApiCoreV1ServiceAccount;
import 'package:kubenav/pages/resources_list/widgets/list_item_widget.dart';
import 'package:kubenav/utils/resources/general.dart';

class ServiceAccountListItemWidget extends StatelessWidget
    implements IListItemWidget {
  const ServiceAccountListItemWidget({
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
    final sa = IoK8sApiCoreV1ServiceAccount.fromJson(item);
    final age = getAge(sa?.metadata?.creationTimestamp);
    final secrets = sa?.secrets.length ?? 0;

    return ListItemWidget(
      title: title,
      resource: resource,
      path: path,
      scope: scope,
      name: sa?.metadata?.name ?? '',
      namespace: sa?.metadata?.namespace,
      info:
          'Namespace: ${sa?.metadata?.namespace ?? '-'} \nSecrets: $secrets \nAge: $age',
    );
  }
}
