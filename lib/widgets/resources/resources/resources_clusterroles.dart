import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:kubenav/models/kubernetes/clusterrolelist_rbac_v1.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_metadata.dart'
    as details_item_metadata;
import 'package:kubenav/widgets/resources/helpers/details_resources_preview.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/resources/resources/resources_events.dart';
import 'package:kubenav/widgets/resources/resources_list.dart';
import 'package:kubenav/widgets/shared/app_prometheus_charts_widget.dart';
import 'package:kubenav/widgets/shared/app_vertical_list_simple_widget.dart';

final resourceClusterRole = Resource(
  category: ResourceCategories.rbac,
  plural: 'ClusterRoles',
  singular: 'ClusterRole',
  description:
      'An RBAC ClusterRole contains rules that represent a set of permissions.',
  path: '/apis/rbac.authorization.k8s.io/v1',
  resource: 'clusterroles',
  scope: ResourceScope.cluster,
  additionalPrinterColumns: [],
  icon: 'clusterroles',
  template: resourceDefaultTemplate,
  decodeListData: (ResourcesListData data) {
    final parsed = json.decode(data.list);
    final items = ClusterrolelistRbacV1.fromJson(parsed).items;

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
    return ClusterrolelistRbacV1.fromJson(parsed).items;
  },
  getName: (dynamic item) {
    return (item as Item).metadata?.name ?? '';
  },
  getNamespace: (dynamic item) {
    return (item as Item).metadata?.namespace;
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
  listItemBuilder:
      (BuildContext context, Resource resource, ResourceItem listItem) {
        final item = listItem.item as Item;
        final status = listItem.status;

        return ResourcesListItem(
          name: item.metadata?.name ?? '',
          namespace: item.metadata?.namespace,
          resource: resource,
          item: item,
          status: status,
          details: [
            'Rules: ${item.rules?.length}',
            'Age: ${getAge(item.metadata?.creationTimestamp)}',
          ],
        );
      },
  previewItemBuilder: (dynamic listItem) {
    final item = listItem as Item;

    return [
      'Rules: ${item.rules?.length}',
      'Age: ${getAge(item.metadata?.creationTimestamp)}',
    ];
  },
  detailsItemBuilder: (BuildContext context, Resource resource, dynamic detailsItem) {
    final item = detailsItem as Item;

    final rules = _formatRules(item.rules);

    return Column(
      children: [
        details_item_metadata.DetailsItemMetadata(
          kind: item.kind?.name,
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
        AppVerticalListSimpleWidget(
          title: 'Rules',
          items: rules
              .map(
                (rule) => AppVerticalListSimpleModel(
                  onTap: () {
                    showSnackbar(
                      context,
                      rule.resource,
                      'Non-Resource URLs: ${rule.nonResourceURLs.isNotEmpty ? rule.nonResourceURLs.join(', ') : '-'}\nResource Names: ${rule.resourceNames.isNotEmpty ? rule.resourceNames.join(', ') : '-'}\nVerbs: ${rule.verbs.isNotEmpty ? rule.verbs.join(', ') : '-'}',
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
                      padding: const EdgeInsets.all(Constants.spacingIcon54x54),
                      child: SvgPicture.asset(
                        'assets/resources/clusterroles.svg',
                      ),
                    ),
                    const SizedBox(width: Constants.spacingSmall),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Characters(rule.resource)
                                .replaceAll(
                                  Characters(''),
                                  Characters('\u{200B}'),
                                )
                                .toString(),
                            style: primaryTextStyle(context),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Non-Resource URLs: ${rule.nonResourceURLs.isNotEmpty ? rule.nonResourceURLs.join(', ') : '-'}\nResource Names: ${rule.resourceNames.isNotEmpty ? rule.resourceNames.join(', ') : '-'}\nVerbs: ${rule.verbs.isNotEmpty ? rule.verbs.join(', ') : '-'}',
                            style: secondaryTextStyle(context),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
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
        AppPrometheusChartsWidget(
          item: item,
          toJson: resource.toJson,
          defaultCharts: const [],
        ),
      ],
    );
  },
);

/// [InternalRule] is our internal format of a rule in a ClusterRole or Role. It
/// contains the [resource] name and a list of all [nonResourceURLs],
/// [resourceNames] and [verbs]. The [resource] consists of the `resource` name
/// and `apiGroup`.
class InternalRule {
  String resource;
  List<String?> nonResourceURLs;
  List<String?> resourceNames;
  List<String?> verbs;

  InternalRule({
    required this.resource,
    required this.nonResourceURLs,
    required this.resourceNames,
    required this.verbs,
  });
}

/// [_formatRules] returns a `List` of rules in our internal [Rule] format from
/// the given [rules] list from a ClusterRole or Role.
List<InternalRule> _formatRules(List<Rule?>? rules) {
  final List<InternalRule> formattedRules = [];

  if (rules == null) {
    return formattedRules;
  }

  for (var rule in rules) {
    if (rule?.apiGroups != null) {
      for (var apiGroup in rule!.apiGroups!) {
        if (rule.resources != null) {
          for (var resource in rule.resources!) {
            formattedRules.add(
              InternalRule(
                resource: '$resource${apiGroup != '' ? '.$apiGroup' : ''}',
                nonResourceURLs: rule.nonResourceUrLs ?? [],
                resourceNames: rule.resourceNames ?? [],
                verbs: rule.verbs,
              ),
            );
          }
        }
      }
    }
  }

  return formattedRules;
}
