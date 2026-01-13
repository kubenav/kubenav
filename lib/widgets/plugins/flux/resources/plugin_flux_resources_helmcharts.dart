import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/schema.models.swagger.dart';
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
  path: '/apis/source.toolkit.fluxcd.io/v1',
  resource: 'helmcharts',
  scope: ResourceScope.namespaced,
  additionalPrinterColumns: [],
  icon: 'flux',
  template: resourceDefaultTemplate,
  decodeListData: (ResourcesListData data) {
    final parsed = json.decode(data.list);
    final items = IoFluxcdToolkitSourceV1HelmChartList.fromJson(parsed).items;

    return items.map((e) {
      final status =
          e.status?.conditions != null && e.status!.conditions!.isNotEmpty
          ? e.status!.conditions!
                .where((e) => e.type == 'Ready')
                .firstOrNull
                ?.status
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
    }).toList();
  },
  decodeList: (String data) {
    final parsed = json.decode(data);
    return IoFluxcdToolkitSourceV1HelmChartList.fromJson(parsed).items;
  },
  getName: (dynamic item) {
    return (item as IoFluxcdToolkitSourceV1HelmChart).metadata?.name ?? '';
  },
  getNamespace: (dynamic item) {
    return (item as IoFluxcdToolkitSourceV1HelmChart).metadata?.namespace;
  },
  decodeItem: (String data) {
    final parsed = json.decode(data);
    return IoFluxcdToolkitSourceV1HelmChart.fromJson(parsed);
  },
  encodeItem: (dynamic item) {
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    return encoder.convert(item);
  },
  toJson: (dynamic item) {
    return json.decode(json.encode(item));
  },
  listItemBuilder: (BuildContext context, Resource resource, ResourceItem listItem) {
    final item = listItem.item as IoFluxcdToolkitSourceV1HelmChart;
    final status = listItem.status;

    return ResourcesListItem(
      name: item.metadata?.name ?? '',
      namespace: item.metadata?.namespace ?? '',
      resource: resource,
      item: item,
      status: status,
      details: [
        'Namespace: ${item.metadata?.namespace ?? '-'}',
        'Ready: ${item.status?.conditions != null && item.status!.conditions!.isNotEmpty ? item.status!.conditions!.where((e) => e.type == 'Ready').firstOrNull?.status : '-'}',
        'Status: ${item.status?.conditions != null && item.status!.conditions!.isNotEmpty ? item.status!.conditions!.where((e) => e.type == 'Ready').firstOrNull?.message : '-'}',
        'Age: ${getAge(item.metadata?.creationTimestamp)}',
      ],
    );
  },
  previewItemBuilder: (dynamic listItem) {
    final item = listItem as IoFluxcdToolkitSourceV1HelmChart;

    return [
      'Namespace: ${item.metadata?.namespace ?? '-'}',
      'Ready: ${item.status?.conditions != null && item.status!.conditions!.isNotEmpty ? item.status!.conditions!.where((e) => e.type == 'Ready').firstOrNull?.status : '-'}',
      'Status: ${item.status?.conditions != null && item.status!.conditions!.isNotEmpty ? item.status!.conditions!.where((e) => e.type == 'Ready').firstOrNull?.message : '-'}',
      'Age: ${getAge(item.metadata?.creationTimestamp)}',
    ];
  },
  detailsItemBuilder: (BuildContext context, Resource resource, dynamic detailsItem) {
    final item = detailsItem as IoFluxcdToolkitSourceV1HelmChart;

    return Column(
      children: [
        DetailsItemMetadata(kind: item.kind, metadata: item.metadata),
        DetailsItemConditions(
          conditions: item.status?.conditions
              ?.map(
                (e) => IoK8sApimachineryPkgApisMetaV1Condition(
                  lastTransitionTime: e.lastTransitionTime,
                  message: e.message,
                  observedGeneration: 0,
                  reason: e.reason,
                  status: e.status.value ?? '',
                  type: e.type,
                ),
              )
              .toList(),
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsItem(
          title: 'Configuration',
          details: [
            DetailsItemModel(
              name: 'Source',
              values: item.spec?.sourceRef != null
                  ? '${item.spec?.sourceRef.kind} (${item.metadata?.namespace}/${item.spec?.sourceRef.name})'
                  : null,
              onTap:
                  item.spec?.sourceRef.kind != null &&
                      kindToFluxResource.containsKey(
                        item.spec!.sourceRef.kind.value,
                      )
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
            DetailsItemModel(name: 'Chart', values: item.spec?.chart),
            DetailsItemModel(name: 'Version', values: item.spec?.version),
            DetailsItemModel(name: 'Interval', values: item.spec?.interval),
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
            DetailsItemModel(name: 'Path', values: item.status?.artifact?.path),
            DetailsItemModel(name: 'Url', values: item.status?.artifact?.url),
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
