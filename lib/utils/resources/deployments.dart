import 'package:kubenav/models/kubernetes/api.dart'
    show IoK8sApiAppsV1Deployment;
import 'package:kubenav/utils/resources/general.dart';

String buildInfoText(IoK8sApiAppsV1Deployment? deplyoment) {
  final age = getAge(deplyoment?.metadata?.creationTimestamp);
  final ready = deplyoment?.status?.readyReplicas ?? 0;
  final upToDate = deplyoment?.status?.updatedReplicas ?? 0;
  final available = deplyoment?.status?.availableReplicas ?? 0;

  return 'Namespace: ${deplyoment?.metadata?.namespace ?? '-'} \nReady: $ready \nUp to date: $upToDate \nAvailable: $available \nAge: $age';
}
