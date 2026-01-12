import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/eventlist_v1.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/widgets/resources/helpers/details_item.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_metadata.dart'
    as details_item_metadata;
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/resources/resources_list.dart';
import 'package:kubenav/widgets/shared/app_prometheus_charts_widget.dart';

final resourceEvent = Resource(
  category: ResourceCategories.cluster,
  plural: 'Events',
  singular: 'Event',
  description:
      'Events are automatically created when other resources have state changes, errors, or other messages that should be broadcast to the system.',
  path: '/api/v1',
  resource: 'events',
  scope: ResourceScope.namespaced,
  additionalPrinterColumns: [],
  icon: 'events',
  template: resourceDefaultTemplate,
  decodeListData: (ResourcesListData data) {
    final parsed = json.decode(data.list);
    final items = EventlistV1.fromJson(parsed).items;

    return items
        .map(
          (e) => ResourceItem(
            item: e,
            metrics: null,
            status: e?.type == 'Normal'
                ? ResourceStatus.success
                : ResourceStatus.warning,
          ),
        )
        .toList();
  },
  decodeList: (String data) {
    final parsed = json.decode(data);
    return EventlistV1.fromJson(parsed).items;
  },
  getName: (dynamic item) {
    return (item as Item).metadata.name ?? '';
  },
  getNamespace: (dynamic item) {
    return (item as Item).metadata.namespace;
  },
  decodeItem: (String data) {
    final parsed = json.decode(data);
    return Item.fromJson(parsed);
  },
  encodeItem: (dynamic item) {
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    return encoder.convert(item);
  },
  toJson: (dynamic item) {
    return json.decode(json.encode(item));
  },
  listItemBuilder: (BuildContext context, Resource resource, ResourceItem listItem) {
    final item = listItem.item as Item;
    final status = listItem.status;

    return ResourcesListItem(
      name: item.metadata.name ?? '',
      namespace: item.metadata.namespace,
      resource: resource,
      item: item,
      status: status,
      details: [
        'Namespace: ${item.metadata.namespace ?? '-'}',
        'Last Seen: ${getAge(item.lastTimestamp ?? item.eventTime ?? item.metadata.creationTimestamp)}',
        'Type: ${item.type ?? '-'}',
        'Reason: ${item.reason ?? '-'}',
        'Object: ${item.involvedObject.kind ?? '-'}/${item.involvedObject.name ?? '-'}',
        'Message: ${item.message ?? '-'}',
      ],
    );
  },
  previewItemBuilder: (dynamic listItem) {
    final item = listItem as Item;

    return [
      'Namespace: ${item.metadata.namespace ?? '-'}',
      'Last Seen: ${getAge(item.lastTimestamp ?? item.eventTime ?? item.metadata.creationTimestamp)}',
      'Type: ${item.type ?? '-'}',
      'Reason: ${item.reason ?? '-'}',
      'Object: ${item.involvedObject.kind ?? '-'}/${item.involvedObject.name ?? '-'}',
      'Message: ${item.message ?? '-'}',
    ];
  },
  detailsItemBuilder:
      (BuildContext context, Resource resource, dynamic detailsItem) {
        final item = detailsItem as Item;

        return Column(
          children: [
            details_item_metadata.DetailsItemMetadata(
              kind: item.kind?.name,
              metadata: details_item_metadata.Metadata(
                name: item.metadata.name,
                namespace: item.metadata.namespace,
                labels: item.metadata.labels,
                annotations: item.metadata.annotations,
                creationTimestamp: item.metadata.creationTimestamp,
                ownerReferences: item.metadata.ownerReferences
                    ?.map(
                      (ownerReference) => details_item_metadata.OwnerReference(
                        apiVersion: ownerReference?.apiVersion ?? '',
                        blockOwnerDeletion: ownerReference?.blockOwnerDeletion,
                        controller: ownerReference?.controller,
                        kind: ownerReference?.kind ?? '',
                        name: ownerReference?.name ?? '',
                        uid: ownerReference?.uid ?? '',
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: Constants.spacingMiddle),
            DetailsItem(
              title: 'Details',
              details: [
                DetailsItemModel(name: 'Type', values: item.type),
                DetailsItemModel(name: 'Reason', values: item.reason),
                DetailsItemModel(name: 'Message', values: item.message),
                DetailsItemModel(
                  name: 'Event Time',
                  values: getAge(item.eventTime),
                ),
                DetailsItemModel(
                  name: 'Last Seen',
                  values: getAge(item.lastTimestamp),
                ),
                DetailsItemModel(
                  name: 'First Seen',
                  values: getAge(item.firstTimestamp),
                ),
                DetailsItemModel(name: 'Count', values: item.count),
                DetailsItemModel(
                  name: 'Source',
                  values: item.source?.component,
                ),
                DetailsItemModel(
                  name: 'Reporting Component',
                  values: item.reportingComponent,
                ),
              ],
            ),
            const SizedBox(height: Constants.spacingMiddle),
            DetailsItem(
              title: 'Involved Object',
              goTo: 'View',
              goToOnTap: () {
                goToReference(
                  context,
                  Reference(
                    apiVersion: item.involvedObject.apiVersion,
                    fieldPath: item.involvedObject.fieldPath,
                    kind: item.involvedObject.kind,
                    name: item.involvedObject.name,
                    namespace: item.involvedObject.namespace,
                    resourceVersion: item.involvedObject.resourceVersion,
                    uid: item.involvedObject.uid,
                  ),
                  null,
                );
              },
              details: [
                DetailsItemModel(
                  name: 'API Version',
                  values: item.involvedObject.apiVersion,
                ),
                DetailsItemModel(
                  name: 'Kind',
                  values: item.involvedObject.kind,
                ),
                DetailsItemModel(
                  name: 'Name',
                  values: item.involvedObject.name,
                ),
                DetailsItemModel(
                  name: 'Namespace',
                  values: item.involvedObject.namespace,
                ),
              ],
            ),
            const SizedBox(height: Constants.spacingMiddle),
            AppPrometheusChartsWidget(
              item: item,
              toJson: resource.toJson,
              defaultCharts: const [],
            ),
          ],
        );
      },
);
