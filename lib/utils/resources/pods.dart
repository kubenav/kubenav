import 'package:kubenav/models/kubernetes/api.dart'
    show IoK8sApiCoreV1Pod, IoK8sApiCoreV1ContainerPort;
import 'package:kubenav/pages/resources_list/widgets/list_item_widget.dart';

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
