import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_container.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_container_status.dart';
import 'package:kubenav/models/kubernetes_extensions/pod_metrics.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/utils/resources/pods.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/resources/details/details_container.dart';
import 'package:kubenav/widgets/shared/app_horizontal_list_cards_widget.dart';

class DetailsContainers extends StatelessWidget {
  const DetailsContainers({
    super.key,
    required this.initContainers,
    required this.containers,
    required this.initContainerStatuses,
    required this.containerStatuses,
    required this.containerMetrics,
  });

  final List<IoK8sApiCoreV1Container> initContainers;
  final List<IoK8sApiCoreV1Container> containers;
  final List<IoK8sApiCoreV1ContainerStatus> initContainerStatuses;
  final List<IoK8sApiCoreV1ContainerStatus> containerStatuses;
  final List<ApisMetricsV1beta1PodMetricsItemContainer> containerMetrics;

  List<String> getSubtitle(
      String containerType, IoK8sApiCoreV1Container container,) {
    List<IoK8sApiCoreV1ContainerStatus> status = [];
    if (containerType == 'Init Container') {
      status =
          initContainerStatuses.where((e) => e.name == container.name).toList();
    } else if (containerType == 'Container') {
      status =
          containerStatuses.where((e) => e.name == container.name).toList();
    }

    if (status.length != 1) {
      return [
        'Type: $containerType',
      ];
    }

    List<ApisMetricsV1beta1PodMetricsItemContainer> filteredContainerMetrics =
        [];
    if (containerMetrics.isNotEmpty) {
      filteredContainerMetrics = containerMetrics
          .where((containerMetric) => containerMetric.name == container.name)
          .toList();
    }

    return [
      'Type: $containerType ',
      'Ready: ${status[0].ready ? 'True' : 'False'}',
      'Restarts: ${status[0].restartCount}',
      'State: ${getContainerState(status[0].state)}',
      'CPU: ${filteredContainerMetrics.isNotEmpty && filteredContainerMetrics[0].usage?.cpu != null ? formatCpuMetric(cpuMetricsStringToDouble(filteredContainerMetrics[0].usage!.cpu!)) : '-'} / ${container.resources != null && container.resources!.requests.containsKey('cpu') ? container.resources!.requests['cpu'] : '-'} / ${container.resources != null && container.resources!.limits.containsKey('cpu') ? container.resources!.limits['cpu'] : '-'}',
      'Memory: ${filteredContainerMetrics.isNotEmpty && filteredContainerMetrics[0].usage?.memory != null ? formatMemoryMetric(memoryMetricsStringToDouble(filteredContainerMetrics[0].usage!.memory!)) : '-'} / ${container.resources != null && container.resources!.requests.containsKey('memory') ? container.resources!.requests['memory'] : '-'} / ${container.resources != null && container.resources!.limits.containsKey('memory') ? container.resources!.limits['memory'] : '-'}',
    ];
  }

  @override
  Widget build(BuildContext context) {
    return AppHorizontalListCardsWidget(
      title: 'Containers',
      cards: [
        ...List.generate(
          initContainers.length,
          (index) => AppHorizontalListCardsModel(
            title: initContainers[index].name,
            subtitle: getSubtitle('Init Container', initContainers[index]),
            image: 'assets/resources/containers.svg',
            imageFit: BoxFit.none,
            onTap: () {
              showModal(
                context,
                DetailsContainer(
                  containerType: 'Init Container',
                  container: initContainers[index],
                  initContainerStatuses: initContainerStatuses,
                  containerStatuses: containerStatuses,
                  containerMetrics: containerMetrics,
                ),
              );
            },
          ),
        ),
        ...List.generate(
          containers.length,
          (index) => AppHorizontalListCardsModel(
            title: containers[index].name,
            subtitle: getSubtitle('Container', containers[index]),
            image: 'assets/resources/containers.svg',
            imageFit: BoxFit.none,
            onTap: () {
              showModal(
                context,
                DetailsContainer(
                  containerType: 'Container',
                  container: containers[index],
                  initContainerStatuses: initContainerStatuses,
                  containerStatuses: containerStatuses,
                  containerMetrics: containerMetrics,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
