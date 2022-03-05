import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/controllers/cluster_controller.dart';
import 'package:kubenav/models/kubernetes/api.dart' show IoK8sApiCoreV1Pod;
import 'package:kubenav/models/kubernetes-extensions/pod_metrics.dart';
import 'package:kubenav/pages/resources_details/widgets/details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/details_resources_preview_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/details_containers_widget.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/resources/pods.dart';

class PodDetailsItemController extends GetxController {
  ClusterController clusterController = Get.find();

  final IoK8sApiCoreV1Pod? pod;
  RxList<ApisMetricsV1beta1PodMetricsItemContainer> metrics =
      <ApisMetricsV1beta1PodMetricsItemContainer>[].obs;

  PodDetailsItemController({
    required this.pod,
  });

  @override
  void onInit() {
    getMetrics();

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

      // await KubernetesService(cluster: cluster).portForward(url);
    } catch (err) {
      Logger.log(
        'PodDetailsItemController portForward',
        'Could not establish port forwarding',
        err,
      );
    }
  }

  /// [getMetrics] returns the CPU and Memory usage for each container of the Pod. This function is called in the
  /// during the initalization ([onInit]) of the controller.
  void getMetrics() async {
    final cluster = clusterController.getActiveCluster();
    if (cluster != null &&
        pod != null &&
        pod!.metadata != null &&
        pod!.metadata!.name != null &&
        pod!.metadata!.namespace != null) {
      final url =
          '/apis/metrics.k8s.io/v1beta1/namespaces/${pod!.metadata!.namespace}/pods/${pod!.metadata!.name}';

      try {
        final metricsData =
            await KubernetesService(cluster: cluster).getRequest(url);

        Logger.log(
          'PodDetailsItemController getMetrics',
          'Pod metrics were returned',
          'Request URL: $url\nManifest: $metricsData',
        );
        final containerMetrics =
            ApisMetricsV1beta1PodMetricsItem.fromJson(metricsData).containers;
        if (containerMetrics != null) {
          metrics.value = containerMetrics;
        }
      } on PlatformException catch (err) {
        Logger.log(
          'PodDetailsItemController getMetrics',
          'An error was returned while getting metrics',
          'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}',
        );
      } catch (err) {
        Logger.log(
          'PodDetailsItemController getMetrics',
          'An error was returned while getting metrics',
          err,
        );
      }
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
    final pod = IoK8sApiCoreV1Pod.fromJson(item);

    PodDetailsItemController controller = Get.put(
      PodDetailsItemController(pod: pod),
    );

    if (pod == null || pod.spec == null || pod.status == null) {
      return Container();
    }

    final ready =
        '${pod.status!.containerStatuses.where((containerStatus) => containerStatus.ready).length}/${pod.spec!.containers.length}';
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
              values: pod.spec!.priority ?? '-',
            ),
            DetailsItemModel(
              name: 'Node',
              values: pod.spec!.nodeName ?? '-',
            ),
            DetailsItemModel(
              name: 'Node',
              values: pod.spec!.serviceAccountName ?? '-',
            ),
            DetailsItemModel(
              name: 'Service Account',
              values: pod.spec!.serviceAccountName ?? '-',
            ),
            DetailsItemModel(
              name: 'Restart Policy',
              values: pod.spec!.restartPolicy.toString(),
            ),
            DetailsItemModel(
              name: 'Termination Grace Period Seconds',
              values: pod.spec!.terminationGracePeriodSeconds ?? '-',
            ),
            DetailsItemModel(
              name: 'Ports',
              values: ports != null
                  ? ports
                      .map((port) =>
                          '${port.containerName}: ${port.port.containerPort}${port.port.protocol != null ? '/${port.port.protocol!.value}' : ''}${port.port.name != null ? ' (${port.port.name})' : ''}')
                      .toList()
                  : '-',
              onTap: (index) {
                if (ports != null) {
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
              values: ready,
            ),
            DetailsItemModel(
              name: 'Restarts',
              values: restarts,
            ),
            DetailsItemModel(
              name: 'Status',
              values: status,
            ),
            DetailsItemModel(
              name: 'QoS',
              values: pod.status!.qosClass.toString(),
            ),
            DetailsItemModel(
              name: 'Pod IP',
              values: pod.status!.podIP ?? '-',
            ),
            DetailsItemModel(
              name: 'Host IP',
              values: pod.status!.hostIP ?? '-',
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsContainersWidget(
          initContainers: pod.spec!.initContainers,
          containers: pod.spec!.containers,
          initContainerStatuses: pod.status!.initContainerStatuses,
          containerStatuses: pod.status!.containerStatuses,
          containerMetrics: controller.metrics,
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreviewWidget(
          title: Resources.map['events']!.title,
          resource: Resources.map['events']!.resource,
          path: Resources.map['events']!.path,
          scope: Resources.map['events']!.scope,
          namespace: pod.metadata?.namespace,
          selector:
              'fieldSelector=involvedObject.name=${pod.metadata?.name ?? ''}',
        ),
      ],
    );
  }
}
