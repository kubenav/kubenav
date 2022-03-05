import 'package:kubenav/models/kubernetes/api.dart' show IoK8sApiBatchV1CronJob;
import 'package:kubenav/utils/resources/general.dart';

String buildInfoText(IoK8sApiBatchV1CronJob? cronJob) {
  final age = getAge(cronJob?.metadata?.creationTimestamp);
  final schedule = cronJob?.spec?.schedule;
  final suspend =
      cronJob?.spec?.suspend == null || cronJob?.spec?.suspend == false
          ? 'False'
          : 'True';
  final active = cronJob?.status?.active.length ?? 0;
  final lastSchedule = getAge(cronJob?.status?.lastScheduleTime);

  return 'Namespace: ${cronJob?.metadata?.namespace ?? '-'} \nSchedule: $schedule \nSuspend: $suspend \nActive: $active \nLast Schedule: $lastSchedule \nAge: $age';
}
