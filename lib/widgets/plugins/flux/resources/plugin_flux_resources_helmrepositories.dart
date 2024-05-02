import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1beta2_helm_repository.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1beta2_helm_repository_list.dart';
import 'package:kubenav/models/resource.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/widgets/plugins/flux/plugin_flux_details.dart';
import 'package:kubenav/widgets/plugins/flux/plugin_flux_list.dart';
import 'package:kubenav/widgets/plugins/flux/resources/plugin_flux_resources.dart';
import 'package:kubenav/widgets/resources/details/details_item.dart';
import 'package:kubenav/widgets/resources/details/details_resources_preview.dart';

final fluxResourceHelmRepository =
    FluxResource<IoFluxcdToolkitSourceV1beta2HelmRepository>(
  category: FluxResourceCategory.sourceController,
  plural: 'Helm Repositories',
  singular: 'Helm Repository',
  description:
      'The HelmRepository API defines a Source to produce an Artifact for a Helm repository index file or OCI Helm repository',
  path: '/apis/source.toolkit.fluxcd.io/v1beta2',
  resource: 'helmrepositories',
  decodeList: (String data) {
    final parsed = json.decode(data);
    return IoFluxcdToolkitSourceV1beta2HelmRepositoryList.fromJson(parsed)
            ?.items ??
        [];
  },
  decodeItem: (String data) {
    final parsed = json.decode(data);
    return IoFluxcdToolkitSourceV1beta2HelmRepository.fromJson(parsed);
  },
  encodeItem: (dynamic item) {
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    return encoder
        .convert((item as IoFluxcdToolkitSourceV1beta2HelmRepository).toJson());
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
    return PluginFluxList<IoFluxcdToolkitSourceV1beta2HelmRepository>(
      resource: fluxResourceHelmRepository,
      itemBuilder: (dynamic listItem) {
        final item = listItem as IoFluxcdToolkitSourceV1beta2HelmRepository;

        return PluginFluxListItem<IoFluxcdToolkitSourceV1beta2HelmRepository>(
          name: item.metadata?.name ?? '',
          namespace: item.metadata?.namespace ?? '',
          resource: fluxResourceHelmRepository,
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
    return PluginFluxDetails<IoFluxcdToolkitSourceV1beta2HelmRepository>(
      name: name,
      namespace: namespace,
      resource: fluxResourceHelmRepository,
      itemBuilder: (dynamic detailsItem) {
        final item = detailsItem as IoFluxcdToolkitSourceV1beta2HelmRepository;

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
