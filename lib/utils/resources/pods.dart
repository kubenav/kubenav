import 'package:kubenav/models/kubernetes-extensions/pod_metrics.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_container_port.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_container_state.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_env_var_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_pod.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_probe.dart';
import 'package:kubenav/pages/resources_list/widgets/list_item_widget.dart';
import 'package:kubenav/utils/resources/general.dart';

/// [getRestarts] returns the number of container restarts for a [pod]. The number of restarts is the sum of all restarts
/// from the init conatainers and containers.
int getRestarts(IoK8sApiCoreV1Pod? pod) {
  final containerRestarts = pod?.status?.containerStatuses != null &&
          pod!.status!.containerStatuses.isNotEmpty
      ? pod.status?.containerStatuses
          .map((containerStatus) => containerStatus.restartCount)
          .reduce(
              (restartCount1, restartCount2) => restartCount1 + restartCount2)
      : 0;

  final initContainerRestarts = pod?.status?.initContainerStatuses != null &&
          pod!.status!.initContainerStatuses.isNotEmpty
      ? pod.status?.initContainerStatuses
          .map((containerStatus) => containerStatus.restartCount)
          .reduce(
              (restartCount1, restartCount2) => restartCount1 + restartCount2)
      : 0;

  if (containerRestarts != null && initContainerRestarts != null) {
    return containerRestarts + initContainerRestarts;
  }

  if (containerRestarts != null) {
    return containerRestarts;
  }

  if (initContainerRestarts != null) {
    return initContainerRestarts;
  }

  return 0;
}

String getStatusText(IoK8sApiCoreV1Pod? pod) {
  if (pod == null) {
    return '-';
  }

  final phase = pod.status?.phase?.value ?? 'Unknown';
  var reason = pod.status?.reason ?? '';

  if (pod.status?.containerStatuses != null) {
    for (var container in pod.status!.containerStatuses) {
      if (container.state?.waiting != null) {
        reason = container.state!.waiting!.reason ?? '';
        break;
      }

      if (container.state?.terminated != null) {
        reason = container.state!.terminated!.reason ?? '';
        break;
      }
    }
  }

  if (reason != '') {
    return reason;
  }

  return reason != '' ? reason : phase;
}

