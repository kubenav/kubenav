import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_service.dart';
import 'package:kubenav/models/resource.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/widgets/resources/list/list_item.dart';

class ServiceListItem extends StatelessWidget implements IListItemWidget {
  const ServiceListItem({
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
    final service = IoK8sApiCoreV1Service.fromJson(item);
    final age = getAge(service?.metadata?.creationTimestamp);
    final type = service?.spec?.type ?? '-';
    final clusterIP = service?.spec?.clusterIP ?? '-';
    final externalIP = service?.status?.loadBalancer?.ingress
        .map((ingress) => ingress.ip)
        .toList();
    final ports = service?.spec?.ports
        .map((port) =>
            '${port.port}${port.protocol != null ? '/${port.protocol}' : ''} (${port.name ?? ''}${port.appProtocol != null ? '/${port.appProtocol}' : ''})')
        .toList();

    return ListItemWidget(
      title: title,
      resource: resource,
      path: path,
      scope: scope,
      additionalPrinterColumns: additionalPrinterColumns,
      name: service?.metadata?.name ?? '',
      namespace: service?.metadata?.namespace,
      info: [
        'Namespace: ${service?.metadata?.namespace ?? '-'}',
        'Type: $type',
        'Cluster IP: $clusterIP',
        'External IP: ${externalIP != null && externalIP.isNotEmpty ? externalIP.join(', ') : '-'}',
        'Port(s): ${ports != null && ports.isNotEmpty ? ports.join(', ') : '-'}',
        'Age: $age',
      ],
    );
  }
}
