import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_rbac_v1_role_binding.dart';
import 'package:kubenav/models/resource.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/widgets/resources/list/list_item.dart';

class RoleBindingListItem extends StatelessWidget implements IListItemWidget {
  const RoleBindingListItem({
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
    final roleBinding = IoK8sApiRbacV1RoleBinding.fromJson(item);
    final age = getAge(roleBinding?.metadata?.creationTimestamp);
    final role =
        '${roleBinding?.roleRef.kind ?? '-'}/${roleBinding?.roleRef.name ?? '-'}';

    return ListItemWidget(
      title: title,
      resource: resource,
      path: path,
      scope: scope,
      name: roleBinding?.metadata?.name ?? '',
      namespace: roleBinding?.metadata?.namespace,
      info: [
        'Namespace: ${roleBinding?.metadata?.namespace ?? '-'}',
        'Role: $role',
        'Age: $age',
      ],
    );
  }
}
