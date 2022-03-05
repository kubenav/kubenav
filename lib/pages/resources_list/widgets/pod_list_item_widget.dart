import 'package:flutter/material.dart';

import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/models/kubernetes/api.dart' show IoK8sApiCoreV1Pod;
import 'package:kubenav/utils/resources/pods.dart';
import 'package:kubenav/pages/resources_list/widgets/list_item_widget.dart';

class PodListItemWidget extends StatelessWidget implements IListItemWidget {
  const PodListItemWidget({
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
    final pod = IoK8sApiCoreV1Pod.fromJson(item);
    final info = buildInfoText(pod);
    final status = getStatus(pod);

    return ListItemWidget(
      title: title,
      resource: resource,
      path: path,
      scope: scope,
      name: pod?.metadata?.name ?? '',
      namespace: pod?.metadata?.namespace,
      info: info,
      status: status,
    );
  }
}
