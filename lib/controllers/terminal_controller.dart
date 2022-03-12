import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/models/terminal_model.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/app_terminals_widget.dart';

/// The [TerminalController] is responsible for handling the terminals of a user. It holds a list of all existing
/// [terminals] and allows users to add new ones or remove existing ones.
class TerminalController extends GetxController {
  RxList<Terminal> terminals = <Terminal>[].obs;
  RxBool showTerminals = false.obs;

  void showTerminalsBottomSheet() {
    showTerminals.value = true;

    Get.bottomSheet(
      BottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.sizeBorderRadius),
        ),
        onClosing: () {},
        enableDrag: false,
        builder: (builder) {
          return const AppTerminalsWidget();
        },
      ),
      isScrollControlled: true,
    ).whenComplete(() => hideTerminalsBottomSheet());
  }

  void hideTerminalsBottomSheet() {
    showTerminals.value = false;
  }

  void addTerminal(
    TerminalType type,
    String name, [
    List<dynamic>? logs,
  ]) {
    terminals.add(
      Terminal(
        type: type,
        name: name,
        logs: logs,
      ),
    );

    showTerminalsBottomSheet();
  }

  void removeTerminal(BuildContext context, int index) {
    terminals.removeAt(index);
    if (terminals.isEmpty) {
      finish(context);
    }
  }
}
