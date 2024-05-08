import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1beta2_helm_chart.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1beta2_helm_chart_list.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/navigate.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/plugins/flux/resources/plugin_flux_resources.dart';
import 'package:kubenav/widgets/resources/helpers/details_item.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_conditions.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_metadata.dart';
import 'package:kubenav/widgets/resources/helpers/details_resources_preview.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/resources/resources/resources_events.dart';
import 'package:kubenav/widgets/resources/resources_details.dart';
import 'package:kubenav/widgets/resources/resources_list.dart';

final Resource fluxResourceHelmChart = Resource(
  category: FluxResourceCategories.sourceController,
  plural: 'Helm Charts',
  singular: 'Helm Chart',
  description:
      'The HelmChart API defines a Source to produce an Artifact for a Helm chart archive with a set of specific configurations',
  path: '/apis/source.toolkit.fluxcd.io/v1beta2',
  resource: 'helmcharts',
  scope: ResourceScope.namespaced,
  additionalPrinterColumns: [],
  icon: 'flux',
  template: resourceDefaultTemplate,
  decodeListData: (ResourcesListData data) {
    final parsed = json.decode(data.list);
    final items =
        IoFluxcdToolkitSourceV1beta2HelmChartList.fromJson(parsed)?.items ?? [];

    return items
        .map(
          (e) => ResourceItem(
            item: e,
            metrics: null,
            status: ResourceStatus.undefined,
          ),
        )
        .toList();
  },
  decodeList: (String data) {
    final parsed = json.decode(data);
    return IoFluxcdToolkitSourceV1beta2HelmChartList.fromJson(parsed)?.items ??
        [];
  },
  getName: (dynamic item) {
    return (item as IoFluxcdToolkitSourceV1beta2HelmChart).metadata?.name ?? '';
  },
  getNamespace: (dynamic item) {
    return (item as IoFluxcdToolkitSourceV1beta2HelmChart).metadata?.namespace;
  },
  decodeItem: (String data) {
    final parsed = json.decode(data);
    return IoFluxcdToolkitSourceV1beta2HelmChart.fromJson(parsed);
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
    final item = listItem.item as IoFluxcdToolkitSourceV1beta2HelmChart;
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
    final item = listItem as IoFluxcdToolkitSourceV1beta2HelmChart;

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
    final item = detailsItem as IoFluxcdToolkitSourceV1beta2HelmChart;

    return Column(
      children: [
        DetailsItemMetadata(metadata: item.metadata),
        DetailsItemConditions(conditions: item.status?.conditions),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsItem(
          title: 'Configuration',
          details: [
            DetailsItemModel(
              name: 'Source',
              values: item.spec?.sourceRef != null
                  ? '${item.spec?.sourceRef.kind} (${item.metadata?.namespace}/${item.spec?.sourceRef.name})'
                  : null,
              onTap: item.spec?.sourceRef.kind != null &&
                      kindToFluxResource
                          .containsKey(item.spec!.sourceRef.kind.value)
                  ? (int index) {
                      final resource =
                          kindToFluxResource[item.spec!.sourceRef.kind.value];

                      if (resource != null) {
                        navigate(
                          context,
                          ResourcesDetails(
                            name: item.spec?.sourceRef.name ?? '',
                            namespace: item.metadata?.namespace ?? '',
                            resource: resource,
                          ),
                        );
                      } else {
                        showSnackbar(
                          context,
                          'Source',
                          '${item.spec!.sourceRef.kind.value} (${item.metadata?.namespace ?? ''}/${item.spec?.sourceRef.name ?? ''})',
                        );
                      }
                    }
                  : null,
            ),
            DetailsItemModel(
              name: 'Chart',
              values: item.spec?.chart,
            ),
            DetailsItemModel(
              name: 'Version',
              values: item.spec?.version,
            ),
            DetailsItemModel(
              name: 'Interval',
              values: item.spec?.interval,
            ),
            DetailsItemModel(
              name: 'Suspended',
              values: item.spec?.suspend == true ? 'True' : 'False',
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
