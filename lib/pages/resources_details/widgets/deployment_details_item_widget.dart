import 'package:flutter/material.dart';

import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/models/kubernetes/api.dart'
    show IoK8sApiAppsV1Deployment;
import 'package:kubenav/pages/resources_details/widgets/details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/details_resources_preview_widget.dart';
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

    if (deployment == null) {
      return Container();
    }

    return Column(
      children: [
        DetailsResourcesPreviewWidget(
          title: Resources.map['pods']!.title,
          resource: Resources.map['pods']!.resource,
          path: Resources.map['pods']!.path,
          scope: Resources.map['pods']!.scope,
          namespace: deployment.metadata?.namespace,
          selector: getSelector(deployment.spec?.selector),
        ),
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
