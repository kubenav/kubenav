import 'package:flutter/material.dart';

import 'package:kubenav/widgets/plugins/flux/resources/plugin_flux_resources_buckets.dart';
import 'package:kubenav/widgets/plugins/flux/resources/plugin_flux_resources_gitrepositories.dart';
import 'package:kubenav/widgets/plugins/flux/resources/plugin_flux_resources_helmcharts.dart';
import 'package:kubenav/widgets/plugins/flux/resources/plugin_flux_resources_helmreleases.dart';
import 'package:kubenav/widgets/plugins/flux/resources/plugin_flux_resources_helmrepositories.dart';
import 'package:kubenav/widgets/plugins/flux/resources/plugin_flux_resources_kustomizations.dart';
import 'package:kubenav/widgets/plugins/flux/resources/plugin_flux_resources_ocirepositories.dart';

/// [FluxResourceCategory] is a `enum`, which defines the different categories
/// of resources supported by the Flux plugin. At the moment we are only
/// supporting the Flux resources of the Source, Kuzstomize and Helm
/// controllers.
///
/// TODO: Add support for the Notification and Image Automation controllers.
enum FluxResourceCategory {
  sourceController,
  kustomizeController,
  helmController,
}

extension FluxResourceCategoryExtension on FluxResourceCategory {
  /// [toLocalizedString] returns a string for the Flux resource category, which
  /// can be used in the UI.
  String toLocalizedString() {
    switch (this) {
      case FluxResourceCategory.sourceController:
        return 'Source Controller';
      case FluxResourceCategory.kustomizeController:
        return 'Kustomize Controller';
      case FluxResourceCategory.helmController:
        return 'Helm Controller';
    }
  }
}

/// The [FluxResource] model represents a single Flux resource, with all the
/// information we need to get and display the resource.
class FluxResource<T> {
  FluxResourceCategory category;
  String plural;
  String singular;
  String description;
  String path;
  String resource;
  List<T> Function(String data) decodeList;
  T? Function(String data) decodeItem;
  String Function(T item) encodeItem;
  Widget listWidget;
  Widget Function(String name, String namespace) detailsWidget;

  FluxResource({
    required this.category,
    required this.plural,
    required this.singular,
    required this.description,
    required this.path,
    required this.resource,
    required this.decodeList,
    required this.decodeItem,
    required this.encodeItem,
    required this.listWidget,
    required this.detailsWidget,
  });
}

/// [fluxResources] is a list of all supported Flux resources, which are
/// implementing the [FluxResource] model.
final List<FluxResource> fluxResources = [
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
