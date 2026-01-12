import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'package:kubenav/models/kubernetes/podlist_v1.dart' as podlistv1;
import 'package:kubenav/models/kubernetes_extensions/pod_metrics.dart';
import 'package:kubenav/models/plugins/prometheus.dart';
import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/repositories/portforwarding_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/navigate.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/utils/themes.dart';
import 'package:kubenav/widgets/resources/helpers/details_item.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_conditions.dart'
    as details_item_conditions;
import 'package:kubenav/widgets/resources/helpers/details_item_metadata.dart'
    as details_item_metadata;
import 'package:kubenav/widgets/resources/helpers/details_resources_preview.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/resources/resources/resources_events.dart';
import 'package:kubenav/widgets/resources/resources/resources_nodes.dart';
import 'package:kubenav/widgets/resources/resources_details.dart';
import 'package:kubenav/widgets/resources/resources_list.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';
import 'package:kubenav/widgets/shared/app_horizontal_list_cards_widget.dart';
import 'package:kubenav/widgets/shared/app_prometheus_charts_widget.dart';
import 'package:kubenav/widgets/shared/app_vertical_list_simple_widget.dart';

final resourcePod = Resource(
  category: ResourceCategories.workload,
  plural: 'Pods',
  singular: 'Pod',
  description:
      'Pods are the smallest deployable units of computing that you can create and manage in Kubernetes.',
  path: '/api/v1',
  resource: 'pods',
  scope: ResourceScope.namespaced,
  additionalPrinterColumns: [],
  icon: 'pods',
  template:
      '{"apiVersion":"v1","kind":"Pod","metadata":{"name":"","namespace":""},"spec":{"containers":[{"name":"nginx","image":"nginx:1.14.2"}]}}',
  decodeListData: (ResourcesListData data) {
    final parsed = json.decode(data.list);
    final items = podlistv1.PodlistV1.fromJson(parsed).items;

    List<ApisMetricsV1beta1PodMetricsItem>? metricsItems;
    if (data.metrics != null && data.metrics != '') {
      final parsedMetrics = json.decode(data.metrics!);
      metricsItems =
          ApisMetricsV1beta1PodMetricsList.fromJson(parsedMetrics).items ?? [];
    }

    return items.map((e) {
      final podDetails = _getPodDetails(e!);
      final metrics = _getMetricsForPod(e, metricsItems);

      return ResourceItem(item: e, metrics: metrics, status: podDetails.status);
    }).toList();
  },
  decodeList: (String data) {
    final parsed = json.decode(data);
    return podlistv1.PodlistV1.fromJson(parsed).items;
  },
  getName: (dynamic item) {
    return (item as podlistv1.PodlistV1Item).metadata?.name ?? '';
  },
  getNamespace: (dynamic item) {
    return (item as podlistv1.PodlistV1Item).metadata?.namespace;
  },
  decodeItem: (String data) {
    final parsed = json.decode(data);
    return podlistv1.PodlistV1Item.fromJson(parsed);
  },
  encodeItem: (dynamic item) {
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    return encoder.convert(item);
  },
  toJson: (dynamic item) {
    return json.decode(json.encode(item));
  },
  listItemBuilder:
      (BuildContext context, Resource resource, ResourceItem listItem) {
        final item = listItem.item as podlistv1.PodlistV1Item;
        final podDetails = _getPodDetails(item);
        final resourceDetails = _getResourceDetails(item, listItem.metrics);

        return ResourcesListItem(
          name: item.metadata?.name ?? '',
          namespace: item.metadata?.namespace,
          resource: resource,
          item: item,
          status: podDetails.status,
          details: [
            'Namespace: ${item.metadata?.namespace ?? '-'}',
            'Ready: ${podDetails.ready}',
            'Status: ${podDetails.statusText}',
            'Restarts: ${podDetails.restarts}',
            'Age: ${getAge(item.metadata?.creationTimestamp)}',
            'CPU: ${resourceDetails?.cpu ?? '-'}',
            'Memory: ${resourceDetails?.memory ?? '-'}',
          ],
        );
      },
  previewItemBuilder: (dynamic listItem) {
    final item = listItem as podlistv1.PodlistV1Item;
    final podDetails = _getPodDetails(item);

    return [
      'Namespace: ${item.metadata?.namespace ?? '-'}',
      'Ready: ${podDetails.ready}',
      'Status: ${podDetails.statusText}',
      'Restarts: ${podDetails.restarts}',
      'Age: ${getAge(item.metadata?.creationTimestamp)}',
    ];
  },
  detailsItemBuilder:
      (BuildContext context, Resource resource, dynamic detailsItem) {
        final item = detailsItem as podlistv1.PodlistV1Item;

        return PodItem(resource: resource, pod: item);
      },
);

class PodItem extends StatelessWidget {
  const PodItem({super.key, required this.resource, required this.pod});

  final Resource resource;
  final podlistv1.PodlistV1Item pod;

