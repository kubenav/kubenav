import 'package:flutter/material.dart';

import 'package:kubenav/models/plugins/helm.dart';
import 'package:kubenav/widgets/plugins/helm/plugin_helm_details.dart';
import 'package:kubenav/widgets/shared/app_resource_actions.dart';

/// The [PluginHelmListItemActions] widget renders an actions menu, with the
/// actions for a Helm release. The actions are the same as defined in the
/// `plugin_helm_details.dart` file for the details view of a Helm release.
class PluginHelmListItemActions extends StatefulWidget {
  const PluginHelmListItemActions({
    super.key,
    required this.release,
  });

  final Release release;

  @override
  State<PluginHelmListItemActions> createState() =>
      _PluginHelmListItemActionsState();
}

class _PluginHelmListItemActionsState extends State<PluginHelmListItemActions> {
  @override
  Widget build(BuildContext context) {
    return AppResourceActions(
      mode: AppResourceActionsMode.actions,
      actions: helmDetailsActions(
        context,
        widget.release,
        null,
      ),
    );
  }
}
