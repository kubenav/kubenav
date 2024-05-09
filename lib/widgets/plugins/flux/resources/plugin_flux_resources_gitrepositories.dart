import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1_git_repository.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1_git_repository_list.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/widgets/plugins/flux/resources/plugin_flux_resources.dart';
import 'package:kubenav/widgets/resources/helpers/details_item.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_conditions.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_metadata.dart';
import 'package:kubenav/widgets/resources/helpers/details_resources_preview.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/resources/resources/resources_events.dart';
import 'package:kubenav/widgets/resources/resources_list.dart';

final Resource fluxResourceGitRepository = Resource(
  category: FluxResourceCategories.sourceController,
  plural: 'Git Repositories',
  singular: 'Git Repository',
  description:
      'The GitRepository API defines a Source to produce an Artifact for a Git repository revision',
  path: '/apis/source.toolkit.fluxcd.io/v1',
  resource: 'gitrepositories',
  scope: ResourceScope.namespaced,
  additionalPrinterColumns: [],
  icon: 'flux',
  template: resourceDefaultTemplate,
  decodeListData: (ResourcesListData data) {
    final parsed = json.decode(data.list);
    final items =
        IoFluxcdToolkitSourceV1GitRepositoryList.fromJson(parsed)?.items ?? [];

    return items.map(
      (e) {
        final status = e.status?.conditions != null &&
                e.status!.conditions!.isNotEmpty
            ? e.status!.conditions!.where((e) => e.type == 'Ready').first.status
            : 'Unknown';

        return ResourceItem(
          item: e,
          metrics: null,
          status: status == 'True'
              ? ResourceStatus.success
              : status == 'False'
                  ? ResourceStatus.danger
                  : ResourceStatus.warning,
        );
      },
    ).toList();
  },
  decodeList: (String data) {
    final parsed = json.decode(data);
    return IoFluxcdToolkitSourceV1GitRepositoryList.fromJson(parsed)?.items ??
        [];
  },
  getName: (dynamic item) {
    return (item as IoFluxcdToolkitSourceV1GitRepository).metadata?.name ?? '';
  },
  getNamespace: (dynamic item) {
    return (item as IoFluxcdToolkitSourceV1GitRepository).metadata?.namespace;
  },
  decodeItem: (String data) {
    final parsed = json.decode(data);
    return IoFluxcdToolkitSourceV1GitRepository.fromJson(parsed);
  },
  encodeItem: (dynamic item) {
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    return encoder.convert(item);
  },
  toJson: (dynamic item) {
    return json.decode(json.encode(item));
  },
  listItemBuilder: (
    BuildContext context,
    Resource resource,
    ResourceItem listItem,
  ) {
    final item = listItem.item as IoFluxcdToolkitSourceV1GitRepository;
    final status = listItem.status;

    return ResourcesListItem(
      name: item.metadata?.name ?? '',
      namespace: item.metadata?.namespace ?? '',
      resource: resource,
      item: item,
      status: status,
      details: [
        'Namespace: ${item.metadata?.namespace ?? '-'}',
        'Ready: ${item.status?.conditions != null && item.status!.conditions!.isNotEmpty ? item.status!.conditions!.where((e) => e.type == 'Ready').first.status : '-'}',
        'Status: ${item.status?.conditions != null && item.status!.conditions!.isNotEmpty ? item.status!.conditions!.where((e) => e.type == 'Ready').first.message : '-'}',
        'Age: ${getAge(item.metadata?.creationTimestamp)}',
      ],
    );
  },
  previewItemBuilder: (
    dynamic listItem,
  ) {
    final item = listItem as IoFluxcdToolkitSourceV1GitRepository;

    return [
      'Namespace: ${item.metadata?.namespace ?? '-'}',
      'Ready: ${item.status?.conditions != null && item.status!.conditions!.isNotEmpty ? item.status!.conditions!.where((e) => e.type == 'Ready').first.status : '-'}',
      'Status: ${item.status?.conditions != null && item.status!.conditions!.isNotEmpty ? item.status!.conditions!.where((e) => e.type == 'Ready').first.message : '-'}',
      'Age: ${getAge(item.metadata?.creationTimestamp)}',
    ];
  },
  detailsItemBuilder: (
    BuildContext context,
    Resource resource,
    dynamic detailsItem,
  ) {
    final item = detailsItem as IoFluxcdToolkitSourceV1GitRepository;

    return Column(
      children: [
        DetailsItemMetadata(
          kind: item.kind,
          metadata: item.metadata,
        ),
        DetailsItemConditions(conditions: item.status?.conditions),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsItem(
          title: 'Configuration',
          details: [
            DetailsItemModel(
              name: 'Url',
              values: item.spec?.url,
            ),
            DetailsItemModel(
              name: 'Interval',
              values: item.spec?.interval,
            ),
            DetailsItemModel(
              name: 'Suspended',
              values: item.spec?.suspend == true ? 'True' : 'False',
            ),
            DetailsItemModel(
              name: 'Timeout',
              values: item.spec?.timeout,
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsItem(
          title: 'Git Repository Reference',
          details: [
            DetailsItemModel(
              name: 'Branch',
              values: item.spec?.ref?.branch,
            ),
            DetailsItemModel(
              name: 'Tag',
              values: item.spec?.ref?.tag,
            ),
            DetailsItemModel(
              name: 'SemVer',
              values: item.spec?.ref?.semver,
            ),
            DetailsItemModel(
              name: 'Name',
              values: item.spec?.ref?.name,
            ),
            DetailsItemModel(
              name: 'Commit',
              values: item.spec?.ref?.commit,
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsItem(
          title: 'Artifact',
          details: [
            DetailsItemModel(
              name: 'Path',
              values: item.status?.artifact?.path,
            ),
            DetailsItemModel(
              name: 'Url',
              values: item.status?.artifact?.url,
            ),
            DetailsItemModel(
              name: 'Revision',
              values: item.status?.artifact?.revision,
            ),
            DetailsItemModel(
              name: 'Digest',
              values: item.status?.artifact?.digest,
            ),
            DetailsItemModel(
              name: 'Last Update',
              values: getAge(item.status?.artifact?.lastUpdateTime),
            ),
            DetailsItemModel(
              name: 'Size',
              values: item.status?.artifact?.size != null
                  ? formatBytes(item.status!.artifact!.size!)
                  : null,
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreview(
          resource: resourceEvent,
          namespace: item.metadata?.namespace,
          selector:
              'fieldSelector=involvedObject.name=${item.metadata?.name ?? ''}',
          filter: null,
        ),
        const SizedBox(height: Constants.spacingMiddle),
      ],
    );
  },
);
