import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1_git_repository.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1_git_repository_list.dart';
import 'package:kubenav/models/resource.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/widgets/plugins/flux/plugin_flux_details.dart';
import 'package:kubenav/widgets/plugins/flux/plugin_flux_list.dart';
import 'package:kubenav/widgets/plugins/flux/resources/plugin_flux_resources.dart';
import 'package:kubenav/widgets/resources/details/details_item.dart';
import 'package:kubenav/widgets/resources/details/details_resources_preview.dart';

final fluxResourceGitRepository =
    FluxResource<IoFluxcdToolkitSourceV1GitRepository>(
  category: FluxResourceCategory.sourceController,
  plural: 'Git Repositories',
  singular: 'Git Repository',
  description:
      'The GitRepository API defines a Source to produce an Artifact for a Git repository revision',
  path: '/apis/source.toolkit.fluxcd.io/v1',
  resource: 'gitrepositories',
  decodeList: (String data) {
    final parsed = json.decode(data);
    return IoFluxcdToolkitSourceV1GitRepositoryList.fromJson(parsed)?.items ??
        [];
  },
  decodeItem: (String data) {
    final parsed = json.decode(data);
    return IoFluxcdToolkitSourceV1GitRepository.fromJson(parsed);
  },
  encodeItem: (dynamic item) {
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    return encoder
        .convert((item as IoFluxcdToolkitSourceV1GitRepository).toJson());
  },
  listWidget: const KustomizationsList(),
  detailsWidget: (String name, String namespace) {
    return KustomizationsDetails(
      name: name,
      namespace: namespace,
    );
  },
);

class KustomizationsList extends StatelessWidget {
  const KustomizationsList({super.key});

  @override
  Widget build(BuildContext context) {
    return PluginFluxList<IoFluxcdToolkitSourceV1GitRepository>(
      resource: fluxResourceGitRepository,
      itemBuilder: (dynamic listItem) {
        final item = listItem as IoFluxcdToolkitSourceV1GitRepository;

        return PluginFluxListItem<IoFluxcdToolkitSourceV1GitRepository>(
          name: item.metadata?.name ?? '',
          namespace: item.metadata?.namespace ?? '',
          resource: fluxResourceGitRepository,
          item: item,
          details: [
            'Namespace: ${item.metadata?.namespace ?? '-'}',
            'Ready: ${item.status?.conditions != null && item.status!.conditions!.isNotEmpty ? item.status!.conditions!.where((e) => e.type == 'Ready').first.status : '-'}',
            'Status: ${item.status?.conditions != null && item.status!.conditions!.isNotEmpty ? item.status!.conditions!.where((e) => e.type == 'Ready').first.message : '-'}',
            'Age: ${getAge(item.metadata?.creationTimestamp)}',
          ],
        );
      },
    );
  }
}

class KustomizationsDetails extends StatelessWidget {
  const KustomizationsDetails({
    super.key,
    required this.name,
    required this.namespace,
  });

  final String name;
  final String namespace;

  @override
  Widget build(BuildContext context) {
    return PluginFluxDetails<IoFluxcdToolkitSourceV1GitRepository>(
      name: name,
      namespace: namespace,
      resource: fluxResourceGitRepository,
      itemBuilder: (dynamic detailsItem) {
        final item = detailsItem as IoFluxcdToolkitSourceV1GitRepository;

        return Column(
          children: [
            DetailsItemMetadata(metadata: item.metadata),
            const SizedBox(height: Constants.spacingMiddle),
            DetailsItemConditions(conditions: item.status?.conditions),
            const SizedBox(height: Constants.spacingMiddle),
            DetailsItemWidget(
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
            DetailsItemWidget(
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
            DetailsItemWidget(
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
              title: Resources.map['events']!.title,
              resource: Resources.map['events']!.resource,
              path: Resources.map['events']!.path,
              scope: Resources.map['events']!.scope,
              additionalPrinterColumns:
                  Resources.map['events']!.additionalPrinterColumns,
              namespace: namespace,
              selector: 'fieldSelector=involvedObject.name=$name',
            ),
            const SizedBox(height: Constants.spacingMiddle),
          ],
        );
      },
    );
  }
}
