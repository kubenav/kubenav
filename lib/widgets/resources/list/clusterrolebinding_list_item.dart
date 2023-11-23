import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_rbac_v1_cluster_role_binding.dart';
import 'package:kubenav/models/resource.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/widgets/resources/list/list_item.dart';

class ClusterRoleBindingListItem extends StatelessWidget
    implements IListItemWidget {
  const ClusterRoleBindingListItem({
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
    final clusterRoleBinding = IoK8sApiRbacV1ClusterRoleBinding.fromJson(item);
    final age = getAge(clusterRoleBinding?.metadata?.creationTimestamp);
    final role =
        '${clusterRoleBinding?.roleRef.kind ?? '-'}/${clusterRoleBinding?.roleRef.name ?? '-'}';

    return ListItemWidget(
      title: title,
      resource: resource,
      path: path,
      scope: scope,
      additionalPrinterColumns: additionalPrinterColumns,
      name: clusterRoleBinding?.metadata?.name ?? '',
      namespace: null,
      item: item,
      info: [
        'Role: $role',
        'Age: $age',
      ],
    );
  }
}
