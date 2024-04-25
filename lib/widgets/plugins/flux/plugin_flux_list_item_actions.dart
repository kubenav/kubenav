import 'package:flutter/material.dart';

import 'package:kubenav/widgets/plugins/flux/plugin_flux_details.dart';
import 'package:kubenav/widgets/plugins/flux/resources.dart';
import 'package:kubenav/widgets/shared/app_resource_actions.dart';

/// The [PluginFluxListItemActions] widget renders an actions menu, with the
/// actions for a Flux resource. The actions are the same as defined in the
/// `plugin_flux_details.dart` file for the details view of a Flux resource.
class PluginFluxListItemActions extends StatefulWidget {
  const PluginFluxListItemActions({
    super.key,
    required this.resource,
    required this.manifest,
  });

  final Resource resource;
  final Map<String, dynamic> manifest;

  @override
  State<PluginFluxListItemActions> createState() =>
      _PluginFluxListItemActionsState();
}

class _PluginFluxListItemActionsState extends State<PluginFluxListItemActions> {
  @override
  Widget build(BuildContext context) {
    return AppResourceActions(
      mode: AppResourceActionsMode.actions,
      actions: fluxDetailsActions(
        context,
        widget.resource,
        widget.manifest,
        [],
      ),
    );
  }
}
