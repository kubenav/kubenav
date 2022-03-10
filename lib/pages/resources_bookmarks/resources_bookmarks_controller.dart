import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/controllers/bookmark_controller.dart';
import 'package:kubenav/controllers/cluster_controller.dart';
import 'package:kubenav/pages/resources_bookmarks/widgets/bookmark_actions_widget.dart';
import 'package:kubenav/utils/constants.dart';

class ResourcesBookmarksController extends GetxController {
  BookmarkController bookmarkController = Get.find();
  ClusterController clusterController = Get.find();

  void showBookmarkActionsBottomSheet(int index) {
    Get.bottomSheet(
      BottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.sizeBorderRadius),
        ),
        onClosing: () {},
        enableDrag: false,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return BookmarkActionsWidget(bookmarkIndex: index);
        },
      ),
      isScrollControlled: true,
    );
  }
}
