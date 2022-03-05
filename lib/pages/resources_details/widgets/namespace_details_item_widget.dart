import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/api.dart'
    show IoK8sApiCoreV1Namespace;
import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/pages/resources_details/widgets/details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/details_resources_preview_widget.dart';
import 'package:kubenav/utils/constants.dart';

class NamespaceDetailsItemWidget extends StatelessWidget
    implements IDetailsItemWidget {
  const NamespaceDetailsItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    final namespace = IoK8sApiCoreV1Namespace.fromJson(item);

    if (namespace == null) {
      return Container();
    }

    return Column(
      children: [
        DetailsItemWidget(
          title: 'Status',
          details: [
            DetailsItemModel(
              name: 'Phase',
              values:
                  namespace.status != null && namespace.status!.phase != null
                      ? namespace.status!.phase!.value
                      : '-',
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreviewWidget(
          title: Resources.map['cronjobs']!.title,
          resource: Resources.map['cronjobs']!.resource,
          path: Resources.map['cronjobs']!.path,
          scope: Resources.map['cronjobs']!.scope,
          namespace: item['metadata']['name'],
          selector: '',
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreviewWidget(
          title: Resources.map['deployments']!.title,
          resource: Resources.map['deployments']!.resource,
          path: Resources.map['deployments']!.path,
          scope: Resources.map['deployments']!.scope,
          namespace: item['metadata']['name'],
          selector: '',
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreviewWidget(
          title: Resources.map['pods']!.title,
          resource: Resources.map['pods']!.resource,
          path: Resources.map['pods']!.path,
          scope: Resources.map['pods']!.scope,
          namespace: item['metadata']['name'],
          selector: '',
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreviewWidget(
          title: Resources.map['statefulsets']!.title,
          resource: Resources.map['statefulsets']!.resource,
          path: Resources.map['statefulsets']!.path,
          scope: Resources.map['statefulsets']!.scope,
          namespace: item['metadata']['name'],
          selector: '',
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreviewWidget(
          title: Resources.map['events']!.title,
          resource: Resources.map['events']!.resource,
          path: Resources.map['events']!.path,
          scope: Resources.map['events']!.scope,
          namespace: item['metadata']['name'],
          selector:
              'fieldSelector=involvedObject.name=${item['metadata']['name']}',
        ),
      ],
    );
  }
}
