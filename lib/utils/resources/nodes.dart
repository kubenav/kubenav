import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_node.dart';
import 'package:kubenav/models/kubernetes_extensions/node_metrics.dart';
import 'package:kubenav/utils/resources/general.dart';

class NodeMetrics {
  String cpu;
  String memory;

  NodeMetrics({
    required this.cpu,
    required this.memory,
  });
}

NodeMetrics? getMetricsFromList(IoK8sApiCoreV1Node? node, dynamic metrics) {
  try {
    if (node == null || node.metadata == null || metrics == null) {
      return null;
    }

    final nodeMetricsList = ApisMetricsV1beta1NodeMetricsList.fromJson(metrics);
    if (nodeMetricsList.items == null || nodeMetricsList.items!.isEmpty) {
      return null;
    }

    final nodeMetricsItem = nodeMetricsList.items!
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

    return NodeMetrics(
      cpu: formatCpuMetric(cpu),
      memory: formatMemoryMetric(memory),
    );
  } catch (err) {
    return null;
  }
}

NodeMetrics? getAllocatableResources(IoK8sApiCoreV1Node? node) {
  if (node == null || node.status == null) {
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

  return NodeMetrics(
    cpu: formatCpuMetric(cpu),
    memory: formatMemoryMetric(memory),
  );
}
