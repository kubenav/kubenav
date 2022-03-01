import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/api.dart'
    show IoK8sApiCoreV1Namespace;
import 'package:kubenav/pages/resources_details/widgets/details_item_widget.dart';

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
              values: [
                namespace.status != null && namespace.status!.phase != null
                    ? namespace.status!.phase!.value
                    : '-'
              ],
            ),
          ],
        ),
      ],
    );
  }
}
