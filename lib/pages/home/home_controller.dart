import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/controllers/cluster_controller.dart';
import 'package:kubenav/widgets/app_clusters_widget.dart';

class HomeController extends GetxController {
  ClusterController clusterController = Get.find();

  void showClusters() {
    Get.bottomSheet(
      BottomSheet(
        onClosing: () {},
        enableDrag: false,
        builder: (builder) {
          return const AppClustersWidget();
        },
      ),
      isScrollControlled: true,
    );
  }
}
