import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_kustomize_v1_kustomization.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_kustomize_v1_kustomization_list.dart';
import 'package:kubenav/models/resource.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/navigate.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/plugins/flux/plugin_flux_details.dart';
import 'package:kubenav/widgets/plugins/flux/plugin_flux_list.dart';
import 'package:kubenav/widgets/plugins/flux/resources/plugin_flux_resources.dart';
import 'package:kubenav/widgets/resources/details/details_item.dart';
import 'package:kubenav/widgets/resources/details/details_resources_preview.dart';

final fluxResourceKustomization =
    FluxResource<IoFluxcdToolkitKustomizeV1Kustomization>(
  category: FluxResourceCategory.kustomizeController,
  plural: 'Kustomizations',
  singular: 'Kustomization',
  description:
      'The Kustomization API defines a pipeline for fetching, decrypting, building, validating and applying Kustomize overlays or plain Kubernetes items',
  path: '/apis/kustomize.toolkit.fluxcd.io/v1',
  resource: 'kustomizations',
  decodeList: (String data) {
    final parsed = json.decode(data);
    return IoFluxcdToolkitKustomizeV1KustomizationList.fromJson(parsed)
            ?.items ??
        [];
  },
  decodeItem: (String data) {
    final parsed = json.decode(data);
    return IoFluxcdToolkitKustomizeV1Kustomization.fromJson(parsed);
  },
  encodeItem: (dynamic item) {
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    return encoder
        .convert((item as IoFluxcdToolkitKustomizeV1Kustomization).toJson());
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
    return PluginFluxList<IoFluxcdToolkitKustomizeV1Kustomization>(
      resource: fluxResourceKustomization,
      itemBuilder: (dynamic listItem) {
        final item = listItem as IoFluxcdToolkitKustomizeV1Kustomization;

        return PluginFluxListItem<IoFluxcdToolkitKustomizeV1Kustomization>(
          name: item.metadata?.name ?? '',
          namespace: item.metadata?.namespace ?? '',
          resource: fluxResourceKustomization,
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
    return PluginFluxDetails<IoFluxcdToolkitKustomizeV1Kustomization>(
      name: name,
      namespace: namespace,
      resource: fluxResourceKustomization,
      itemBuilder: (dynamic detailsItem) {
        final item = detailsItem as IoFluxcdToolkitKustomizeV1Kustomization;

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
                  name: 'Source',
                  values: item.spec?.sourceRef != null
                      ? '${item.spec?.sourceRef.kind} (${item.spec?.sourceRef.namespace ?? item.metadata?.namespace}/${item.spec?.sourceRef.name})'
                      : null,
                  onTap: item.spec?.sourceRef.kind != null &&
                          kindToFluxResource.containsKey(
                            item.spec?.sourceRef.kind.value,
                          )
                      ? (int index) {
                          final resource = kindToFluxResource[
                              item.spec?.sourceRef.kind.value];

                          if (resource != null) {
                            navigate(
                              context,
                              resource.detailsWidget(
                                item.spec?.sourceRef.name ?? '',
                                item.spec?.sourceRef.namespace ??
                                    item.metadata?.namespace ??
                                    '',
                              ),
                            );
                          } else {
                            showSnackbar(
                              context,
                              'Source',
                              '${item.spec?.sourceRef.kind.value} (${item.spec?.sourceRef.namespace ?? item.metadata?.namespace ?? ''}/${item.spec?.sourceRef.name ?? ''})',
                            );
                          }
                        }
                      : null,
                ),
                DetailsItemModel(
                  name: 'Path',
                  values: item.spec?.path,
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
                  name: 'Prune',
                  values: item.spec?.prune == true ? 'True' : 'False',
                ),
                DetailsItemModel(
                  name: 'Timeout',
                  values: item.spec?.timeout,
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
