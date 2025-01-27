import 'package:flutter/material.dart';

import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/plugins/argo/actions/plugin_argo_sync.dart';
import 'package:kubenav/widgets/plugins/argo/resources/plugin_argo_resources_applications.dart';
import 'package:kubenav/widgets/plugins/argo/resources/plugin_argo_resources_projects.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/shared/app_resource_actions.dart';

class ArgoResourceCategories {
  static const resources = 'Resources';
}

final List<String> argoResourceCategories = [
  ArgoResourceCategories.resources,
];

/// [argoResources] is a list of all supported Argo resources, which are
/// implementing the [Resource] model.
final List<Resource> argoResources = [
  argoResourceApplication,
  argoResourceProject,
//  argoResourceRollout,
];

/// [kindToArgoResource] is a map, which maps the kind of a Argo resource to
/// the [Resource] model.
final kindToArgoResource = {
  'Application': argoResourceApplication,
  'AppProject': argoResourceProject,
//  'Rollout': argoResourceRollout,
};

List<AppResourceActionsModel> argoResourceActions(
  BuildContext context,
  String name,
  String? namespace,
  Resource resource,
  dynamic item,
) {
  if (resource.resource == argoResourceApplication.resource &&
      resource.path == argoResourceApplication.path) {
    return [
      AppResourceActionsModel(
        title: 'Sync',
        icon: Icons.sync,
        onTap: () {
          showModal(
            context,
            PluginArgoSync(
              name: name,
              namespace: namespace ?? 'default',
              resource: resource,
              item: item,
            ),
          );
        },
      ),
    ];
  }
  return [];
}
