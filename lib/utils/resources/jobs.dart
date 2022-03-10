import 'package:kubenav/models/kubernetes/io_k8s_api_batch_v1_job.dart';
import 'package:kubenav/utils/resources/general.dart';

String buildInfoText(IoK8sApiBatchV1Job? job) {
  final age = getAge(job?.metadata?.creationTimestamp);
  final completions = job?.spec?.completions ?? 0;
  final succeeded = job?.status?.succeeded ?? 0;
  final duration =
      timeDiff(job?.status?.startTime, job?.status?.completionTime);

  return 'Namespace: ${job?.metadata?.namespace ?? '-'} \nCompletions: $succeeded/$completions \nDuration: $duration \nAge: $age';
}
