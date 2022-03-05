import 'package:kubenav/models/kubernetes/api.dart'
    show
        IoK8sApiCoreV1Pod,
        IoK8sApiCoreV1ContainerPort,
        IoK8sApiCoreV1ContainerState,
        IoK8sApiCoreV1EnvVarSource,
        IoK8sApiCoreV1Probe;
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

String buildInfoText(IoK8sApiCoreV1Pod? pod) {
  final age = getAge(pod?.metadata?.creationTimestamp);
  final ready =
      '${pod?.status?.containerStatuses.where((containerStatus) => containerStatus.ready).length ?? '0'}/${pod?.spec?.containers.length ?? '0'}';
  final statusText = getStatusText(pod);
  final restarts = getRestarts(pod);

  return 'Namespace: ${pod?.metadata?.namespace ?? '-'} \nReady: $ready \nStatus: $statusText \nRestarts: $restarts \nAge: $age';
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
