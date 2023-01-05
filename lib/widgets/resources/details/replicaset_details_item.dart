import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_apps_v1_replica_set.dart';
import 'package:kubenav/models/plugins/prometheus.dart';
import 'package:kubenav/models/resource.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/widgets/resources/details/details_item.dart';
import 'package:kubenav/widgets/resources/details/details_resources_preview.dart';
import 'package:kubenav/widgets/shared/app_prometheus_charts_widget.dart';

class ReplicaSetDetailsItem extends StatelessWidget
    implements IDetailsItemWidget {
  const ReplicaSetDetailsItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    final replicaSet = IoK8sApiAppsV1ReplicaSet.fromJson(item);

    if (replicaSet == null ||
        replicaSet.spec == null ||
        replicaSet.status == null) {
      return Container();
    }

    return Column(
      children: [
        DetailsItemWidget(
          title: 'Configuration',
          details: [
            DetailsItemModel(
              name: 'Replicas',
              values: replicaSet.spec!.replicas ?? '-',
            ),
            DetailsItemModel(
              name: 'Selector',
              values: replicaSet.spec!.selector.matchLabels.entries
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
              values: replicaSet.status!.replicas,
            ),
            DetailsItemModel(
              name: 'Ready Replicas',
              values: replicaSet.status!.readyReplicas ?? '-',
            ),
            DetailsItemModel(
              name: 'Available Replicas',
              values: replicaSet.status!.availableReplicas ?? '-',
            ),
            DetailsItemModel(
              name: 'Fully Labeled Replicas',
              values: replicaSet.status!.fullyLabeledReplicas ?? '-',
            ),
            DetailsItemModel(
              name: 'Observed Generation',
              values: replicaSet.status!.observedGeneration ?? '-',
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
          namespace: replicaSet.metadata?.namespace,
          selector: getSelector(replicaSet.spec?.selector),
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreview(
          title: Resources.map['events']!.title,
          resource: Resources.map['events']!.resource,
          path: Resources.map['events']!.path,
          scope: Resources.map['events']!.scope,
          additionalPrinterColumns:
              Resources.map['events']!.additionalPrinterColumns,
          namespace: replicaSet.metadata?.namespace,
          selector:
              'fieldSelector=involvedObject.name=${replicaSet.metadata?.name ?? ''}',
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
                      'sum(kube_replicaset_spec_replicas{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", replicaset="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"})',
                  label: 'Desired',
                ),
                Query(
                  query:
                      'sum(kube_replicaset_status_replicas{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", replicaset="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"})',
                  label: 'Current',
                ),
                Query(
                  query:
                      'sum(kube_replicaset_status_ready_replicas{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", replicaset="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"})',
                  label: 'Ready',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
