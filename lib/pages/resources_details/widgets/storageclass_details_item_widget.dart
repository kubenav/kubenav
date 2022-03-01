import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/api.dart'
    show IoK8sApiStorageV1StorageClass;
import 'package:kubenav/pages/resources_details/widgets/details_item_widget.dart';

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
              values: [
                sc.metadata != null &&
                        sc.metadata!.annotations.containsKey(
                            'storageclass.kubernetes.io/is-default-class') &&
                        sc
                                .metadata!
                                .annotations[
                                    'storageclass.kubernetes.io/is-default-class']!
                                .toLowerCase() ==
                            'true'
                    ? 'Yes'
                    : 'No'
              ],
            ),
            DetailsItemModel(
              name: 'Provisioner',
              values: [sc.provisioner],
            ),
            DetailsItemModel(
              name: 'Parameters',
              values: sc.parameters.entries
                  .map((e) => '${e.key}=${e.value}')
                  .toList(),
            ),
            DetailsItemModel(
              name: 'Allow Volume Expansion',
              values: [
                sc.allowVolumeExpansion != null &&
                        sc.allowVolumeExpansion == true
                    ? 'True'
                    : 'False'
              ],
            ),
            DetailsItemModel(
              name: 'Mount Options',
              values: sc.mountOptions.isNotEmpty ? sc.mountOptions : ['-'],
            ),
            DetailsItemModel(
              name: 'Reclaim Policy',
              values: [sc.reclaimPolicy ?? '-'],
            ),
            DetailsItemModel(
              name: 'Volume Bind Mode',
              values: [sc.volumeBindingMode ?? '-'],
            ),
          ],
        ),
      ],
    );
  }
}
