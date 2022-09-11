import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/controllers/bookmark_controller.dart';
import 'package:kubenav/controllers/cluster_controller.dart';
import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/widgets/app_clusters_widget.dart';

class ResourcesController extends GetxController {
  BookmarkController bookmarkController = Get.find();
  ClusterController clusterController = Get.find();
  Map<String, Resource> resources = Resources.map;

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
