import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/schema.models.swagger.dart';
import 'package:kubenav/models/plugins/prometheus.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/widgets/resources/helpers/details_item.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_metadata.dart';
import 'package:kubenav/widgets/resources/helpers/details_resources_preview.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/resources/resources/resources_events.dart';
import 'package:kubenav/widgets/resources/resources_list.dart';
import 'package:kubenav/widgets/shared/app_prometheus_charts_widget.dart';

final resourceLimitRange = Resource(
  category: ResourceCategories.configAndStorage,
  plural: 'LimitRanges',
  singular: 'LimitRange',
  description:
      'A LimitRange is a policy to constrain the resource allocations (limits and requests) that you can specify for each applicable object kind in a namespace.',
  path: '/api/v1',
  resource: 'limitranges',
  scope: ResourceScope.namespaced,
  additionalPrinterColumns: [],
  icon: 'limitranges',
  template: resourceDefaultTemplate,
  decodeListData: (ResourcesListData data) {
    final parsed = json.decode(data.list);
    final items = IoK8sApiCoreV1LimitRangeList.fromJson(parsed).items;

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
    return IoK8sApiCoreV1LimitRangeList.fromJson(parsed).items;
  },
  getName: (dynamic item) {
    return (item as IoK8sApiCoreV1LimitRange).metadata?.name ?? '';
  },
  getNamespace: (dynamic item) {
    return (item as IoK8sApiCoreV1LimitRange).metadata?.namespace;
  },
  decodeItem: (String data) {
    final parsed = json.decode(data);
    return IoK8sApiCoreV1LimitRange.fromJson(parsed);
  },
  encodeItem: (dynamic item) {
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    return encoder.convert(item);
  },
  toJson: (dynamic item) {
    return json.decode(json.encode(item));
  },
  listItemBuilder:
      (BuildContext context, Resource resource, ResourceItem listItem) {
        final item = listItem.item as IoK8sApiCoreV1LimitRange;
        final status = listItem.status;

        return ResourcesListItem(
          name: item.metadata?.name ?? '',
          namespace: item.metadata?.namespace,
          resource: resource,
          item: item,
          status: status,
          details: [
            'Namespace: ${item.metadata?.namespace ?? '-'}',
            'Limits: ${item.spec?.limits.length ?? '-'}',
            'Age: ${getAge(item.metadata?.creationTimestamp)}',
          ],
        );
      },
  previewItemBuilder: (dynamic listItem) {
    final item = listItem as IoK8sApiCoreV1LimitRange;

    return [
      'Namespace: ${item.metadata?.namespace ?? '-'}',
      'Limits: ${item.spec?.limits.length ?? '-'}',
      'Age: ${getAge(item.metadata?.creationTimestamp)}',
    ];
  },
  detailsItemBuilder: (BuildContext context, Resource resource, dynamic detailsItem) {
    final item = detailsItem as IoK8sApiCoreV1LimitRange;

    return Column(
      children: [
        DetailsItemMetadata(kind: item.kind, metadata: item.metadata),
        const SizedBox(height: Constants.spacingMiddle),
        ..._buildLimits(item.spec?.limits),
        DetailsResourcesPreview(
          resource: resourceEvent,
          namespace: item.metadata?.namespace,
          selector:
              'fieldSelector=involvedObject.name=${item.metadata?.name ?? ''}',
          filter: null,
        ),
        const SizedBox(height: Constants.spacingMiddle),
        AppPrometheusChartsWidget(
          item: item,
          toJson: resource.toJson,
          defaultCharts: _buildMetrics(item.spec?.limits).entries
              .map(
                (e) => Chart(
                  title: e.key,
                  unit: '',
                  queries: [
                    Query(
                      query:
                          'sum(kube_limitrange{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", limitrange="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}", type="${e.value[0]}", resource="${e.value[1]}"}) by (type, resource, constraint)',
                      label: '{{ .constraint }}',
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ],
    );
  },
);

List<Widget> _buildLimits(List<IoK8sApiCoreV1LimitRangeItem>? limits) {
  final List<Widget> widgets = [];

  if (limits == null) {
    return widgets;
  }

  for (var i = 0; i < limits.length; i++) {
    widgets.add(
      DetailsItem(
        title: 'Limit ${i + 1}',
        details: [
          DetailsItemModel(name: 'Type', values: limits[i].type),
          DetailsItemModel(
            name: 'Defaults',
            values: limits[i].$default?.entries.map((e) {
              return '${e.key}: ${e.value}';
            }).toList(),
          ),
          DetailsItemModel(
            name: 'Default Requests',
            values: limits[i].defaultRequest?.entries.map((e) {
              return '${e.key}: ${e.value}';
            }).toList(),
          ),
          DetailsItemModel(
            name: 'Max',
            values: limits[i].max?.entries.map((e) {
              return '${e.key}: ${e.value}';
            }).toList(),
          ),
          DetailsItemModel(
            name: 'Min',
            values: limits[i].min?.entries.map((e) {
              return '${e.key}: ${e.value}';
            }).toList(),
          ),
        ],
      ),
    );
    widgets.add(const SizedBox(height: Constants.spacingMiddle));
  }

  return widgets;
}

/// [_buildMetrics] returns a map of metrics for the defined limits. The map
/// contains all unique combinations of the used types and resources in the
/// limits definition as key. The value is a list of two elements, with the type
/// as the first element and the resource as the second element.
Map<String, List<String>> _buildMetrics(
  List<IoK8sApiCoreV1LimitRangeItem>? limits,
) {
  if (limits == null) {
    return {};
  }

  final metrics = <String, List<String>>{};

  for (var i = 0; i < limits.length; i++) {
    final type = limits[i].type;

    for (var j = 0; j < (limits[i].$default?.keys.length ?? 0); j++) {
      final resource = limits[i].$default?.keys.elementAt(j);
      metrics['$type: $resource'] = [type, resource ?? ''];
    }
  }

  return metrics;
}
