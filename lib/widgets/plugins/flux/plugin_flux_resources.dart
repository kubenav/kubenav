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

/// [FluxResourceCategory] is a `enum`, which defines the different categories
/// of resources supported by the Flux plugin.
enum FluxResourceCategory {
  sourceController,
  kustomizeController,
  helmController,
}

extension FluxResourceTypeExtension on FluxResourceCategory {
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
class FluxResource {
  FluxResourceCategory category;
  String plural;
  String singular;
  String description;
  FluxResourceAPI api;
  FluxResourceItem Function(
    Map<String, dynamic> item,
  ) buildListItem;
  List<FluxResourceItem> Function(
    BuildContext context,
    Map<String, dynamic> item,
  ) buildDetails;

  FluxResource({
    required this.category,
    required this.plural,
    required this.singular,
    required this.description,
    required this.api,
    required this.buildListItem,
    required this.buildDetails,
  });
}

/// [FluxResourceAPI] is a model to store the API information for a Flux
/// resource.
class FluxResourceAPI {
  String kind;
  String path;
  String resource;

  FluxResourceAPI({
    required this.kind,
    required this.path,
    required this.resource,
  });
}

/// The [FluxResourceItem] model represents a single item in the list view or a
/// single card in the details view for a resource.
class FluxResourceItem {
  String name;
  String namespace;
  String title;
  List<FluxResourceItemData> data;

  FluxResourceItem({
    required this.name,
    required this.namespace,
    required this.title,
    required this.data,
  });
}

class FluxResourceItemData {
  String key;
  String value;
  final void Function(int index)? onTap;

