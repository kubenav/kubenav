import 'package:flutter/material.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/plugins/flux/actions/plugin_flux_reconcile.dart';
import 'package:kubenav/widgets/plugins/flux/actions/plugin_flux_resume.dart';
import 'package:kubenav/widgets/plugins/flux/actions/plugin_flux_suspend.dart';
import 'package:kubenav/widgets/plugins/flux/resources/plugin_flux_resources_buckets.dart';
import 'package:kubenav/widgets/plugins/flux/resources/plugin_flux_resources_gitrepositories.dart';
import 'package:kubenav/widgets/plugins/flux/resources/plugin_flux_resources_helmcharts.dart';
import 'package:kubenav/widgets/plugins/flux/resources/plugin_flux_resources_helmreleases.dart';
import 'package:kubenav/widgets/plugins/flux/resources/plugin_flux_resources_helmrepositories.dart';
import 'package:kubenav/widgets/plugins/flux/resources/plugin_flux_resources_kustomizations.dart';
import 'package:kubenav/widgets/plugins/flux/resources/plugin_flux_resources_ocirepositories.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/shared/app_resource_actions.dart';

/// [FluxResourceCategories] defines the different categories of resources
/// supported by the Flux plugin. At the moment we are only supporting the Flux
/// resources of the Source, Kuzstomize and Helm controllers.
///
/// TODO: Add support for the Notification and Image Automation controllers.
class FluxResourceCategories {
  static const sourceController = 'Source Controller';
  static const kustomizeController = 'Kustomize Controller';
  static const helmController = 'Helm Controller';
}

final List<String> fluxResourceCategories = [
  FluxResourceCategories.sourceController,
  FluxResourceCategories.kustomizeController,
  FluxResourceCategories.helmController,
];

/// [fluxResources] is a list of all supported Flux resources, which are
/// implementing the [FluxResource] model.
final List<Resource> fluxResources = [
  fluxResourceGitRepository,
  fluxResourceOCIRepository,
  fluxResourceBucket,
  fluxResourceHelmRepository,
  fluxResourceHelmChart,
  fluxResourceKustomization,
  fluxResourceHelmRelease,
];

/// [kindToFluxResource] is a map, which maps the kind of a Flux resource to
/// the [FluxResource] model.
final kindToFluxResource = {
  'GitRepository': fluxResourceGitRepository,
  'OCIRepository': fluxResourceOCIRepository,
  'Bucket': fluxResourceBucket,
  'HelmRepository': fluxResourceHelmRepository,
  'HelmChart': fluxResourceHelmChart,
  'Kustomization': fluxResourceKustomization,
  'HelmRelease': fluxResourceHelmRelease,
};

List<AppResourceActionsModel> fluxResourceActions(
  BuildContext context,
  String name,
  String? namespace,
  Resource resource,
  dynamic item,
) {
  if ((resource.resource == fluxResourceGitRepository.resource &&
          resource.path == fluxResourceGitRepository.path) ||
      (resource.resource == fluxResourceOCIRepository.resource &&
          resource.path == fluxResourceOCIRepository.path) ||
      (resource.resource == fluxResourceBucket.resource &&
          resource.path == fluxResourceBucket.path) ||
      (resource.resource == fluxResourceHelmRepository.resource &&
          resource.path == fluxResourceHelmRepository.path) ||
      (resource.resource == fluxResourceHelmChart.resource &&
          resource.path == fluxResourceHelmChart.path) ||
      (resource.resource == fluxResourceKustomization.resource &&
          resource.path == fluxResourceKustomization.path) ||
      (resource.resource == fluxResourceHelmRelease.resource &&
          resource.path == fluxResourceHelmRelease.path)) {
    return [
      AppResourceActionsModel(
        title: 'Reconcile',
        icon: Icons.restart_alt,
        onTap: () {
          showModal(
            context,
            PluginFluxReconcile(
              name: name,
              namespace: namespace ?? 'default',
              resource: resource,
              item: item,
            ),
          );
        },
      ),
      AppResourceActionsModel(
        title: 'Suspend',
        icon: Icons.pause,
        onTap: () {
          showModal(
            context,
            PluginFluxSuspend(
              name: name,
              namespace: namespace ?? 'default',
              resource: resource,
              item: item,
            ),
          );
        },
      ),
      AppResourceActionsModel(
        title: 'Resume',
        icon: Icons.play_arrow,
        onTap: () {
          showModal(
            context,
            PluginFluxResume(
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
