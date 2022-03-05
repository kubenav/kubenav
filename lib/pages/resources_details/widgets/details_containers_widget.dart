import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/api.dart'
    show IoK8sApiCoreV1Container, IoK8sApiCoreV1ContainerStatus;
import 'package:kubenav/models/kubernetes-extensions/pod_metrics.dart';
import 'package:kubenav/pages/resources_details/widgets/details_container_widget.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/utils/resources/pods.dart';
import 'package:kubenav/widgets/app_horizontal_list_cards_widget.dart';

class DetailsContainersWidget extends StatelessWidget {
  const DetailsContainersWidget({
    Key? key,
    required this.initContainers,
    required this.containers,
    required this.initContainerStatuses,
    required this.containerStatuses,
    required this.containerMetrics,
  }) : super(key: key);

  final List<IoK8sApiCoreV1Container> initContainers;
  final List<IoK8sApiCoreV1Container> containers;
  final List<IoK8sApiCoreV1ContainerStatus> initContainerStatuses;
  final List<IoK8sApiCoreV1ContainerStatus> containerStatuses;
  final RxList<ApisMetricsV1beta1PodMetricsItemContainer> containerMetrics;

  String getSubtitle(String containerType, IoK8sApiCoreV1Container container) {
    List<IoK8sApiCoreV1ContainerStatus> status = [];
    if (containerType == 'Init Container') {
      status =
          initContainerStatuses.where((e) => e.name == container.name).toList();
    } else if (containerType == 'Container') {
      status =
          containerStatuses.where((e) => e.name == container.name).toList();
    }

    if (status.length != 1) {
      return 'Type: $containerType';
    }

    List<ApisMetricsV1beta1PodMetricsItemContainer> filteredContainerMetrics =
        [];
    if (containerMetrics.isNotEmpty) {
      filteredContainerMetrics = containerMetrics
          .where((containerMetric) => containerMetric.name == container.name)
          .toList();
    }

    return 'Type: $containerType \nReady: ${status[0].ready ? 'True' : 'False'}\nRestarts: ${status[0].restartCount}\nState: ${getContainerState(status[0].state)}\nCPU: ${filteredContainerMetrics.isNotEmpty && filteredContainerMetrics[0].usage?.cpu != null ? formatCpuMetric(cpuMetricsStringToInt(filteredContainerMetrics[0].usage!.cpu!)) : '-'} / ${container.resources != null && container.resources!.requests.containsKey('cpu') ? container.resources!.requests['cpu'] : '-'} / ${container.resources != null && container.resources!.limits.containsKey('cpu') ? container.resources!.limits['cpu'] : '-'}\nMemory: ${filteredContainerMetrics.isNotEmpty && filteredContainerMetrics[0].usage?.memory != null ? formatMemoryMetric(memoryMetricsStringToInt(filteredContainerMetrics[0].usage!.memory!)) : '-'} / ${container.resources != null && container.resources!.requests.containsKey('memory') ? container.resources!.requests['memory'] : '-'} / ${container.resources != null && container.resources!.limits.containsKey('memory') ? container.resources!.limits['memory'] : '-'}';
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return AppHorizontalListCardsWidget(
          title: 'Containers',
          cards: [
            ...List.generate(
              initContainers.length,
              (index) => AppHorizontalListCardsModel(
                title: initContainers[index].name,
                subtitle: getSubtitle('Init Container', initContainers[index]),
                image: 'assets/resources/image108x108/containers.png',
                imageFit: BoxFit.none,
                onTap: () {
                  Get.bottomSheet(
                    BottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(Constants.sizeBorderRadius),
                      ),
                      onClosing: () {},
                      enableDrag: false,
                      builder: (builder) {
                        return DetailsContainerWidget(
                          containerType: 'Init Container',
                          container: initContainers[index],
                          initContainerStatuses: initContainerStatuses,
                          containerStatuses: containerStatuses,
                          containerMetrics: containerMetrics,
                        );
                      },
                    ),
                    isScrollControlled: true,
                  );
                },
              ),
            ),
            ...List.generate(
              containers.length,
              (index) => AppHorizontalListCardsModel(
                title: containers[index].name,
                subtitle: getSubtitle('Container', containers[index]),
                image: 'assets/resources/image108x108/containers.png',
                imageFit: BoxFit.none,
                onTap: () {
                  Get.bottomSheet(
                    BottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(Constants.sizeBorderRadius),
                      ),
                      onClosing: () {},
                      enableDrag: false,
                      builder: (builder) {
                        return DetailsContainerWidget(
                          containerType: 'Container',
                          container: containers[index],
                          initContainerStatuses: initContainerStatuses,
                          containerStatuses: containerStatuses,
                          containerMetrics: containerMetrics,
                        );
                      },
                    ),
                    isScrollControlled: true,
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
