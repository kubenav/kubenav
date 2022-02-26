import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/api.dart'
    show IoK8sApiNetworkingV1Ingress;
import 'package:kubenav/pages/resources_list/widgets/list_item_widget.dart';
import 'package:kubenav/utils/resources/general.dart';

class IngressListItemWidget extends StatelessWidget implements IListItemWidget {
  const IngressListItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

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
      name: ingress?.metadata?.name ?? '',
      namespace: ingress?.metadata?.namespace,
      info:
          'Namespace: ${ingress?.metadata?.namespace ?? '-'} \nHosts: ${hosts != null && hosts.isNotEmpty ? hosts.join(', ') : '-'} \nAddress: ${address != null && address.isNotEmpty ? address.join(', ') : '-'} \nAge: $age',
      status:
          hosts == null || hosts.isEmpty || address == null || address.isEmpty
              ? Status.warning
              : Status.success,
    );
  }
}