  Future<List<ApisMetricsV1beta1PodMetricsItemContainer>> _fetchMetrics(
    BuildContext context,
  ) async {
    try {
      ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
        context,
        listen: false,
      );
      AppRepository appRepository = Provider.of<AppRepository>(
        context,
        listen: false,
      );

      final cluster = await clustersRepository.getClusterWithCredentials(
        clustersRepository.activeClusterId,
      );

      final url =
          '/apis/metrics.k8s.io/v1beta1/namespaces/${pod.metadata?.namespace}/pods/${pod.metadata?.name}';

      final result = await KubernetesService(
        cluster: cluster!,
        proxy: appRepository.settings.proxy,
        timeout: appRepository.settings.timeout,
      ).getRequest(url);

      final containerMetrics = await compute(_decodeContainerMetrics, result);
      if (containerMetrics != null) {
        return containerMetrics;
      }

      return [];
    } catch (err) {
      return [];
    }
  }

  /// [_portForward] creates a port forwarding session for the provided
  /// container ([containerName]) with the provided [containerPort].
  Future<void> _portForward(
    BuildContext context,
    String containerName,
    int containerPort,
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
        pod.metadata?.name ?? '',
        pod.metadata?.namespace ?? '',
        containerName,
        containerPort,
        '',
        '',
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
    final ports = _getPorts(pod);
    final podDetails = _getPodDetails(pod);

    return Column(
      children: [
        details_item_metadata.DetailsItemMetadata(
          kind: pod.kind?.name,
          metadata: details_item_metadata.Metadata(
            name: pod.metadata?.name,
            namespace: pod.metadata?.namespace,
            labels: pod.metadata?.labels,
            annotations: pod.metadata?.annotations,
            creationTimestamp: pod.metadata?.creationTimestamp,
            ownerReferences: pod.metadata?.ownerReferences
                ?.map(
                  (ownerReference) => details_item_metadata.OwnerReference(
                    apiVersion: ownerReference?.apiVersion ?? '',
                    blockOwnerDeletion: ownerReference?.blockOwnerDeletion,
                    controller: ownerReference?.controller,
                    kind: ownerReference?.kind ?? '',
                    name: ownerReference?.name ?? '',
                    uid: ownerReference?.uid ?? '',
                  ),
                )
                .toList(),
          ),
        ),
        details_item_conditions.DetailsItemConditions(
          conditions: pod.status?.conditions
              ?.map(
                (condition) => details_item_conditions.Condition(
                  type: condition?.type ?? '',
                  status: condition?.status ?? '',
                  lastTransitionTime:
                      condition?.lastTransitionTime ?? DateTime.now(),
                  reason: condition?.reason ?? '',
                  message: condition?.message ?? '',
                ),
              )
              .toList(),
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsItem(
          title: 'Configuration',
          details: [
            DetailsItemModel(name: 'Priority', values: pod.spec?.priority),
            DetailsItemModel(
              name: 'Node',
              values: pod.spec?.nodeName,
              onTap: (index) {
                navigate(
                  context,
                  ResourcesDetails(
                    name: pod.spec?.nodeName ?? '',
                    namespace: null,
                    resource: resourceNode,
                  ),
                );
              },
            ),
            DetailsItemModel(
              name: 'Service Account',
              values: pod.spec?.serviceAccountName,
            ),
            DetailsItemModel(
              name: 'Restart Policy',
              values: pod.spec?.restartPolicy,
            ),
            DetailsItemModel(
              name: 'Termination Grace Period Seconds',
              values: pod.spec?.terminationGracePeriodSeconds,
            ),
            DetailsItemModel(
              name: 'Ports',
              values: ports != null
                  ? ports
                        .map(
                          (port) =>
                              '${port.containerName}: ${port.port.containerPort}${port.port.protocol != null ? '/${port.port.protocol}' : ''}${port.port.name != null ? ' (${port.port.name})' : ''}',
                        )
                        .toList()
                  : '-',
              onTap: (index) {
                if (ports != null) {
                  _portForward(
                    context,
                    ports[index].containerName,
                    ports[index].port.containerPort,
                  );
                }
              },
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsItem(
          title: 'Status',
          details: [
            DetailsItemModel(name: 'Ready', values: podDetails.ready),
            DetailsItemModel(name: 'Restarts', values: podDetails.restarts),
            DetailsItemModel(name: 'Status', values: podDetails.statusText),
            DetailsItemModel(name: 'QoS', values: pod.status?.qosClass),
            DetailsItemModel(name: 'Pod IP', values: pod.status?.podIp),
            DetailsItemModel(name: 'Host IP', values: pod.status?.hostIp),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        FutureBuilder(
          future: _fetchMetrics(context),
          builder:
              (
                BuildContext context,
                AsyncSnapshot<List<ApisMetricsV1beta1PodMetricsItemContainer>>
                snapshot,
              ) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.primary,
                    );
                  default:
                    return DetailsContainers(
                      initContainers: pod.spec!.initContainers,
                      containers: pod.spec!.containers,
                      initContainerStatuses: pod.status!.initContainerStatuses,
                      containerStatuses: pod.status!.containerStatuses,
                      containerMetrics: snapshot.data ?? [],
                    );
                }
              },
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreview(
          resource: resourceEvent,
          namespace: pod.metadata?.namespace,
          selector:
              'fieldSelector=involvedObject.name=${pod.metadata?.name ?? ''}',
          filter: null,
        ),
        const SizedBox(height: Constants.spacingMiddle),
        AppPrometheusChartsWidget(
          item: pod,
          toJson: resource.toJson,
          defaultCharts: [
            Chart(
              title: 'CPU Usage',
              unit: 'm',
              queries: [
                Query(
                  query:
                      '(sum(rate(container_cpu_usage_seconds_total{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", pod="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}", container!="", container!="POD"}[2m])) by (container)) * 1000',
                  label: 'Usage {{ .container }}',
                ),
                Query(
                  query:
                      '(sum(kube_pod_container_resource_requests{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", pod="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}", resource="cpu", container!="", container!="POD"}) by (container)) * 1000',
                  label: 'Requests {{ .container }}',
                ),
                Query(
                  query:
                      '(sum(kube_pod_container_resource_limits{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", pod="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}", resource="cpu", container!="", container!="POD"}) by (container)) * 1000',
                  label: 'Limits {{ .container }}',
                ),
              ],
            ),
            Chart(
              title: 'Memory Usage',
              unit: 'MiB',
              queries: [
                Query(
                  query:
                      '(sum(container_memory_working_set_bytes{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", pod="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}", container!="", container!="POD"}) by (container)) / 1024 / 1024',
                  label: 'Usage {{ .container }}',
                ),
                Query(
                  query:
                      '(sum(kube_pod_container_resource_requests{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", pod="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}", resource="memory", container!="", container!="POD"}) by (container)) / 1024 / 1024',
                  label: 'Requests {{ .container }}',
                ),
                Query(
                  query:
                      '(sum(kube_pod_container_resource_limits{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", pod="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}", resource="memory", container!="", container!="POD"}) by (container)) / 1024 / 1024',
                  label: 'Limits {{ .container }}',
                ),
              ],
            ),
            Chart(
              title: 'Network I/O',
              unit: 'MiB',
              queries: [
                Query(
                  query:
                      'sum(rate(container_network_receive_bytes_total{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", pod="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}[2m])) by (pod) / 1024 / 1024',
                  label: 'Received',
                ),
                Query(
                  query:
                      '-sum(rate(container_network_transmit_bytes_total{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", pod="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}[2m])) by (pod) / 1024 / 1024',
                  label: 'Transmitted',
                ),
              ],
            ),
            Chart(
              title: 'Restarts',
              unit: '',
              queries: [
                Query(
                  query:
                      'sum(kube_pod_container_status_restarts_total{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", pod="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}", container!="", container!="POD"}) by (container)',
                  label: '{{ .container }}',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

/// The [DetailsContainers] widget displays the containers of a Pod. The
/// [initContainers] and [containers] are displayed as
/// [AppHorizontalListCardsModel]. The [initContainerStatuses] and
/// [containerStatuses] are used to get the status of the containers. The
/// [containerMetrics] are used to get the metrics of the containers.
class DetailsContainers extends StatelessWidget {
  const DetailsContainers({
    super.key,
    required this.initContainers,
    required this.containers,
    required this.initContainerStatuses,
    required this.containerStatuses,
    required this.containerMetrics,
  });

  final List<podlistv1.Container?>? initContainers;
  final List<podlistv1.Container?> containers;
  final List<podlistv1.ContainerStatus?>? initContainerStatuses;
  final List<podlistv1.ContainerStatus?>? containerStatuses;
  final List<ApisMetricsV1beta1PodMetricsItemContainer> containerMetrics;

  List<String> _getSubtitle(
    String containerType,
    podlistv1.Container container,
  ) {
    List<podlistv1.ContainerStatus?>? status = [];
    if (containerType == 'Init Container') {
      status = initContainerStatuses
          ?.where((e) => e?.name == container.name)
          .toList();
    } else if (containerType == 'Container') {
      status = containerStatuses
          ?.where((e) => e?.name == container.name)
          .toList();
    }

    if (status == null || status.length != 1) {
      return ['Type: $containerType'];
    }

    List<ApisMetricsV1beta1PodMetricsItemContainer> filteredContainerMetrics =
        [];
    if (containerMetrics.isNotEmpty) {
      filteredContainerMetrics = containerMetrics
          .where((containerMetric) => containerMetric.name == container.name)
          .toList();
    }

    return [
      'Type: $containerType ',
      'Ready: ${status[0]!.ready ? 'True' : 'False'}',
      'Restarts: ${status[0]!.restartCount}',
      'State: ${_getContainerState(status[0]!.state)}',
      'CPU: ${filteredContainerMetrics.isNotEmpty && filteredContainerMetrics[0].usage?.cpu != null ? formatCpuMetric(cpuMetricsStringToDouble(filteredContainerMetrics[0].usage!.cpu!)) : '-'} / ${container.resources?.requests != null && container.resources!.requests!.containsKey('cpu') ? container.resources!.requests!['cpu'] : '-'} / ${container.resources?.limits != null && container.resources!.limits!.containsKey('cpu') ? container.resources!.limits!['cpu'] : '-'}',
      'Memory: ${filteredContainerMetrics.isNotEmpty && filteredContainerMetrics[0].usage?.memory != null ? formatMemoryMetric(memoryMetricsStringToDouble(filteredContainerMetrics[0].usage!.memory!)) : '-'} / ${container.resources?.requests != null && container.resources!.requests!.containsKey('memory') ? container.resources!.requests!['memory'] : '-'} / ${container.resources?.limits != null && container.resources!.limits!.containsKey('memory') ? container.resources!.limits!['memory'] : '-'}',
    ];
  }

  @override
  Widget build(BuildContext context) {
    return AppHorizontalListCardsWidget(
      title: 'Containers',
      cards: [
        ...List.generate(
          initContainers?.length ?? 0,
          (index) => AppHorizontalListCardsModel(
            title: initContainers![index]!.name,
            subtitle: _getSubtitle('Init Container', initContainers![index]!),
            image: 'assets/resources/containers.svg',
            imageFit: BoxFit.none,
            onTap: () {
              showModal(
                context,
                DetailsContainer(
                  containerType: 'Init Container',
                  container: initContainers![index],
                  initContainerStatuses: initContainerStatuses,
                  containerStatuses: containerStatuses,
                  containerMetrics: containerMetrics,
                ),
              );
            },
          ),
        ),
        ...List.generate(
          containers.length,
          (index) => AppHorizontalListCardsModel(
            title: containers[index]!.name,
            subtitle: _getSubtitle('Container', containers[index]!),
            image: 'assets/resources/containers.svg',
            imageFit: BoxFit.none,
            onTap: () {
              showModal(
                context,
                DetailsContainer(
                  containerType: 'Container',
                  container: containers[index],
                  initContainerStatuses: initContainerStatuses,
                  containerStatuses: containerStatuses,
                  containerMetrics: containerMetrics,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

/// The [DetailsContainer] widget displays the details of a container. The
/// details are containing information about the container configuration, the
/// status, the resources, the environment variables and the volume mounts.
class DetailsContainer extends StatelessWidget {
  const DetailsContainer({
    super.key,
    required this.containerType,
    required this.container,
    required this.initContainerStatuses,
    required this.containerStatuses,
    required this.containerMetrics,
  });

  final podlistv1.Container? container;
  final String containerType;
  final List<podlistv1.ContainerStatus?>? initContainerStatuses;
  final List<podlistv1.ContainerStatus?>? containerStatuses;
  final List<ApisMetricsV1beta1PodMetricsItemContainer> containerMetrics;

  List<Widget> _buildStatus() {
    List<podlistv1.ContainerStatus?>? status = [];
    if (containerType == 'Init Container') {
      status =
          initContainerStatuses
              ?.where((e) => e?.name == container?.name)
              .toList() ??
          [];
    } else if (containerType == 'Container') {
      status =
          containerStatuses
              ?.where((e) => e?.name == container?.name)
              .toList() ??
          [];
    }

    if (status.length != 1) {
      return [Container()];
    }

    return [
      DetailsItem(
        title: 'Status',
        details: [
          DetailsItemModel(
            name: 'State',
            values: _getContainerState(status[0]?.state, true),
          ),
          DetailsItemModel(
            name: 'Last State',
            values: _getContainerLastState(status[0]?.lastState, true),
          ),
          DetailsItemModel(
            name: 'Ready',
            values: status[0]!.ready ? 'True' : 'False',
          ),
          DetailsItemModel(name: 'Restarts', values: status[0]!.restartCount),
        ],
      ),
      const SizedBox(height: Constants.spacingMiddle),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final List<ApisMetricsV1beta1PodMetricsItemContainer> containerMetric =
        containerMetrics
            .where((containerMetric) => containerMetric.name == container?.name)
            .toList();

    return AppBottomSheetWidget(
      title: container?.name ?? '',
      subtitle: containerType,
      icon: 'assets/resources/containers.svg',
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Close',
      actionPressed: () {
        Navigator.pop(context);
      },
      actionIsLoading: false,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: Constants.spacingMiddle),
          child: Column(
            children: [
              DetailsItem(
                title: 'Configuration',
                details: [
                  DetailsItemModel(
                    name: 'Image',
                    values: container?.image ?? '-',
                  ),
                  DetailsItemModel(
                    name: 'Image Pull Policy',
                    values: container?.imagePullPolicy != null
                        ? podlistv1.pullPolicyValues.reverse[container!
                              .imagePullPolicy]
                        : '-',
                  ),
                  DetailsItemModel(
                    name: 'Command',
                    values:
                        container?.command != null &&
                            container!.command!.isNotEmpty
                        ? container!.command
                        : '-',
                  ),
                  DetailsItemModel(
                    name: 'Arguments',
                    values:
                        container?.args != null && container!.args!.isNotEmpty
                        ? container!.args
                        : '-',
                  ),
                  DetailsItemModel(
                    name: 'Ports',
                    values:
                        container?.ports != null && container!.ports!.isNotEmpty
                        ? container!.ports
                              ?.map(
                                (port) =>
                                    '${port?.containerPort}${port?.hostPort != null ? '/${port?.hostPort}' : ''}${port?.protocol != null ? '/${port?.protocol}' : ''}${port?.name != null ? ' (${port?.name})' : ''}',
                              )
                              .toList()
                        : '-',
                  ),
                  DetailsItemModel(
                    name: 'Readiness Probe',
                    values: container?.readinessProbe != null
                        ? _getProbe(container!.readinessProbe!)
                        : '-',
                  ),
                  DetailsItemModel(
                    name: 'Liveness Probe',
                    values: container?.livenessProbe != null
                        ? _getProbe(container!.livenessProbe!)
                        : '-',
                  ),
                  DetailsItemModel(
                    name: 'Startup Probe',
                    values: container?.startupProbe != null
                        ? _getProbe(container!.startupProbe!)
                        : '-',
                  ),
                ],
              ),
              const SizedBox(height: Constants.spacingMiddle),
              ..._buildStatus(),
              DetailsItem(
                title: 'Resources',
                details: [
                  DetailsItemModel(
                    name: 'CPU Usage',
                    values:
                        containerMetric.isNotEmpty &&
                            containerMetric[0].usage?.cpu != null
                        ? formatCpuMetric(
                            cpuMetricsStringToDouble(
                              containerMetric[0].usage!.cpu!,
                            ),
                          )
                        : '-',
                  ),
                  DetailsItemModel(
                    name: 'CPU Requests',
                    values:
                        container?.resources?.requests != null &&
                            container!.resources!.requests!.containsKey('cpu')
                        ? container!.resources!.requests!['cpu']
                        : '-',
                  ),
                  DetailsItemModel(
                    name: 'CPU Limits',
                    values:
                        container?.resources?.limits != null &&
                            container!.resources!.limits!.containsKey('cpu')
                        ? container!.resources!.limits!['cpu']
                        : '-',
                  ),
                  DetailsItemModel(
                    name: 'Memory Usage',
                    values:
                        containerMetric.isNotEmpty &&
                            containerMetric[0].usage?.memory != null
                        ? formatMemoryMetric(
                            memoryMetricsStringToDouble(
                              containerMetric[0].usage!.memory!,
                            ),
                          )
                        : '-',
                  ),
                  DetailsItemModel(
                    name: 'Memory Requests',
                    values:
                        container?.resources?.requests != null &&
                            container!.resources!.requests!.containsKey(
                              'memory',
                            )
                        ? container!.resources!.requests!['memory']
                        : '-',
                  ),
                  DetailsItemModel(
                    name: 'Memory Limits',
                    values:
                        container?.resources?.limits != null &&
                            container!.resources!.limits!.containsKey('memory')
                        ? container!.resources!.limits!['memory']
                        : '-',
                  ),
                ],
              ),
              const SizedBox(height: Constants.spacingMiddle),
              AppVerticalListSimpleWidget(
                title: 'Environment Variables',
                items:
                    container?.env
                        ?.map(
                          (env) => AppVerticalListSimpleModel(
                            onTap: () {
                              showSnackbar(
                                context,
                                env?.name ?? '',
                                env?.value != null
                                    ? env!.value!
                                    : env?.valueFrom != null
                                    ? _getValueFrom(env!.valueFrom!)
                                    : '-',
                              );
                            },
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(Constants.sizeBorderRadius),
                                  ),
                                ),
                                height: 54,
                                width: 54,
                                padding: const EdgeInsets.all(
                                  Constants.spacingIcon54x54,
                                ),
                                child: SvgPicture.asset(
                                  'assets/resources/secrets.svg',
                                ),
                              ),
                              const SizedBox(width: Constants.spacingSmall),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      env?.name ?? '',
                                      style: primaryTextStyle(context),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      env?.value != null
                                          ? env!.value!
                                          : env?.valueFrom != null
                                          ? _getValueFrom(env!.valueFrom!)
                                          : '-',
                                      style: secondaryTextStyle(context),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: Constants.spacingSmall),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Theme.of(context)
                                    .extension<CustomColors>()!
                                    .textSecondary
                                    .withValues(alpha: Constants.opacityIcon),
                                size: 24,
                              ),
                            ],
                          ),
                        )
                        .toList() ??
                    [],
              ),
              const SizedBox(height: Constants.spacingMiddle),
              AppVerticalListSimpleWidget(
                title: 'Volume Mounts',
                items:
                    container?.volumeMounts
                        ?.map(
                          (volumeMount) => AppVerticalListSimpleModel(
                            onTap: () {
                              showSnackbar(
                                context,
                                volumeMount?.name ?? '',
                                'Path: ${volumeMount?.mountPath}\nSub-Path: ${volumeMount?.subPath ?? '-'}\nReadonly: ${volumeMount?.readOnly == true ? 'True' : 'False'}',
                              );
                            },
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(Constants.sizeBorderRadius),
                                  ),
                                ),
                                height: 54,
                                width: 54,
                                padding: const EdgeInsets.all(
                                  Constants.spacingIcon54x54,
                                ),
                                child: SvgPicture.asset(
                                  'assets/resources/persistentvolumes.svg',
                                ),
                              ),
                              const SizedBox(width: Constants.spacingSmall),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      volumeMount?.name ?? '',
                                      style: primaryTextStyle(context),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      volumeMount?.mountPath ?? '',
                                      style: secondaryTextStyle(context),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: Constants.spacingSmall),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Theme.of(context)
                                    .extension<CustomColors>()!
                                    .textSecondary
                                    .withValues(alpha: Constants.opacityIcon),
                                size: 24,
                              ),
                            ],
                          ),
                        )
                        .toList() ??
                    [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// [_decodeContainerMetrics] decodes the result of the Kubernetes API request
/// to get the metrics of a Pod. The result is a list of
/// [ApisMetricsV1beta1PodMetricsItemContainer].
List<ApisMetricsV1beta1PodMetricsItemContainer>? _decodeContainerMetrics(
  String result,
) {
  final parsed = json.decode(result);
  return ApisMetricsV1beta1PodMetricsItem.fromJson(parsed).containers;
}

/// [PodContainerPort] represents a single port of a Pod. It contains the name
/// of the container ([containerName]) where the port is used and the [port]
/// specification. [port] is [podlistv1.ContainerPort] or
/// [podlistv1.InitContainerPort].
class PodContainerPort {
  String containerName;
  dynamic port;

  PodContainerPort({required this.containerName, required this.port});
}

/// [_getPorts] returns a list of ports for all init containers, containers and
/// ephemeral containers of a [pod]. The returned list is of the type
/// `PodContainerPort`, so that we know to which container relates to which
/// port.
List<PodContainerPort>? _getPorts(podlistv1.PodlistV1Item pod) {
  final List<PodContainerPort> ports = [];

  if (pod.spec!.initContainers != null) {
    for (var container in pod.spec!.initContainers!) {
      if (container?.ports != null) {
        for (var port in container!.ports!) {
          ports.add(
            PodContainerPort(containerName: container.name, port: port),
          );
        }
      }
    }
  }

  for (var container in pod.spec!.containers) {
    if (container?.ports != null) {
      for (var port in container!.ports!) {
        ports.add(PodContainerPort(containerName: container.name, port: port));
      }
    }
  }

  if (ports.isEmpty) {
    return null;
  }

  return ports;
}

/// [PodDetails] contains the details of a Pod. The [ready] field contains the
/// number of ready containers and the number of should ready containers. The
/// [statusText] field contains the status of the Pod. The [restarts] field
/// contains the number of restarts of the Pod. The [status] field contains the
/// status of the Pod.
class PodDetails {
  String ready;
  String statusText;
  String restarts;
  ResourceStatus status;

  PodDetails({
    required this.ready,
    required this.statusText,
    required this.restarts,
    required this.status,
  });
}

/// [_getPodDetails] returns the details of a Pod as [PodDetails].
PodDetails _getPodDetails(podlistv1.PodlistV1Item pod) {
  int shouldReady = 0;
  int isReady = 0;
  int restarts = 0;
  bool restartsWithinLast24Hours = false;

  if (pod.status?.containerStatuses == null) {
    return PodDetails(
      ready: '-',
      statusText: '-',
      restarts: '-',
      status: ResourceStatus.undefined,
    );
  }

  if (pod.status!.containerStatuses != null) {
    for (var containerStatus in pod.status!.containerStatuses!) {
      shouldReady++;
      if (containerStatus!.ready) {
        isReady++;
      }

      restarts += containerStatus.restartCount;

      if (containerStatus.lastState != null &&
          containerStatus.lastState!.terminated != null &&
          containerStatus.lastState!.terminated!.exitCode != 0 &&
          containerStatus.lastState!.terminated!.finishedAt != null &&
          DateTime.now()
                  .difference(
                    containerStatus.lastState!.terminated!.finishedAt!,
                  )
                  .inHours <=
              24) {
        restartsWithinLast24Hours = true;
      }
    }
  }

  final status = _getPodStatus(pod);
  final isHealhty = _isPodHealthy(pod);

  return PodDetails(
    ready: '$isReady/$shouldReady',
    statusText: status,
    restarts: '$restarts',
    status: isHealhty == false
        ? ResourceStatus.danger
        : (shouldReady != isReady &&
                  (status != 'Completed' && status != 'Succeeded')) ||
              (restarts > 0 && restartsWithinLast24Hours)
        ? ResourceStatus.warning
        : ResourceStatus.success,
  );
}

/// [_getPodStatus] returns the status of a Pod as a string. The status is
/// determined by the phase of the Pod and the status of the containers.
String _getPodStatus(podlistv1.PodlistV1Item pod) {
  switch (pod.status?.phase) {
    case podlistv1.Phase.SUCCEEDED:
      if (pod.status!.containerStatuses != null) {
        for (var status in pod.status!.containerStatuses!) {
          if (status?.state?.terminated != null) {
            return status?.state?.terminated?.reason ?? pod.status!.phase!.name;
          }
        }
      }
      break;
    case podlistv1.Phase.FAILED:
      if (pod.status!.conditions != null) {
        for (var condition in pod.status!.conditions!) {
          if (condition?.type == 'Initialized' &&
              condition?.status == 'False') {
            return 'Init:Error';
          }
        }
      }
      if (pod.status!.containerStatuses != null) {
        for (var status in pod.status!.containerStatuses!) {
          if (status?.state?.terminated != null) {
            return status?.state?.terminated?.reason ?? pod.status!.phase!.name;
          }
        }
      }
      break;
    case podlistv1.Phase.RUNNING:
    case podlistv1.Phase.PENDING:
      if (pod.status!.containerStatuses != null) {
        for (var status in pod.status!.containerStatuses!) {
          if (status?.state?.waiting != null) {
            return status?.state?.waiting?.reason ?? pod.status!.phase!.name;
          }
        }
      }
      break;
    default:
      if (pod.metadata?.deletionTimestamp != null &&
          pod.metadata?.deletionTimestamp?.millisecondsSinceEpoch != 0) {
        return 'Terminating';
      }
  }

  return pod.status?.phase?.name ?? '-';
}

/// [_isPodWaitingContainers] returns true if a Pod has waiting containers.
bool _isPodWaitingContainers(podlistv1.PodlistV1Item pod) {
  if (pod.status!.containerStatuses != null) {
    for (var status in pod.status!.containerStatuses!) {
      if (status?.state?.waiting != null) {
        return true;
      }
    }
  }
  return false;
}

/// [_isPodHealthy] returns true if a Pod is healthy. A Pod is healthy if all
/// containers are running and the Pod is in the state 'Running'.
bool _isPodHealthy(podlistv1.PodlistV1Item pod) {
  switch (pod.status?.phase) {
    case podlistv1.Phase.SUCCEEDED:
      if (pod.status!.containerStatuses != null) {
        for (var status in pod.status!.containerStatuses!) {
          if (status?.state?.terminated != null &&
              status?.state?.terminated?.exitCode != 0) {
            return false;
          }
        }
      }
      break;
    case podlistv1.Phase.PENDING:
      if (_isPodWaitingContainers(pod)) {
        return false;
      }
      break;
    case podlistv1.Phase.RUNNING:
      if (pod.status!.conditions != null) {
        for (var condition in pod.status!.conditions!) {
          if (condition?.status == 'False') {
            return false;
          }
        }
      }
      if (_isPodWaitingContainers(pod)) {
        return false;
      }
      break;
    default:
      return false;
  }

  return true;
}

/// [_getResourceDetails] returns a formatted string with the CPU and Memory
/// usage, requests and limits. The metrics are formatted as
/// `usage / requests / limits`.
ResourceMetrics? _getResourceDetails(
  podlistv1.PodlistV1Item pod,
  ResourceMetrics? usage,
) {
  try {
    var cpuRequests = 0.0;
    var cpuLimits = 0.0;
    var memoryRequests = 0.0;
    var memoryLimits = 0.0;

    for (var i = 0; i < pod.spec!.containers.length; i++) {
      if (pod.spec!.containers[i]?.resources?.requests != null) {
        if (pod.spec!.containers[i]!.resources!.requests!.containsKey('cpu')) {
          cpuRequests =
              cpuRequests +
              cpuMetricsStringToDouble(
                pod.spec!.containers[i]!.resources!.requests!['cpu']!,
              );
        }

        if (pod.spec!.containers[i]!.resources!.requests!.containsKey(
          'memory',
        )) {
          memoryRequests =
              memoryRequests +
              memoryMetricsStringToDouble(
                pod.spec!.containers[i]!.resources!.requests!['memory']!,
              );
        }
      }

      if (pod.spec!.containers[i]?.resources?.limits != null) {
        if (pod.spec!.containers[i]!.resources!.limits!.containsKey('cpu')) {
          cpuLimits =
              cpuLimits +
              cpuMetricsStringToDouble(
                pod.spec!.containers[i]!.resources!.limits!['cpu']!,
              );
        }

        if (pod.spec!.containers[i]!.resources!.limits!.containsKey('memory')) {
          memoryLimits =
              memoryLimits +
              memoryMetricsStringToDouble(
                pod.spec!.containers[i]!.resources!.limits!['memory']!,
              );
        }
      }
    }

    return ResourceMetrics(
      cpu:
          '${usage?.cpu ?? '-'} / ${cpuRequests == 0 ? '-' : formatCpuMetric(cpuRequests)} / ${cpuLimits == 0 ? '-' : formatCpuMetric(cpuLimits)}',
      memory:
          '${usage?.memory ?? '-'} / ${memoryRequests == 0 ? '-' : formatMemoryMetric(memoryRequests)} / ${memoryLimits == 0 ? '-' : formatMemoryMetric(memoryLimits)}',
    );
  } catch (err) {
    return null;
  }
}

/// [_getMetricsForPod] returns the metrics for a Pod as [ResourceMetrics] from
/// the [metrics] list. The returned metrics can then be used within the
/// [ResourceItem] and the `_getResourceDetails`.
ResourceMetrics? _getMetricsForPod(
  podlistv1.PodlistV1Item pod,
  List<ApisMetricsV1beta1PodMetricsItem>? metrics,
) {
  try {
    if (pod.metadata == null || metrics == null || metrics.isEmpty) {
      return null;
    }

    final podMetricsItem = metrics
        .where(
          (item) =>
              item.metadata?.name == pod.metadata!.name &&
              item.metadata?.namespace == pod.metadata!.namespace,
        )
        .toList();

    if (podMetricsItem.length != 1 ||
        podMetricsItem[0].containers == null ||
        podMetricsItem[0].containers!.isEmpty) {
      return null;
    }

    var cpu = 0.0;
    var memory = 0.0;

    for (var i = 0; i < podMetricsItem[0].containers!.length; i++) {
      if (podMetricsItem[0].containers![i].usage != null) {
        if (podMetricsItem[0].containers![i].usage!.cpu != null) {
          cpu =
              cpu +
              cpuMetricsStringToDouble(
                podMetricsItem[0].containers![i].usage!.cpu!,
              );
        }

        if (podMetricsItem[0].containers![i].usage!.memory != null) {
          memory =
              memory +
              memoryMetricsStringToDouble(
                podMetricsItem[0].containers![i].usage!.memory!,
              );
        }
      }
    }

    return ResourceMetrics(
      cpu: formatCpuMetric(cpu),
      memory: formatMemoryMetric(memory),
    );
  } catch (err) {
    return null;
  }
}

String _getContainerState(
  podlistv1.ContainerStatusState? state, [
  bool detailed = false,
]) {
  if (state == null) {
    return '-';
  }

  if (state.waiting != null) {
    if (detailed) {
      return 'Waiting: ${state.waiting!.reason ?? '-'} / ${state.waiting!.message ?? '-'}';
    }

    return state.waiting!.reason ?? 'Waiting';
  }

  if (state.terminated != null) {
    if (detailed) {
      return 'Terminated with ${state.terminated!.exitCode} at ${formatTime(state.terminated?.finishedAt)}: ${state.terminated!.reason ?? '-'} / ${state.terminated!.message ?? '-'}';
    }

    return state.terminated!.reason ?? 'Terminated';
  }

  if (state.running != null) {
    if (detailed) {
      return 'Running since ${formatTime(state.running?.startedAt)}';
    }

    return 'Running';
  }

  return '-';
}

String _getContainerLastState(
  podlistv1.ContainerStatusLastState? state, [
  bool detailed = false,
]) {
  if (state == null) {
    return '-';
  }

  if (state.waiting != null) {
    if (detailed) {
      return 'Waiting: ${state.waiting!.reason ?? '-'} / ${state.waiting!.message ?? '-'}';
    }

    return state.waiting!.reason ?? 'Waiting';
  }

  if (state.terminated != null) {
    if (detailed) {
      return 'Terminated with ${state.terminated!.exitCode} at ${formatTime(state.terminated?.finishedAt)}: ${state.terminated!.reason ?? '-'} / ${state.terminated!.message ?? '-'}';
    }

    return state.terminated!.reason ?? 'Terminated';
  }

  if (state.running != null) {
    if (detailed) {
      return 'Running since ${formatTime(state.running?.startedAt)}';
    }

    return 'Running';
  }

  return '-';
}

List<String> _getProbe(dynamic probe) {
  final List<String> list = [];

  if (probe.exec != null) {
    list.add(probe.exec!.command.join(', '));
  }

  if (probe.httpGet != null) {
    list.add(
      '${probe.httpGet!.scheme?.toLowerCase()}://${probe.httpGet!.host ?? 'localhost'}:${probe.httpGet!.port}${probe.httpGet!.path}',
    );
  }

  if (probe.initialDelaySeconds != null) {
    list.add('delay=${probe.initialDelaySeconds}s');
  }

  if (probe.timeoutSeconds != null) {
    list.add('timeout=${probe.timeoutSeconds}s');
  }

  if (probe.periodSeconds != null) {
    list.add('period=${probe.periodSeconds}s');
  }

  if (probe.successThreshold != null) {
    list.add('#success=${probe.successThreshold}');
  }

  if (probe.failureThreshold != null) {
    list.add('#failure=${probe.failureThreshold}');
  }

  return list;
}

String _getValueFrom(podlistv1.PurpleValueFrom valueFrom) {
  if (valueFrom.configMapKeyRef != null) {
    return 'configMapKeyRef(${valueFrom.configMapKeyRef!.name}: ${valueFrom.configMapKeyRef!.key})';
  }

  if (valueFrom.fieldRef != null) {
    return 'fieldRef(${valueFrom.fieldRef!.apiVersion}: ${valueFrom.fieldRef!.fieldPath})';
  }

  if (valueFrom.resourceFieldRef != null) {
    return 'secretKeyRef(${valueFrom.resourceFieldRef!.containerName}: ${valueFrom.resourceFieldRef!.resource})';
  }

  if (valueFrom.secretKeyRef != null) {
    return 'secretKeyRef(${valueFrom.secretKeyRef!.name}: ${valueFrom.secretKeyRef!.key})';
  }

  return '-';
}
