import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/controllers/global_settings_controller.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/app_actions_widget.dart';

class DeleteNamespaceController extends GetxController {
  GlobalSettingsController globalSettingsController = Get.find();
  final int index;

  DeleteNamespaceController({
    required this.index,
  });

  void deleteNamespace() {
    globalSettingsController.namespaces.removeAt(index);
  }
}

class DeleteNamespaceWidget extends StatelessWidget {
  const DeleteNamespaceWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    DeleteNamespaceController controller = Get.put(
      DeleteNamespaceController(
        index: index,
      ),
    );

    return AppActionsWidget(
      actions: [
        AppActionsWidgetAction(
          title: 'Delete',
          color: Constants.colorDanger,
          onTap: () {
            final namespace =
                controller.globalSettingsController.namespaces[index];
            controller.deleteNamespace();
            snackbar(
              'Namespace deleted',
              'The namespace $namespace was deleted',
            );
            finish(context);
          },
        ),
      ],
    );
  }
}
