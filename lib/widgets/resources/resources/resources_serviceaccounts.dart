import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_service_account.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_service_account_list.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/navigate.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/utils/themes.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_metadata.dart';
import 'package:kubenav/widgets/resources/helpers/details_resources_preview.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/resources/resources/resources_events.dart';
import 'package:kubenav/widgets/resources/resources/resources_secrets.dart';
import 'package:kubenav/widgets/resources/resources_details.dart';
import 'package:kubenav/widgets/resources/resources_list.dart';
import 'package:kubenav/widgets/shared/app_prometheus_charts_widget.dart';
import 'package:kubenav/widgets/shared/app_vertical_list_simple_widget.dart';

final resourceServiceAccount = Resource(
  category: ResourceCategories.configAndStorage,
  plural: 'ServiceAccounts',
  singular: 'ServiceAccount',
  description:
      'A ServiceAccount provides an identity for processes that run in a Pod.',
  path: '/api/v1',
  resource: 'serviceaccounts',
  scope: ResourceScope.namespaced,
  additionalPrinterColumns: [],
  icon: 'serviceaccounts',
  template: resourceDefaultTemplate,
  decodeListData: (ResourcesListData data) {
    final parsed = json.decode(data.list);
    final items =
        IoK8sApiCoreV1ServiceAccountList.fromJson(parsed)?.items ?? [];

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
    return IoK8sApiCoreV1ServiceAccountList.fromJson(parsed)?.items ?? [];
  },
  getName: (dynamic item) {
    return (item as IoK8sApiCoreV1ServiceAccount).metadata?.name ?? '';
  },
  getNamespace: (dynamic item) {
    return (item as IoK8sApiCoreV1ServiceAccount).metadata?.namespace;
  },
  decodeItem: (String data) {
    final parsed = json.decode(data);
    return IoK8sApiCoreV1ServiceAccount.fromJson(parsed);
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
    final item = listItem.item as IoK8sApiCoreV1ServiceAccount;
    final status = listItem.status;

    return ResourcesListItem(
      name: item.metadata?.name ?? '',
      namespace: item.metadata?.namespace,
      resource: resource,
      item: item,
      status: status,
      details: [
        'Namespace: ${item.metadata?.namespace ?? '-'}',
        'Secrets: ${item.secrets.length}',
        'Age: ${getAge(item.metadata?.creationTimestamp)}',
      ],
    );
  },
  previewItemBuilder: (
    dynamic listItem,
  ) {
    final item = listItem as IoK8sApiCoreV1ServiceAccount;

    return [
      'Namespace: ${item.metadata?.namespace ?? '-'}',
      'Secrets: ${item.secrets.length}',
      'Age: ${getAge(item.metadata?.creationTimestamp)}',
    ];
  },
  detailsItemBuilder: (
    BuildContext context,
    Resource resource,
    dynamic detailsItem,
  ) {
    final item = detailsItem as IoK8sApiCoreV1ServiceAccount;

    return Column(
      children: [
        DetailsItemMetadata(metadata: item.metadata),
        const SizedBox(height: Constants.spacingMiddle),
        AppVerticalListSimpleWidget(
          title: 'Secrets',
          items: item.secrets
              .map(
                (secret) => AppVerticalListSimpleModel(
                  onTap: () {
                    navigate(
                      context,
                      ResourcesDetails(
                        name: secret.name ?? '',
                        namespace: secret.namespace ?? item.metadata?.namespace,
                        resource: resourceSecret,
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
                      child: SvgPicture.asset('assets/resources/secrets.svg'),
                    ),
                    const SizedBox(width: Constants.spacingSmall),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            secret.name ?? '-',
                            style: primaryTextStyle(
                              context,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Namespace: ${secret.namespace ?? item.metadata?.namespace ?? '-'}',
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
