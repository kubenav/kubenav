import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:kubenav/models/kubernetes/io_k8s_apiextensions_apiserver_pkg_apis_apiextensions_v1_custom_resource_definition.dart';
import 'package:kubenav/models/kubernetes/io_k8s_apiextensions_apiserver_pkg_apis_apiextensions_v1_custom_resource_definition_list.dart';
import 'package:kubenav/models/kubernetes/io_k8s_apimachinery_pkg_apis_meta_v1_condition.dart';
import 'package:kubenav/models/kubernetes/io_k8s_apimachinery_pkg_apis_meta_v1_object_meta.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/navigate.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/utils/themes.dart';
import 'package:kubenav/widgets/resources/helpers/details_item.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_conditions.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_metadata.dart';
import 'package:kubenav/widgets/resources/helpers/details_resources_preview.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/resources/resources/resources_events.dart';
import 'package:kubenav/widgets/resources/resources_list.dart';
import 'package:kubenav/widgets/shared/app_prometheus_charts_widget.dart';
import 'package:kubenav/widgets/shared/app_vertical_list_simple_widget.dart';

final resourceCustomResourceDefinition = Resource(
  category: ResourceCategories.cluster,
  plural: 'CustomResourceDefinitions',
  singular: 'CustomResourceDefinition',
  description: 'Custom resources are extensions of the Kubernetes API.',
  path: '/apis/apiextensions.k8s.io/v1',
  resource: 'customresourcedefinitions',
  scope: ResourceScope.cluster,
  additionalPrinterColumns: [],
  icon: 'customresourcedefinitions',
  template: resourceDefaultTemplate,
  decodeListData: (ResourcesListData data) {
    final parsed = json.decode(data.list);
    final items =
        IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionList
                    .fromJson(parsed)
                ?.items ??
            [];
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
    return IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinitionList
                .fromJson(parsed)
            ?.items ??
        [];
  },
  getName: (dynamic item) {
    return (item
                as IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinition)
            .metadata
            ?.name ??
        '';
  },
  getNamespace: (dynamic item) {
    return (item
            as IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinition)
        .metadata
        ?.namespace;
  },
  decodeItem: (String data) {
    final parsed = json.decode(data);
    return IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinition
        .fromJson(parsed);
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
    final item = listItem.item
        as IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinition;
    final status = listItem.status;

    return ResourcesListItem(
      name: item.metadata?.name ?? '',
      namespace: item.metadata?.namespace,
      resource: resource,
      item: item,
      status: status,
      details: [
        'Kind: ${item.spec.names.kind}',
        'Scope: ${item.spec.scope}',
        'Age: ${getAge(item.metadata?.creationTimestamp)}',
      ],
    );
  },
  previewItemBuilder: (
    dynamic listItem,
  ) {
    final item = listItem
        as IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinition;

    return [
      'Kind: ${item.spec.names.kind}',
      'Scope: ${item.spec.scope}',
      'Age: ${getAge(item.metadata?.creationTimestamp)}',
    ];
  },
  detailsItemBuilder: (
    BuildContext context,
    Resource resource,
    dynamic detailsItem,
  ) {
    final item = detailsItem
        as IoK8sApiextensionsApiserverPkgApisApiextensionsV1CustomResourceDefinition;

    return Column(
      children: [
        DetailsItemMetadata(
          kind: item.kind,
          metadata: item.metadata,
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsItem(
          title: 'Configuration',
          details: [
            DetailsItemModel(
              name: 'Group',
              values: item.spec.group,
            ),
            DetailsItemModel(
              name: 'Kind',
              values: item.spec.names.kind,
            ),
            DetailsItemModel(
              name: 'List Kind',
              values: item.spec.names.listKind,
            ),
            DetailsItemModel(
              name: 'Plural',
              values: item.spec.names.plural,
            ),
            DetailsItemModel(
              name: 'Singular',
              values: item.spec.names.singular,
            ),
            DetailsItemModel(
              name: 'Scope',
              values: item.spec.scope,
            ),
            DetailsItemModel(
              name: 'Conversion Strategy',
              values: item.spec.conversion?.strategy,
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        AppVerticalListSimpleWidget(
          title: 'Versions',
          items: item.spec.versions
              .map(
                (version) => AppVerticalListSimpleModel(
                  onTap: () {
                    final customResource = buildCustomResource(
                      item.spec.names.plural,
                      item.spec.names.singular ?? item.spec.names.plural,
                      '${item.spec.group}/${version.name}',
                      '/apis/${item.spec.group}/${version.name}',
                      item.spec.names.plural,
                      item.spec.scope,
                      version.additionalPrinterColumns
                          .where((e) => e.priority == null || e.priority == 0)
                          .map(
                            (e) => AdditionalPrinterColumns(
                              description: e.description ?? '',
                              jsonPath: e.jsonPath,
                              name: e.name,
                              type: e.type,
                            ),
                          )
                          .toList(),
                    );

                    navigate(
                      context,
                      ResourcesList(
                        resource: customResource,
                        namespace: null,
                        selector: null,
                      ),
                    );
                  },
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(Constants.sizeBorderRadius),
                        ),
                      ),
                      height: 54,
                      width: 54,
                      padding: const EdgeInsets.all(
                        Constants.spacingIcon54x54,
                      ),
                      child: SvgPicture.asset(
                        'assets/resources/customresourcedefinitions.svg',
                      ),
                    ),
                    const SizedBox(width: Constants.spacingSmall),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            version.name,
                            style: primaryTextStyle(
                              context,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '${version.deprecated == true ? 'Deprecated' : 'Stable'}: ${version.deprecationWarning ?? '-'}',
                            style: secondaryTextStyle(
                              context,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: Constants.spacingSmall),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Theme.of(context)
                          .extension<CustomColors>()!
                          .textSecondary
                          .withOpacity(Constants.opacityIcon),
                      size: 24,
                    ),
                  ],
                ),
              )
              .toList(),
        ),
        const SizedBox(height: Constants.spacingMiddle),
      ],
    );
  },
);

