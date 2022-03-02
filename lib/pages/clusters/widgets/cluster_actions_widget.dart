import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:kubenav/controllers/cluster_controller.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/app_actions_widget.dart';

class ClusterActionsController extends GetxController {
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
}

class ClusterActionsWidget extends StatelessWidget {
  const ClusterActionsWidget({
    Key? key,
    required this.clusterIndex,
  }) : super(key: key);

  final int clusterIndex;

  @override
  Widget build(BuildContext context) {
    ClusterActionsController controller = Get.put(
      ClusterActionsController(),
    );

    return AppActionsWidget(
      actions: [
        AppActionsWidgetAction(
          title: 'Edit',
          onTap: () {
            finish(context);
          },
        ),
        AppActionsWidgetAction(
          title: 'Delete',
          color: Constants.colorDanger,
          onTap: () {
            final clusterName =
                controller.clusterController.getActiveClusterName();
            controller.clusterController.deleteCluster(clusterIndex);
            snackbar(
              'Cluster deleted',
              'The cluster $clusterName was deleted',
            );
            finish(context);
          },
        ),
      ],
    );
  }
}
