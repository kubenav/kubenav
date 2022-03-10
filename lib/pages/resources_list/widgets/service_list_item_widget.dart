import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_service.dart';
import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/pages/resources_list/widgets/list_item_widget.dart';
import 'package:kubenav/utils/resources/general.dart';

class ServiceListItemWidget extends StatelessWidget implements IListItemWidget {
  const ServiceListItemWidget({
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
    final service = IoK8sApiCoreV1Service.fromJson(item);
    final age = getAge(service?.metadata?.creationTimestamp);
    final type = service?.spec?.type?.value ?? '-';
    final clusterIP = service?.spec?.clusterIP ?? '-';
    final externalIP = service?.status?.loadBalancer?.ingress
        .map((ingress) => ingress.ip)
        .toList();
    final ports = service?.spec?.ports
        .map((port) =>
            '${port.port}${port.protocol != null ? '/${port.protocol!.value}' : ''} (${port.name ?? ''}${port.appProtocol != null ? '/${port.appProtocol}' : ''})')
        .toList();

    return ListItemWidget(
      title: title,
      resource: resource,
      path: path,
      scope: scope,
      name: service?.metadata?.name ?? '',
      namespace: service?.metadata?.namespace,
      info:
          'Namespace: ${service?.metadata?.namespace ?? '-'} \nType: $type \nCluster IP: $clusterIP \nExternal IP: ${externalIP != null && externalIP.isNotEmpty ? externalIP.join(', ') : '-'} \nPort(s): ${ports != null && ports.isNotEmpty ? ports.join(', ') : '-'} \nAge: $age',
    );
  }
}