String getContainerState(
  IoK8sApiCoreV1ContainerState? state, [
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

Status getStatus(IoK8sApiCoreV1Pod? pod) {
  if (pod == null) {
    return Status.warning;
  }

  final phase = pod.status?.phase?.value ?? 'Unknown';

  if (phase == 'Running' || phase == 'Succeeded') {
    return Status.success;
  }

  if (phase == 'Unknown') {
    return Status.warning;
  }

  return Status.danger;
}

/// [PodContainerPort] represents a single port of a Pod. it contains the name of the container ([containerName]) where
/// the port is used and the [port] specification.
class PodContainerPort {
  String containerName;
  IoK8sApiCoreV1ContainerPort port;

  PodContainerPort({
    required this.containerName,
    required this.port,
  });
}

/// [getPorts] returns a list of ports for all init containers, containers and ephemeral containers of a [pod]. The
/// returned list if of the type `PodContainerPort`, so that we know to which container a port relates to.
List<PodContainerPort>? getPorts(IoK8sApiCoreV1Pod? pod) {
  if (pod == null || pod.spec == null) {
    return null;
  }

  final List<PodContainerPort> ports = [];

  for (var container in pod.spec!.initContainers) {
    for (var port in container.ports) {
      ports.add(PodContainerPort(containerName: container.name, port: port));
    }
  }

  for (var container in pod.spec!.containers) {
    for (var port in container.ports) {
      ports.add(PodContainerPort(containerName: container.name, port: port));
    }
  }

  for (var container in pod.spec!.ephemeralContainers) {
    for (var port in container.ports) {
      ports.add(PodContainerPort(containerName: container.name, port: port));
    }
  }

  if (ports.isEmpty) {
    return null;
  }

  return ports;
}

List<String> buildInfoText(IoK8sApiCoreV1Pod? pod) {
  final age = getAge(pod?.metadata?.creationTimestamp);
  final ready =
      '${pod?.status?.containerStatuses.where((containerStatus) => containerStatus.ready).length ?? '0'}/${pod?.spec?.containers.length ?? '0'}';
  final statusText = getStatusText(pod);
  final restarts = getRestarts(pod);

  return [
    'Namespace: ${pod?.metadata?.namespace ?? '-'}',
    'Ready: $ready',
    'Status: $statusText',
    'Restarts: $restarts',
    'Age: $age',
  ];
}

List<String> getProbe(IoK8sApiCoreV1Probe probe) {
  final List<String> list = [];

  if (probe.exec != null) {
    list.add(probe.exec!.command.join(', '));
  }

  if (probe.httpGet != null) {
    list.add(
        '${probe.httpGet!.scheme?.value.toLowerCase()}://${probe.httpGet!.host ?? 'localhost'}:${probe.httpGet!.port}${probe.httpGet!.path}');
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

String getValueFrom(IoK8sApiCoreV1EnvVarSource valueFrom) {
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

class PodMetrics {
  String cpu;
  String memory;

  PodMetrics({
    required this.cpu,
    required this.memory,
  });
}

PodMetrics? getMetricsFromList(IoK8sApiCoreV1Pod? pod, dynamic metrics) {
  try {
    if (pod == null || pod.metadata == null || metrics == null) {
      return null;
    }

    final podMetricsList = ApisMetricsV1beta1PodMetricsList.fromJson(metrics);
    if (podMetricsList.items == null || podMetricsList.items!.isEmpty) {
      return null;
    }

    final podMetricsItem = podMetricsList.items!
        .where((item) =>
            item.metadata?.name == pod.metadata!.name &&
            item.metadata?.namespace == pod.metadata!.namespace)
        .toList();

    if (podMetricsItem.length != 1 ||
        podMetricsItem[0].containers == null ||
        podMetricsItem[0].containers!.isEmpty) {
      return null;
    }

    int cpu = 0;
    int memory = 0;

    for (var i = 0; i < podMetricsItem[0].containers!.length; i++) {
      if (podMetricsItem[0].containers![i].usage != null) {
        if (podMetricsItem[0].containers![i].usage!.cpu != null) {
          cpu = cpu +
              cpuMetricsStringToInt(
                  podMetricsItem[0].containers![i].usage!.cpu!);
        }

        if (podMetricsItem[0].containers![i].usage!.memory != null) {
          memory = memory +
              memoryMetricsStringToInt(
                  podMetricsItem[0].containers![i].usage!.memory!);
        }
      }
    }

    return PodMetrics(
      cpu: formatCpuMetric(cpu),
      memory: formatMemoryMetric(memory),
    );
  } catch (err) {
    return null;
  }
}

PodMetrics? getResources(IoK8sApiCoreV1Pod? pod) {
  try {
    if (pod == null || pod.spec == null || pod.spec!.containers.isEmpty) {
      return null;
    }

    int cpuRequests = 0;
    int cpuLimits = 0;
    int memoryRequests = 0;
    int memoryLimits = 0;

    for (var i = 0; i < pod.spec!.containers.length; i++) {
      if (pod.spec!.containers[i].resources != null) {
        if (pod.spec!.containers[i].resources!.requests.containsKey('cpu')) {
          cpuRequests = cpuRequests +
              cpuMetricsStringToInt(
                  pod.spec!.containers[i].resources!.requests['cpu']!);
        }

        if (pod.spec!.containers[i].resources!.requests.containsKey('memory')) {
          memoryRequests = memoryRequests +
              memoryMetricsStringToInt(
                  pod.spec!.containers[i].resources!.requests['memory']!);
        }

        if (pod.spec!.containers[i].resources!.limits.containsKey('cpu')) {
          cpuLimits = cpuLimits +
              cpuMetricsStringToInt(
                  pod.spec!.containers[i].resources!.limits['cpu']!);
        }

        if (pod.spec!.containers[i].resources!.limits.containsKey('memory')) {
          memoryLimits = memoryLimits +
              memoryMetricsStringToInt(
                  pod.spec!.containers[i].resources!.limits['memory']!);
        }
      }
    }

    return PodMetrics(
      cpu:
          '/ ${cpuRequests == 0 ? '-' : formatCpuMetric(cpuRequests)} / ${cpuLimits == 0 ? '-' : formatCpuMetric(cpuLimits)}',
      memory:
          '/ ${memoryRequests == 0 ? '-' : formatMemoryMetric(memoryRequests)} / ${memoryLimits == 0 ? '-' : formatMemoryMetric(memoryLimits)}',
    );
  } catch (err) {
    return null;
  }
}
