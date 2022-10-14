import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/controllers/portforwarding_controller.dart';
import 'package:kubenav/controllers/terminal_controller.dart';
import 'package:kubenav/utils/constants.dart';

class AppFloatingActionButtonsController extends GetxController {
  TerminalController terminalController = Get.find();
  PortForwardingController portForwardingController = Get.find();
}

class AppFloatingActionButtonsWidget extends StatelessWidget {
  const AppFloatingActionButtonsWidget({Key? key}) : super(key: key);

  List<Widget> buildFloatingActionButtons(
      AppFloatingActionButtonsController controller) {
    List<Widget> floatingActionButtons = [];

    if (controller.terminalController.terminals.isNotEmpty) {
      floatingActionButtons.add(
        FloatingActionButton(
          heroTag: 'terminal',
          backgroundColor: Constants.colorPrimary,
          onPressed: () {
            controller.terminalController.showTerminalsBottomSheet();
          },
          child: const Icon(
            Icons.terminal,
            color: Colors.white,
          ),
        ),
      );
    }

    if (controller.portForwardingController.sessions.isNotEmpty) {
      floatingActionButtons.add(
        FloatingActionButton(
          heroTag: 'portforwarding',
          backgroundColor: Constants.colorPrimary,
          onPressed: () {
            controller.portForwardingController.showSessionsBottomSheet();
          },
          child: const Icon(
            Icons.link,
            color: Colors.white,
          ),
        ),
      );
    }

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
          children: controller.terminalController.showTerminals.value ||
                  controller.portForwardingController.showSessions.value
              ? []
              : buildFloatingActionButtons(controller),
        );
      },
    );
  }
}
