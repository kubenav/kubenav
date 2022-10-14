import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_pod.dart';
import 'package:kubenav/pages/resources_details/widgets/details_live_metrics_widget.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/app_actions_widget.dart';

class DetailsLiveMetricsContainersWidget extends StatelessWidget {
  const DetailsLiveMetricsContainersWidget({
    Key? key,
    required this.name,
    required this.namespace,
    required this.pod,
  }) : super(key: key);

  final String name;
  final String namespace;
  final IoK8sApiCoreV1Pod pod;

  @override
  Widget build(BuildContext context) {
    return AppActionsWidget(
      actions: List.generate(
        pod.spec != null ? pod.spec!.containers.length + 1 : 1,
        (index) => AppActionsWidgetAction(
          title: index == pod.spec!.containers.length
              ? 'All Containers'
              : pod.spec?.containers[index].name ?? '',
          color: Constants.colorPrimary,
          onTap: () {
            finish(context);
            Get.bottomSheet(
              BottomSheet(
                onClosing: () {},
                enableDrag: false,
                builder: (builder) {
                  return DetailsLiveMetricsWidget(
                    name: name,
                    namespace: namespace,
                    pod: pod,
                    selectedContainer: index == pod.spec!.containers.length
                        ? ''
                        : pod.spec?.containers[index].name ?? '',
                  );
                },
              ),
              isScrollControlled: true,
            );
          },
        ),
      ),
    );
  }
}
