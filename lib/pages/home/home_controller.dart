import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:kubenav/controllers/cluster_controller.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/widgets/app_clusters_widget.dart';

class HomeController extends GetxController {
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

  void showClusters() {
    Get.bottomSheet(
      BottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.sizeBorderRadius),
        ),
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
