import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_service.dart';
import 'package:kubenav/models/resource.dart';
import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/repositories/portforwarding_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/resources/details/details_item.dart';
import 'package:kubenav/widgets/resources/details/details_resources_preview.dart';
import 'package:kubenav/widgets/shared/app_prometheus_charts_widget.dart';

class ServiceDetailsItem extends StatefulWidget implements IDetailsItemWidget {
  const ServiceDetailsItem({
    super.key,
    required this.item,
  });

  @override
  final dynamic item;

  @override
  State<ServiceDetailsItem> createState() => _ServiceDetailsItemState();
}

class _ServiceDetailsItemState extends State<ServiceDetailsItem> {
  Future<void> _portForward(
    String serviceNamespace,
    String serviceSelector,
    String serviceTargetPort,
  ) async {
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: false,
    );
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: false,
    );
    PortForwardingRepository portForwardingRepository =
        Provider.of<PortForwardingRepository>(
      context,
      listen: false,
    );

    showSnackbar(
      context,
      'Port Forwarding',
      'Session is created ...',
    );

    try {
      final cluster = await clustersRepository.getClusterWithCredentials(
        clustersRepository.activeClusterId,
      );

      await portForwardingRepository.createSession(
        cluster!,
        appRepository.settings.proxy,
        appRepository.settings.timeout,
        '',
        serviceNamespace,
        '',
        0,
        serviceSelector,
        serviceTargetPort,
      );

      if (mounted) {
        showSnackbar(
          context,
          'Port Forwarding',
          'Session was created',
        );
      }
    } catch (err) {
      if (mounted) {
        showSnackbar(
          context,
          'Could not create session',
          err.toString(),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final service = IoK8sApiCoreV1Service.fromJson(widget.item);

    if (service == null || service.spec == null || service.status == null) {
      return Container();
    }

    return Column(
      children: [
        DetailsItemWidget(
          title: 'Configuration',
          details: [
            DetailsItemModel(
              name: 'Selectors',
              values: service.spec!.selector.entries
                  .map((selector) => '${selector.key}=${selector.value}')
                  .toList(),
            ),
            DetailsItemModel(
              name: 'Type',
              values: service.spec!.type ?? '-',
            ),
            DetailsItemModel(
              name: 'Ports',
              values: service.spec!.ports
                  .map(
                    (port) =>
                        '${port.port}${port.nodePort != null ? '/${port.nodePort}' : ''}${port.protocol != null ? '/${port.protocol}' : ''}${port.name != null ? ' (${port.name})' : ''} -> ${port.targetPort}',
                  )
                  .toList(),
              onTap: (index) {
                _portForward(
                  service.metadata?.namespace ?? '',
                  service.spec!.selector.entries
                      .map((selector) => '${selector.key}=${selector.value}')
                      .toList()
                      .join(','),
                  service.spec!.ports[index].targetPort.toString(),
                );
              },
            ),
            DetailsItemModel(
              name: 'Session Affinity',
              values: service.spec!.sessionAffinity ?? '-',
            ),
            DetailsItemModel(
              name: 'External Traffic Policy',
              values: service.spec!.externalTrafficPolicy ?? '-',
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsItemWidget(
          title: 'Status',
          details: [
            DetailsItemModel(
              name: 'Cluster IP',
              values: service.spec!.clusterIP ?? '-',
            ),
            DetailsItemModel(
              name: 'Cluster IPs',
              values: service.spec!.clusterIPs.isNotEmpty
                  ? service.spec!.clusterIPs
                  : '-',
            ),
            DetailsItemModel(
              name: 'External IPs',
              values: service.spec!.externalIPs.isNotEmpty
                  ? service.spec!.externalIPs
                      .map((externalIP) => externalIP)
                      .toList()
                  : '-',
            ),
            DetailsItemModel(
              name: 'External Name',
              values: service.spec!.externalName ?? '-',
            ),
            DetailsItemModel(
              name: 'Load Balancer IP',
              values: service.status!.loadBalancer != null &&
                      service.status!.loadBalancer!.ingress.isNotEmpty
                  ? service.status!.loadBalancer?.ingress
                      .map((ingress) => ingress.ip ?? '-')
                      .toList()
                  : '-',
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreview(
          title: Resources.map['pods']!.title,
          resource: Resources.map['pods']!.resource,
          path: Resources.map['pods']!.path,
          scope: Resources.map['pods']!.scope,
          additionalPrinterColumns:
              Resources.map['pods']!.additionalPrinterColumns,
          namespace: service.metadata?.namespace,
          selector: getMatchLabelsSelector(service.spec!.selector),
        ),
        DetailsResourcesPreview(
          title: Resources.map['events']!.title,
          resource: Resources.map['events']!.resource,
          path: Resources.map['events']!.path,
          scope: Resources.map['events']!.scope,
          additionalPrinterColumns:
              Resources.map['events']!.additionalPrinterColumns,
          namespace: service.metadata?.namespace,
          selector:
              'fieldSelector=involvedObject.name=${service.metadata?.name}',
        ),
        const SizedBox(height: Constants.spacingMiddle),
        AppPrometheusChartsWidget(
          manifest: widget.item,
          defaultCharts: const [],
        ),
      ],
    );
  }
}
