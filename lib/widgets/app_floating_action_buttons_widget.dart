import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:kubenav/controllers/terminal_controller.dart';
import 'package:kubenav/utils/constants.dart';

class AppFloatingActionButtonsController extends GetxController {
  TerminalController terminalController = Get.find();

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

class AppFloatingActionButtonsWidget extends StatelessWidget {
  const AppFloatingActionButtonsWidget({Key? key}) : super(key: key);

  List<Widget> buildFloatingActionButtons(
      AppFloatingActionButtonsController controller) {
    List<Widget> floatingActionButtons = [];

    if (controller.terminalController.terminals.isNotEmpty) {
      floatingActionButtons.add(
        FloatingActionButton(
          heroTag: "terminal",
          backgroundColor: Constants.colorPrimary,
          onPressed: () {
            controller.terminalController.showTerminalsBottomSheet();
          },
          child: const Icon(Icons.terminal),
        ),
      );
    }

    // if (controller.portForwardingController.connections.isNotEmpty) {
    //   floatingActionButtons.add(
    //     FloatingActionButton(
    //       heroTag: "portforwarding",
    //       backgroundColor: Constants.colorPrimary,
    //       onPressed: () {},
    //       child: const Icon(Icons.link),
    //     ),
    //   );
    // }

    return floatingActionButtons;
  }

  @override
  Widget build(BuildContext context) {
    AppFloatingActionButtonsController controller = Get.put(
      AppFloatingActionButtonsController(),
    );

    return Obx(
      () {
        return Wrap(
          direction: Axis.vertical,
          spacing: Constants.spacingMiddle,
          children: controller.terminalController.showTerminals.value
              ? []
              : buildFloatingActionButtons(controller),
        );
      },
    );
  }
}
