import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_service.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_service_list.dart';
import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/repositories/portforwarding_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/resources/helpers/details_item.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_conditions.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_metadata.dart';
import 'package:kubenav/widgets/resources/helpers/details_resources_preview.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/resources/resources/resources_events.dart';
import 'package:kubenav/widgets/resources/resources/resources_pods.dart';
import 'package:kubenav/widgets/resources/resources_list.dart';
import 'package:kubenav/widgets/shared/app_prometheus_charts_widget.dart';

final resourceService = Resource(
  category: ResourceCategories.discoveryandloadbalancing,
  plural: 'Services',
  singular: 'Service',
  description:
      'An abstract way to expose an application running on a set of Pods as a network service.',
  path: '/api/v1',
  resource: 'services',
  scope: ResourceScope.namespaced,
  additionalPrinterColumns: [],
  icon: 'services',
  template: resourceDefaultTemplate,
  decodeListData: (ResourcesListData data) {
    final parsed = json.decode(data.list);
    final items = IoK8sApiCoreV1ServiceList.fromJson(parsed)?.items ?? [];

    return items
        .map(
          (e) => ResourceItem(
            item: e,
            metrics: null,
            status: ResourceStatus.undefined,
          ),
        )
        .toList();
  },
  decodeList: (String data) {
    final parsed = json.decode(data);
    return IoK8sApiCoreV1ServiceList.fromJson(parsed)?.items ?? [];
  },
  getName: (dynamic item) {
    return (item as IoK8sApiCoreV1Service).metadata?.name ?? '';
  },
  getNamespace: (dynamic item) {
    return (item as IoK8sApiCoreV1Service).metadata?.namespace;
  },
  decodeItem: (String data) {
    final parsed = json.decode(data);
    return IoK8sApiCoreV1Service.fromJson(parsed);
  },
  encodeItem: (dynamic item) {
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    return encoder.convert(item);
  },
  toJson: (dynamic item) {
    return json.decode(json.encode(item));
  },
  listItemBuilder: (BuildContext context, Resource resource, ResourceItem listItem) {
    final item = listItem.item as IoK8sApiCoreV1Service;
    final status = listItem.status;

    final externalIP = item.status?.loadBalancer?.ingress
        .map((ingress) => ingress.ip)
        .toList();
    final ports = item.spec?.ports
        .map(
          (port) =>
              '${port.port}${port.protocol != null ? '/${port.protocol}' : ''} (${port.name ?? ''}${port.appProtocol != null ? '/${port.appProtocol}' : ''})',
        )
        .toList();

    return ResourcesListItem(
      name: item.metadata?.name ?? '',
      namespace: item.metadata?.namespace,
      resource: resource,
      item: item,
      status: status,
      details: [
        'Namespace: ${item.metadata?.namespace ?? '-'}',
        'Type: ${item.spec?.type ?? '-'}',
        'Cluster IP: ${item.spec?.clusterIP ?? '-'}',
        'External IP: ${externalIP != null && externalIP.isNotEmpty ? externalIP.join(', ') : '-'}',
        'Port(s): ${ports != null && ports.isNotEmpty ? ports.join(', ') : '-'}',
        'Age: ${getAge(item.metadata?.creationTimestamp)}',
      ],
    );
  },
  previewItemBuilder: (dynamic listItem) {
    final item = listItem as IoK8sApiCoreV1Service;

    final externalIP = item.status?.loadBalancer?.ingress
        .map((ingress) => ingress.ip)
        .toList();
    final ports = item.spec?.ports
        .map(
          (port) =>
              '${port.port}${port.protocol != null ? '/${port.protocol}' : ''} (${port.name ?? ''}${port.appProtocol != null ? '/${port.appProtocol}' : ''})',
        )
        .toList();

    return [
      'Namespace: ${item.metadata?.namespace ?? '-'}',
      'Type: ${item.spec?.type ?? '-'}',
      'Cluster IP: ${item.spec?.clusterIP ?? '-'}',
      'External IP: ${externalIP != null && externalIP.isNotEmpty ? externalIP.join(', ') : '-'}',
      'Port(s): ${ports != null && ports.isNotEmpty ? ports.join(', ') : '-'}',
      'Age: ${getAge(item.metadata?.creationTimestamp)}',
    ];
  },
  detailsItemBuilder:
      (BuildContext context, Resource resource, dynamic detailsItem) {
        final item = detailsItem as IoK8sApiCoreV1Service;

        return ServiceItem(resource: resource, service: item);
      },
);

