import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_service.dart';
import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/pages/resources_details/widgets/details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/details_resources_preview_widget.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/widgets/app_prometheus_charts_widget.dart';

class ServiceDetailsItemWidget extends StatelessWidget
    implements IDetailsItemWidget {
  const ServiceDetailsItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    final service = IoK8sApiCoreV1Service.fromJson(item);

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
                  .map((port) =>
                      '${port.port}${port.nodePort != null ? '/${port.nodePort}' : ''}${port.protocol != null ? '/${port.protocol}' : ''}${port.name != null ? ' (${port.name})' : ''} -> ${port.targetPort}')
                  .toList(),
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
        DetailsResourcesPreviewWidget(
          title: Resources.map['pods']!.title,
          resource: Resources.map['pods']!.resource,
          path: Resources.map['pods']!.path,
          scope: Resources.map['pods']!.scope,
          namespace: item['metadata']['namespace'],
          selector: getMatchLabelsSelector(service.spec!.selector),
        ),
        DetailsResourcesPreviewWidget(
          title: Resources.map['events']!.title,
          resource: Resources.map['events']!.resource,
          path: Resources.map['events']!.path,
          scope: Resources.map['events']!.scope,
          namespace: item['metadata']['namespace'],
          selector:
              'fieldSelector=involvedObject.name=${item['metadata']['name']}',
        ),
        const SizedBox(height: Constants.spacingMiddle),
        AppPrometheusChartsWidget(
          manifest: item,
          defaultCharts: const [],
        ),
      ],
    );
  }
}
