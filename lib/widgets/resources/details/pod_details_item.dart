import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_pod.dart';
import 'package:kubenav/models/kubernetes_extensions/pod_metrics.dart';
import 'package:kubenav/models/plugins/prometheus.dart';
import 'package:kubenav/models/resource.dart';
import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/repositories/portforwarding_repository.dart';
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/resources/pods.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/resources/details/details_containers.dart';
import 'package:kubenav/widgets/resources/details/details_item.dart';
import 'package:kubenav/widgets/resources/details/details_resources_preview.dart';
import 'package:kubenav/widgets/shared/app_prometheus_charts_widget.dart';

class PodDetailsItem extends StatefulWidget implements IDetailsItemWidget {
  const PodDetailsItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  final dynamic item;

  @override
  State<PodDetailsItem> createState() => _PodDetailsItemState();
}

class _PodDetailsItemState extends State<PodDetailsItem> {
  late Future<List<ApisMetricsV1beta1PodMetricsItemContainer>>
      _futureFetchMetrics;

  Future<List<ApisMetricsV1beta1PodMetricsItemContainer>>
      _fetchMetrics() async {
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

      final pod = IoK8sApiCoreV1Pod.fromJson(widget.item);

      final url =
          '/apis/metrics.k8s.io/v1beta1/namespaces/${pod!.metadata!.namespace}/pods/${pod.metadata!.name}';

      final metricsData = await KubernetesService(
        cluster: cluster!,
        proxy: appRepository.settings.proxy,
        timeout: appRepository.settings.timeout,
      ).getRequest(url);

      Logger.log(
        'PodDetailsItem _fetchMetrics',
        'Pod metrics were returned',
        'Request URL: $url\nManifest: $metricsData',
      );

      final containerMetrics = ApisMetricsV1beta1PodMetricsItem.fromJson(
        metricsData,
      ).containers;
      if (containerMetrics != null) {
        return containerMetrics;
      }

      return [];
    } catch (err) {
      return [];
    }
  }

  Future<void> _portForward(String containerName, int containerPort) async {
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
      final pod = IoK8sApiCoreV1Pod.fromJson(widget.item);

      final cluster = await clustersRepository.getClusterWithCredentials(
        clustersRepository.activeClusterId,
      );

      await portForwardingRepository.createSession(
        cluster!,
        appRepository.settings.proxy,
        appRepository.settings.timeout,
        pod!.metadata!.name!,
        pod.metadata!.namespace!,
        containerName,
        containerPort,
      );

      if (mounted) {
        showSnackbar(
          context,
          'Port Forwarding',
          'Session was created',
        );
      }
    } catch (err) {
      showSnackbar(
        context,
        'Could not create session',
        err.toString(),
      );
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      _futureFetchMetrics = _fetchMetrics();
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ClustersRepository>(
      context,
      listen: true,
    );

    final pod = IoK8sApiCoreV1Pod.fromJson(widget.item);

    if (pod == null || pod.spec == null || pod.status == null) {
      return Container();
    }

    final ready =
        '${pod.status!.containerStatuses.where((containerStatus) => containerStatus.ready).length}/${pod.spec!.containers.length}';
    final restarts = getRestarts(pod);
    final status = getStatusText(pod);
    final ports = getPorts(pod);

    return Column(
      children: [
        DetailsItemWidget(
          title: 'Configuration',
          details: [
            DetailsItemModel(
              name: 'Priority',
              values: pod.spec!.priority ?? '-',
            ),
            DetailsItemModel(
              name: 'Node',
              values: pod.spec!.nodeName ?? '-',
            ),
            DetailsItemModel(
              name: 'Node',
              values: pod.spec!.serviceAccountName ?? '-',
            ),
            DetailsItemModel(
              name: 'Service Account',
              values: pod.spec!.serviceAccountName ?? '-',
            ),
            DetailsItemModel(
              name: 'Restart Policy',
              values: pod.spec!.restartPolicy.toString(),
            ),
            DetailsItemModel(
              name: 'Termination Grace Period Seconds',
              values: pod.spec!.terminationGracePeriodSeconds ?? '-',
            ),
            DetailsItemModel(
              name: 'Ports',
              values: ports != null
                  ? ports
                      .map((port) =>
                          '${port.containerName}: ${port.port.containerPort}${port.port.protocol != null ? '/${port.port.protocol}' : ''}${port.port.name != null ? ' (${port.port.name})' : ''}')
                      .toList()
                  : '-',
              onTap: (index) {
                if (ports != null) {
                  _portForward(
                    ports[index].containerName,
                    ports[index].port.containerPort,
                  );
                }
              },
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsItemWidget(
          title: 'Status',
          details: [
            DetailsItemModel(
              name: 'Ready',
              values: ready,
            ),
            DetailsItemModel(
              name: 'Restarts',
              values: restarts,
            ),
            DetailsItemModel(
              name: 'Status',
              values: status,
            ),
            DetailsItemModel(
              name: 'QoS',
              values: pod.status!.qosClass.toString(),
            ),
            DetailsItemModel(
              name: 'Pod IP',
              values: pod.status!.podIP ?? '-',
            ),
            DetailsItemModel(
              name: 'Host IP',
              values: pod.status!.hostIP ?? '-',
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        FutureBuilder(
          future: _futureFetchMetrics,
          builder: (
            BuildContext context,
            AsyncSnapshot<List<ApisMetricsV1beta1PodMetricsItemContainer>>
                snapshot,
          ) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return CircularProgressIndicator(
                  color: theme(context).colorPrimary,
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
          title: Resources.map['events']!.title,
          resource: Resources.map['events']!.resource,
          path: Resources.map['events']!.path,
          scope: Resources.map['events']!.scope,
          additionalPrinterColumns:
              Resources.map['events']!.additionalPrinterColumns,
          namespace: pod.metadata?.namespace,
          selector:
              'fieldSelector=involvedObject.name=${pod.metadata?.name ?? ''}',
        ),
        const SizedBox(height: Constants.spacingMiddle),
        AppPrometheusChartsWidget(
          manifest: widget.item,
          defaultCharts: [
            Chart(
              title: 'CPU Usage',
              unit: 'Cores',
              queries: [
                Query(
                  query:
                      'sum(rate(container_cpu_usage_seconds_total{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", pod="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}", container!="", container!="POD"}[2m])) by (container)',
                  label: 'Usage {{ .container }}',
                ),
                Query(
                  query:
                      'sum(kube_pod_container_resource_requests{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", pod="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}", resource="cpu", container!="", container!="POD"}) by (container)',
                  label: 'Requests {{ .container }}',
                ),
                Query(
                  query:
                      'sum(kube_pod_container_resource_limits{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", pod="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}", resource="cpu", container!="", container!="POD"}) by (container)',
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