  FluxResourceItemData({
    required this.key,
    required this.value,
    this.onTap,
  });
}

/// [fluxResources] is a list of all supported Flux resources.
final List<FluxResource> fluxResources = [
  FluxResource(
    category: FluxResourceCategory.sourceController,
    plural: 'Git Repositories',
    singular: 'Git Repository',
    description:
        'The GitRepository API defines a Source to produce an Artifact for a Git repository revision',
    api: FluxResourceAPI(
      kind: 'GitRepository',
      path: '/apis/source.toolkit.fluxcd.io/v1',
      resource: 'gitrepositories',
    ),
    buildListItem: (item) {
      final data = IoFluxcdToolkitSourceV1GitRepository.fromJson(item);

      return FluxResourceItem(
        name: data?.metadata?.name ?? '',
        namespace: data?.metadata?.namespace ?? '',
        title: data?.metadata?.name ?? '-',
        data: [
          FluxResourceItemData(
            key: 'Namespace',
            value: data?.metadata?.namespace ?? '-',
          ),
          FluxResourceItemData(
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
          FluxResourceItemData(
            key: 'Status',
            value: data?.status?.conditions != null &&
                    data!.status!.conditions.isNotEmpty
                ? data.status!.conditions
                    .where((e) => e.type == 'Ready')
                    .first
                    .message
                : '-',
          ),
          FluxResourceItemData(
            key: 'Age',
            value: getAge(data?.metadata?.creationTimestamp),
          ),
        ],
      );
    },
    buildDetails: (context, item) {
      final data = IoFluxcdToolkitSourceV1GitRepository.fromJson(item);

      return [
        FluxResourceItem(
          name: data?.metadata?.name ?? '',
          namespace: data?.metadata?.namespace ?? '',
          title: 'Configuration',
          data: [
            FluxResourceItemData(
              key: 'Url',
              value: data?.spec?.url ?? '-',
            ),
            FluxResourceItemData(
              key: 'Interval',
              value: data?.spec?.interval ?? '-',
            ),
            FluxResourceItemData(
              key: 'Suspended',
              value: data?.spec?.suspend == true ? 'True' : 'False',
            ),
            FluxResourceItemData(
              key: 'Timeout',
              value: data?.spec?.timeout ?? '-',
            ),
          ],
        ),
        FluxResourceItem(
          name: data?.metadata?.name ?? '',
          namespace: data?.metadata?.namespace ?? '',
          title: 'Git Repository Reference',
          data: [
            FluxResourceItemData(
              key: 'Branch',
              value: data?.spec?.ref?.branch ?? '-',
            ),
            FluxResourceItemData(
              key: 'Tag',
              value: data?.spec?.ref?.tag ?? '-',
            ),
            FluxResourceItemData(
              key: 'SemVer',
              value: data?.spec?.ref?.semver ?? '-',
            ),
            FluxResourceItemData(
              key: 'Name',
              value: data?.spec?.ref?.name ?? '-',
            ),
            FluxResourceItemData(
              key: 'Commit',
              value: data?.spec?.ref?.commit ?? '-',
            ),
          ],
        ),
        FluxResourceItem(
          name: data?.metadata?.name ?? '',
          namespace: data?.metadata?.namespace ?? '',
          title: 'Artifact',
          data: [
            FluxResourceItemData(
              key: 'Path',
              value: data?.status?.artifact?.path ?? '-',
            ),
            FluxResourceItemData(
              key: 'Url',
              value: data?.status?.artifact?.url ?? '-',
            ),
            FluxResourceItemData(
              key: 'Revision',
              value: data?.status?.artifact?.revision ?? '-',
            ),
            FluxResourceItemData(
              key: 'Digest',
              value: data?.status?.artifact?.digest ?? '-',
            ),
            FluxResourceItemData(
              key: 'Last Update',
              value: getAge(data?.status?.artifact?.lastUpdateTime),
            ),
            FluxResourceItemData(
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
  FluxResource(
    category: FluxResourceCategory.sourceController,
    plural: 'OCI Repositories',
    singular: 'OCI Repository',
    description:
        'The OCIRepository API defines a Source to produce an Artifact for an OCI repository',
    api: FluxResourceAPI(
      kind: 'OCIRepository',
      path: '/apis/source.toolkit.fluxcd.io/v1beta2',
      resource: 'ocirepositories',
    ),
    buildListItem: (item) {
      final data = IoFluxcdToolkitSourceV1beta2OCIRepository.fromJson(item);

      return FluxResourceItem(
        name: data?.metadata?.name ?? '',
        namespace: data?.metadata?.namespace ?? '',
        title: data?.metadata?.name ?? '-',
        data: [
          FluxResourceItemData(
            key: 'Namespace',
            value: data?.metadata?.namespace ?? '-',
          ),
          FluxResourceItemData(
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
          FluxResourceItemData(
            key: 'Status',
            value: data?.status?.conditions != null &&
                    data!.status!.conditions.isNotEmpty
                ? data.status!.conditions
                    .where((e) => e.type == 'Ready')
                    .first
                    .message
                : '-',
          ),
          FluxResourceItemData(
            key: 'Age',
            value: getAge(data?.metadata?.creationTimestamp),
          ),
        ],
      );
    },
    buildDetails: (context, item) {
      final data = IoFluxcdToolkitSourceV1beta2OCIRepository.fromJson(item);

      return [
        FluxResourceItem(
          name: data?.metadata?.name ?? '',
          namespace: data?.metadata?.namespace ?? '',
          title: 'Configuration',
          data: [
            FluxResourceItemData(
              key: 'Url',
              value: data?.spec?.url ?? '-',
            ),
            FluxResourceItemData(
              key: 'Provider',
              value: data?.spec?.interval ?? '-',
            ),
            FluxResourceItemData(
              key: 'Interval',
              value: data?.spec?.interval ?? '-',
            ),
            FluxResourceItemData(
              key: 'Suspended',
              value: data?.spec?.suspend == true ? 'True' : 'False',
            ),
            FluxResourceItemData(
              key: 'Timeout',
              value: data?.spec?.timeout ?? '-',
            ),
          ],
        ),
        FluxResourceItem(
          name: data?.metadata?.name ?? '',
          namespace: data?.metadata?.namespace ?? '',
          title: 'OCI Repository Reference',
          data: [
            FluxResourceItemData(
              key: 'Tag',
              value: data?.spec?.ref?.tag ?? '-',
            ),
            FluxResourceItemData(
              key: 'SemVer',
              value: data?.spec?.ref?.semver ?? '-',
            ),
            FluxResourceItemData(
              key: 'Digest',
              value: data?.spec?.ref?.digest ?? '-',
            ),
          ],
        ),
        FluxResourceItem(
          name: data?.metadata?.name ?? '',
          namespace: data?.metadata?.namespace ?? '',
          title: 'Artifact',
          data: [
            FluxResourceItemData(
              key: 'Path',
              value: data?.status?.artifact?.path ?? '-',
            ),
            FluxResourceItemData(
              key: 'Url',
              value: data?.status?.artifact?.url ?? '-',
            ),
            FluxResourceItemData(
              key: 'Revision',
              value: data?.status?.artifact?.revision ?? '-',
            ),
            FluxResourceItemData(
              key: 'Digest',
              value: data?.status?.artifact?.digest ?? '-',
            ),
            FluxResourceItemData(
              key: 'Last Update',
              value: getAge(data?.status?.artifact?.lastUpdateTime),
            ),
            FluxResourceItemData(
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
  FluxResource(
    category: FluxResourceCategory.sourceController,
    plural: 'Buckets',
    singular: 'Bucket',
    description:
        'The Bucket API defines a Source to produce an Artifact for objects from storage solutions like Amazon S3, Google Cloud Storage buckets, or any other solution with a S3 compatible API such as Minio, Alibaba Cloud OSS and others',
    api: FluxResourceAPI(
      kind: 'Bucket',
      path: '/apis/source.toolkit.fluxcd.io/v1beta2',
      resource: 'buckets',
    ),
    buildListItem: (item) {
      final data = IoFluxcdToolkitSourceV1beta2Bucket.fromJson(item);

      return FluxResourceItem(
        name: data?.metadata?.name ?? '',
        namespace: data?.metadata?.namespace ?? '',
        title: data?.metadata?.name ?? '-',
        data: [
          FluxResourceItemData(
            key: 'Namespace',
            value: data?.metadata?.namespace ?? '-',
          ),
          FluxResourceItemData(
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
          FluxResourceItemData(
            key: 'Status',
            value: data?.status?.conditions != null &&
                    data!.status!.conditions.isNotEmpty
                ? data.status!.conditions
                    .where((e) => e.type == 'Ready')
                    .first
                    .message
                : '-',
          ),
          FluxResourceItemData(
            key: 'Age',
            value: getAge(data?.metadata?.creationTimestamp),
          ),
        ],
      );
    },
    buildDetails: (context, item) {
      final data = IoFluxcdToolkitSourceV1beta2Bucket.fromJson(item);

      return [
        FluxResourceItem(
          name: data?.metadata?.name ?? '',
          namespace: data?.metadata?.namespace ?? '',
          title: 'Configuration',
          data: [
            FluxResourceItemData(
              key: 'Provider',
              value: data?.spec?.provider?.value ?? '-',
            ),
            FluxResourceItemData(
              key: 'Bucket Name',
              value: data?.spec?.bucketName ?? '-',
            ),
            FluxResourceItemData(
              key: 'Provider',
              value: data?.spec?.endpoint ?? '-',
            ),
            FluxResourceItemData(
              key: 'Region',
              value: data?.spec?.region ?? '-',
            ),
            FluxResourceItemData(
              key: 'Prefix',
              value: data?.spec?.prefix ?? '-',
            ),
            FluxResourceItemData(
              key: 'Insecure',
              value: data?.spec?.insecure == true ? 'True' : 'False',
            ),
            FluxResourceItemData(
              key: 'Interval',
              value: data?.spec?.interval ?? '-',
            ),
            FluxResourceItemData(
              key: 'Suspended',
              value: data?.spec?.suspend == true ? 'True' : 'False',
            ),
            FluxResourceItemData(
              key: 'Timeout',
              value: data?.spec?.timeout ?? '-',
            ),
          ],
        ),
        FluxResourceItem(
          name: data?.metadata?.name ?? '',
          namespace: data?.metadata?.namespace ?? '',
          title: 'Artifact',
          data: [
            FluxResourceItemData(
              key: 'Path',
              value: data?.status?.artifact?.path ?? '-',
            ),
            FluxResourceItemData(
              key: 'Url',
              value: data?.status?.artifact?.url ?? '-',
            ),
            FluxResourceItemData(
              key: 'Revision',
              value: data?.status?.artifact?.revision ?? '-',
            ),
            FluxResourceItemData(
              key: 'Digest',
              value: data?.status?.artifact?.digest ?? '-',
            ),
            FluxResourceItemData(
              key: 'Last Update',
              value: getAge(data?.status?.artifact?.lastUpdateTime),
            ),
            FluxResourceItemData(
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
  FluxResource(
    category: FluxResourceCategory.sourceController,
    plural: 'Helm Repositories',
    singular: 'Helm Repositorie',
    description:
        'The HelmRepository API defines a Source to produce an Artifact for a Helm repository index file or OCI Helm repository',
    api: FluxResourceAPI(
      kind: 'HelmRepository',
      path: '/apis/source.toolkit.fluxcd.io/v1beta2',
      resource: 'helmrepositories',
    ),
    buildListItem: (item) {
      final data = IoFluxcdToolkitSourceV1beta2HelmRepository.fromJson(item);

      return FluxResourceItem(
        name: data?.metadata?.name ?? '',
        namespace: data?.metadata?.namespace ?? '',
        title: data?.metadata?.name ?? '-',
        data: [
          FluxResourceItemData(
            key: 'Namespace',
            value: data?.metadata?.namespace ?? '-',
          ),
          FluxResourceItemData(
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
          FluxResourceItemData(
            key: 'Status',
            value: data?.status?.conditions != null &&
                    data!.status!.conditions.isNotEmpty
                ? data.status!.conditions
                    .where((e) => e.type == 'Ready')
                    .first
                    .message
                : '-',
          ),
          FluxResourceItemData(
            key: 'Age',
            value: getAge(data?.metadata?.creationTimestamp),
          ),
        ],
      );
    },
    buildDetails: (context, item) {
      final data = IoFluxcdToolkitSourceV1beta2HelmRepository.fromJson(item);

      return [
        FluxResourceItem(
          name: data?.metadata?.name ?? '',
          namespace: data?.metadata?.namespace ?? '',
          title: 'Configuration',
          data: [
            FluxResourceItemData(
              key: 'Url',
              value: data?.spec?.url ?? '-',
            ),
            FluxResourceItemData(
              key: 'Interval',
              value: data?.spec?.interval ?? '-',
            ),
            FluxResourceItemData(
              key: 'Suspended',
              value: data?.spec?.suspend == true ? 'True' : 'False',
            ),
            FluxResourceItemData(
              key: 'Timeout',
              value: data?.spec?.timeout ?? '-',
            ),
          ],
        ),
        FluxResourceItem(
          name: data?.metadata?.name ?? '',
          namespace: data?.metadata?.namespace ?? '',
          title: 'Artifact',
          data: [
            FluxResourceItemData(
              key: 'Path',
              value: data?.status?.artifact?.path ?? '-',
            ),
            FluxResourceItemData(
              key: 'Url',
              value: data?.status?.artifact?.url ?? '-',
            ),
            FluxResourceItemData(
              key: 'Revision',
              value: data?.status?.artifact?.revision ?? '-',
            ),
            FluxResourceItemData(
              key: 'Digest',
              value: data?.status?.artifact?.digest ?? '-',
            ),
            FluxResourceItemData(
              key: 'Last Update',
              value: getAge(data?.status?.artifact?.lastUpdateTime),
            ),
            FluxResourceItemData(
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
  FluxResource(
    category: FluxResourceCategory.sourceController,
    plural: 'Helm Charts',
    singular: 'Helm Chart',
    description:
        'The HelmChart API defines a Source to produce an Artifact for a Helm chart archive with a set of specific configurations',
    api: FluxResourceAPI(
      kind: 'HelmChart',
      path: '/apis/source.toolkit.fluxcd.io/v1beta2',
      resource: 'helmcharts',
    ),
    buildListItem: (item) {
      final data = IoFluxcdToolkitSourceV1beta2HelmChart.fromJson(item);

      return FluxResourceItem(
        name: data?.metadata?.name ?? '',
        namespace: data?.metadata?.namespace ?? '',
        title: data?.metadata?.name ?? '-',
        data: [
          FluxResourceItemData(
            key: 'Namespace',
            value: data?.metadata?.namespace ?? '-',
          ),
          FluxResourceItemData(
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
          FluxResourceItemData(
            key: 'Status',
            value: data?.status?.conditions != null &&
                    data!.status!.conditions.isNotEmpty
                ? data.status!.conditions
                    .where((e) => e.type == 'Ready')
                    .first
                    .message
                : '-',
          ),
          FluxResourceItemData(
            key: 'Age',
            value: getAge(data?.metadata?.creationTimestamp),
          ),
        ],
      );
    },
    buildDetails: (context, item) {
      final data = IoFluxcdToolkitSourceV1beta2HelmChart.fromJson(item);

      return [
        FluxResourceItem(
          name: data?.metadata?.name ?? '',
          namespace: data?.metadata?.namespace ?? '',
          title: 'Configuration',
          data: [
            FluxResourceItemData(
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
                          resource: fluxResources
                              .where(
                                (e) =>
                                    e.api.kind ==
                                    data!.spec!.sourceRef.kind.value,
                              )
                              .first,
                          name: data?.spec?.sourceRef.name ?? '',
                          namespace: data?.metadata?.namespace ?? '',
                        ),
                      );
                    },
            ),
            FluxResourceItemData(
              key: 'Chart',
              value: data?.spec?.chart ?? '-',
            ),
            FluxResourceItemData(
              key: 'Version',
              value: data?.spec?.version ?? '-',
            ),
            FluxResourceItemData(
              key: 'Interval',
              value: data?.spec?.interval ?? '-',
            ),
            FluxResourceItemData(
              key: 'Suspended',
              value: data?.spec?.suspend == true ? 'True' : 'False',
            ),
          ],
        ),
        FluxResourceItem(
          name: data?.metadata?.name ?? '',
          namespace: data?.metadata?.namespace ?? '',
          title: 'Artifact',
          data: [
            FluxResourceItemData(
              key: 'Path',
              value: data?.status?.artifact?.path ?? '-',
            ),
            FluxResourceItemData(
              key: 'Url',
              value: data?.status?.artifact?.url ?? '-',
            ),
            FluxResourceItemData(
              key: 'Revision',
              value: data?.status?.artifact?.revision ?? '-',
            ),
            FluxResourceItemData(
              key: 'Digest',
              value: data?.status?.artifact?.digest ?? '-',
            ),
            FluxResourceItemData(
              key: 'Last Update',
              value: getAge(data?.status?.artifact?.lastUpdateTime),
            ),
            FluxResourceItemData(
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
  FluxResource(
    category: FluxResourceCategory.kustomizeController,
    plural: 'Kustomizations',
    singular: 'Kustomization',
    description:
        'The Kustomization API defines a pipeline for fetching, decrypting, building, validating and applying Kustomize overlays or plain Kubernetes items',
    api: FluxResourceAPI(
      kind: 'Kustomization',
      path: '/apis/kustomize.toolkit.fluxcd.io/v1',
      resource: 'kustomizations',
    ),
    buildListItem: (item) {
      final data = IoFluxcdToolkitKustomizeV1Kustomization.fromJson(item);

      return FluxResourceItem(
        name: data?.metadata?.name ?? '',
        namespace: data?.metadata?.namespace ?? '',
        title: data?.metadata?.name ?? '-',
        data: [
          FluxResourceItemData(
            key: 'Namespace',
            value: data?.metadata?.namespace ?? '-',
          ),
          FluxResourceItemData(
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
          FluxResourceItemData(
            key: 'Status',
            value: data?.status?.conditions != null &&
                    data!.status!.conditions.isNotEmpty
                ? data.status!.conditions
                    .where((e) => e.type == 'Ready')
                    .first
                    .message
                : '-',
          ),
          FluxResourceItemData(
            key: 'Age',
            value: getAge(data?.metadata?.creationTimestamp),
          ),
        ],
      );
    },
    buildDetails: (context, item) {
      final data = IoFluxcdToolkitKustomizeV1Kustomization.fromJson(item);

      return [
        FluxResourceItem(
          name: data?.metadata?.name ?? '',
          namespace: data?.metadata?.namespace ?? '',
          title: 'Configuration',
          data: [
            FluxResourceItemData(
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
                          resource: fluxResources
                              .where(
                                (e) =>
                                    e.api.kind ==
                                    data!.spec!.sourceRef.kind.value,
                              )
                              .first,
                          name: data?.spec?.sourceRef.name ?? '',
                          namespace: data?.spec?.sourceRef.namespace ??
                              data?.metadata?.namespace ??
                              '',
                        ),
                      );
                    },
            ),
            FluxResourceItemData(
              key: 'Path',
              value: data?.spec?.path ?? '-',
            ),
            FluxResourceItemData(
              key: 'Interval',
              value: data?.spec?.interval ?? '-',
            ),
            FluxResourceItemData(
              key: 'Suspended',
              value: data?.spec?.suspend == true ? 'True' : 'False',
            ),
            FluxResourceItemData(
              key: 'Prune',
              value: data?.spec?.prune == true ? 'True' : 'False',
            ),
            FluxResourceItemData(
              key: 'Timeout',
              value: data?.spec?.timeout ?? '-',
            ),
          ],
        ),
        FluxResourceItem(
          name: data?.metadata?.name ?? '',
          namespace: data?.metadata?.namespace ?? '',
          title: 'Status',
          data: [
            FluxResourceItemData(
              key: 'Last Applied Revision',
              value: data?.status?.lastAppliedRevision ?? '-',
            ),
            FluxResourceItemData(
              key: 'Last Attempted Revision',
              value: data?.status?.lastAttemptedRevision ?? '-',
            ),
          ],
        ),
      ];
    },
  ),
  FluxResource(
    category: FluxResourceCategory.helmController,
    plural: 'Helm Releases',
    singular: 'Helm Release',
    description:
        'The HelmRelease API allows for controller-driven reconciliation of Helm releases via Helm actions such as install, upgrade, test, uninstall, and rollback',
    api: FluxResourceAPI(
      kind: 'HelmRelease',
      path: '/apis/helm.toolkit.fluxcd.io/v2beta2',
      resource: 'helmreleases',
    ),
    buildListItem: (item) {
      final data = IoFluxcdToolkitHelmV2beta2HelmRelease.fromJson(item);

      return FluxResourceItem(
        name: data?.metadata?.name ?? '',
        namespace: data?.metadata?.namespace ?? '',
        title: data?.metadata?.name ?? '-',
        data: [
          FluxResourceItemData(
            key: 'Namespace',
            value: data?.metadata?.namespace ?? '-',
          ),
          FluxResourceItemData(
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
          FluxResourceItemData(
            key: 'Status',
            value: data?.status?.conditions != null &&
                    data!.status!.conditions.isNotEmpty
                ? data.status!.conditions
                    .where((e) => e.type == 'Ready')
                    .first
                    .message
                : '-',
          ),
          FluxResourceItemData(
            key: 'Age',
            value: getAge(data?.metadata?.creationTimestamp),
          ),
        ],
      );
    },
    buildDetails: (context, item) {
      final data = IoFluxcdToolkitHelmV2beta2HelmRelease.fromJson(item);

      return [
        FluxResourceItem(
          name: data?.metadata?.name ?? '',
          namespace: data?.metadata?.namespace ?? '',
          title: 'Configuration',
          data: [
            FluxResourceItemData(
              key: 'Chart',
              value: data?.spec?.chart.spec.chart ?? '-',
            ),
            FluxResourceItemData(
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
                          resource: fluxResources
                              .where(
                                (e) =>
                                    e.api.kind ==
                                    data?.spec?.chart.spec.sourceRef.kind!
                                        .value,
                              )
                              .first,
                          name: data?.spec?.chart.spec.sourceRef.name ?? '',
                          namespace:
                              data?.spec?.chart.spec.sourceRef.namespace ??
                                  data?.metadata?.namespace ??
                                  '',
                        ),
                      );
                    },
            ),
            FluxResourceItemData(
              key: 'Interval',
              value: data?.spec?.interval ?? '-',
            ),
            FluxResourceItemData(
              key: 'Suspended',
              value: data?.spec?.suspend == true ? 'True' : 'False',
            ),
            FluxResourceItemData(
              key: 'Timeout',
              value: data?.spec?.timeout ?? '-',
            ),
          ],
        ),
        FluxResourceItem(
          name: data?.metadata?.name ?? '',
          namespace: data?.metadata?.namespace ?? '',
          title: 'Status',
          data: [
            FluxResourceItemData(
              key: 'Helm Chart',
              value: data?.status?.helmChart ?? '-',
              onTap: data?.status?.helmChart == null
                  ? null
                  : (index) {
                      final namespacename = data?.status?.helmChart!.split('/');

                      navigate(
                        context,
                        PluginFluxDetails(
                          resource: fluxResources
                              .where(
                                (e) => e.api.kind == 'HelmChart',
                              )
                              .first,
                          name: namespacename != null ? namespacename[1] : '',
                          namespace:
                              namespacename != null ? namespacename[0] : '',
                        ),
                      );
                    },
            ),
            FluxResourceItemData(
              key: 'Last Applied Revision',
              value: data?.status?.lastAppliedRevision ?? '-',
            ),
            FluxResourceItemData(
              key: 'Last Attempted Revision',
              value: data?.status?.lastAttemptedRevision ?? '-',
            ),
            FluxResourceItemData(
              key: 'Failures',
              value: data?.status?.failures != null
                  ? '${data?.status?.failures}'
                  : '0',
            ),
            FluxResourceItemData(
              key: 'Install Failures',
              value: data?.status?.installFailures != null
                  ? '${data?.status?.installFailures}'
                  : '0',
            ),
            FluxResourceItemData(
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
];
