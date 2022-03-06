import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:kubenav/controllers/bookmark_controller.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/app_actions_widget.dart';

class BookmarkActionsController extends GetxController {
  BookmarkController bookmarkController = Get.find();

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

class BookmarkActionsWidget extends StatelessWidget {
  const BookmarkActionsWidget({
    Key? key,
    required this.bookmarkIndex,
  }) : super(key: key);

  final int bookmarkIndex;

  @override
  Widget build(BuildContext context) {
    BookmarkActionsController controller = Get.put(
      BookmarkActionsController(),
    );

    return AppActionsWidget(
      actions: [
        AppActionsWidgetAction(
          title: 'Delete',
          color: Constants.colorDanger,
          onTap: () {
            controller.bookmarkController.removeBookmark(bookmarkIndex);
            finish(context);
          },
        ),
      ],
    );
  }
}
