import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_networking_v1_ingress.dart';
import 'package:kubenav/models/resource.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/widgets/resources/list/list_item.dart';

class IngressListItem extends StatelessWidget implements IListItemWidget {
  const IngressListItem({
    Key? key,
    required this.title,
    required this.resource,
    required this.path,
    required this.scope,
    required this.item,
    required this.additionalPrinterColumns,
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
  final List<AdditionalPrinterColumns> additionalPrinterColumns;
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
      additionalPrinterColumns: additionalPrinterColumns,
      name: ingress?.metadata?.name ?? '',
      namespace: ingress?.metadata?.namespace,
      item: item,
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
