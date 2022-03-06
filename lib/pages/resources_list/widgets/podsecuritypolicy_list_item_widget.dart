import 'package:flutter/material.dart';

import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/models/kubernetes/api.dart'
    show IoK8sApiPolicyV1beta1PodSecurityPolicy;
import 'package:kubenav/pages/resources_list/widgets/list_item_widget.dart';
import 'package:kubenav/utils/resources/general.dart';

class PodSecurityPolicyListItemWidget extends StatelessWidget
    implements IListItemWidget {
  const PodSecurityPolicyListItemWidget({
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
    final psp = IoK8sApiPolicyV1beta1PodSecurityPolicy.fromJson(item);
    final age = getAge(psp?.metadata?.creationTimestamp);
    final privileged =
        psp?.spec?.privileged != null && psp?.spec?.privileged == true
            ? 'True'
            : 'Flase';
    final capabilities = psp?.spec?.allowedCapabilities != null
        ? psp?.spec?.allowedCapabilities.join(', ')
        : '-';
    final seLinux = psp?.spec?.seLinux.rule ?? '-';
    final runAsUser = psp?.spec?.runAsUser.rule ?? '-';
    final fsGroup = psp?.spec?.fsGroup.rule ?? '-';
    final supplementalGroups = psp?.spec?.supplementalGroups.rule ?? '-';
    final readOnlyRootFS = psp?.spec?.readOnlyRootFilesystem != null &&
            psp?.spec?.readOnlyRootFilesystem == true
        ? 'True'
        : 'False';
    final volumes =
        psp?.spec?.volumes != null ? psp?.spec?.volumes.join(', ') : '-';

    return ListItemWidget(
      title: title,
      resource: resource,
      path: path,
      scope: scope,
      name: psp?.metadata?.name ?? '',
      namespace: null,
      info:
          'Privileged: $privileged \nCapabilities: $capabilities \nSELinux: $seLinux \nRun as User: $runAsUser \nFS Group: $fsGroup \nSupplemental Groups: $supplementalGroups \nRead Only Root FS: $readOnlyRootFS \nVolumes: $volumes \nAge: $age',
    );
  }
}