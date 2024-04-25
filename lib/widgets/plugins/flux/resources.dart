import 'package:flutter/material.dart';

import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_helm_v2beta2_helm_release.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_kustomize_v1_kustomization.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1_git_repository.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1beta2_bucket.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1beta2_helm_chart.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1beta2_helm_repository.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1beta2_oci_repository.dart';
import 'package:kubenav/utils/navigate.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/widgets/plugins/flux/plugin_flux_details.dart';

/// [ResourceType] is a `enum`, which defines the different types of resources
/// which can be managed by the Flux plugin.
enum ResourceType {
  gitrepository,
  ocirepository,
  bucket,
  helmrepository,
  helmchart,
  kustomization,
  helmrelease,
}

extension ResourceTypeExtension on ResourceType {
  /// [toShortString] returns a short string of the resource scope, so that we
  /// can use the type within the json encode and decode functions.
  String toShortString() {
    return toString().split('.').last;
  }
}

/// [getResourceTypeFromString] is a helper function to get the `ResourceType`
/// from it's string representation.
ResourceType getResourceTypeFromString(String? scope) {
  switch (scope) {
    case 'gitrepository':
      return ResourceType.gitrepository;
    case 'ocirepository':
      return ResourceType.ocirepository;
    case 'bucket':
      return ResourceType.bucket;
    case 'helmrepository':
      return ResourceType.helmrepository;
    case 'helmchart':
      return ResourceType.helmchart;
    case 'kustomization':
      return ResourceType.kustomization;
    case 'helmrelease':
      return ResourceType.helmrelease;
    default:
      return ResourceType.kustomization;
  }
}

/// The [Resource] model represents a single Flux resource, with all the
/// information we need to get and display the resource.
class Resource {
  String titlePlural;
  String titleSingular;
  String description;
  ResourceType type;
  String path;
  String resource;
  ResourceItem Function(
    Map<String, dynamic> manifest,
  ) buildListItem;
  List<ResourceItem> Function(
    BuildContext context,
    Map<String, dynamic> manifest,
  ) buildDetails;

  Resource({
    required this.titlePlural,
    required this.titleSingular,
    required this.description,
    required this.type,
    required this.path,
    required this.resource,
    required this.buildListItem,
    required this.buildDetails,
  });
}

/// The [ResourceCategory] model represents a single resource category supported
/// by the Flux plugin. A category is a collection of resources, which can be
/// displayed in a list.
class ResourceCategory {
  String title;
  List<Resource> resources;

  ResourceCategory({
    required this.title,
    required this.resources,
  });
}

/// The [ResourceItem] model represents a single item in the list view for a
/// resource. The list item contains a title and a list of data, which can be
/// displayed for each item.
class ResourceItem {
  String name;
  String namespace;
  String title;
  List<ResourceItemData> data;

  ResourceItem({
    required this.name,
    required this.namespace,
    required this.title,
    required this.data,
  });
}

class ResourceItemData {
  String key;
  String value;
  final void Function(int index)? onTap;

  ResourceItemData({
    required this.key,
    required this.value,
    this.onTap,
  });
}

final Map<String, Resource> _kindResourceMapping = {
  'GitRepository': resourceCategories[0].resources[0],
  'OCIRepository': resourceCategories[0].resources[1],
  'Bucket': resourceCategories[0].resources[2],
  'HelmRepository': resourceCategories[0].resources[3],
  'HelmChart': resourceCategories[0].resources[4],
  'Kustomization': resourceCategories[1].resources[0],
  'HelmRelease': resourceCategories[2].resources[0],
};

