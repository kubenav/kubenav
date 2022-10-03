import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_node.dart';
import 'package:kubenav/models/prometheus_model.dart';
import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/pages/home/widgets/metrics_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/details_resources_preview_widget.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/app_prometheus_charts_widget.dart';

class NodeDetailsItemWidget extends StatelessWidget
    implements IDetailsItemWidget {
  const NodeDetailsItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    final node = IoK8sApiCoreV1Node.fromJson(item);

    if (node == null || node.spec == null || node.status == null) {
      return Container();
    }

    return Column(
      children: [
        DetailsItemWidget(
          title: 'Configuration',
          details: [
            DetailsItemModel(
              name: 'Architecture',
              values: node.status!.nodeInfo?.architecture ?? '-',
            ),
            DetailsItemModel(
              name: 'Boot ID',
              values: node.status!.nodeInfo?.bootID ?? '-',
            ),
            DetailsItemModel(
              name: 'Container Runtime Version',
              values: node.status!.nodeInfo?.containerRuntimeVersion ?? '-',
            ),
            DetailsItemModel(
              name: 'Kernel Version',
              values: node.status!.nodeInfo?.kernelVersion ?? '-',
            ),
            DetailsItemModel(
              name: 'KubeProxy Version',
              values: node.status!.nodeInfo?.kubeProxyVersion ?? '-',
            ),
            DetailsItemModel(
              name: 'Kubelet Version',
              values: node.status!.nodeInfo?.kubeletVersion ?? '-',
            ),
            DetailsItemModel(
              name: 'Machine ID',
              values: node.status!.nodeInfo?.machineID ?? '-',
            ),
            DetailsItemModel(
              name: 'Operating System',
              values: node.status!.nodeInfo?.operatingSystem ?? '-',
            ),
            DetailsItemModel(
              name: 'OS Image',
              values: node.status!.nodeInfo?.osImage ?? '-',
            ),
            DetailsItemModel(
              name: 'Pod CIDR',
              values: node.spec!.podCIDR ?? '-',
            ),
            DetailsItemModel(
              name: 'Pod CIDRs',
              values:
                  node.spec!.podCIDRs.isNotEmpty ? node.spec!.podCIDRs : '-',
            ),
            DetailsItemModel(
              name: 'System UUID',
              values: node.status!.nodeInfo?.systemUUID ?? '-',
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsItemWidget(
          title: 'Status',
          details: [
            DetailsItemModel(
              name: 'Status',
              values: node.status!.conditions
                  .where((condition) => condition.status == 'True')
                  .map((condition) => condition.type)
                  .toList(),
            ),
            DetailsItemModel(
              name: 'Addresses',
              values: node.status!.addresses
                  .map((address) => '${address.type}: ${address.address}')
                  .toList(),
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        MetricsWidget(
          nodeName: node.metadata?.name,
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsItemWidget(
          title: 'Resources',
          details: node.status!.allocatable.entries
              .map(
                (allocatable) => DetailsItemModel(
                  name: allocatable.key,
                  values: allocatable.value,
                  onTap: (index) {
                    snackbar(allocatable.key,
                        'Allocatable: ${allocatable.value}\nCapacity: ${node.status!.capacity.containsKey(allocatable.key) ? node.status!.capacity[allocatable.key] : '-'}');
                  },
                ),
              )
              .toList(),
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreviewWidget(
          title: Resources.map['pods']!.title,
          resource: Resources.map['pods']!.resource,
          path: Resources.map['pods']!.path,
          scope: Resources.map['pods']!.scope,
          namespace: null,
          selector: 'fieldSelector=spec.nodeName=${item['metadata']['name']}',
        ),
        const SizedBox(height: Constants.spacingMiddle),
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
          defaultCharts: [
            Chart(
              title: 'CPU Usage',
              unit: 'Cores',
              queries: [
                Query(
                  query:
                      'sum(rate(container_cpu_usage_seconds_total{node="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}", container!="", container!="POD"}[2m]))',
                  label: 'Usage',
                ),
                Query(
                  query:
                      'sum(kube_pod_container_resource_requests{node="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}", resource="cpu", container!="", container!="POD"})',
                  label: 'Requests',
                ),
                Query(
                  query:
                      'sum(kube_pod_container_resource_limits{node="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}", resource="cpu", container!="", container!="POD"})',
                  label: 'Limits',
                ),
                Query(
                  query:
                      'sum(kube_node_status_allocatable{node="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}", resource="cpu"})',
                  label: 'Allocatable',
                ),
              ],
            ),
            Chart(
              title: 'Memory Usage',
              unit: 'GiB',
              queries: [
                Query(
                  query:
                      '(sum(container_memory_working_set_bytes{node="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}", container!="", container!="POD"})) / 1024 / 1024 / 1024',
                  label: 'Usage',
                ),
                Query(
                  query:
                      '(sum(kube_pod_container_resource_requests{node="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}", resource="memory", container!="", container!="POD"})) / 1024 / 1024 / 1024',
                  label: 'Requests',
                ),
                Query(
                  query:
                      '(sum(kube_pod_container_resource_limits{node="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}", resource="memory", container!="", container!="POD"})) / 1024 / 1024 / 1024',
                  label: 'Limits',
                ),
                Query(
                  query:
                      '(sum(kube_node_status_allocatable{node="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}", resource="memory"})) / 1024 / 1024 / 1024',
                  label: 'Allocatable',
                ),
              ],
            ),
            Chart(
              title: 'Pods',
              unit: '',
              queries: [
                Query(
                  query:
                      'count(kube_pod_info{node="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"})',
                  label: 'Current',
                ),
                Query(
                  query:
                      'sum(kube_node_status_allocatable{node="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}", resource="pods"})',
                  label: 'Allocatable',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
