import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_node.dart';
import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/pages/home/widgets/metrics_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/details_resources_preview_widget.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';

class NodeDetailsItemWidget extends StatelessWidget
    implements IDetailsItemWidget {
  const NodeDetailsItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    final node = IoK8sApiCoreV1Node.fromJson(item);

    if (node == null || node.spec == null || node.status == null) {
      return Container();
    }

    return Column(
      children: [
        DetailsItemWidget(
          title: 'Configuration',
          details: [
            DetailsItemModel(
              name: 'Architecture',
              values: node.status!.nodeInfo?.architecture ?? '-',
            ),
            DetailsItemModel(
              name: 'Boot ID',
              values: node.status!.nodeInfo?.bootID ?? '-',
            ),
            DetailsItemModel(
              name: 'Container Runtime Version',
              values: node.status!.nodeInfo?.containerRuntimeVersion ?? '-',
            ),
            DetailsItemModel(
              name: 'Kernel Version',
              values: node.status!.nodeInfo?.kernelVersion ?? '-',
            ),
            DetailsItemModel(
              name: 'KubeProxy Version',
              values: node.status!.nodeInfo?.kubeProxyVersion ?? '-',
            ),
            DetailsItemModel(
              name: 'Kubelet Version',
              values: node.status!.nodeInfo?.kubeletVersion ?? '-',
            ),
            DetailsItemModel(
              name: 'Machine ID',
              values: node.status!.nodeInfo?.machineID ?? '-',
            ),
            DetailsItemModel(
              name: 'Operating System',
              values: node.status!.nodeInfo?.operatingSystem ?? '-',
            ),
            DetailsItemModel(
              name: 'OS Image',
              values: node.status!.nodeInfo?.osImage ?? '-',
            ),
            DetailsItemModel(
              name: 'Pod CIDR',
              values: node.spec!.podCIDR ?? '-',
            ),
            DetailsItemModel(
              name: 'Pod CIDRs',
              values:
                  node.spec!.podCIDRs.isNotEmpty ? node.spec!.podCIDRs : '-',
            ),
            DetailsItemModel(
              name: 'System UUID',
              values: node.status!.nodeInfo?.systemUUID ?? '-',
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsItemWidget(
          title: 'Status',
          details: [
            DetailsItemModel(
              name: 'Status',
              values: node.status!.conditions
                  .where((condition) => condition.status == 'True')
                  .where((condition) => condition.type != null)
                  .map((condition) => condition.type?.value ?? '-')
                  .toList(),
            ),
            DetailsItemModel(
              name: 'Addresses',
              values: node.status!.addresses
                  .map((address) => '${address.type}: ${address.address}')
                  .toList(),
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        MetricsWidget(
          nodeName: node.metadata?.name,
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsItemWidget(
          title: 'Resources',
          details: node.status!.allocatable.entries
              .map(
                (allocatable) => DetailsItemModel(
                  name: allocatable.key,
                  values: allocatable.value,
                  onTap: (index) {
                    snackbar(allocatable.key,
                        'Allocatable: ${allocatable.value}\nCapacity: ${node.status!.capacity.containsKey(allocatable.key) ? node.status!.capacity[allocatable.key] : '-'}');
                  },
                ),
              )
              .toList(),
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreviewWidget(
          title: Resources.map['pods']!.title,
          resource: Resources.map['pods']!.resource,
          path: Resources.map['pods']!.path,
          scope: Resources.map['pods']!.scope,
          namespace: null,
          selector: 'fieldSelector=spec.nodeName=${item['metadata']['name']}',
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
