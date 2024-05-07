import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_helm_v2beta2_helm_release.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_helm_v2beta2_helm_release_list.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/navigate.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/plugins/flux/plugin_flux_details.dart';
import 'package:kubenav/widgets/plugins/flux/plugin_flux_list.dart';
import 'package:kubenav/widgets/plugins/flux/resources/plugin_flux_resources.dart';
import 'package:kubenav/widgets/resources/helpers/details_item.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_conditions.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_metadata.dart';
import 'package:kubenav/widgets/resources/helpers/details_resources_preview.dart';
import 'package:kubenav/widgets/resources/resources/resources_events.dart';

final fluxResourceHelmRelease =
    FluxResource<IoFluxcdToolkitHelmV2beta2HelmRelease>(
  category: FluxResourceCategory.helmController,
  plural: 'Helm Releases',
  singular: 'Helm Release',
  description:
      'The HelmRelease API allows for controller-driven reconciliation of Helm releases via Helm actions such as install, upgrade, test, uninstall, and rollback',
  path: '/apis/helm.toolkit.fluxcd.io/v2beta2',
  resource: 'helmreleases',
  decodeList: (String data) {
    final parsed = json.decode(data);
    return IoFluxcdToolkitHelmV2beta2HelmReleaseList.fromJson(parsed)?.items ??
        [];
  },
  decodeItem: (String data) {
    final parsed = json.decode(data);
    return IoFluxcdToolkitHelmV2beta2HelmRelease.fromJson(parsed);
  },
  encodeItem: (dynamic item) {
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    return encoder.convert(item);
  },
  listWidget: const ListWidget(),
  detailsWidget: (String name, String namespace) {
    return DetailsWidget(
      name: name,
      namespace: namespace,
    );
  },
);

class ListWidget extends StatelessWidget {
  const ListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PluginFluxList<IoFluxcdToolkitHelmV2beta2HelmRelease>(
      resource: fluxResourceHelmRelease,
      itemBuilder: (dynamic listItem) {
        final item = listItem as IoFluxcdToolkitHelmV2beta2HelmRelease;

        return PluginFluxListItem<IoFluxcdToolkitHelmV2beta2HelmRelease>(
          name: item.metadata?.name ?? '',
          namespace: item.metadata?.namespace ?? '',
          resource: fluxResourceHelmRelease,
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

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({
    super.key,
    required this.name,
    required this.namespace,
  });

  final String name;
  final String namespace;

  @override
  Widget build(BuildContext context) {
    return PluginFluxDetails<IoFluxcdToolkitHelmV2beta2HelmRelease>(
      name: name,
      namespace: namespace,
      resource: fluxResourceHelmRelease,
      itemBuilder: (dynamic detailsItem) {
        final item = detailsItem as IoFluxcdToolkitHelmV2beta2HelmRelease;

        return Column(
          children: [
            DetailsItemMetadata(metadata: item.metadata),
            const SizedBox(height: Constants.spacingMiddle),
            DetailsItemConditions(conditions: item.status?.conditions),
            const SizedBox(height: Constants.spacingMiddle),
            DetailsItem(
              title: 'Configuration',
              details: [
                DetailsItemModel(
                  name: 'Chart',
                  values: item.spec?.chart.spec.chart,
                ),
                DetailsItemModel(
                  name: 'Source',
                  values: item.spec?.chart.spec.sourceRef != null
                      ? '${item.spec?.chart.spec.sourceRef.kind} (${item.spec?.chart.spec.sourceRef.namespace ?? item.metadata?.namespace}/${item.spec?.chart.spec.sourceRef.name})'
                      : null,
                  onTap: item.spec?.chart.spec.sourceRef.kind != null &&
                          kindToFluxResource.containsKey(
                            item.spec!.chart.spec.sourceRef.kind!.value,
                          )
                      ? (int index) {
                          final resource = kindToFluxResource[
                              item.spec!.chart.spec.sourceRef.kind!.value];

                          if (resource != null) {
                            navigate(
                              context,
                              resource.detailsWidget(
                                item.spec?.chart.spec.sourceRef.name ?? '',
                                item.spec?.chart.spec.sourceRef.namespace ??
                                    item.metadata?.namespace ??
                                    '',
                              ),
                            );
                          } else {
                            showSnackbar(
                              context,
                              'Source',
                              '${item.spec!.chart.spec.sourceRef.kind!.value} (${item.spec?.chart.spec.sourceRef.namespace ?? item.metadata?.namespace ?? ''}/${item.spec?.chart.spec.sourceRef.name ?? ''})',
                            );
                          }
                        }
                      : null,
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
              title: 'Status',
              details: [
                DetailsItemModel(
                  name: 'Helm Chart',
                  values: item.status?.helmChart,
                  onTap: item.status?.helmChart != null
                      ? (int index) {
                          final resource = kindToFluxResource['HelmChart'];
                          final namespacename =
                              item.status?.helmChart!.split('/');

                          if (resource != null) {
                            navigate(
                              context,
                              resource.detailsWidget(
                                namespacename != null ? namespacename[1] : '',
                                namespacename != null ? namespacename[0] : '',
                              ),
                            );
                          } else {
                            showSnackbar(
                              context,
                              'Helm Chart',
                              'HelmChart (${namespacename != null ? namespacename[0] : ''}/${namespacename != null ? namespacename[1] : ''})',
                            );
                          }
                        }
                      : null,
                ),
                DetailsItemModel(
                  name: 'Last Applied Revision',
                  values: item.status?.lastAppliedRevision,
                ),
                DetailsItemModel(
                  name: 'Last Attempted Revision',
                  values: item.status?.lastAttemptedRevision,
                ),
                DetailsItemModel(
                  name: 'Failures',
                  values: item.status?.failures,
                ),
                DetailsItemModel(
                  name: 'Install Failures',
                  values: item.status?.installFailures,
                ),
                DetailsItemModel(
                  name: 'Upgrade Failures',
                  values: item.status?.upgradeFailures,
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
  }
}
