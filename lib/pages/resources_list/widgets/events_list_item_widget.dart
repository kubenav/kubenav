import 'package:flutter/material.dart';

import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/models/kubernetes/api.dart' show IoK8sApiCoreV1Event;
import 'package:kubenav/pages/resources_list/widgets/list_item_widget.dart';
import 'package:kubenav/utils/resources/general.dart';

class EventListItemWidget extends StatelessWidget implements IListItemWidget {
  const EventListItemWidget({
    Key? key,
    required this.title,
    required this.resource,
    required this.path,
    required this.scope,
    required this.item,
  }) : super(key: key);

  @override
  final String? title;
  @override
  final String? resource;
  @override
  final String? path;
  @override
  final ResourceScope? scope;
  @override
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    final event = IoK8sApiCoreV1Event.fromJson(item);
    final lastSeen = getAge(event?.lastTimestamp);
    final type = event?.type ?? '-';
    final reason = event?.reason ?? '-';
    final object =
        '${event?.involvedObject.kind ?? '-'}/${event?.involvedObject.name ?? '-'}';
    final message = event?.message ?? '-';

    return ListItemWidget(
      title: title,
      resource: resource,
      path: path,
      scope: scope,
      name: event?.metadata.name ?? '',
      namespace: event?.metadata.namespace,
      info:
          'Last Seen: $lastSeen \nType: $type \nReason: $reason \nObject: $object \nMessage: $message',
    );
  }
}
