import 'package:flutter/material.dart';

import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/models/kubernetes/api.dart'
    show IoK8sApiCoreV1Endpoints;
import 'package:kubenav/pages/resources_list/widgets/list_item_widget.dart';
import 'package:kubenav/utils/resources/general.dart';

class EndpoinstListItemWidget extends StatelessWidget
    implements IListItemWidget {
  const EndpoinstListItemWidget({
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
    final endpoints = IoK8sApiCoreV1Endpoints.fromJson(item);
    final age = getAge(endpoints?.metadata?.creationTimestamp);
    final ips = endpoints?.subsets
        .map((subset) => subset.addresses.map((address) => address.ip).toList())
        .expand((e) => e)
        .toList();

    return ListItemWidget(
      title: title,
      resource: resource,
      path: path,
      scope: scope,
      name: endpoints?.metadata?.name ?? '',
      namespace: endpoints?.metadata?.namespace,
      info:
          'Namespace: ${endpoints?.metadata?.namespace ?? '-'} \nEndpoints: ${ips != null && ips.isNotEmpty ? ips.join(', ') : '-'} \nAge: $age',
      status: ips != null && ips.isNotEmpty ? Status.success : Status.warning,
    );
  }
}
