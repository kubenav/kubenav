import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:kubenav/models/kubernetes/nodelist_v1.dart';
import 'package:kubenav/models/kubernetes_extensions/node_metrics.dart';
import 'package:kubenav/models/plugins/prometheus.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/utils/themes.dart';
import 'package:kubenav/widgets/home/overview/overview_metrics.dart';
import 'package:kubenav/widgets/resources/helpers/details_item.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_conditions.dart'
    as details_item_conditions;
import 'package:kubenav/widgets/resources/helpers/details_item_metadata.dart'
    as details_item_metadata;
import 'package:kubenav/widgets/resources/helpers/details_resources_preview.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/resources/resources/resources_events.dart';
import 'package:kubenav/widgets/resources/resources/resources_pods.dart';
import 'package:kubenav/widgets/resources/resources_list.dart';
import 'package:kubenav/widgets/shared/app_prometheus_charts_widget.dart';
import 'package:kubenav/widgets/shared/app_vertical_list_simple_widget.dart';

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
    final items = NodelistV1.fromJson(parsed).items;

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
        status: !_isNodeReady(e?.status?.conditions)
            ? ResourceStatus.danger
            : e?.spec?.unschedulable == true
            ? ResourceStatus.warning
            : ResourceStatus.success,
      );
    }).toList();
  },
  decodeList: (String data) {
    final parsed = json.decode(data);
    return NodelistV1.fromJson(parsed).items;
  },
  getName: (dynamic item) {
    return (item as Item).metadata?.name ?? '';
  },
  getNamespace: (dynamic item) {
    return null;
  },
  decodeItem: (String data) {
    final parsed = json.decode(data);
    return Item.fromJson(parsed);
  },
  encodeItem: (dynamic item) {
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    return encoder.convert(item);
  },
  toJson: (dynamic item) {
    return json.decode(json.encode(item));
  },
  listItemBuilder: (BuildContext context, Resource resource, ResourceItem listItem) {
    final item = listItem.item as Item;
    final status = listItem.status;

    final nodeStatus = _getNodeStatus(item);
    final roles = item.metadata?.labels?['kubernetes.azure.com/role'] ?? '-';
    final version = item.status?.nodeInfo?.kubeletVersion ?? '-';
    final nodeAllocatableResources = _getAllocatableResources(item);

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
  previewItemBuilder: (dynamic listItem) {
    final item = listItem as Item;

    final nodeStatus = _getNodeStatus(item);
    final roles = item.metadata?.labels?['kubernetes.azure.com/role'] ?? '-';
    final version = item.status?.nodeInfo?.kubeletVersion ?? '-';

    return [
      'Status: $nodeStatus',
      'Roles: $roles',
      'Version: $version',
      'Age: ${getAge(item.metadata?.creationTimestamp)}',
    ];
  },
  detailsItemBuilder: (BuildContext context, Resource resource, dynamic detailsItem) {
    final item = detailsItem as Item;

    return Column(
      children: [
        details_item_metadata.DetailsItemMetadata(
          kind: item.kind?.name,
          metadata: details_item_metadata.Metadata(
            name: item.metadata?.name,
            namespace: item.metadata?.namespace,
            labels: item.metadata?.labels,
            annotations: item.metadata?.annotations,
            creationTimestamp: item.metadata?.creationTimestamp,
            ownerReferences: item.metadata?.ownerReferences
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
          conditions: item.status?.conditions
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
            DetailsItemModel(
              name: 'Architecture',
              values: item.status?.nodeInfo?.architecture,
            ),
            DetailsItemModel(
              name: 'Boot ID',
              values: item.status?.nodeInfo?.bootId,
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
              values: item.status?.nodeInfo?.machineId,
            ),
            DetailsItemModel(
              name: 'Operating System',
              values: item.status?.nodeInfo?.operatingSystem,
            ),
            DetailsItemModel(
              name: 'OS Image',
              values: item.status?.nodeInfo?.osImage,
            ),
            DetailsItemModel(name: 'Pod CIDR', values: item.spec?.podCidr),
            DetailsItemModel(name: 'Pod CIDRs', values: item.spec?.podCidRs),
            DetailsItemModel(
              name: 'System UUID',
              values: item.status?.nodeInfo?.systemUuid,
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
                  ?.where((condition) => condition?.status == 'True')
                  .map((condition) => condition?.type)
                  .toList(),
            ),
            DetailsItemModel(
              name: 'Addresses',
              values: item.status?.addresses
                  ?.map((address) => '${address?.type}: ${address?.address}')
                  .toList(),
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        OverviewMetrics(nodeName: item.metadata?.name),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsItem(
          title: 'Resources',
          details:
              item.status?.allocatable?.entries
                  .map(
                    (allocatable) => DetailsItemModel(
                      name: allocatable.key,
                      values: allocatable.value,
                      onTap: (index) {
                        showSnackbar(
                          context,
                          allocatable.key,
                          'Allocatable: ${allocatable.value}\nCapacity: ${item.status!.capacity != null && item.status!.capacity!.containsKey(allocatable.key) ? item.status?.capacity![allocatable.key] : '-'}',
                        );
                      },
                    ),
                  )
                  .toList() ??
              [],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        AppVerticalListSimpleWidget(
          title: 'Images',
          items:
              item.status?.images
                  ?.map(
                    (image) => AppVerticalListSimpleModel(
                      onTap: () {
                        showSnackbar(
                          context,
                          'Names',
                          image?.names?.join('\n') ?? '-',
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
                            'assets/resources/containers.svg',
                          ),
                        ),
                        const SizedBox(width: Constants.spacingSmall),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                image?.names?.firstOrNull ?? '-',
                                style: primaryTextStyle(context),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                image?.sizeBytes != null
                                    ? formatBytes(image!.sizeBytes!)
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
              unit: 'm',
              queries: [
                Query(
                  query:
                      'sum(rate(container_cpu_usage_seconds_total{node="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}", container!="", container!="POD"}[2m])) * 1000',
                  label: 'Usage',
                ),
                Query(
                  query:
                      'sum(kube_pod_container_resource_requests{node="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}", resource="cpu", container!="", container!="POD"}) * 1000',
                  label: 'Requests',
                ),
                Query(
                  query:
                      'sum(kube_pod_container_resource_limits{node="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}", resource="cpu", container!="", container!="POD"}) * 1000',
                  label: 'Limits',
                ),
                Query(
                  query:
                      'sum(kube_node_status_allocatable{node="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}", resource="cpu"}) * 1000',
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

bool _isNodeReady(List<Condition?>? conditions) {
  if (conditions == null || conditions.isEmpty) {
    return false;
  }

  for (var condition in conditions) {
    if (condition?.type == 'Ready' && condition?.status == 'True') {
      return true;
    }
  }

  return false;
}

String _getNodeStatus(Item node) {
  List<String> statuses = [];

  if (node.status?.conditions == null) {
    return 'Unknown';
  }

  for (var condition in node.status!.conditions!) {
    if (condition?.status == 'True' && condition?.type != null) {
      statuses.add(condition!.type);
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
  Item? node,
  List<ApisMetricsV1beta1NodeMetricsItem>? metrics,
) {
  try {
    if (node?.metadata == null || metrics == null || metrics.isEmpty) {
      return null;
    }

    final nodeMetricsItem = metrics
        .where((item) => item.metadata?.name == node?.metadata?.name)
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
      memory =
          memory +
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

ResourceMetrics? _getAllocatableResources(Item node) {
  if (node.status == null) {
    return null;
  }

  var cpu = 0.0;
  var memory = 0.0;

  if (node.status!.allocatable != null &&
      node.status!.allocatable!.containsKey('cpu')) {
    cpu = cpu + cpuMetricsStringToDouble(node.status!.allocatable!['cpu']!);
  }

  if (node.status!.allocatable != null &&
      node.status!.allocatable!.containsKey('memory')) {
    memory =
        memory +
        memoryMetricsStringToDouble(node.status!.allocatable!['memory']!);
  }

  return ResourceMetrics(
    cpu: formatCpuMetric(cpu),
    memory: formatMemoryMetric(memory),
  );
}
