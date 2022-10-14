import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_networking_v1_ingress.dart';
import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/pages/resources_list/widgets/list_item_widget.dart';
import 'package:kubenav/utils/resources/general.dart';

class IngressListItemWidget extends StatelessWidget implements IListItemWidget {
  const IngressListItemWidget({
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
    final ingress = IoK8sApiNetworkingV1Ingress.fromJson(item);
    final age = getAge(ingress?.metadata?.creationTimestamp);
    final hosts = ingress?.spec?.rules.map((rule) => rule.host).toList();
    final address = ingress?.status?.loadBalancer?.ingress
        .where((e) => e.ip != null)
        .map((e) => e.ip)
        .toList();

    return ListItemWidget(
      title: title,
      resource: resource,
      path: path,
      scope: scope,
      name: ingress?.metadata?.name ?? '',
      namespace: ingress?.metadata?.namespace,
      info: [
        'Namespace: ${ingress?.metadata?.namespace ?? '-'}',
        'Hosts: ${hosts != null && hosts.isNotEmpty ? hosts.join(', ') : '-'}',
        'Address: ${address != null && address.isNotEmpty ? address.join(', ') : '-'}',
        'Age: $age',
      ],
      status:
          hosts == null || hosts.isEmpty || address == null || address.isEmpty
              ? Status.warning
              : Status.success,
    );
  }
}
