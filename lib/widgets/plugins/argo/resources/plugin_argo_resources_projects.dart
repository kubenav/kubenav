import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_app_project.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_app_project_list.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/widgets/plugins/argo/resources/plugin_argo_resources.dart';
import 'package:kubenav/widgets/resources/helpers/details_item.dart';
import 'package:kubenav/widgets/resources/helpers/details_item_metadata.dart';
import 'package:kubenav/widgets/resources/helpers/details_resources_preview.dart';
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/resources/resources/resources_events.dart';
import 'package:kubenav/widgets/resources/resources_list.dart';

final Resource argoResourceProject = Resource(
  category: ArgoResourceCategories.resources,
  plural: 'Projects',
  singular: 'Project',
  description: 'Project provides a logical grouping of applications.',
  path: '/apis/argoproj.io/v1alpha1',
  resource: 'appprojects',
  scope: ResourceScope.namespaced,
  additionalPrinterColumns: [],
  icon: 'argo',
  template: resourceDefaultTemplate,
  decodeListData: (ResourcesListData data) {
    final parsed = json.decode(data.list);
    final items =
        IoArgoprojV1alpha1AppProjectList.fromJson(parsed)?.items ?? [];

    return items.map(
      (e) {
        return ResourceItem(
          item: e,
          metrics: null,
          status: ResourceStatus.undefined,
        );
      },
    ).toList();
  },
  decodeList: (String data) {
    final parsed = json.decode(data);
    return IoArgoprojV1alpha1AppProjectList.fromJson(parsed)?.items ?? [];
  },
  getName: (dynamic item) {
    return (item as IoArgoprojV1alpha1AppProject).metadata.name ?? '';
  },
  getNamespace: (dynamic item) {
    return (item as IoArgoprojV1alpha1AppProject).metadata.namespace;
  },
  decodeItem: (String data) {
    final parsed = json.decode(data);
    return IoArgoprojV1alpha1AppProject.fromJson(parsed);
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
    final item = listItem.item as IoArgoprojV1alpha1AppProject;
    final status = listItem.status;

    return ResourcesListItem(
      name: item.metadata.name ?? '',
      namespace: item.metadata.namespace ?? '',
      resource: resource,
      item: item,
      status: status,
      details: [
        'Namespace: ${item.metadata.namespace ?? '-'}',
        'CreatedAt: ${getAge(item.metadata.creationTimestamp)}',
      ],
    );
  },
  previewItemBuilder: (
    dynamic listItem,
  ) {
    final item = listItem as IoArgoprojV1alpha1AppProject;

    return [
      'Namespace: ${item.metadata.namespace ?? '-'}',
      'CreatedAt: ${getAge(item.metadata.creationTimestamp)}',
    ];
  },
  detailsItemBuilder: (
    BuildContext context,
    Resource resource,
    dynamic detailsItem,
  ) {
    final item = detailsItem as IoArgoprojV1alpha1AppProject;

    return Column(
      children: [
        DetailsItemMetadata(
          kind: item.kind,
          metadata: item.metadata,
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsItem(
          title: 'Details',
          details: [
            DetailsItemModel(
              name: 'Description',
              values: item.spec.description,
            ),
            // TODO: There are more details to show than just enabled or not
            DetailsItemModel(
              name: 'SyncWindows',
              values: item.spec.syncWindows.isEmpty
                  ? 'No sync windows'
                  : 'Sync windows defined',
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreview(
          resource: resourceEvent,
          namespace: item.metadata.namespace,
          selector:
              'fieldSelector=involvedObject.name=${item.metadata.name ?? ''}',
          filter: null,
        ),
        const SizedBox(height: Constants.spacingMiddle),
      ],
    );
  },
);
