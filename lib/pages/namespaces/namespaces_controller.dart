import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/controllers/global_settings_controller.dart';
import 'package:kubenav/pages/namespaces/widgets/add_namespace_widget.dart';
import 'package:kubenav/pages/namespaces/widgets/delete_namespace_widget.dart';
import 'package:kubenav/utils/constants.dart';

class NamespacesController extends GetxController {
  GlobalSettingsController globalSettingsController = Get.find();

  void addNamespace() {
    Get.bottomSheet(
      BottomSheet(
        onClosing: () {},
        enableDrag: false,
        builder: (builder) {
          return const AddNamespaceWidget();
        },
      ),
      isScrollControlled: true,
    );
  }

  void deleteNamespace(int index) {
    Get.bottomSheet(
      BottomSheet(
        onClosing: () {},
        enableDrag: false,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return Container(
            margin: const EdgeInsets.all(Constants.spacingMiddle),
            child: DeleteNamespaceWidget(
              index: index,
            ),
          );
        },
      ),
      isScrollControlled: true,
    );
  }
}
