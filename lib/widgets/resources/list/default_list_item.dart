import 'package:flutter/material.dart';

import 'package:kubenav/models/resource.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/widgets/resources/list/list_item.dart';

class DefaultListItem extends StatelessWidget implements IListItemWidget {
  const DefaultListItem({
    Key? key,
    required this.title,
    required this.resource,
    required this.path,
    required this.scope,
    required this.item,
    required this.additionalPrinterColumns,
  }) : super(key: key);

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

  List<String> _buildInfo(String? namespace, String age) {
    if (additionalPrinterColumns.isEmpty) {
      if (namespace != null) {
        return [
          'Namespace: $namespace',
          'Age: $age',
        ];
      }

      return [
        'Age: $age',
      ];
    }

    if (namespace != null) {
      return [
        'Namespace: $namespace',
        ...additionalPrinterColumns
            .map(
                (e) => '${e.name}: ${getAdditionalPrinterColumnValue(e, item)}')
            .toList(),
      ];
    }

    return additionalPrinterColumns
        .map((e) => '${e.name}: ${getAdditionalPrinterColumnValue(e, item)}')
        .toList();
  }

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
      additionalPrinterColumns: additionalPrinterColumns,
      name: name,
      namespace: namespace,
      item: item,
      info: _buildInfo(namespace, age),
    );
  }
}
