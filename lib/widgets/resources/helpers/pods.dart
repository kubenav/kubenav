import 'package:kubenav/models/kubernetes/api.dart'
    show IoK8sApiCoreV1Pod, IoK8sApiCoreV1ContainerPort;
import 'package:kubenav/widgets/resources/list_item_widget.dart';

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

class PodContainerPort {
  String containerName;
  IoK8sApiCoreV1ContainerPort port;

  PodContainerPort({
    required this.containerName,
    required this.port,
  });
}

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
