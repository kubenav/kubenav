import 'package:flutter/material.dart';

import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/pages/resources_list/widgets/list_item_widget.dart';
import 'package:kubenav/utils/resources/general.dart';

class DefaultListItemWidget extends StatelessWidget implements IListItemWidget {
  const DefaultListItemWidget({
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
    final name = item['metadata'] != null && item['metadata']['name'] != null
        ? item['metadata']['name']
        : '-';
    final namespace =
        item['metadata'] != null ? item['metadata']['namespace'] : null;
    final age = getAge(item['metadata'] != null &&
            item['metadata']['creationTimestamp'] != null
        ? DateTime.parse(item['metadata']['creationTimestamp'])
        : null);

    return ListItemWidget(
      title: title,
      resource: resource,
      path: path,
      scope: scope,
      name: name,
      namespace: namespace,
      info: namespace != null
          ? [
              'Namespace: $namespace',
              'Age: $age',
            ]
          : [
              'Age: $age',
            ],
    );
  }
}
