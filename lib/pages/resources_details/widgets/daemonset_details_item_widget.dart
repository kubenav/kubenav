import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_apps_v1_daemon_set.dart';
import 'package:kubenav/models/prometheus_model.dart';
import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/pages/resources_details/widgets/details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/details_resources_preview_widget.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/widgets/app_prometheus_charts_widget.dart';

class DaemonSetDetailsItemWidget extends StatelessWidget
    implements IDetailsItemWidget {
  const DaemonSetDetailsItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    final daemonSet = IoK8sApiAppsV1DaemonSet.fromJson(item);

    if (daemonSet == null ||
        daemonSet.spec == null ||
        daemonSet.status == null) {
      return Container();
    }

    return Column(
      children: [
        DetailsItemWidget(
          title: 'Configuration',
          details: [
            DetailsItemModel(
              name: 'Revision History Limit',
              values: daemonSet.spec!.revisionHistoryLimit ?? '-',
            ),
            DetailsItemModel(
              name: 'Update Strategy',
              values: daemonSet.spec!.updateStrategy?.type?.value ?? '-',
            ),
            DetailsItemModel(
              name: 'Selector',
              values: daemonSet.spec!.selector.matchLabels.entries
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
              name: 'Desired Number\nof Nodes Scheduled',
              values: '\n${daemonSet.status!.desiredNumberScheduled}',
            ),
            DetailsItemModel(
              name: 'Current Number\nof Nodes Scheduled',
              values: '\n${daemonSet.status!.currentNumberScheduled}',
            ),
            DetailsItemModel(
              name: 'Number of Nodes\nScheduled with Ready Pods',
              values: '\n${daemonSet.status!.numberReady}',
            ),
            DetailsItemModel(
              name: 'Number of Nodes\nScheduled with Available Pods',
              values: '\n${daemonSet.status!.numberAvailable ?? '-'}',
            ),
            DetailsItemModel(
              name: 'Number of Nodes\nScheduled with Up-to-date Pods',
              values: '\n${daemonSet.status!.updatedNumberScheduled ?? '-'}',
            ),
            DetailsItemModel(
              name: 'Number\nof Nodes Misscheduled',
              values: '\n${daemonSet.status!.numberMisscheduled}',
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreviewWidget(
          title: Resources.map['pods']!.title,
          resource: Resources.map['pods']!.resource,
          path: Resources.map['pods']!.path,
          scope: Resources.map['pods']!.scope,
          namespace: daemonSet.metadata?.namespace,
          selector: getSelector(daemonSet.spec!.selector),
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreviewWidget(
          title: Resources.map['events']!.title,
          resource: Resources.map['events']!.resource,
          path: Resources.map['events']!.path,
          scope: Resources.map['events']!.scope,
          namespace: daemonSet.metadata?.namespace,
          selector:
              'fieldSelector=involvedObject.name=${daemonSet.metadata?.name ?? ''}',
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
                      'kube_daemonset_status_desired_number_scheduled{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", daemonset="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}',
                  label: 'Desired',
                ),
                Query(
                  query:
                      'kube_daemonset_status_current_number_scheduled{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", daemonset="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}',
                  label: 'Current',
                ),
                Query(
                  query:
                      'kube_daemonset_status_number_ready{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", daemonset="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}',
                  label: 'Ready',
                ),
                Query(
                  query:
                      'kube_daemonset_status_number_misscheduled{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", daemonset="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}',
                  label: 'Misscheduled',
                ),
                Query(
                  query:
                      'kube_daemonset_updated_number_scheduled{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", daemonset="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}',
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
