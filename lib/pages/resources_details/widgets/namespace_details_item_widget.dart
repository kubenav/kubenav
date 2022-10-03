import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_namespace.dart';
import 'package:kubenav/models/prometheus_model.dart';
import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/pages/resources_details/widgets/details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/details_resources_preview_widget.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/widgets/app_prometheus_charts_widget.dart';

class NamespaceDetailsItemWidget extends StatelessWidget
    implements IDetailsItemWidget {
  const NamespaceDetailsItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    final namespace = IoK8sApiCoreV1Namespace.fromJson(item);

    if (namespace == null) {
      return Container();
    }

    return Column(
      children: [
        DetailsItemWidget(
          title: 'Status',
          details: [
            DetailsItemModel(
              name: 'Phase',
              values:
                  namespace.status != null && namespace.status!.phase != null
                      ? namespace.status!.phase!.value
                      : '-',
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreviewWidget(
          title: Resources.map['cronjobs']!.title,
          resource: Resources.map['cronjobs']!.resource,
          path: Resources.map['cronjobs']!.path,
          scope: Resources.map['cronjobs']!.scope,
          namespace: item['metadata']['name'],
          selector: '',
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreviewWidget(
          title: Resources.map['deployments']!.title,
          resource: Resources.map['deployments']!.resource,
          path: Resources.map['deployments']!.path,
          scope: Resources.map['deployments']!.scope,
          namespace: item['metadata']['name'],
          selector: '',
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreviewWidget(
          title: Resources.map['pods']!.title,
          resource: Resources.map['pods']!.resource,
          path: Resources.map['pods']!.path,
          scope: Resources.map['pods']!.scope,
          namespace: item['metadata']['name'],
          selector: '',
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreviewWidget(
          title: Resources.map['statefulsets']!.title,
          resource: Resources.map['statefulsets']!.resource,
          path: Resources.map['statefulsets']!.path,
          scope: Resources.map['statefulsets']!.scope,
          namespace: item['metadata']['name'],
          selector: '',
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreviewWidget(
          title: Resources.map['events']!.title,
          resource: Resources.map['events']!.resource,
          path: Resources.map['events']!.path,
          scope: Resources.map['events']!.scope,
          namespace: item['metadata']['name'],
          selector:
              'fieldSelector=involvedObject.name=${item['metadata']['name']}',
        ),
        const SizedBox(height: Constants.spacingMiddle),
        AppPrometheusChartsWidget(
          manifest: item,
          defaultCharts: [
            Chart(
              title: 'Total CPU Usage',
              unit: 'Cores',
              queries: [
                Query(
                  query:
                      'sum(rate(container_cpu_usage_seconds_total{namespace="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}", container!="", container!="POD"}[2m]))',
                  label: 'Usage',
                ),
                Query(
                  query:
                      'sum(kube_pod_container_resource_requests{namespace="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}", resource="cpu", container!="", container!="POD"})',
                  label: 'Requests',
                ),
                Query(
                  query:
                      'sum(kube_pod_container_resource_limits{namespace="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}", resource="cpu", container!="", container!="POD"})',
                  label: 'Limits',
                ),
              ],
            ),
            Chart(
              title: 'Total Memory Usage',
              unit: 'MiB',
              queries: [
                Query(
                  query:
                      '(sum(container_memory_working_set_bytes{namespace="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}", container!="", container!="POD"})) / 1024 / 1024',
                  label: 'Usage',
                ),
                Query(
                  query:
                      '(sum(kube_pod_container_resource_requests{namespace="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}", resource="memory", container!="", container!="POD"})) / 1024 / 1024',
                  label: 'Requests',
                ),
                Query(
                  query:
                      '(sum(kube_pod_container_resource_limits{namespace="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}", resource="memory", container!="", container!="POD"})) / 1024 / 1024',
                  label: 'Limits',
                ),
              ],
            ),
            Chart(
              title: 'Total Network I/O',
              unit: 'MiB',
              queries: [
                Query(
                  query:
                      'sum(rate(container_network_receive_bytes_total{namespace="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}[2m])) / 1024 / 1024',
                  label: 'Received',
                ),
                Query(
                  query:
                      '-sum(rate(container_network_transmit_bytes_total{namespace="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}[2m])) / 1024 / 1024',
                  label: 'Transmitted',
                ),
              ],
            ),
            Chart(
              title: 'Total Restarts',
              unit: '',
              queries: [
                Query(
                  query:
                      'sum(kube_pod_container_status_restarts_total{namespace="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}", container!="", container!="POD"}) by (pod)',
                  label: 'Restarts',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