class ServiceItem extends StatelessWidget {
  const ServiceItem({super.key, required this.resource, required this.service});

  final Resource resource;
  final IoK8sApiCoreV1Service service;

  Future<void> _portForward(
    BuildContext context,
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
        Provider.of<PortForwardingRepository>(context, listen: false);

    showSnackbar(context, 'Port Forwarding', 'Create Session ...');

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

      if (context.mounted) {
        showSnackbar(context, 'Port Forwarding', 'Session Created');
      }
    } catch (err) {
      if (context.mounted) {
        showSnackbar(
          context,
          'Failed to Create Port Forwarding Session',
          err.toString(),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DetailsItemMetadata(kind: service.kind, metadata: service.metadata),
        DetailsItemConditions(conditions: service.status?.conditions),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsItem(
          title: 'Configuration',
          details: [
            DetailsItemModel(
              name: 'Selectors',
              values: service.spec?.selector.entries
                  .map((selector) => '${selector.key}=${selector.value}')
                  .toList(),
            ),
            DetailsItemModel(name: 'Type', values: service.spec?.type),
            DetailsItemModel(
              name: 'Ports',
              values: service.spec?.ports
                  .map(
                    (port) =>
                        '${port.port}${port.nodePort != null ? '/${port.nodePort}' : ''}${port.protocol != null ? '/${port.protocol}' : ''}${port.name != null ? ' (${port.name})' : ''} -> ${port.targetPort}',
                  )
                  .toList(),
              onTap: (index) {
                _portForward(
                  context,
                  service.metadata?.namespace ?? '',
                  service.spec?.selector.entries
                          .map(
                            (selector) => '${selector.key}=${selector.value}',
                          )
                          .toList()
                          .join(',') ??
                      '',
                  service.spec?.ports[index].targetPort.toString() ?? '',
                );
              },
            ),
            DetailsItemModel(
              name: 'Session Affinity',
              values: service.spec?.sessionAffinity,
            ),
            DetailsItemModel(
              name: 'External Traffic Policy',
              values: service.spec?.externalTrafficPolicy,
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsItem(
          title: 'Status',
          details: [
            DetailsItemModel(
              name: 'Cluster IP',
              values: service.spec?.clusterIP,
            ),
            DetailsItemModel(
              name: 'Cluster IPs',
              values: service.spec?.clusterIPs,
            ),
            DetailsItemModel(
              name: 'External IPs',
              values: service.spec?.externalIPs
                  .map((externalIP) => externalIP)
                  .toList(),
            ),
            DetailsItemModel(
              name: 'External Name',
              values: service.spec?.externalName,
            ),
            DetailsItemModel(
              name: 'Load Balancer IP',
              values: service.status!.loadBalancer?.ingress
                  .map((ingress) => ingress.ip ?? '-')
                  .toList(),
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreview(
          resource: resourcePod,
          namespace: service.metadata?.namespace,
          selector: getMatchLabelsSelector(service.spec!.selector),
          filter: null,
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreview(
          resource: resourceEvent,
          namespace: service.metadata?.namespace,
          selector:
              'fieldSelector=involvedObject.name=${service.metadata?.name ?? ''}',
          filter: null,
        ),
        const SizedBox(height: Constants.spacingMiddle),
        AppPrometheusChartsWidget(
          item: service,
          toJson: resource.toJson,
          defaultCharts: const [],
        ),
      ],
    );
  }
}
