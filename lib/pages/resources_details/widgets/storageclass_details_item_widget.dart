import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_storage_v1_storage_class.dart';
import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/pages/resources_details/widgets/details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/details_resources_preview_widget.dart';
import 'package:kubenav/utils/constants.dart';

class StorageClassDetailsItemWidget extends StatelessWidget
    implements IDetailsItemWidget {
  const StorageClassDetailsItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    final sc = IoK8sApiStorageV1StorageClass.fromJson(item);

    if (sc == null) {
      return Container();
    }

    return Column(
      children: [
        DetailsItemWidget(
          title: 'Configuration',
          details: [
            DetailsItemModel(
              name: 'Default',
              values: sc.metadata != null &&
                      sc.metadata!.annotations.containsKey(
                          'storageclass.kubernetes.io/is-default-class') &&
                      sc
                              .metadata!
                              .annotations[
                                  'storageclass.kubernetes.io/is-default-class']!
                              .toLowerCase() ==
                          'true'
                  ? 'Yes'
                  : 'No',
            ),
            DetailsItemModel(
              name: 'Provisioner',
              values: sc.provisioner,
            ),
            DetailsItemModel(
              name: 'Parameters',
              values: sc.parameters.entries
                  .map((e) => '${e.key}=${e.value}')
                  .toList(),
            ),
            DetailsItemModel(
              name: 'Allow Volume Expansion',
              values: sc.allowVolumeExpansion != null &&
                      sc.allowVolumeExpansion == true
                  ? 'True'
                  : 'False',
            ),
            DetailsItemModel(
              name: 'Mount Options',
              values: sc.mountOptions.isNotEmpty ? sc.mountOptions : '-',
            ),
            DetailsItemModel(
              name: 'Reclaim Policy',
              values: sc.reclaimPolicy ?? '-',
            ),
            DetailsItemModel(
              name: 'Volume Bind Mode',
              values: sc.volumeBindingMode ?? '-',
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreviewWidget(
          title: Resources.map['events']!.title,
          resource: Resources.map['events']!.resource,
          path: Resources.map['events']!.path,
          scope: Resources.map['events']!.scope,
          namespace: item['metadata']['namespace'],
          selector:
              'fieldSelector=involvedObject.name=${item['metadata']['name']}',
        ),
      ],
    );
  }
}
