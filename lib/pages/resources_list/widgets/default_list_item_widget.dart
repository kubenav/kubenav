import 'package:flutter/material.dart';

import 'package:kubenav/pages/resources_list/widgets/list_item_widget.dart';
import 'package:kubenav/utils/resources/general.dart';

class DefaultListItemWidget extends StatelessWidget implements IListItemWidget {
  const DefaultListItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

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
      name: name,
      namespace: namespace,
      info:
          namespace != null ? 'Namespace: $namespace \nAge: $age' : 'Age: $age',
    );
  }
}
