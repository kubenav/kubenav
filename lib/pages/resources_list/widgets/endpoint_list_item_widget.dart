import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_endpoints.dart';
import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/pages/resources_list/widgets/list_item_widget.dart';
import 'package:kubenav/utils/resources/general.dart';

class EndpointListItemWidget extends StatelessWidget
    implements IListItemWidget {
  const EndpointListItemWidget({
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
    final endpoint = IoK8sApiCoreV1Endpoints.fromJson(item);
    final age = getAge(endpoint?.metadata?.creationTimestamp);
    final ips = endpoint?.subsets
        .map((subset) => subset.addresses.map((address) => address.ip).toList())
        .expand((e) => e)
        .toList();

    return ListItemWidget(
      title: title,
      resource: resource,
      path: path,
      scope: scope,
      name: endpoint?.metadata?.name ?? '',
      namespace: endpoint?.metadata?.namespace,
      info: [
        'Namespace: ${endpoint?.metadata?.namespace ?? '-'}',
        'Endpoints: ${ips != null && ips.isNotEmpty ? ips.join(', ') : '-'}',
        'Age: $age',
      ],
      status: ips != null && ips.isNotEmpty ? Status.success : Status.warning,
    );
  }
}
