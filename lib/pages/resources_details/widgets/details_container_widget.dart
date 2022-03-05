import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/api.dart'
    show IoK8sApiCoreV1Container, IoK8sApiCoreV1ContainerStatus;
import 'package:kubenav/models/kubernetes-extensions/pod_metrics.dart';
import 'package:kubenav/pages/resources_details/widgets/details_item_widget.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/utils/resources/pods.dart';
import 'package:kubenav/widgets/app_bottom_sheet_widget.dart';
import 'package:kubenav/widgets/app_vertical_list_simple_widget.dart';

class DetailsContainerWidget extends StatelessWidget {
  const DetailsContainerWidget({
    Key? key,
    required this.containerType,
    required this.container,
    required this.initContainerStatuses,
    required this.containerStatuses,
    required this.containerMetrics,
  }) : super(key: key);

  final String containerType;
  final IoK8sApiCoreV1Container container;
  final List<IoK8sApiCoreV1ContainerStatus> initContainerStatuses;
  final List<IoK8sApiCoreV1ContainerStatus> containerStatuses;
  final RxList<ApisMetricsV1beta1PodMetricsItemContainer> containerMetrics;

  List<Widget> buildStatus() {
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
        Container(),
      ];
    }

    return [
      DetailsItemWidget(
        smallPadding: true,
        title: 'Status',
        details: [
          DetailsItemModel(
            name: 'State',
            values: getContainerState(status[0].state, true),
          ),
          DetailsItemModel(
            name: 'Last State',
            values: getContainerState(status[0].lastState, true),
          ),
          DetailsItemModel(
            name: 'Ready',
            values: status[0].ready ? 'True' : 'False',
          ),
          DetailsItemModel(
            name: 'Restarts',
            values: status[0].restartCount,
          ),
        ],
      ),
      const SizedBox(height: Constants.spacingMiddle),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final List<ApisMetricsV1beta1PodMetricsItemContainer> containerMetric =
        containerMetrics
            .where((containerMetric) => containerMetric.name == container.name)
            .toList();

    return AppBottomSheetWidget(
      title: container.name,
      subtitle: containerType,
      icon: 'assets/resources/image54x54/containers.png',
      onClosePressed: () {
        finish(context);
      },
      actionText: 'Close',
      onActionPressed: () {
        finish(context);
      },
      child: ListView(
        shrinkWrap: false,
        children: [
          DetailsItemWidget(
            smallPadding: true,
            title: 'Configuration',
            details: [
              DetailsItemModel(
                name: 'Image',
                values: container.image ?? '-',
              ),
              DetailsItemModel(
                name: 'Image Pull Policy',
                values: container.imagePullPolicy?.value ?? '-',
              ),
              DetailsItemModel(
                name: 'Command',
                values: container.command.isNotEmpty ? container.command : '-',
              ),
              DetailsItemModel(
                name: 'Arguments',
                values: container.args.isNotEmpty ? container.args : '-',
              ),
              DetailsItemModel(
                name: 'Ports',
                values: container.ports.isNotEmpty
                    ? container.ports
                        .map((port) =>
                            '${port.containerPort}${port.hostPort != null ? '/${port.hostPort}' : ''}${port.protocol != null ? '/${port.protocol!.value}' : ''}${port.name != null ? ' (${port.name})' : ''}')
                        .toList()
                    : '-',
              ),
              DetailsItemModel(
                name: 'Readiness Probe',
                values: container.readinessProbe != null
                    ? getProbe(container.readinessProbe!)
                    : '-',
              ),
              DetailsItemModel(
                name: 'Liveness Probe',
                values: container.livenessProbe != null
                    ? getProbe(container.livenessProbe!)
                    : '-',
              ),
              DetailsItemModel(
                name: 'Startup Probe',
                values: container.startupProbe != null
                    ? getProbe(container.startupProbe!)
                    : '-',
              ),
            ],
          ),
          const SizedBox(height: Constants.spacingMiddle),
          ...buildStatus(),
          DetailsItemWidget(
            smallPadding: true,
            title: 'Resources',
            details: [
              DetailsItemModel(
                name: 'CPU Usage',
                values: containerMetric.isNotEmpty &&
                        containerMetric[0].usage?.cpu != null
                    ? formatCpuMetric(
                        cpuMetricsStringToInt(containerMetric[0].usage!.cpu!))
                    : '-',
              ),
              DetailsItemModel(
                name: 'CPU Requests',
                values: container.resources != null &&
                        container.resources!.requests.containsKey('cpu')
                    ? container.resources!.requests['cpu']
                    : '-',
              ),
              DetailsItemModel(
                name: 'CPU Limits',
                values: container.resources != null &&
                        container.resources!.limits.containsKey('cpu')
                    ? container.resources!.limits['cpu']
                    : '-',
              ),
              DetailsItemModel(
                name: 'Memory Usage',
                values: containerMetric.isNotEmpty &&
                        containerMetric[0].usage?.memory != null
                    ? formatMemoryMetric(memoryMetricsStringToInt(
                        containerMetric[0].usage!.memory!))
                    : '-',
              ),
              DetailsItemModel(
                name: 'Memory Requests',
                values: container.resources != null &&
                        container.resources!.requests.containsKey('memory')
                    ? container.resources!.requests['memory']
                    : '-',
              ),
              DetailsItemModel(
                name: 'Memory Limits',
                values: container.resources != null &&
                        container.resources!.limits.containsKey('memory')
                    ? container.resources!.limits['memory']
                    : '-',
              ),
            ],
          ),
          const SizedBox(height: Constants.spacingMiddle),
          AppVertialListSimpleWidget(
            smallPadding: true,
            title: 'Environment Variables',
            items: container.env
                .map(
                  (env) => AppVertialListSimpleModel(
                    onTap: () {
                      snackbar(
                        env.name,
                        env.value != null
                            ? env.value!
                            : env.valueFrom != null
                                ? getValueFrom(env.valueFrom!)
                                : '-',
                      );
                    },
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Constants.colorPrimary,
                          borderRadius: BorderRadius.all(
                            Radius.circular(Constants.sizeBorderRadius),
                          ),
                        ),
                        height: 54,
                        width: 54,
                        child: Image.asset(
                          'assets/resources/image42x42/secrets.png',
                        ),
                      ),
                      const SizedBox(width: Constants.spacingSmall),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              env.name,
                              style: primaryTextStyle(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              env.value != null
                                  ? env.value!
                                  : env.valueFrom != null
                                      ? getValueFrom(env.valueFrom!)
                                      : '-',
                              style: secondaryTextStyle(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: Constants.spacingSmall),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey[300],
                        size: 24,
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
          AppVertialListSimpleWidget(
            smallPadding: true,
            title: 'Volume Mounts',
            items: container.volumeMounts
                .map(
                  (volumeMount) => AppVertialListSimpleModel(
                    onTap: () {
                      snackbar(
                        volumeMount.name,
                        'Path: ${volumeMount.mountPath}\nSub-Path: ${volumeMount.subPath ?? '-'}\nReadonly: ${volumeMount.readOnly == true ? 'True' : 'False'}',
                      );
                    },
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Constants.colorPrimary,
                          borderRadius: BorderRadius.all(
                            Radius.circular(Constants.sizeBorderRadius),
                          ),
                        ),
                        height: 54,
                        width: 54,
                        child: Image.asset(
                          'assets/resources/image42x42/persistentvolumes.png',
                        ),
                      ),
                      const SizedBox(width: Constants.spacingSmall),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              volumeMount.name,
                              style: primaryTextStyle(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              volumeMount.mountPath,
                              style: secondaryTextStyle(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: Constants.spacingSmall),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey[300],
                        size: 24,
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
