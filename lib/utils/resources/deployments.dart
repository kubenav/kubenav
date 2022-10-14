import 'package:kubenav/models/kubernetes/io_k8s_api_apps_v1_deployment.dart';
import 'package:kubenav/utils/resources/general.dart';

List<String> buildInfoText(IoK8sApiAppsV1Deployment? deployment) {
  final age = getAge(deployment?.metadata?.creationTimestamp);
  final ready = deployment?.status?.readyReplicas ?? 0;
  final upToDate = deployment?.status?.updatedReplicas ?? 0;
  final available = deployment?.status?.availableReplicas ?? 0;

  return [
    'Namespace: ${deployment?.metadata?.namespace ?? '-'}',
    'Ready: $ready',
    'Up to date: $upToDate',
    'Available: $available',
    'Age: $age',
  ];
}
