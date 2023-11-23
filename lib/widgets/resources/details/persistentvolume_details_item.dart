import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_persistent_volume.dart';
import 'package:kubenav/models/plugins/prometheus.dart';
import 'package:kubenav/models/resource.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/widgets/resources/details/details_item.dart';
import 'package:kubenav/widgets/resources/details/details_resources_preview.dart';
import 'package:kubenav/widgets/shared/app_prometheus_charts_widget.dart';

class PersistentVolumeDetailsItem extends StatelessWidget
    implements IDetailsItemWidget {
  const PersistentVolumeDetailsItem({
    super.key,
    required this.item,
  });

  @override
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    final pv = IoK8sApiCoreV1PersistentVolume.fromJson(item);

    if (pv == null || pv.spec == null || pv.status == null) {
      return Container();
    }

    return Column(
      children: [
        DetailsItemWidget(
          title: 'Configuration',
          details: [
            DetailsItemModel(
              name: 'Storage Class',
              values: pv.spec!.storageClassName ?? '-',
            ),
            DetailsItemModel(
              name: 'Reclaim Policy',
              values: pv.spec!.persistentVolumeReclaimPolicy ?? '-',
            ),
            DetailsItemModel(
              name: 'Access Modes',
              values:
                  pv.spec!.accessModes.isNotEmpty ? pv.spec!.accessModes : '-',
            ),
            DetailsItemModel(
              name: 'Storage',
              values: pv.spec!.capacity.containsKey('storage')
                  ? pv.spec!.capacity['storage']
                  : '-',
            ),
            DetailsItemModel(
              name: 'Mount Options',
              values: pv.spec!.mountOptions.isNotEmpty
                  ? pv.spec!.mountOptions
                  : '-',
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsItemWidget(
          title: 'Status',
          details: [
            DetailsItemModel(
              name: 'Status',
              values: pv.status!.phase ?? '-',
            ),
            DetailsItemModel(
              name: 'Claim',
              values:
                  '${pv.spec!.claimRef?.namespace ?? '-'}/${pv.spec!.claimRef?.name ?? '-'}',
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
          defaultCharts: [
            Chart(
              title: 'Capacity',
              unit: 'GiB',
              queries: [
                Query(
                  query:
                      'kube_persistentvolume_capacity_bytes{persistentvolume="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"} / 1024 / 1024 / 1024',
                  label: 'Capacity',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
