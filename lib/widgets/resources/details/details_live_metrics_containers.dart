import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_pod.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/resources/details/details_live_metrics.dart';
import 'package:kubenav/widgets/shared/app_actions_widget.dart';

/// The [DetailsLiveMetricsContainers] widget returns an actions menu, where a
/// user can select the container for which he wants to view the live metrics
/// for CPU and Memory usage. The actions menu also contains an item to view the
/// live metrics for all contains in of a Pod.
class DetailsLiveMetricsContainers extends StatelessWidget {
  const DetailsLiveMetricsContainers({
    super.key,
    required this.name,
    required this.namespace,
    required this.pod,
  });

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
          color: Theme.of(context).colorScheme.primary,
          onTap: () {
            Navigator.pop(context);
            showModal(
              context,
              DetailsLiveMetrics(
                name: name,
                namespace: namespace,
                pod: pod,
                selectedContainer: index == pod.spec!.containers.length
                    ? ''
                    : pod.spec?.containers[index].name ?? '',
              ),
            );
          },
        ),
      ),
    );
  }
}
