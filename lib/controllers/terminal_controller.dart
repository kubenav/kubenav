import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:xterm/xterm.dart' as xterm;

import 'package:kubenav/models/terminal_model.dart';
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
        onClosing: () {},
        enableDrag: false,
        builder: (builder) {
          return const AppTerminalsWidget();
        },
      ),
      isScrollControlled: true,
    ).whenComplete(() {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
      hideTerminalsBottomSheet();
    });
  }

  void hideTerminalsBottomSheet() {
    showTerminals.value = false;
  }

  void addTerminal(
    TerminalType type,
    String name,
    List<dynamic>? logs,
    xterm.Terminal? terminal,
  ) {
    terminals.add(
      Terminal(
        type: type,
        name: name,
        logs: logs,
        terminal: terminal,
      ),
    );

    showTerminalsBottomSheet();
  }

  void removeTerminal(BuildContext context, int index) {
    if (terminals[index].terminal != null) {
      terminals[index].terminal!.terminateBackend();
    }

    terminals.removeAt(index);
    if (terminals.isEmpty) {
      finish(context);
    }
  }
}
