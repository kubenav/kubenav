import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:kubenav/models/kubernetes/clusterrolebindinglist_rbac_v1.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/navigate.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/utils/themes.dart';
import 'package:kubenav/widgets/resources/helpers/details_item.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_metadata.dart'
    as details_item_metadata;
import 'package:kubenav/widgets/resources/helpers/details_resources_preview.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/resources/resources/resources_clusterroles.dart';
import 'package:kubenav/widgets/resources/resources/resources_events.dart';
import 'package:kubenav/widgets/resources/resources_details.dart';
import 'package:kubenav/widgets/resources/resources_list.dart';
import 'package:kubenav/widgets/shared/app_prometheus_charts_widget.dart';
import 'package:kubenav/widgets/shared/app_vertical_list_simple_widget.dart';

final resourceClusterRoleBinding = Resource(
  category: ResourceCategories.rbac,
  plural: 'ClusterRoleBindings',
  singular: 'ClusterRoleBinding',
  description:
      'A cluster role binding grants the permissions defined in a role to a user or set of users.',
  path: '/apis/rbac.authorization.k8s.io/v1',
  resource: 'clusterrolebindings',
  scope: ResourceScope.cluster,
  additionalPrinterColumns: [],
  icon: 'clusterrolebindings',
  template: resourceDefaultTemplate,
  decodeListData: (ResourcesListData data) {
    final parsed = json.decode(data.list);
    final items = ClusterrolebindinglistRbacV1.fromJson(parsed).items;

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
    return ClusterrolebindinglistRbacV1.fromJson(parsed).items;
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
            'Role: ${item.roleRef.kind}/${item.roleRef.name}',
            'Age: ${getAge(item.metadata?.creationTimestamp)}',
          ],
        );
      },
  previewItemBuilder: (dynamic listItem) {
    final item = listItem as Item;

    return [
      'Role: ${item.roleRef.kind}/${item.roleRef.name}',
      'Age: ${getAge(item.metadata?.creationTimestamp)}',
    ];
  },
  detailsItemBuilder: (BuildContext context, Resource resource, dynamic detailsItem) {
    final item = detailsItem as Item;

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
        DetailsItem(
          title: 'Configuration',
          details: [
            DetailsItemModel(
              name: 'Role',
              values: '${item.roleRef.kind}/${item.roleRef.name}',
              onTap: item.roleRef.kind == 'ClusterRole'
                  ? (index) {
                      navigate(
                        context,
                        ResourcesDetails(
                          name: item.roleRef.name,
                          namespace: null,
                          resource: resourceClusterRole,
                        ),
                      );
                    }
                  : null,
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        AppVerticalListSimpleWidget(
          title: 'Subjects',
          items:
              item.subjects
                  ?.map(
                    (subject) => AppVerticalListSimpleModel(
                      onTap: kindToResource.containsKey(subject?.kind)
                          ? () {
                              navigate(
                                context,
                                ResourcesDetails(
                                  name: subject?.name ?? '',
                                  namespace: subject?.namespace,
                                  resource: kindToResource[subject?.kind]!,
                                ),
                              );
                            }
                          : null,
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
                            'assets/resources/clusterrolebindings.svg',
                          ),
                        ),
                        const SizedBox(width: Constants.spacingSmall),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                subject?.kind ?? '',
                                style: primaryTextStyle(context),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                '${subject?.namespace != null ? '${subject?.namespace}/' : ''}${subject?.name ?? ''}',
                                style: secondaryTextStyle(context),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        ..._buildIcon(context, subject?.kind ?? ''),
                      ],
                    ),
                  )
                  .toList() ??
              [],
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

List<Widget> _buildIcon(BuildContext context, String kind) {
  if (kindToResource.containsKey(kind)) {
    return [
      const SizedBox(width: Constants.spacingSmall),
      Icon(
        Icons.arrow_forward_ios,
        color: Theme.of(context)
            .extension<CustomColors>()!
            .textSecondary
            .withValues(alpha: Constants.opacityIcon),
        size: 24,
      ),
    ];
  }

  return [];
}