/// [resourceCategories] is a list of all supported resource categories, which
/// can be managed by the Flux plugin. Each category contains a list of
/// resources.
final resourceCategories = [
  ResourceCategory(
    title: 'Source Controller',
    resources: [
      Resource(
        titlePlural: 'Git Repositories',
        titleSingular: 'Git Repository',
        description:
            'The GitRepository API defines a Source to produce an Artifact for a Git repository revision',
        type: ResourceType.gitrepository,
        path: '/apis/source.toolkit.fluxcd.io/v1',
        resource: 'gitrepositories',
        buildListItem: (manifest) {
          final data = IoFluxcdToolkitSourceV1GitRepository.fromJson(manifest);

          return ResourceItem(
            name: data?.metadata?.name ?? '',
            namespace: data?.metadata?.namespace ?? '',
            title: data?.metadata?.name ?? '-',
            data: [
              ResourceItemData(
                key: 'Namespace',
                value: data?.metadata?.namespace ?? '-',
              ),
              ResourceItemData(
                key: 'Ready',
                value: data?.status?.conditions != null &&
                        data!.status!.conditions.isNotEmpty
                    ? data.status!.conditions
                        .where((e) => e.type == 'Ready')
                        .first
                        .status
                        .value
                    : '-',
              ),
              ResourceItemData(
                key: 'Status',
                value: data?.status?.conditions != null &&
                        data!.status!.conditions.isNotEmpty
                    ? data.status!.conditions
                        .where((e) => e.type == 'Ready')
                        .first
                        .message
                    : '-',
              ),
              ResourceItemData(
                key: 'Age',
                value: getAge(data?.metadata?.creationTimestamp),
              ),
            ],
          );
        },
        buildDetails: (context, manifest) {
          final data = IoFluxcdToolkitSourceV1GitRepository.fromJson(manifest);

          return [
            ResourceItem(
              name: data?.metadata?.name ?? '',
              namespace: data?.metadata?.namespace ?? '',
              title: 'Configuration',
              data: [
                ResourceItemData(
                  key: 'Url',
                  value: data?.spec?.url ?? '-',
                ),
                ResourceItemData(
                  key: 'Interval',
                  value: data?.spec?.interval ?? '-',
                ),
                ResourceItemData(
                  key: 'Suspended',
                  value: data?.spec?.suspend == true ? 'True' : 'False',
                ),
                ResourceItemData(
                  key: 'Timeout',
                  value: data?.spec?.timeout ?? '-',
                ),
              ],
            ),
            ResourceItem(
              name: data?.metadata?.name ?? '',
              namespace: data?.metadata?.namespace ?? '',
              title: 'Git Repository Reference',
              data: [
                ResourceItemData(
                  key: 'Branch',
                  value: data?.spec?.ref?.branch ?? '-',
                ),
                ResourceItemData(
                  key: 'Tag',
                  value: data?.spec?.ref?.tag ?? '-',
                ),
                ResourceItemData(
                  key: 'SemVer',
                  value: data?.spec?.ref?.semver ?? '-',
                ),
                ResourceItemData(
                  key: 'Name',
                  value: data?.spec?.ref?.name ?? '-',
                ),
                ResourceItemData(
                  key: 'Commit',
                  value: data?.spec?.ref?.commit ?? '-',
                ),
              ],
            ),
            ResourceItem(
              name: data?.metadata?.name ?? '',
              namespace: data?.metadata?.namespace ?? '',
              title: 'Artifact',
              data: [
                ResourceItemData(
                  key: 'Path',
                  value: data?.status?.artifact?.path ?? '-',
                ),
                ResourceItemData(
                  key: 'Url',
                  value: data?.status?.artifact?.url ?? '-',
                ),
                ResourceItemData(
                  key: 'Revision',
                  value: data?.status?.artifact?.revision ?? '-',
                ),
                ResourceItemData(
                  key: 'Digest',
                  value: data?.status?.artifact?.digest ?? '-',
                ),
                ResourceItemData(
                  key: 'Last Update',
                  value: getAge(data?.status?.artifact?.lastUpdateTime),
                ),
                ResourceItemData(
                  key: 'Size',
                  value: data?.status?.artifact?.size != null
                      ? formatBytes(data!.status!.artifact!.size!)
                      : '-',
                ),
              ],
            ),
          ];
        },
      ),
      Resource(
        titlePlural: 'OCI Repositories',
        titleSingular: 'OCI Repository',
        description:
            'The OCIRepository API defines a Source to produce an Artifact for an OCI repository',
        type: ResourceType.ocirepository,
        path: '/apis/source.toolkit.fluxcd.io/v1beta2',
        resource: 'ocirepositories',
        buildListItem: (manifest) {
          final data =
              IoFluxcdToolkitSourceV1beta2OCIRepository.fromJson(manifest);

          return ResourceItem(
            name: data?.metadata?.name ?? '',
            namespace: data?.metadata?.namespace ?? '',
            title: data?.metadata?.name ?? '-',
            data: [
              ResourceItemData(
                key: 'Namespace',
                value: data?.metadata?.namespace ?? '-',
              ),
              ResourceItemData(
                key: 'Ready',
                value: data?.status?.conditions != null &&
                        data!.status!.conditions.isNotEmpty
                    ? data.status!.conditions
                        .where((e) => e.type == 'Ready')
                        .first
                        .status
                        .value
                    : '-',
              ),
              ResourceItemData(
                key: 'Status',
                value: data?.status?.conditions != null &&
                        data!.status!.conditions.isNotEmpty
                    ? data.status!.conditions
                        .where((e) => e.type == 'Ready')
                        .first
                        .message
                    : '-',
              ),
              ResourceItemData(
                key: 'Age',
                value: getAge(data?.metadata?.creationTimestamp),
              ),
            ],
          );
        },
        buildDetails: (context, manifest) {
          final data =
              IoFluxcdToolkitSourceV1beta2OCIRepository.fromJson(manifest);

          return [
            ResourceItem(
              name: data?.metadata?.name ?? '',
              namespace: data?.metadata?.namespace ?? '',
              title: 'Configuration',
              data: [
                ResourceItemData(
                  key: 'Url',
                  value: data?.spec?.url ?? '-',
                ),
                ResourceItemData(
                  key: 'Provider',
                  value: data?.spec?.interval ?? '-',
                ),
                ResourceItemData(
                  key: 'Interval',
                  value: data?.spec?.interval ?? '-',
                ),
                ResourceItemData(
                  key: 'Suspended',
                  value: data?.spec?.suspend == true ? 'True' : 'False',
                ),
                ResourceItemData(
                  key: 'Timeout',
                  value: data?.spec?.timeout ?? '-',
                ),
              ],
            ),
            ResourceItem(
              name: data?.metadata?.name ?? '',
              namespace: data?.metadata?.namespace ?? '',
              title: 'OCI Repository Reference',
              data: [
                ResourceItemData(
                  key: 'Tag',
                  value: data?.spec?.ref?.tag ?? '-',
                ),
                ResourceItemData(
                  key: 'SemVer',
                  value: data?.spec?.ref?.semver ?? '-',
                ),
                ResourceItemData(
                  key: 'Digest',
                  value: data?.spec?.ref?.digest ?? '-',
                ),
              ],
            ),
            ResourceItem(
              name: data?.metadata?.name ?? '',
              namespace: data?.metadata?.namespace ?? '',
              title: 'Artifact',
              data: [
                ResourceItemData(
                  key: 'Path',
                  value: data?.status?.artifact?.path ?? '-',
                ),
                ResourceItemData(
                  key: 'Url',
                  value: data?.status?.artifact?.url ?? '-',
                ),
                ResourceItemData(
                  key: 'Revision',
                  value: data?.status?.artifact?.revision ?? '-',
                ),
                ResourceItemData(
                  key: 'Digest',
                  value: data?.status?.artifact?.digest ?? '-',
                ),
                ResourceItemData(
                  key: 'Last Update',
                  value: getAge(data?.status?.artifact?.lastUpdateTime),
                ),
                ResourceItemData(
                  key: 'Size',
                  value: data?.status?.artifact?.size != null
                      ? formatBytes(data!.status!.artifact!.size!)
                      : '-',
                ),
              ],
            ),
          ];
        },
      ),
      Resource(
        titlePlural: 'Buckets',
        titleSingular: 'Bucket',
        description:
            'The Bucket API defines a Source to produce an Artifact for objects from storage solutions like Amazon S3, Google Cloud Storage buckets, or any other solution with a S3 compatible API such as Minio, Alibaba Cloud OSS and others',
        type: ResourceType.bucket,
        path: '/apis/source.toolkit.fluxcd.io/v1beta2',
        resource: 'buckets',
        buildListItem: (manifest) {
          final data = IoFluxcdToolkitSourceV1beta2Bucket.fromJson(manifest);

          return ResourceItem(
            name: data?.metadata?.name ?? '',
            namespace: data?.metadata?.namespace ?? '',
            title: data?.metadata?.name ?? '-',
            data: [
              ResourceItemData(
                key: 'Namespace',
                value: data?.metadata?.namespace ?? '-',
              ),
              ResourceItemData(
                key: 'Ready',
                value: data?.status?.conditions != null &&
                        data!.status!.conditions.isNotEmpty
                    ? data.status!.conditions
                        .where((e) => e.type == 'Ready')
                        .first
                        .status
                        .value
                    : '-',
              ),
              ResourceItemData(
                key: 'Status',
                value: data?.status?.conditions != null &&
                        data!.status!.conditions.isNotEmpty
                    ? data.status!.conditions
                        .where((e) => e.type == 'Ready')
                        .first
                        .message
                    : '-',
              ),
              ResourceItemData(
                key: 'Age',
                value: getAge(data?.metadata?.creationTimestamp),
              ),
            ],
          );
        },
        buildDetails: (context, manifest) {
          final data = IoFluxcdToolkitSourceV1beta2Bucket.fromJson(manifest);

          return [
            ResourceItem(
              name: data?.metadata?.name ?? '',
              namespace: data?.metadata?.namespace ?? '',
              title: 'Configuration',
              data: [
                ResourceItemData(
                  key: 'Provider',
                  value: data?.spec?.provider?.value ?? '-',
                ),
                ResourceItemData(
                  key: 'Bucket Name',
                  value: data?.spec?.bucketName ?? '-',
                ),
                ResourceItemData(
                  key: 'Provider',
                  value: data?.spec?.endpoint ?? '-',
                ),
                ResourceItemData(
                  key: 'Region',
                  value: data?.spec?.region ?? '-',
                ),
                ResourceItemData(
                  key: 'Prefix',
                  value: data?.spec?.prefix ?? '-',
                ),
                ResourceItemData(
                  key: 'Insecure',
                  value: data?.spec?.insecure == true ? 'True' : 'False',
                ),
                ResourceItemData(
                  key: 'Interval',
                  value: data?.spec?.interval ?? '-',
                ),
                ResourceItemData(
                  key: 'Suspended',
                  value: data?.spec?.suspend == true ? 'True' : 'False',
                ),
                ResourceItemData(
                  key: 'Timeout',
                  value: data?.spec?.timeout ?? '-',
                ),
              ],
            ),
            ResourceItem(
              name: data?.metadata?.name ?? '',
              namespace: data?.metadata?.namespace ?? '',
              title: 'Artifact',
              data: [
                ResourceItemData(
                  key: 'Path',
                  value: data?.status?.artifact?.path ?? '-',
                ),
                ResourceItemData(
                  key: 'Url',
                  value: data?.status?.artifact?.url ?? '-',
                ),
                ResourceItemData(
                  key: 'Revision',
                  value: data?.status?.artifact?.revision ?? '-',
                ),
                ResourceItemData(
                  key: 'Digest',
                  value: data?.status?.artifact?.digest ?? '-',
                ),
                ResourceItemData(
                  key: 'Last Update',
                  value: getAge(data?.status?.artifact?.lastUpdateTime),
                ),
                ResourceItemData(
                  key: 'Size',
                  value: data?.status?.artifact?.size != null
                      ? formatBytes(data!.status!.artifact!.size!)
                      : '-',
                ),
              ],
            ),
          ];
        },
      ),
      Resource(
        titlePlural: 'Helm Repositories',
        titleSingular: 'Helm Repositorie',
        description:
            'The HelmRepository API defines a Source to produce an Artifact for a Helm repository index file or OCI Helm repository',
        type: ResourceType.helmrepository,
        path: '/apis/source.toolkit.fluxcd.io/v1beta2',
        resource: 'helmrepositories',
        buildListItem: (manifest) {
          final data =
              IoFluxcdToolkitSourceV1beta2HelmRepository.fromJson(manifest);

          return ResourceItem(
            name: data?.metadata?.name ?? '',
            namespace: data?.metadata?.namespace ?? '',
            title: data?.metadata?.name ?? '-',
            data: [
              ResourceItemData(
                key: 'Namespace',
                value: data?.metadata?.namespace ?? '-',
              ),
              ResourceItemData(
                key: 'Ready',
                value: data?.status?.conditions != null &&
                        data!.status!.conditions.isNotEmpty
                    ? data.status!.conditions
                        .where((e) => e.type == 'Ready')
                        .first
                        .status
                        .value
                    : '-',
              ),
              ResourceItemData(
                key: 'Status',
                value: data?.status?.conditions != null &&
                        data!.status!.conditions.isNotEmpty
                    ? data.status!.conditions
                        .where((e) => e.type == 'Ready')
                        .first
                        .message
                    : '-',
              ),
              ResourceItemData(
                key: 'Age',
                value: getAge(data?.metadata?.creationTimestamp),
              ),
            ],
          );
        },
        buildDetails: (context, manifest) {
          final data =
              IoFluxcdToolkitSourceV1beta2HelmRepository.fromJson(manifest);

          return [
            ResourceItem(
              name: data?.metadata?.name ?? '',
              namespace: data?.metadata?.namespace ?? '',
              title: 'Configuration',
              data: [
                ResourceItemData(
                  key: 'Url',
                  value: data?.spec?.url ?? '-',
                ),
                ResourceItemData(
                  key: 'Interval',
                  value: data?.spec?.interval ?? '-',
                ),
                ResourceItemData(
                  key: 'Suspended',
                  value: data?.spec?.suspend == true ? 'True' : 'False',
                ),
                ResourceItemData(
                  key: 'Timeout',
                  value: data?.spec?.timeout ?? '-',
                ),
              ],
            ),
            ResourceItem(
              name: data?.metadata?.name ?? '',
              namespace: data?.metadata?.namespace ?? '',
              title: 'Artifact',
              data: [
                ResourceItemData(
                  key: 'Path',
                  value: data?.status?.artifact?.path ?? '-',
                ),
                ResourceItemData(
                  key: 'Url',
                  value: data?.status?.artifact?.url ?? '-',
                ),
                ResourceItemData(
                  key: 'Revision',
                  value: data?.status?.artifact?.revision ?? '-',
                ),
                ResourceItemData(
                  key: 'Digest',
                  value: data?.status?.artifact?.digest ?? '-',
                ),
                ResourceItemData(
                  key: 'Last Update',
                  value: getAge(data?.status?.artifact?.lastUpdateTime),
                ),
                ResourceItemData(
                  key: 'Size',
                  value: data?.status?.artifact?.size != null
                      ? formatBytes(data!.status!.artifact!.size!)
                      : '-',
                ),
              ],
            ),
          ];
        },
      ),
      Resource(
        titlePlural: 'Helm Charts',
        titleSingular: 'Helm Chart',
        description:
            'The HelmChart API defines a Source to produce an Artifact for a Helm chart archive with a set of specific configurations',
        type: ResourceType.helmchart,
        path: '/apis/source.toolkit.fluxcd.io/v1beta2',
        resource: 'helmcharts',
        buildListItem: (manifest) {
          final data = IoFluxcdToolkitSourceV1beta2HelmChart.fromJson(manifest);

          return ResourceItem(
            name: data?.metadata?.name ?? '',
            namespace: data?.metadata?.namespace ?? '',
            title: data?.metadata?.name ?? '-',
            data: [
              ResourceItemData(
                key: 'Namespace',
                value: data?.metadata?.namespace ?? '-',
              ),
              ResourceItemData(
                key: 'Ready',
                value: data?.status?.conditions != null &&
                        data!.status!.conditions.isNotEmpty
                    ? data.status!.conditions
                        .where((e) => e.type == 'Ready')
                        .first
                        .status
                        .value
                    : '-',
              ),
              ResourceItemData(
                key: 'Status',
                value: data?.status?.conditions != null &&
                        data!.status!.conditions.isNotEmpty
                    ? data.status!.conditions
                        .where((e) => e.type == 'Ready')
                        .first
                        .message
                    : '-',
              ),
              ResourceItemData(
                key: 'Age',
                value: getAge(data?.metadata?.creationTimestamp),
              ),
            ],
          );
        },
        buildDetails: (context, manifest) {
          final data = IoFluxcdToolkitSourceV1beta2HelmChart.fromJson(manifest);

          return [
            ResourceItem(
              name: data?.metadata?.name ?? '',
              namespace: data?.metadata?.namespace ?? '',
              title: 'Configuration',
              data: [
                ResourceItemData(
                  key: 'Source',
                  value: data?.spec?.sourceRef != null
                      ? '${data?.spec?.sourceRef.kind} (${data?.metadata?.namespace}/${data?.spec?.sourceRef.name})'
                      : '-',
                  onTap: data?.spec?.sourceRef.kind == null
                      ? null
                      : (index) {
                          navigate(
                            context,
                            PluginFluxDetails(
                              resource: _kindResourceMapping[
                                  data!.spec!.sourceRef.kind.value]!,
                              name: data.spec?.sourceRef.name ?? '',
                              namespace: data.metadata?.namespace ?? '',
                            ),
                          );
                        },
                ),
                ResourceItemData(
                  key: 'Chart',
                  value: data?.spec?.chart ?? '-',
                ),
                ResourceItemData(
                  key: 'Version',
                  value: data?.spec?.version ?? '-',
                ),
                ResourceItemData(
                  key: 'Interval',
                  value: data?.spec?.interval ?? '-',
                ),
                ResourceItemData(
                  key: 'Suspended',
                  value: data?.spec?.suspend == true ? 'True' : 'False',
                ),
              ],
            ),
            ResourceItem(
              name: data?.metadata?.name ?? '',
              namespace: data?.metadata?.namespace ?? '',
              title: 'Artifact',
              data: [
                ResourceItemData(
                  key: 'Path',
                  value: data?.status?.artifact?.path ?? '-',
                ),
                ResourceItemData(
                  key: 'Url',
                  value: data?.status?.artifact?.url ?? '-',
                ),
                ResourceItemData(
                  key: 'Revision',
                  value: data?.status?.artifact?.revision ?? '-',
                ),
                ResourceItemData(
                  key: 'Digest',
                  value: data?.status?.artifact?.digest ?? '-',
                ),
                ResourceItemData(
                  key: 'Last Update',
                  value: getAge(data?.status?.artifact?.lastUpdateTime),
                ),
                ResourceItemData(
                  key: 'Size',
                  value: data?.status?.artifact?.size != null
                      ? formatBytes(data!.status!.artifact!.size!)
                      : '-',
                ),
              ],
            ),
          ];
        },
      ),
    ],
  ),
  ResourceCategory(
    title: 'Kustomize Controller',
    resources: [
      Resource(
        titlePlural: 'Kustomizations',
        titleSingular: 'Kustomization',
        description:
            'The Kustomization API defines a pipeline for fetching, decrypting, building, validating and applying Kustomize overlays or plain Kubernetes manifests',
        type: ResourceType.kustomization,
        path: '/apis/kustomize.toolkit.fluxcd.io/v1',
        resource: 'kustomizations',
        buildListItem: (manifest) {
          final data =
              IoFluxcdToolkitKustomizeV1Kustomization.fromJson(manifest);

          return ResourceItem(
            name: data?.metadata?.name ?? '',
            namespace: data?.metadata?.namespace ?? '',
            title: data?.metadata?.name ?? '-',
            data: [
              ResourceItemData(
                key: 'Namespace',
                value: data?.metadata?.namespace ?? '-',
              ),
              ResourceItemData(
                key: 'Ready',
                value: data?.status?.conditions != null &&
                        data!.status!.conditions.isNotEmpty
                    ? data.status!.conditions
                        .where((e) => e.type == 'Ready')
                        .first
                        .status
                        .value
                    : '-',
              ),
              ResourceItemData(
                key: 'Status',
                value: data?.status?.conditions != null &&
                        data!.status!.conditions.isNotEmpty
                    ? data.status!.conditions
                        .where((e) => e.type == 'Ready')
                        .first
                        .message
                    : '-',
              ),
              ResourceItemData(
                key: 'Age',
                value: getAge(data?.metadata?.creationTimestamp),
              ),
            ],
          );
        },
        buildDetails: (context, manifest) {
          final data =
              IoFluxcdToolkitKustomizeV1Kustomization.fromJson(manifest);

          return [
            ResourceItem(
              name: data?.metadata?.name ?? '',
              namespace: data?.metadata?.namespace ?? '',
              title: 'Configuration',
              data: [
                ResourceItemData(
                  key: 'Source',
                  value: data?.spec?.sourceRef != null
                      ? '${data?.spec?.sourceRef.kind} (${data?.spec?.sourceRef.namespace ?? data?.metadata?.namespace}/${data?.spec?.sourceRef.name})'
                      : '-',
                  onTap: data?.spec?.sourceRef.kind == null
                      ? null
                      : (index) {
                          navigate(
                            context,
                            PluginFluxDetails(
                              resource: _kindResourceMapping[
                                  data!.spec!.sourceRef.kind.value]!,
                              name: data.spec?.sourceRef.name ?? '',
                              namespace: data.spec?.sourceRef.namespace ??
                                  data.metadata?.namespace ??
                                  '',
                            ),
                          );
                        },
                ),
                ResourceItemData(
                  key: 'Path',
                  value: data?.spec?.path ?? '-',
                ),
                ResourceItemData(
                  key: 'Interval',
                  value: data?.spec?.interval ?? '-',
                ),
                ResourceItemData(
                  key: 'Suspended',
                  value: data?.spec?.suspend == true ? 'True' : 'False',
                ),
                ResourceItemData(
                  key: 'Prune',
                  value: data?.spec?.prune == true ? 'True' : 'False',
                ),
                ResourceItemData(
                  key: 'Timeout',
                  value: data?.spec?.timeout ?? '-',
                ),
              ],
            ),
            ResourceItem(
              name: data?.metadata?.name ?? '',
              namespace: data?.metadata?.namespace ?? '',
              title: 'Status',
              data: [
                ResourceItemData(
                  key: 'Last Applied Revision',
                  value: data?.status?.lastAppliedRevision ?? '-',
                ),
                ResourceItemData(
                  key: 'Last Attempted Revision',
                  value: data?.status?.lastAttemptedRevision ?? '-',
                ),
              ],
            ),
          ];
        },
      ),
    ],
  ),
  ResourceCategory(
    title: 'Helm Controller',
    resources: [
      Resource(
        titlePlural: 'Helm Releases',
        titleSingular: 'Helm Release',
        description:
            'The HelmRelease API allows for controller-driven reconciliation of Helm releases via Helm actions such as install, upgrade, test, uninstall, and rollback',
        type: ResourceType.helmrelease,
        path: '/apis/helm.toolkit.fluxcd.io/v2beta2',
        resource: 'helmreleases',
        buildListItem: (manifest) {
          final data = IoFluxcdToolkitHelmV2beta2HelmRelease.fromJson(manifest);

          return ResourceItem(
            name: data?.metadata?.name ?? '',
            namespace: data?.metadata?.namespace ?? '',
            title: data?.metadata?.name ?? '-',
            data: [
              ResourceItemData(
                key: 'Namespace',
                value: data?.metadata?.namespace ?? '-',
              ),
              ResourceItemData(
                key: 'Ready',
                value: data?.status?.conditions != null &&
                        data!.status!.conditions.isNotEmpty
                    ? data.status!.conditions
                        .where((e) => e.type == 'Ready')
                        .first
                        .status
                        .value
                    : '-',
              ),
              ResourceItemData(
                key: 'Status',
                value: data?.status?.conditions != null &&
                        data!.status!.conditions.isNotEmpty
                    ? data.status!.conditions
                        .where((e) => e.type == 'Ready')
                        .first
                        .message
                    : '-',
              ),
              ResourceItemData(
                key: 'Age',
                value: getAge(data?.metadata?.creationTimestamp),
              ),
            ],
          );
        },
        buildDetails: (context, manifest) {
          final data = IoFluxcdToolkitHelmV2beta2HelmRelease.fromJson(manifest);

          return [
            ResourceItem(
              name: data?.metadata?.name ?? '',
              namespace: data?.metadata?.namespace ?? '',
              title: 'Configuration',
              data: [
                ResourceItemData(
                  key: 'Chart',
                  value: data?.spec?.chart.spec.chart ?? '-',
                ),
                ResourceItemData(
                  key: 'Source',
                  value: data?.spec?.chart.spec.sourceRef != null
                      ? '${data?.spec?.chart.spec.sourceRef.kind} (${data?.spec?.chart.spec.sourceRef.namespace ?? data?.metadata?.namespace}/${data?.spec?.chart.spec.sourceRef.name})'
                      : '-',
                  onTap: data?.spec?.chart.spec.sourceRef.kind == null
                      ? null
                      : (index) {
                          navigate(
                            context,
                            PluginFluxDetails(
                              resource: _kindResourceMapping[data
                                  ?.spec?.chart.spec.sourceRef.kind!.value]!,
                              name: data?.spec?.chart.spec.sourceRef.name ?? '',
                              namespace:
                                  data?.spec?.chart.spec.sourceRef.namespace ??
                                      data?.metadata?.namespace ??
                                      '',
                            ),
                          );
                        },
                ),
                ResourceItemData(
                  key: 'Interval',
                  value: data?.spec?.interval ?? '-',
                ),
                ResourceItemData(
                  key: 'Suspended',
                  value: data?.spec?.suspend == true ? 'True' : 'False',
                ),
                ResourceItemData(
                  key: 'Timeout',
                  value: data?.spec?.timeout ?? '-',
                ),
              ],
            ),
            ResourceItem(
              name: data?.metadata?.name ?? '',
              namespace: data?.metadata?.namespace ?? '',
              title: 'Status',
              data: [
                ResourceItemData(
                  key: 'Helm Chart',
                  value: data?.status?.helmChart ?? '-',
                  onTap: data?.status?.helmChart == null
                      ? null
                      : (index) {
                          final namespacename =
                              data?.status?.helmChart!.split('/');

                          navigate(
                            context,
                            PluginFluxDetails(
                              resource: _kindResourceMapping['HelmChart']!,
                              name:
                                  namespacename != null ? namespacename[1] : '',
                              namespace:
                                  namespacename != null ? namespacename[0] : '',
                            ),
                          );
                        },
                ),
                ResourceItemData(
                  key: 'Last Applied Revision',
                  value: data?.status?.lastAppliedRevision ?? '-',
                ),
                ResourceItemData(
                  key: 'Last Attempted Revision',
                  value: data?.status?.lastAttemptedRevision ?? '-',
                ),
                ResourceItemData(
                  key: 'Failures',
                  value: data?.status?.failures != null
                      ? '${data?.status?.failures}'
                      : '0',
                ),
                ResourceItemData(
                  key: 'Install Failures',
                  value: data?.status?.installFailures != null
                      ? '${data?.status?.installFailures}'
                      : '0',
                ),
                ResourceItemData(
                  key: 'Upgrade Failures',
                  value: data?.status?.upgradeFailures != null
                      ? '${data?.status?.upgradeFailures}'
                      : '0',
                ),
              ],
            ),
          ];
        },
      ),
    ],
  ),
];
