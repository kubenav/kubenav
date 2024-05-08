import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_node.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_node_condition.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_node_list.dart';
import 'package:kubenav/models/kubernetes/io_k8s_apimachinery_pkg_apis_meta_v1_condition.dart';
import 'package:kubenav/models/kubernetes_extensions/node_metrics.dart';
import 'package:kubenav/models/plugins/prometheus.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/home/overview/overview_metrics.dart';
import 'package:kubenav/widgets/resources/helpers/details_item.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_conditions.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_metadata.dart';
import 'package:kubenav/widgets/resources/helpers/details_resources_preview.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/resources/resources/resources_events.dart';
import 'package:kubenav/widgets/resources/resources/resources_pods.dart';
import 'package:kubenav/widgets/resources/resources_list.dart';
import 'package:kubenav/widgets/shared/app_prometheus_charts_widget.dart';

final resourceNode = Resource(
  category: ResourceCategories.cluster,
  plural: 'Nodes',
  singular: 'Node',
  description:
      'A node may be a virtual or physical machine, depending on the cluster.',
  path: '/api/v1',
  resource: 'nodes',
  scope: ResourceScope.cluster,
  additionalPrinterColumns: [],
  icon: 'nodes',
  template: resourceDefaultTemplate,
  decodeListData: (ResourcesListData data) {
    final parsed = json.decode(data.list);
    final items = IoK8sApiCoreV1NodeList.fromJson(parsed)?.items ?? [];

    List<ApisMetricsV1beta1NodeMetricsItem>? metricsItems;
    if (data.metrics != null && data.metrics != '') {
      final parsedMetrics = json.decode(data.metrics!);
      metricsItems =
          ApisMetricsV1beta1NodeMetricsList.fromJson(parsedMetrics).items ?? [];
    }

    return items.map((e) {
      final metrics = _getMetricsForNode(e, metricsItems);

      return ResourceItem(
        item: e,
        metrics: metrics,
        status: !_isNodeReady(e.status!.conditions)
            ? ResourceStatus.danger
            : e.spec!.unschedulable == true
                ? ResourceStatus.warning
                : ResourceStatus.success,
      );
    }).toList();
  },
  decodeList: (String data) {
    final parsed = json.decode(data);
    return IoK8sApiCoreV1NodeList.fromJson(parsed)?.items ?? [];
  },
  getName: (dynamic item) {
    return (item as IoK8sApiCoreV1Node).metadata?.name ?? '';
  },
  getNamespace: (dynamic item) {
    return null;
  },
  decodeItem: (String data) {
    final parsed = json.decode(data);
    return IoK8sApiCoreV1Node.fromJson(parsed);
  },
  encodeItem: (dynamic item) {
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    return encoder.convert(item);
  },
  toJson: (dynamic item) {
    return json.decode(json.encode(item));
  },
  listItemBuilder: (
    BuildContext context,
    Resource resource,
    ResourceItem listItem,
  ) {
    final item = listItem.item as IoK8sApiCoreV1Node;
    final status = listItem.status;

    final nodeStatus = _getNodeStatus(item);
    final roles = item.metadata?.labels['kubernetes.azure.com/role'] ?? '-';
    final version = item.status?.nodeInfo?.kubeletVersion ?? '-';
    final nodeAllocatableResources = getAllocatableResources(item);

    return ResourcesListItem(
      name: item.metadata?.name ?? '',
      namespace: item.metadata?.namespace,
      resource: resource,
      item: item,
      status: status,
      details: [
        'Status: $nodeStatus',
        'Roles: $roles',
        'Version: $version',
        'Age: ${getAge(item.metadata?.creationTimestamp)}',
        'CPU: ${listItem.metrics?.cpu ?? '-'} / ${nodeAllocatableResources?.cpu ?? '-'}',
        'Memory: ${listItem.metrics?.memory ?? '-'} / ${nodeAllocatableResources?.memory ?? '-'}',
      ],
    );
  },
  previewItemBuilder: (
    dynamic listItem,
  ) {
    final item = listItem as IoK8sApiCoreV1Node;

    final nodeStatus = _getNodeStatus(item);
    final roles = item.metadata?.labels['kubernetes.azure.com/role'] ?? '-';
    final version = item.status?.nodeInfo?.kubeletVersion ?? '-';

    return [
      'Status: $nodeStatus',
      'Roles: $roles',
      'Version: $version',
      'Age: ${getAge(item.metadata?.creationTimestamp)}',
    ];
  },
  detailsItemBuilder: (
    BuildContext context,
    Resource resource,
    dynamic detailsItem,
  ) {
    final item = detailsItem as IoK8sApiCoreV1Node;

    return Column(
      children: [
        DetailsItemMetadata(metadata: item.metadata),
        DetailsItemConditions(
          conditions: item.status?.conditions
              .map(
                (e) => IoK8sApimachineryPkgApisMetaV1Condition(
                  lastTransitionTime: e.lastTransitionTime ?? DateTime.now(),
                  message: e.message ?? '',
                  observedGeneration: null,
                  reason: e.reason ?? '',
                  status: e.status,
                  type: e.type,
                ),
              )
              .toList(),
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsItem(
          title: 'Configuration',
          details: [
            DetailsItemModel(
              name: 'Architecture',
              values: item.status?.nodeInfo?.architecture,
            ),
            DetailsItemModel(
              name: 'Boot ID',
              values: item.status?.nodeInfo?.bootID,
            ),
            DetailsItemModel(
              name: 'Container Runtime Version',
              values: item.status?.nodeInfo?.containerRuntimeVersion,
            ),
            DetailsItemModel(
              name: 'Kernel Version',
              values: item.status?.nodeInfo?.kernelVersion,
            ),
            DetailsItemModel(
              name: 'KubeProxy Version',
              values: item.status?.nodeInfo?.kubeProxyVersion,
            ),
            DetailsItemModel(
              name: 'Kubelet Version',
              values: item.status?.nodeInfo?.kubeletVersion,
            ),
            DetailsItemModel(
              name: 'Machine ID',
              values: item.status?.nodeInfo?.machineID,
            ),
            DetailsItemModel(
              name: 'Operating System',
              values: item.status?.nodeInfo?.operatingSystem,
            ),
            DetailsItemModel(
              name: 'OS Image',
              values: item.status?.nodeInfo?.osImage,
            ),
            DetailsItemModel(
              name: 'Pod CIDR',
              values: item.spec?.podCIDR,
            ),
            DetailsItemModel(
              name: 'Pod CIDRs',
              values: item.spec?.podCIDRs,
            ),
            DetailsItemModel(
              name: 'System UUID',
              values: item.status?.nodeInfo?.systemUUID,
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsItem(
          title: 'Status',
          details: [
            DetailsItemModel(
              name: 'Status',
              values: item.status?.conditions
                  .where((condition) => condition.status == 'True')
                  .map((condition) => condition.type)
                  .toList(),
            ),
            DetailsItemModel(
              name: 'Addresses',
              values: item.status?.addresses
                  .map((address) => '${address.type}: ${address.address}')
                  .toList(),
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        OverviewMetrics(
          nodeName: item.metadata?.name,
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsItem(
          title: 'Resources',
          details: item.status?.allocatable.entries
                  .map(
                    (allocatable) => DetailsItemModel(
                      name: allocatable.key,
                      values: allocatable.value,
                      onTap: (index) {
                        showSnackbar(
                          context,
                          allocatable.key,
                          'Allocatable: ${allocatable.value}\nCapacity: ${item.status!.capacity.containsKey(allocatable.key) ? item.status?.capacity[allocatable.key] : '-'}',
                        );
                      },
                    ),
                  )
                  .toList() ??
              [],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreview(
          resource: resourcePod,
          namespace: null,
          selector: 'fieldSelector=spec.nodeName=${item.metadata?.name}',
          filter: null,
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreview(
          resource: resourceEvent,
          namespace: item.metadata?.namespace,
          selector:
              'fieldSelector=involvedObject.name=${item.metadata?.name ?? ''}',
          filter: null,
        ),
        const SizedBox(height: Constants.spacingMiddle),
        AppPrometheusChartsWidget(
          item: item,
          toJson: resource.toJson,
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
  },
);

bool _isNodeReady(List<IoK8sApiCoreV1NodeCondition> conditions) {
  for (var condition in conditions) {
    if (condition.type == 'Ready' && condition.status == 'True') {
      return true;
    }
  }

  return false;
}

String _getNodeStatus(IoK8sApiCoreV1Node node) {
  List<String> statuses = [];

  for (var condition in node.status!.conditions) {
    if (condition.status == 'True') {
      statuses.add(condition.type);
    }
  }

  if (statuses.isEmpty) {
    if (node.spec!.unschedulable == true) {
      return 'NotReady,SchedulingDisabled';
    }

    return 'NotReady';
  }

  if (node.spec!.unschedulable == true) {
    statuses.add('SchedulingDisabled');
  }

  return statuses.join(',');
}

ResourceMetrics? _getMetricsForNode(
  IoK8sApiCoreV1Node node,
  List<ApisMetricsV1beta1NodeMetricsItem>? metrics,
) {
  try {
    if (node.metadata == null || metrics == null || metrics.isEmpty) {
      return null;
    }

    final nodeMetricsItem = metrics
        .where((item) => item.metadata?.name == node.metadata!.name)
        .toList();

    if (nodeMetricsItem.length != 1 || nodeMetricsItem[0].usage == null) {
      return null;
    }

    var cpu = 0.0;
    var memory = 0.0;

    if (nodeMetricsItem[0].usage!.cpu != null) {
      cpu = cpu + cpuMetricsStringToDouble(nodeMetricsItem[0].usage!.cpu!);
    }

    if (nodeMetricsItem[0].usage!.memory != null) {
      memory = memory +
          memoryMetricsStringToDouble(nodeMetricsItem[0].usage!.memory!);
    }

    return ResourceMetrics(
      cpu: formatCpuMetric(cpu),
      memory: formatMemoryMetric(memory),
    );
  } catch (err) {
    return null;
  }
}

ResourceMetrics? getAllocatableResources(IoK8sApiCoreV1Node node) {
  if (node.status == null) {
    return null;
  }

  var cpu = 0.0;
  var memory = 0.0;

  if (node.status!.allocatable.containsKey('cpu')) {
    cpu = cpu + cpuMetricsStringToDouble(node.status!.allocatable['cpu']!);
  }

  if (node.status!.allocatable.containsKey('memory')) {
    memory = memory +
        memoryMetricsStringToDouble(node.status!.allocatable['memory']!);
  }

  return ResourceMetrics(
    cpu: formatCpuMetric(cpu),
    memory: formatMemoryMetric(memory),
  );
}