Resource buildCustomResource(
  String plural,
  String singular,
  String description,
  String path,
  String resource,
  String scope,
  List<AdditionalPrinterColumns> additionalPrinterColumns,
) {
  return Resource(
    category: ResourceCategories.cluster,
    plural: plural,
    singular: singular,
    description: description,
    path: path,
    resource: resource,
    scope: getResourceScopeFromString(scope),
    additionalPrinterColumns: additionalPrinterColumns,
    icon: 'customresourcedefinitions',
    template: resourceDefaultTemplate,
    decodeListData: (ResourcesListData data) {
      final parsed = json.decode(data.list);

      return parsed.containsKey('items')
          ? (parsed['items'] as List<dynamic>)
              .map(
                (e) => ResourceItem(
                  item: e,
                  metrics: null,
                  status: ResourceStatus.undefined,
                ),
              )
              .toList()
          : [] as List<ResourceItem>;
    },
    decodeList: (String data) {
      final parsed = json.decode(data);
      return parsed.containsKey('items')
          ? parsed['items'] as List<dynamic>
          : [];
    },
    getName: (dynamic item) {
      return item.containsKey('metadata') &&
              item['metadata'] != null &&
              item['metadata'].containsKey('name') &&
              item['metadata']['name'] != null
          ? item['metadata']['name']
          : '';
    },
    getNamespace: (dynamic item) {
      return item.containsKey('metadata') &&
              item['metadata'] != null &&
              item['metadata'].containsKey('namespace') &&
              item['metadata']['namespace'] != null
          ? item['metadata']['namespace']
          : null;
    },
    decodeItem: (String data) {
      return json.decode(data);
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
      final name = resource.getName(listItem.item);
      final namespace = resource.getNamespace(listItem.item);
      final List<String> details =
          namespace != null ? ['Namespace: $namespace'] : [];

      if (resource.additionalPrinterColumns.isNotEmpty) {
        details.addAll(
          resource.additionalPrinterColumns.map(
            (e) =>
                '${e.name}: ${getAdditionalPrinterColumnValue(e, listItem.item)}',
          ),
        );
      } else if (listItem.item.containsKey('metadata') &&
          listItem.item['metadata'] != null &&
          listItem.item['metadata'].containsKey('creationTimestamp') &&
          listItem.item['metadata']['creationTimestamp'] != null) {
        details.add(
          'Age: ${getAge(DateTime.parse(listItem.item['metadata']['creationTimestamp']))}',
        );
      }

      return ResourcesListItem(
        name: name,
        namespace: namespace,
        resource: resource,
        item: listItem.item,
        status: listItem.status,
        details: details,
      );
    },
    previewItemBuilder: (
      dynamic listItem,
    ) {
      return [];
    },
    detailsItemBuilder: (
      BuildContext context,
      Resource resource,
      dynamic detailsItem,
    ) {
      return CustomResourceItem(
        resource: resource,
        item: detailsItem,
      );
    },
  );
}

