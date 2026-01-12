import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:kubenav/models/kubernetes_extensions/customresourcedefinitions.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/navigate.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/utils/themes.dart';
import 'package:kubenav/widgets/resources/helpers/details_item.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_conditions.dart'
    as details_item_conditions;
import 'package:kubenav/widgets/resources/helpers/details_item_metadata.dart'
    as details_item_metadata;
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
    final items = CustomResourceDefinitionList.fromJson(parsed).items;
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
    return CustomResourceDefinitionList.fromJson(parsed).items;
  },
  getName: (dynamic item) {
    return (item as CustomResourceDefinition).metadata?.name ?? '';
  },
  getNamespace: (dynamic item) {
    return (item as CustomResourceDefinition).metadata?.namespace;
  },
  decodeItem: (String data) {
    final parsed = json.decode(data);
    return CustomResourceDefinition.fromJson(parsed);
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
        final item = listItem.item as CustomResourceDefinition;
        final status = listItem.status;

        return ResourcesListItem(
          name: item.metadata?.name ?? '',
          namespace: item.metadata?.namespace,
          resource: resource,
          item: item,
          status: status,
          details: [
            'Kind: ${item.spec?.names.kind}',
            'Scope: ${item.spec?.scope}',
            'Age: ${getAge(item.metadata?.creationTimestamp)}',
          ],
        );
      },
  previewItemBuilder: (dynamic listItem) {
    final item = listItem as CustomResourceDefinition;

    return [
      'Kind: ${item.spec?.names.kind}',
      'Scope: ${item.spec?.scope}',
      'Age: ${getAge(item.metadata?.creationTimestamp)}',
    ];
  },
  detailsItemBuilder:
      (BuildContext context, Resource resource, dynamic detailsItem) {
        final item = detailsItem as CustomResourceDefinition;

        return Column(
          children: [
            details_item_metadata.DetailsItemMetadata(
              kind: 'CustomResourceDefinition',
              metadata: details_item_metadata.Metadata(
                name: item.metadata?.name,
                namespace: item.metadata?.namespace,
                labels: item.metadata?.labels,
                annotations: item.metadata?.annotations,
                creationTimestamp: item.metadata?.creationTimestamp,
                ownerReferences: item.metadata?.ownerReferences
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
              title: 'Configuration',
              details: [
                DetailsItemModel(name: 'Group', values: item.spec?.group),
                DetailsItemModel(name: 'Kind', values: item.spec?.names.kind),
                DetailsItemModel(
                  name: 'List Kind',
                  values: item.spec?.names.listKind,
                ),
                DetailsItemModel(
                  name: 'Plural',
                  values: item.spec?.names.plural,
                ),
                DetailsItemModel(
                  name: 'Singular',
                  values: item.spec?.names.singular,
                ),
                DetailsItemModel(name: 'Scope', values: item.spec?.scope),
                DetailsItemModel(
                  name: 'Conversion Strategy',
                  values: item.spec?.conversion?.strategy,
                ),
              ],
            ),
            const SizedBox(height: Constants.spacingMiddle),
            AppVerticalListSimpleWidget(
              title: 'Versions',
              items:
                  item.spec?.versions
                      .map(
                        (version) => AppVerticalListSimpleModel(
                          onTap: () {
                            final customResource = buildCustomResource(
                              item.spec?.names.plural ?? '',
                              item.spec?.names.singular ??
                                  item.spec?.names.plural ??
                                  '',
                              '${item.spec?.group}/${version.name}',
                              '/apis/${item.spec?.group}/${version.name}',
                              item.spec?.names.plural ?? '',
                              item.spec?.scope ?? '',
                              version.additionalPrinterColumns
                                  .where(
                                    (e) =>
                                        e.priority == null || e.priority == 0,
                                  )
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
                                    style: primaryTextStyle(context),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    '${version.deprecated == true ? 'Deprecated' : 'Stable'}: ${version.deprecationWarning ?? '-'}',
                                    style: secondaryTextStyle(context),
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
                                  .withValues(alpha: Constants.opacityIcon),
                              size: 24,
                            ),
                          ],
                        ),
                      )
                      .toList() ??
                  [],
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
    listItemBuilder: (BuildContext context, Resource resource, ResourceItem listItem) {
      final name = resource.getName(listItem.item);
      final namespace = resource.getNamespace(listItem.item);
      final List<String> details = namespace != null
          ? ['Namespace: $namespace']
          : [];

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
    previewItemBuilder: (dynamic listItem) {
      return [];
    },
    detailsItemBuilder:
        (BuildContext context, Resource resource, dynamic detailsItem) {
          return CustomResourceItem(resource: resource, item: detailsItem);
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

  Future<CustomResourceDefinitionMetadata?> _getMetadata() async {
    try {
      return CustomResourceDefinitionMetadata.fromJson(item['metadata']);
    } catch (err) {
      return null;
    }
  }

  Future<List<Condition>?> _getConditions() async {
    try {
      if (item.containsKey('status') &&
          item['status'] != null &&
          item['status'].containsKey('conditions') &&
          item['status']['conditions'] != null &&
          item['status']['conditions'] is List<dynamic>) {
        final List<Condition> conditions = [];

        for (final condition in item['status']['conditions']) {
          final value = Condition.fromJson(condition);
          conditions.add(value);
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
      DetailsItem(title: 'Additional Information', details: detailsItems),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
          future: _getMetadata(),
          builder:
              (
                BuildContext context,
                AsyncSnapshot<CustomResourceDefinitionMetadata?> snapshot,
              ) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.primary,
                    );
                  default:
                    return details_item_metadata.DetailsItemMetadata(
                      kind: item != null && item.containsKey('kind')
                          ? item['kind']
                          : null,
                      metadata: details_item_metadata.Metadata(
                        name: snapshot.data?.name,
                        namespace: snapshot.data?.namespace,
                        labels: snapshot.data?.labels,
                        annotations: snapshot.data?.annotations,
                        creationTimestamp: snapshot.data?.creationTimestamp,
                        ownerReferences: snapshot.data?.ownerReferences
                            ?.map(
                              (ownerReference) =>
                                  details_item_metadata.OwnerReference(
                                    apiVersion:
                                        ownerReference?.apiVersion ?? '',
                                    blockOwnerDeletion:
                                        ownerReference?.blockOwnerDeletion,
                                    controller: ownerReference?.controller,
                                    kind: ownerReference?.kind ?? '',
                                    name: ownerReference?.name ?? '',
                                    uid: ownerReference?.uid ?? '',
                                  ),
                            )
                            .toList(),
                      ),
                    );
                }
              },
        ),
        FutureBuilder(
          future: _getConditions(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Condition>?> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.primary,
                    );
                  default:
                    return details_item_conditions.DetailsItemConditions(
                      conditions: snapshot.data
                          ?.map(
                            (condition) => details_item_conditions.Condition(
                              type: condition.type,
                              status: condition.status,
                              lastTransitionTime:
                                  condition.lastTransitionTime ??
                                  DateTime.now(),
                              reason: condition.reason ?? '',
                              message: condition.message ?? '',
                            ),
                          )
                          .toList(),
                    );
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
