import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_kustomize_v1_kustomization.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_kustomize_v1_kustomization_list.dart';
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

final Resource fluxResourceKustomization = Resource(
  category: FluxResourceCategories.kustomizeController,
  plural: 'Kustomizations',
  singular: 'Kustomization',
  description:
      'The Kustomization API defines a pipeline for fetching, decrypting, building, validating and applying Kustomize overlays or plain Kubernetes items',
  path: '/apis/kustomize.toolkit.fluxcd.io/v1',
  resource: 'kustomizations',
  scope: ResourceScope.namespaced,
  additionalPrinterColumns: [],
  icon: 'flux',
  template: resourceDefaultTemplate,
  decodeListData: (ResourcesListData data) {
    final parsed = json.decode(data.list);
    final items =
        IoFluxcdToolkitKustomizeV1KustomizationList.fromJson(parsed)?.items ??
            [];

    return items.map(
      (e) {
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
      },
    ).toList();
  },
  decodeList: (String data) {
    final parsed = json.decode(data);
    return IoFluxcdToolkitKustomizeV1KustomizationList.fromJson(parsed)
            ?.items ??
        [];
  },
  getName: (dynamic item) {
    return (item as IoFluxcdToolkitKustomizeV1Kustomization).metadata?.name ??
        '';
  },
  getNamespace: (dynamic item) {
    return (item as IoFluxcdToolkitKustomizeV1Kustomization)
        .metadata
        ?.namespace;
  },
  decodeItem: (String data) {
    final parsed = json.decode(data);
    return IoFluxcdToolkitKustomizeV1Kustomization.fromJson(parsed);
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
    final item = listItem.item as IoFluxcdToolkitKustomizeV1Kustomization;
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
  previewItemBuilder: (
    dynamic listItem,
  ) {
    final item = listItem as IoFluxcdToolkitKustomizeV1Kustomization;

    return [
      'Namespace: ${item.metadata?.namespace ?? '-'}',
      'Ready: ${item.status?.conditions != null && item.status!.conditions!.isNotEmpty ? item.status!.conditions!.where((e) => e.type == 'Ready').firstOrNull?.status : '-'}',
      'Status: ${item.status?.conditions != null && item.status!.conditions!.isNotEmpty ? item.status!.conditions!.where((e) => e.type == 'Ready').firstOrNull?.message : '-'}',
      'Age: ${getAge(item.metadata?.creationTimestamp)}',
    ];
  },
  detailsItemBuilder: (
    BuildContext context,
    Resource resource,
    dynamic detailsItem,
  ) {
    final item = detailsItem as IoFluxcdToolkitKustomizeV1Kustomization;

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
              name: 'Source',
              values: item.spec?.sourceRef != null
                  ? '${item.spec?.sourceRef.kind} (${item.spec?.sourceRef.namespace ?? item.metadata?.namespace}/${item.spec?.sourceRef.name})'
                  : null,
              onTap: item.spec?.sourceRef.kind != null &&
                      kindToFluxResource.containsKey(
                        item.spec?.sourceRef.kind.value,
                      )
                  ? (int index) {
                      final resource =
                          kindToFluxResource[item.spec?.sourceRef.kind.value];

                      if (resource != null) {
                        navigate(
                          context,
                          ResourcesDetails(
                            name: item.spec?.sourceRef.name ?? '',
                            namespace: item.spec?.sourceRef.namespace ??
                                item.metadata?.namespace ??
                                '',
                            resource: resource,
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
