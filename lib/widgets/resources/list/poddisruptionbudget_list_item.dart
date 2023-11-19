import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_policy_v1_pod_disruption_budget.dart';
import 'package:kubenav/models/resource.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/widgets/resources/list/list_item.dart';

class PodDisruptionBudgetListItem extends StatelessWidget
    implements IListItemWidget {
  const PodDisruptionBudgetListItem({
    super.key,
    required this.title,
    required this.resource,
    required this.path,
    required this.scope,
    required this.item,
    required this.additionalPrinterColumns,
  });

  @override
  final String title;
  @override
  final String resource;
  @override
  final String path;
  @override
  final ResourceScope scope;
  @override
  final List<AdditionalPrinterColumns> additionalPrinterColumns;
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
      additionalPrinterColumns: additionalPrinterColumns,
      name: pdb?.metadata?.name ?? '',
      namespace: pdb?.metadata?.namespace,
      item: item,
      info: [
        'Namespace: ${pdb?.metadata?.namespace ?? '-'}',
        'Min. Available: $minAvailable',
        'Max. Unavailable: $maxUnavailable',
        'Allowed Disruptions: $allowedDisruptions',
        'Age: $age',
      ],
      status: getStatus(
        desiredHealthy,
        currentHealthy,
      ),
    );
  }
}
