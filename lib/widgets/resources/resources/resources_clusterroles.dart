import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_rbac_v1_cluster_role.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_rbac_v1_cluster_role_list.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_metadata.dart';
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
    final items = IoK8sApiRbacV1ClusterRoleList.fromJson(parsed)?.items ?? [];

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
    return IoK8sApiRbacV1ClusterRoleList.fromJson(parsed)?.items ?? [];
  },
  getName: (dynamic item) {
    return (item as IoK8sApiRbacV1ClusterRole).metadata?.name ?? '';
  },
  getNamespace: (dynamic item) {
    return (item as IoK8sApiRbacV1ClusterRole).metadata?.namespace;
  },
  decodeItem: (String data) {
    final parsed = json.decode(data);
    return IoK8sApiRbacV1ClusterRole.fromJson(parsed);
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
    final item = listItem.item as IoK8sApiRbacV1ClusterRole;
    final status = listItem.status;

    return ResourcesListItem(
      name: item.metadata?.name ?? '',
      namespace: item.metadata?.namespace,
      resource: resource,
      item: item,
      status: status,
      details: [
        'Rules: ${item.rules.length}',
        'Age: ${getAge(item.metadata?.creationTimestamp)}',
      ],
    );
  },
  previewItemBuilder: (
    dynamic listItem,
  ) {
    final item = listItem as IoK8sApiRbacV1ClusterRole;

    return [
      'Rules: ${item.rules.length}',
      'Age: ${getAge(item.metadata?.creationTimestamp)}',
    ];
  },
  detailsItemBuilder: (
    BuildContext context,
    Resource resource,
    dynamic detailsItem,
  ) {
    final item = detailsItem as IoK8sApiRbacV1ClusterRole;

    final rules = formatRules(item.rules);

    return Column(
      children: [
        DetailsItemMetadata(
          kind: item.kind,
          metadata: item.metadata,
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
                      padding: const EdgeInsets.all(
                        Constants.spacingIcon54x54,
                      ),
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
                            style: primaryTextStyle(
                              context,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Non-Resource URLs: ${rule.nonResourceURLs.isNotEmpty ? rule.nonResourceURLs.join(', ') : '-'}\nResource Names: ${rule.resourceNames.isNotEmpty ? rule.resourceNames.join(', ') : '-'}\nVerbs: ${rule.verbs.isNotEmpty ? rule.verbs.join(', ') : '-'}',
                            style: secondaryTextStyle(
                              context,
                            ),
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
