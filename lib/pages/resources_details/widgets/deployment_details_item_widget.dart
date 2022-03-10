import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_apps_v1_deployment.dart';
import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/pages/resources_details/widgets/details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/details_resources_preview_widget.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/resources/general.dart';

class DeploymentDetailsItemWidget extends StatelessWidget
    implements IDetailsItemWidget {
  const DeploymentDetailsItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    final deployment = IoK8sApiAppsV1Deployment.fromJson(item);

    if (deployment == null ||
        deployment.spec == null ||
        deployment.status == null) {
      return Container();
    }

    return Column(
      children: [
        DetailsItemWidget(
          title: 'Configuration',
          details: [
            DetailsItemModel(
              name: 'Replicas',
              values: deployment.spec!.replicas ?? '-',
            ),
            DetailsItemModel(
              name: 'Revision History Limit',
              values: deployment.spec!.revisionHistoryLimit ?? '-',
            ),
            DetailsItemModel(
              name: 'Progress Deadline Seconds',
              values: deployment.spec!.progressDeadlineSeconds ?? '-',
            ),
            DetailsItemModel(
              name: 'Min. Ready Seconds',
              values: deployment.spec!.minReadySeconds ?? '-',
            ),
            DetailsItemModel(
              name: 'Update Strategy',
              values: deployment.spec!.strategy?.type?.value ?? '-',
            ),
            DetailsItemModel(
              name: 'Selector',
              values: deployment.spec!.selector.matchLabels.entries
                  .map((matchLabel) => '${matchLabel.key}=${matchLabel.value}')
                  .toList(),
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsItemWidget(
          title: 'Status',
          details: [
            DetailsItemModel(
              name: 'Desired Replicas',
              values: deployment.status!.replicas ?? '-',
            ),
            DetailsItemModel(
              name: 'Ready Replicas',
              values: deployment.status!.readyReplicas ?? '-',
            ),
            DetailsItemModel(
              name: 'Available Replicas',
              values: deployment.status!.availableReplicas ?? '-',
            ),
            DetailsItemModel(
              name: 'Unavailable Replicas',
              values: deployment.status!.unavailableReplicas ?? '-',
            ),
            DetailsItemModel(
              name: 'Updated Replicas',
              values: deployment.status!.updatedReplicas ?? '-',
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreviewWidget(
          title: Resources.map['pods']!.title,
          resource: Resources.map['pods']!.resource,
          path: Resources.map['pods']!.path,
          scope: Resources.map['pods']!.scope,
          namespace: deployment.metadata?.namespace,
          selector: getSelector(deployment.spec?.selector),
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreviewWidget(
          title: Resources.map['events']!.title,
          resource: Resources.map['events']!.resource,
          path: Resources.map['events']!.path,
          scope: Resources.map['events']!.scope,
          namespace: deployment.metadata?.namespace,
          selector:
              'fieldSelector=involvedObject.name=${deployment.metadata?.name ?? ''}',
        ),
      ],
    );
  }
}
