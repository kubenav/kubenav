import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/schema.models.swagger.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/widgets/resources/helpers/details_item.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_metadata.dart';
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
    final items = IoK8sApiCoreV1EventList.fromJson(parsed).items;

    return items
        .map(
          (e) => ResourceItem(
            item: e,
            metrics: null,
            status: e.type == 'Normal'
                ? ResourceStatus.success
                : ResourceStatus.warning,
          ),
        )
        .toList();
  },
  decodeList: (String data) {
    final parsed = json.decode(data);
    return IoK8sApiCoreV1EventList.fromJson(parsed).items;
  },
  getName: (dynamic item) {
    return (item as IoK8sApiCoreV1Event).metadata.name ?? '';
  },
  getNamespace: (dynamic item) {
    return (item as IoK8sApiCoreV1Event).metadata.namespace;
  },
  decodeItem: (String data) {
    final parsed = json.decode(data);
    return IoK8sApiCoreV1Event.fromJson(parsed);
  },
  encodeItem: (dynamic item) {
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    return encoder.convert(item);
  },
  toJson: (dynamic item) {
    return json.decode(json.encode(item));
  },
  listItemBuilder: (BuildContext context, Resource resource, ResourceItem listItem) {
    final item = listItem.item as IoK8sApiCoreV1Event;
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
    final item = listItem as IoK8sApiCoreV1Event;

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
        final item = detailsItem as IoK8sApiCoreV1Event;

        return Column(
          children: [
            DetailsItemMetadata(kind: item.kind, metadata: item.metadata),
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
                goToReference(context, item.involvedObject, null);
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
