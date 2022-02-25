import 'dart:io' show Platform;

import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/themes/nord.dart';
import 'package:get/get.dart';
import 'package:highlight/languages/yaml.dart';

import 'package:kubenav/services/helpers_service.dart';
import 'package:kubenav/utils/helpers.dart';
// import 'package:kubenav/utils/yaml_writer.dart';
import 'package:kubenav/widgets/app_bottom_sheet_widget.dart';

class ShowYamlController extends GetxController {
  dynamic item;
  CodeController? codeController;

  ShowYamlController({required this.item});

  @override
  void onInit() {
    codeController = CodeController(
      text: '',
      language: yaml,
      theme: nordTheme,
    );
    prettifyYAML();

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

  void prettifyYAML() async {
    try {
      final data = await HelpersService().prettifyYAML(item);
      codeController?.text = data;
    } catch (err) {
      debugPrint('prettifyYAML error: $err');
    }
  }
}

class ShowYamlWidget extends StatelessWidget {
  const ShowYamlWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final dynamic item;

  @override
  Widget build(BuildContext context) {
    ShowYamlController controller = Get.put(
      ShowYamlController(item: item),
    );

    return AppBottomSheetWidget(
      title: 'Yaml',
      subtitle: item['metadata']['name'] ?? '',
      icon: Icons.description,
      onClosePressed: () {
        debugPrint('Close show yaml widget buttom sheet');
        finish(context);
      },
      actionText: 'Close',
      onActionPressed: () {
        debugPrint('Close show yaml widget buttom sheet');
        finish(context);
      },
      child: Form(
        child: ListView(
          shrinkWrap: false,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              child: CodeField(
                controller: controller.codeController!,
                enabled: false,
                textStyle: TextStyle(
                  fontSize: 14,
                  fontFamily: Platform.isIOS ? 'Courier' : 'monospace',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
