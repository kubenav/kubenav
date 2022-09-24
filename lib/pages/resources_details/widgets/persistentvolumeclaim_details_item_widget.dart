import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_persistent_volume_claim.dart';
import 'package:kubenav/models/prometheus_model.dart';
import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/pages/resources_details/widgets/details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/details_resources_preview_widget.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/widgets/app_prometheus_metrics_widget.dart';

class PersistentVolumeClaimDetailsItemWidget extends StatelessWidget
    implements IDetailsItemWidget {
  const PersistentVolumeClaimDetailsItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    final pvc = IoK8sApiCoreV1PersistentVolumeClaim.fromJson(item);

    if (pvc == null || pvc.spec == null || pvc.status == null) {
      return Container();
    }

    return Column(
      children: [
        DetailsItemWidget(
          title: 'Configuration',
          details: [
            DetailsItemModel(
              name: 'Storage Class',
              values: pvc.spec!.storageClassName ?? '-',
            ),
            DetailsItemModel(
              name: 'Access Modes',
              values: pvc.spec!.accessModes.isNotEmpty
                  ? pvc.spec!.accessModes
                  : '-',
            ),
            DetailsItemModel(
              name: 'Requested Storage',
              values: pvc.spec!.resources != null &&
                      pvc.spec!.resources!.requests.containsKey('storage')
                  ? pvc.spec!.resources!.requests['storage']
                  : '-',
            ),
            DetailsItemModel(
              name: 'Volume Mode',
              values: pvc.spec!.volumeMode ?? '-',
            ),
            DetailsItemModel(
              name: 'Volume Name',
              values: pvc.spec!.volumeName ?? '-',
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsItemWidget(
          title: 'Status',
          details: [
            DetailsItemModel(
              name: 'Status',
              values: pvc.status!.phase?.value ?? '-',
            ),
            DetailsItemModel(
              name: 'Access Modes',
              values: pvc.spec!.accessModes.isNotEmpty
                  ? pvc.spec!.accessModes
                  : '-',
            ),
            DetailsItemModel(
              name: 'Storage',
              values: pvc.status!.capacity.containsKey('storage')
                  ? pvc.status!.capacity['storage']
                  : '-',
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
        const SizedBox(height: Constants.spacingMiddle),
        AppPrometheusMetricsWidget(
          manifest: item,
          defaultCharts: [
            Chart(
              title: 'Volume Space Usage',
              unit: '',
              queries: [
                Query(
                  query:
                      '(sum without(instance, node) (topk(1, (kubelet_volume_stats_capacity_bytes{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", persistentvolumeclaim="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}))) - sum without(instance, node) (topk(1, (kubelet_volume_stats_available_bytes{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", persistentvolumeclaim="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"})))) / 1024 / 1024 / 1024',
                  label: 'Used',
                ),
                Query(
                  query:
                      'sum without(instance, node) (topk(1, (kubelet_volume_stats_available_bytes{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", persistentvolumeclaim="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}))) / 1024 / 1024 / 1024',
                  label: 'Free',
                ),
              ],
            ),
            Chart(
              title: 'Volume inodes Usage',
              unit: '',
              queries: [
                Query(
                  query:
                      'sum without(instance, node) (topk(1, (kubelet_volume_stats_inodes_used{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", persistentvolumeclaim="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"})))',
                  label: 'Used',
                ),
                Query(
                  query:
                      '(sum without(instance, node) (topk(1, (kubelet_volume_stats_inodes{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", persistentvolumeclaim="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}))) - sum without(instance, node) (topk(1, (kubelet_volume_stats_inodes_used{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", persistentvolumeclaim="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}))))',
                  label: 'Free',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
