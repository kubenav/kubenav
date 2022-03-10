import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_event.dart';
import 'package:kubenav/utils/resources/general.dart';

String buildInfoText(IoK8sApiCoreV1Event? event) {
  final lastSeen = getAge(event?.lastTimestamp);
  final type = event?.type ?? '-';
  final reason = event?.reason ?? '-';
  final object =
      '${event?.involvedObject.kind ?? '-'}/${event?.involvedObject.name ?? '-'}';
  final message = event?.message ?? '-';

  return 'Last Seen: $lastSeen \nType: $type \nReason: $reason \nObject: $object \nMessage: $message';
}
