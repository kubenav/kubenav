import 'package:kubenav/models/kubernetes/io_k8s_api_apps_v1_stateful_set.dart';
import 'package:kubenav/utils/resources/general.dart';

List<String> buildInfoText(IoK8sApiAppsV1StatefulSet? sts) {
  final age = getAge(sts?.metadata?.creationTimestamp);
  final replicas = sts?.status?.replicas ?? 0;
  final ready = sts?.status?.readyReplicas ?? 0;
  final upToDate = sts?.status?.updatedReplicas ?? 0;

  return [
    'Namespace: ${sts?.metadata?.namespace ?? '-'}',
    'Ready: $ready/$replicas',
    'Up to date: $upToDate',
    'Age: $age',
  ];
}
