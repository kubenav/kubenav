import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_policy_v1beta1_pod_security_policy.dart';
import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/pages/resources_details/widgets/details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/details_resources_preview_widget.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/widgets/app_prometheus_metrics_widget.dart';

class PodSecurityPolicyDetailsItemWidget extends StatelessWidget
    implements IDetailsItemWidget {
  const PodSecurityPolicyDetailsItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    final psp = IoK8sApiPolicyV1beta1PodSecurityPolicy.fromJson(item);

    if (psp == null || psp.spec == null) {
      return Container();
    }

    return Column(
      children: [
        DetailsItemWidget(
          title: 'Configuration',
          details: [
            DetailsItemModel(
              name: 'Allow Privileged',
              values:
                  psp.spec!.privileged != null && psp.spec!.privileged == true
                      ? 'True'
                      : 'Flase',
            ),
            DetailsItemModel(
              name: 'Allow Privilege Escalation',
              values: psp.spec!.allowPrivilegeEscalation != null &&
                      psp.spec!.allowPrivilegeEscalation == true
                  ? 'True'
                  : 'Flase',
            ),
            DetailsItemModel(
              name: 'Default Add Capabilities',
              values: psp.spec!.defaultAddCapabilities.isNotEmpty
                  ? psp.spec!.defaultAddCapabilities.join(', ')
                  : '-',
            ),
            DetailsItemModel(
              name: 'Required Drop Capabilities',
              values: psp.spec!.requiredDropCapabilities.isNotEmpty
                  ? psp.spec!.requiredDropCapabilities.join(', ')
                  : '-',
            ),
            DetailsItemModel(
              name: 'Allowed Capabilities',
              values: psp.spec!.allowedCapabilities.isNotEmpty
                  ? psp.spec!.allowedCapabilities.join(', ')
                  : '-',
            ),
            DetailsItemModel(
              name: 'Allowed Volume Types',
              values: psp.spec!.volumes.isNotEmpty
                  ? psp.spec!.volumes.join(', ')
                  : '-',
            ),
            DetailsItemModel(
              name: 'Allow Host Network',
              values:
                  psp.spec!.hostNetwork != null && psp.spec!.hostNetwork == true
                      ? 'True'
                      : 'Flase',
            ),
            DetailsItemModel(
              name: 'Allow Host Ports',
              values: psp.spec!.hostPorts.isNotEmpty
                  ? psp.spec!.hostPorts
                      .map((e) => '${e.min} - ${e.max}')
                      .join(', ')
                  : '-',
            ),
            DetailsItemModel(
              name: 'Allow Host PID',
              values: psp.spec!.hostPID != null && psp.spec!.hostPID == true
                  ? 'True'
                  : 'Flase',
            ),
            DetailsItemModel(
              name: 'Allow Host IPC',
              values: psp.spec!.hostIPC != null && psp.spec!.hostIPC == true
                  ? 'True'
                  : 'Flase',
            ),
            DetailsItemModel(
              name: 'Read Only Root Filesystem',
              values: psp.spec!.readOnlyRootFilesystem != null &&
                      psp.spec!.readOnlyRootFilesystem == true
                  ? 'True'
                  : 'Flase',
            ),
            DetailsItemModel(
              name: 'SELinux Context Strategy',
              values: psp.spec!.seLinux.rule,
            ),
            DetailsItemModel(
              name: 'Run As User Strategy',
              values: psp.spec!.runAsUser.rule,
            ),
            DetailsItemModel(
              name: 'FSGroup Strategy',
              values: psp.spec!.fsGroup.rule ?? '-',
            ),
            DetailsItemModel(
              name: 'Supplemental Groups Strategy',
              values: psp.spec!.supplementalGroups.rule ?? '-',
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
          defaultCharts: const [],
        ),
      ],
    );
  }
}
