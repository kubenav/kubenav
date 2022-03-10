import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_policy_v1_pod_disruption_budget.dart';
import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/pages/resources_details/widgets/details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/details_resources_preview_widget.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/resources/general.dart';

class PodDisruptionBudgetDetailsItemWidget extends StatelessWidget
    implements IDetailsItemWidget {
  const PodDisruptionBudgetDetailsItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    final pdb = IoK8sApiPolicyV1PodDisruptionBudget.fromJson(item);

    if (pdb == null || pdb.spec == null || pdb.status == null) {
      return Container();
    }

    return Column(
      children: [
        DetailsItemWidget(
          title: 'Configuration',
          details: [
            DetailsItemModel(
              name: 'Selector',
              values: pdb.spec!.selector?.matchLabels.entries
                      .map((matchLabels) =>
                          '${matchLabels.key}=${matchLabels.value}')
                      .toList() ??
                  '-',
            ),
            DetailsItemModel(
              name: 'Min. Available',
              values: pdb.spec!.minAvailable ?? '-',
            ),
            DetailsItemModel(
              name: 'Max. Available',
              values: pdb.spec!.maxUnavailable ?? '-',
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsItemWidget(
          title: 'Status',
          details: [
            DetailsItemModel(
              name: 'Current Healthy',
              values: pdb.status!.currentHealthy,
            ),
            DetailsItemModel(
              name: 'Desired Healthy',
              values: pdb.status!.desiredHealthy,
            ),
            DetailsItemModel(
              name: 'Disruptions Allowed',
              values: pdb.status!.disruptionsAllowed,
            ),
            DetailsItemModel(
              name: 'Expected Pods',
              values: pdb.status!.expectedPods,
            ),
            DetailsItemModel(
              name: 'Observed Generation',
              values: pdb.status!.observedGeneration ?? '-',
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreviewWidget(
          title: Resources.map['pods']!.title,
          resource: Resources.map['pods']!.resource,
          path: Resources.map['pods']!.path,
          scope: Resources.map['pods']!.scope,
          namespace: item['metadata']['namespace'],
          selector: getSelector(pdb.spec!.selector),
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreviewWidget(
          title: Resources.map['events']!.title,
          resource: Resources.map['events']!.resource,
          path: Resources.map['events']!.path,
          scope: Resources.map['events']!.scope,
          namespace: item['metadata']['namespace'],
          selector:
              'fieldSelector=involvedObject.name=${item['metadata']['name']}',
        ),
      ],
    );
  }
}
