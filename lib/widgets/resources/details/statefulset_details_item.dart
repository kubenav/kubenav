import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_apps_v1_stateful_set.dart';
import 'package:kubenav/models/plugins/prometheus.dart';
import 'package:kubenav/models/resource.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/widgets/resources/details/details_item.dart';
import 'package:kubenav/widgets/resources/details/details_resources_preview.dart';
import 'package:kubenav/widgets/shared/app_prometheus_charts_widget.dart';

class StatefulSetDetailsItem extends StatelessWidget
    implements IDetailsItemWidget {
  const StatefulSetDetailsItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    final statefulSet = IoK8sApiAppsV1StatefulSet.fromJson(item);

    if (statefulSet == null ||
        statefulSet.spec == null ||
        statefulSet.status == null) {
      return Container();
    }

    return Column(
      children: [
        DetailsItemWidget(
          title: 'Configuration',
          details: [
            DetailsItemModel(
              name: 'Replicas',
              values: statefulSet.spec!.replicas ?? '-',
            ),
            DetailsItemModel(
              name: 'Revision History Limit',
              values: statefulSet.spec!.revisionHistoryLimit ?? '-',
            ),
            DetailsItemModel(
              name: 'Min. Ready Seconds',
              values: statefulSet.spec!.minReadySeconds ?? '-',
            ),
            DetailsItemModel(
              name: 'Update Strategy',
              values: statefulSet.spec!.updateStrategy?.type ?? '-',
            ),
            DetailsItemModel(
              name: 'Service Name',
              values: statefulSet.spec!.podManagementPolicy ?? '-',
            ),
            DetailsItemModel(
              name: 'Pod Management Policy',
              values: statefulSet.spec!.serviceName,
            ),
            DetailsItemModel(
              name: 'Selector',
              values: statefulSet.spec!.selector.matchLabels.entries
                  .map((matchLabel) => '${matchLabel.key}=${matchLabel.value}')
                  .toList(),
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsItemWidget(
          title: 'Status',
          details: [
            DetailsItemModel(
              name: 'Desired Replicas',
              values: statefulSet.status!.replicas,
            ),
            DetailsItemModel(
              name: 'Ready Replicas',
              values: statefulSet.status!.readyReplicas ?? '-',
            ),
            DetailsItemModel(
              name: 'Available Replicas',
              values: statefulSet.status!.availableReplicas ?? '-',
            ),
            DetailsItemModel(
              name: 'Updated Replicas',
              values: statefulSet.status!.updatedReplicas ?? '-',
            ),
            DetailsItemModel(
              name: 'Current Revision',
              values: statefulSet.status!.currentRevision ?? '-',
            ),
            DetailsItemModel(
              name: 'Updated Revision',
              values: statefulSet.status!.updateRevision ?? '-',
            ),
            DetailsItemModel(
              name: 'Observed Generation',
              values: statefulSet.status!.observedGeneration ?? '-',
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreview(
          title: Resources.map['pods']!.title,
          resource: Resources.map['pods']!.resource,
          path: Resources.map['pods']!.path,
          scope: Resources.map['pods']!.scope,
          additionalPrinterColumns:
              Resources.map['pods']!.additionalPrinterColumns,
          namespace: statefulSet.metadata?.namespace,
          selector: getSelector(statefulSet.spec?.selector),
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreview(
          title: Resources.map['events']!.title,
          resource: Resources.map['events']!.resource,
          path: Resources.map['events']!.path,
          scope: Resources.map['events']!.scope,
          additionalPrinterColumns:
              Resources.map['events']!.additionalPrinterColumns,
          namespace: statefulSet.metadata?.namespace,
          selector:
              'fieldSelector=involvedObject.name=${statefulSet.metadata?.name ?? ''}',
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
                      'kube_statefulset_replicas{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", statefulset="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}',
                  label: 'Desired',
                ),
                Query(
                  query:
                      'kube_statefulset_status_replicas_current{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", statefulset="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}',
                  label: 'Current',
                ),
                Query(
                  query:
                      'kube_statefulset_status_replicas_ready{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", statefulset="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}',
                  label: 'Ready',
                ),
                Query(
                  query:
                      'kube_statefulset_status_replicas_updated{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", statefulset="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}',
                  label: 'Updated',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
