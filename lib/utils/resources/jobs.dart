import 'package:kubenav/models/kubernetes/api.dart' show IoK8sApiBatchV1Job;
import 'package:kubenav/utils/resources/general.dart';

String buildInfoText(IoK8sApiBatchV1Job? job) {
  final age = getAge(job?.metadata?.creationTimestamp);
  final completions = job?.spec?.completions ?? 0;
  final succeeded = job?.status?.succeeded ?? 0;
  final duration =
      timeDiff(job?.status?.startTime, job?.status?.completionTime);

  return 'Namespace: ${job?.metadata?.namespace ?? '-'} \nCompletions: $succeeded/$completions \nDuration: $duration \nAge: $age';
}
