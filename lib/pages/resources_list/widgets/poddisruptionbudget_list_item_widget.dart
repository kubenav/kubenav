import 'package:flutter/material.dart';

import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/models/kubernetes/api.dart'
    show IoK8sApiPolicyV1PodDisruptionBudget;
import 'package:kubenav/pages/resources_list/widgets/list_item_widget.dart';
import 'package:kubenav/utils/resources/general.dart';

class PodDisruptionBudgetListItemWidget extends StatelessWidget
    implements IListItemWidget {
  const PodDisruptionBudgetListItemWidget({
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

  Status getStatus(
    int desiredHealthy,
    int currentHealthy,
  ) {
    if (desiredHealthy == 0) {
      return Status.warning;
    }

    if (currentHealthy < desiredHealthy) {
      return Status.danger;
    }

    return Status.success;
  }

  @override
  Widget build(BuildContext context) {
    final pdb = IoK8sApiPolicyV1PodDisruptionBudget.fromJson(item);
    final age = getAge(pdb?.metadata?.creationTimestamp);
    final minAvailable = pdb?.spec?.minAvailable ?? '-';
    final maxUnavailable = pdb?.spec?.maxUnavailable ?? '-';
    final allowedDisruptions = pdb?.status?.disruptionsAllowed ?? 0;
    final desiredHealthy = pdb?.status?.desiredHealthy ?? 0;
    final currentHealthy = pdb?.status?.currentHealthy ?? 0;

    return ListItemWidget(
      title: title,
      resource: resource,
      path: path,
      scope: scope,
      name: pdb?.metadata?.name ?? '',
      namespace: pdb?.metadata?.namespace,
      info:
          'Namespace: ${pdb?.metadata?.namespace ?? '-'} \nMin. Available: $minAvailable \nMax. Unavailable: $maxUnavailable \nAllowed Disruptions: $allowedDisruptions \nAge: $age',
      status: getStatus(
        desiredHealthy,
        currentHealthy,
      ),
    );
  }
}