class CustomResourceItem extends StatelessWidget {
  const CustomResourceItem({
    super.key,
    required this.resource,
    required this.item,
  });

  final Resource resource;
  final dynamic item;

  Future<IoK8sApimachineryPkgApisMetaV1ObjectMeta?> _getMetadata() async {
    try {
      return IoK8sApimachineryPkgApisMetaV1ObjectMeta.fromJson(
        item['metadata'],
      );
    } catch (err) {
      return null;
    }
  }

  Future<List<IoK8sApimachineryPkgApisMetaV1Condition>?>
      _getConditions() async {
    try {
      if (item.containsKey('status') &&
          item['status'] != null &&
          item['status'].containsKey('conditions') &&
          item['status']['conditions'] != null &&
          item['status']['conditions'] is List<dynamic>) {
        final List<IoK8sApimachineryPkgApisMetaV1Condition> conditions = [];

        for (final condition in item['status']['conditions']) {
          final value =
              IoK8sApimachineryPkgApisMetaV1Condition.fromJson(condition);
          if (value != null) {
            conditions.add(value);
          }
        }

        return conditions;
      }
      return null;
    } catch (err) {
      return null;
    }
  }

  List<Widget> _buildAdditionalPrinterColumns(BuildContext context) {
    if (resource.additionalPrinterColumns.isEmpty) {
      return [Container()];
    }

    List<DetailsItemModel> detailsItems = [];

    for (final additionalPrinterColumn in resource.additionalPrinterColumns) {
      final value = getAdditionalPrinterColumnValue(
        additionalPrinterColumn,
        item,
      );

      detailsItems.add(
        DetailsItemModel(
          name: additionalPrinterColumn.name,
          values: value,
          onTap: additionalPrinterColumn.description == ''
              ? null
              : (index) {
                  showSnackbar(
                    context,
                    '${additionalPrinterColumn.name}: $value',
                    additionalPrinterColumn.description,
                  );
                },
        ),
      );
    }

    return [
      const SizedBox(height: Constants.spacingMiddle),
      DetailsItem(
        title: 'Additional Information',
        details: detailsItems,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
          future: _getMetadata(),
          builder: (
            BuildContext context,
            AsyncSnapshot<IoK8sApimachineryPkgApisMetaV1ObjectMeta?> snapshot,
          ) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.primary,
                );
              default:
                return DetailsItemMetadata(
                  kind: item != null && item.containsKey('kind')
                      ? item['kind']
                      : null,
                  metadata: snapshot.data,
                );
            }
          },
        ),
        FutureBuilder(
          future: _getConditions(),
          builder: (
            BuildContext context,
            AsyncSnapshot<List<IoK8sApimachineryPkgApisMetaV1Condition>?>
                snapshot,
          ) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.primary,
                );
              default:
                return DetailsItemConditions(conditions: snapshot.data);
            }
          },
        ),
        ..._buildAdditionalPrinterColumns(context),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreview(
          resource: resourceEvent,
          namespace: resource.getNamespace(item),
          selector:
              'fieldSelector=involvedObject.name=${resource.getName(item)}',
          filter: null,
        ),
        const SizedBox(height: Constants.spacingMiddle),
        AppPrometheusChartsWidget(
          item: item,
          toJson: resource.toJson,
          defaultCharts: const [],
        ),
      ],
    );
  }
}
