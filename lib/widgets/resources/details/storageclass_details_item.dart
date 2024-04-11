import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_storage_v1_storage_class.dart';
import 'package:kubenav/models/resource.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/widgets/resources/details/details_item.dart';
import 'package:kubenav/widgets/resources/details/details_resources_preview.dart';
import 'package:kubenav/widgets/shared/app_prometheus_charts_widget.dart';

class StorageClassDetailsItem extends StatelessWidget
    implements IDetailsItemWidget {
  const StorageClassDetailsItem({
    super.key,
    required this.item,
  });

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
                          'storageclass.kubernetes.io/is-default-class',) &&
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
        DetailsResourcesPreview(
          title: Resources.map['events']!.title,
          resource: Resources.map['events']!.resource,
          path: Resources.map['events']!.path,
          scope: Resources.map['events']!.scope,
          additionalPrinterColumns:
              Resources.map['events']!.additionalPrinterColumns,
          namespace: item['metadata']['namespace'],
          selector:
              'fieldSelector=involvedObject.name=${item['metadata']['name']}',
        ),
        const SizedBox(height: Constants.spacingMiddle),
        AppPrometheusChartsWidget(
          manifest: item,
          defaultCharts: const [],
        ),
      ],
    );
  }
}
