import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_namespace.dart';
import 'package:kubenav/models/plugins/prometheus.dart';
import 'package:kubenav/models/resource.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/widgets/resources/details/details_item.dart';
import 'package:kubenav/widgets/resources/details/details_resources_preview.dart';
import 'package:kubenav/widgets/shared/app_prometheus_charts_widget.dart';

class NamespaceDetailsItem extends StatelessWidget
    implements IDetailsItemWidget {
  const NamespaceDetailsItem({
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
                      ? namespace.status!.phase
                      : '-',
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreview(
          title: Resources.map['cronjobs']!.title,
          resource: Resources.map['cronjobs']!.resource,
          path: Resources.map['cronjobs']!.path,
          scope: Resources.map['cronjobs']!.scope,
          additionalPrinterColumns:
              Resources.map['cronjobs']!.additionalPrinterColumns,
          namespace: item['metadata']['name'],
          selector: '',
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreview(
          title: Resources.map['deployments']!.title,
          resource: Resources.map['deployments']!.resource,
          path: Resources.map['deployments']!.path,
          scope: Resources.map['deployments']!.scope,
          additionalPrinterColumns:
              Resources.map['deployments']!.additionalPrinterColumns,
          namespace: item['metadata']['name'],
          selector: '',
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreview(
          title: Resources.map['pods']!.title,
          resource: Resources.map['pods']!.resource,
          path: Resources.map['pods']!.path,
          scope: Resources.map['pods']!.scope,
          additionalPrinterColumns:
              Resources.map['pods']!.additionalPrinterColumns,
          namespace: item['metadata']['name'],
          selector: '',
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreview(
          title: Resources.map['statefulsets']!.title,
          resource: Resources.map['statefulsets']!.resource,
          path: Resources.map['statefulsets']!.path,
          scope: Resources.map['statefulsets']!.scope,
          additionalPrinterColumns:
              Resources.map['statefulsets']!.additionalPrinterColumns,
          namespace: item['metadata']['name'],
          selector: '',
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreview(
          title: Resources.map['events']!.title,
          resource: Resources.map['events']!.resource,
          path: Resources.map['events']!.path,
          scope: Resources.map['events']!.scope,
          additionalPrinterColumns:
              Resources.map['events']!.additionalPrinterColumns,
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
