import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_namespace.dart';
import 'package:kubenav/models/resource.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/widgets/resources/list/list_item.dart';

class NamespaceListItem extends StatelessWidget implements IListItemWidget {
  const NamespaceListItem({
    Key? key,
    required this.title,
    required this.resource,
    required this.path,
    required this.scope,
    required this.item,
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
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    final namespace = IoK8sApiCoreV1Namespace.fromJson(item);
    final age = getAge(namespace?.metadata?.creationTimestamp);
    final status = namespace?.status?.phase ?? '-';

    return ListItemWidget(
      title: title,
      resource: resource,
      path: path,
      scope: scope,
      name: namespace?.metadata?.name ?? '',
      namespace: null,
      info: [
        'Status: $status',
        'Age: $age',
      ],
    );
  }
}
