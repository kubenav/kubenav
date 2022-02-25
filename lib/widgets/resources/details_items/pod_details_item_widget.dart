import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:kubenav/controllers/cluster_controller.dart';
import 'package:kubenav/models/kubernetes/api.dart' show IoK8sApiCoreV1Pod;
import 'package:kubenav/services/cluster_service.dart';
import 'package:kubenav/widgets/resources/helpers/pods.dart';
import 'package:kubenav/widgets/resources/helpers/general.dart';
import 'package:kubenav/widgets/resources/details_item_widget.dart';
import 'package:kubenav/utils/constants.dart';

class PodDetailsItemController extends GetxController {
  ClusterController clusterController = Get.find();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void portForward(
      String name, String namespace, String container, int port) async {
    try {
      final cluster = clusterController
          .clusters[clusterController.activeClusterIndex.value].value;

      final url =
          '/api/v1/namespaces/$namespace/pods/$name/portforward?ports=$port';

      // await ClusterService(cluster: cluster).portForward(url);
    } catch (err) {
      debugPrint('portForward error: $err');
    }
  }
}

class PodDetailsItemWidget extends StatelessWidget
    implements IDetailsItemWidget {
  const PodDetailsItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    PodDetailsItemController controller = Get.put(
      PodDetailsItemController(),
    );

    final pod = IoK8sApiCoreV1Pod.fromJson(item);
    final ready =
        '${pod?.status?.containerStatuses.where((containerStatus) => containerStatus.ready).length ?? '0'}/${pod?.spec?.containers.length ?? '0'}';
    final restarts = getRestarts(pod);
    final status = getStatusText(pod);
    final ports = getPorts(pod);

    return Column(
      children: [
        DetailsItemWidget(
          title: 'Configuration',
          details: [
            DetailsItemModel(
              name: 'Priority',
              values: ['${pod?.spec?.priority ?? '-'}'],
            ),
            DetailsItemModel(
              name: 'Node',
              values: [pod?.spec?.nodeName ?? '-'],
            ),
            DetailsItemModel(
              name: 'Node',
              values: [pod?.spec?.serviceAccountName ?? '-'],
            ),
            DetailsItemModel(
              name: 'Service Account',
              values: [pod?.spec?.serviceAccountName ?? '-'],
            ),
            DetailsItemModel(
              name: 'Restart Policy',
              values: [pod?.spec?.restartPolicy.toString() ?? '-'],
            ),
            DetailsItemModel(
              name: 'Termination Grace Period Seconds',
              values: ['${pod?.spec?.terminationGracePeriodSeconds ?? '-'}'],
            ),
            DetailsItemModel(
              name: 'Ports',
              values: ports != null
                  ? ports
                      .map((port) =>
                          '${port.containerName}: ${port.port.containerPort}${port.port.protocol != null ? '/${port.port.protocol!.value}' : ''}${port.port.name != null ? ' (${port.port.name})' : ''}')
                      .toList()
                  : ['-'],
              onTap: (index) {
                if (pod != null && ports != null) {
                  controller.portForward(
                    pod.metadata!.name!,
                    pod.metadata!.namespace!,
                    ports[index].containerName,
                    ports[index].port.containerPort,
                  );
                }
              },
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsItemWidget(
          title: 'Status',
          details: [
            DetailsItemModel(
              name: 'Ready',
              values: [ready],
            ),
            DetailsItemModel(
              name: 'Restarts',
              values: ['$restarts'],
            ),
            DetailsItemModel(
              name: 'Status',
              values: [status],
            ),
            DetailsItemModel(
              name: 'QoS',
              values: [pod?.status?.qosClass.toString() ?? '-'],
            ),
            DetailsItemModel(
              name: 'Pod IP',
              values: [pod?.status?.podIP ?? '-'],
            ),
            DetailsItemModel(
              name: 'Host IP',
              values: [pod?.status?.hostIP ?? '-'],
            ),
          ],
        ),
      ],
    );
  }
}
