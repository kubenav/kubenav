import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_autoscaling_v2_horizontal_pod_autoscaler.dart';
import 'package:kubenav/models/plugins/prometheus.dart';
import 'package:kubenav/models/resource.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/widgets/resources/details/details_item.dart';
import 'package:kubenav/widgets/resources/details/details_resources_preview.dart';
import 'package:kubenav/widgets/shared/app_prometheus_charts_widget.dart';

class HorizontalPodAutoscalerDetailsItem extends StatelessWidget
    implements IDetailsItemWidget {
  const HorizontalPodAutoscalerDetailsItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  final dynamic item;

  List<Widget> buildReference(
      IoK8sApiAutoscalingV2HorizontalPodAutoscaler hpa) {
    if (hpa.spec!.scaleTargetRef.kind != 'Deployment' &&
        hpa.spec!.scaleTargetRef.kind != 'StatefulSet') {
      return [Container()];
    }

    return [
      DetailsResourcesPreview(
        title: '${hpa.spec!.scaleTargetRef.kind}s',
        resource: '${hpa.spec!.scaleTargetRef.kind.toLowerCase()}s',
        path: '/apis/${hpa.spec!.scaleTargetRef.apiVersion}',
        scope: ResourceScope.namespaced,
        additionalPrinterColumns: const [],
        namespace: item['metadata']['namespace'],
        selector:
            'fieldSelector=metadata.name=${hpa.spec!.scaleTargetRef.name}',
      ),
      const SizedBox(height: Constants.spacingMiddle),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final hpa = IoK8sApiAutoscalingV2HorizontalPodAutoscaler.fromJson(item);

    if (hpa == null || hpa.spec == null) {
      return Container();
    }

    return Column(
      children: [
        DetailsItemWidget(
          title: 'Configuration',
          details: [
            DetailsItemModel(
              name: 'Min. Replicas',
              values: hpa.spec!.minReplicas,
            ),
            DetailsItemModel(
              name: 'Max. Replicas',
              values: hpa.spec!.maxReplicas,
            ),
            DetailsItemModel(
              name: 'Reference',
              values:
                  '${hpa.spec!.scaleTargetRef.kind}/${hpa.spec!.scaleTargetRef.name}',
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsItemWidget(
          title: 'Status',
          details: [
            DetailsItemModel(
              name: 'Desired Replicas',
              values: hpa.status?.desiredReplicas ?? '-',
            ),
            DetailsItemModel(
              name: 'Current Replicas',
              values: hpa.status?.currentReplicas ?? '-',
            ),
            DetailsItemModel(
              name: 'Last Scale Time',
              values: formatTime(hpa.status?.lastScaleTime),
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        ...buildReference(hpa),
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
              title: 'Pods',
              unit: '',
              queries: [
                Query(
                  query:
                      'kube_horizontalpodautoscaler_status_desired_replicas{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", horizontalpodautoscaler="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}',
                  label: 'Desired',
                ),
                Query(
                  query:
                      'kube_horizontalpodautoscaler_status_current_replicas{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", horizontalpodautoscaler="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}',
                  label: 'Current',
                ),
                Query(
                  query:
                      'kube_horizontalpodautoscaler_spec_min_replicas{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", horizontalpodautoscaler="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}',
                  label: 'Min',
                ),
                Query(
                  query:
                      'kube_horizontalpodautoscaler_spec_max_replicas{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", horizontalpodautoscaler="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}',
                  label: 'Max',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
