import 'package:flutter/material.dart';

import 'package:kubenav/models/resource.dart';
import 'package:kubenav/widgets/resources/resource_details.dart';
import 'package:kubenav/widgets/shared/app_resource_actions.dart';

/// The [ListItemActions] widget renders an actions menu, with the actions for
/// a reesource. The actions are the same as defined in `resource_details.dart`
/// file for the details view of a resource.
class ListItemActions extends StatefulWidget {
  const ListItemActions({
    Key? key,
    required this.title,
    required this.resource,
    required this.path,
    required this.scope,
    required this.additionalPrinterColumns,
    required this.name,
    required this.namespace,
    required this.item,
  }) : super(key: key);

  final String title;
  final String resource;
  final String path;
  final ResourceScope scope;
  final List<AdditionalPrinterColumns> additionalPrinterColumns;
  final String name;
  final String? namespace;
  final dynamic item;

  @override
  State<ListItemActions> createState() => _ListItemActionsState();
}

class _ListItemActionsState extends State<ListItemActions> {
  @override
  Widget build(BuildContext context) {
    return AppResourceActions(
      mode: AppResourceActionsMode.actions,
      actions: resourceDetailsActions(
        context,
        widget.title,
        widget.resource,
        widget.path,
        widget.scope,
        widget.additionalPrinterColumns,
        widget.name,
        widget.namespace,
        widget.item,
        [],
      ),
    );
  }
}
