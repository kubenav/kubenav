import 'dart:io' show Platform;

import 'package:flutter/material.dart';

import 'package:code_text_field/code_text_field.dart';
import 'package:flutter_highlight/themes/nord.dart';
import 'package:get/get.dart';
import 'package:highlight/languages/yaml.dart';

import 'package:kubenav/services/helpers_service.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/widgets/app_bottom_sheet_widget.dart';

class DetailsShowYamlController extends GetxController {
  dynamic item;
  CodeController? codeController;

  DetailsShowYamlController({required this.item});

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

  void prettifyYAML() async {
    try {
      final data = await HelpersService().prettifyYAML(item);
      codeController?.text = data;
    } catch (err) {
      Logger.log(
        'DetailsShowYamlController prettifyYAML',
        'An error was returned while prettyfing yaml',
        err,
      );
    }
  }
}

class DetailsShowYamlWidget extends StatelessWidget {
  const DetailsShowYamlWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final dynamic item;

  @override
  Widget build(BuildContext context) {
    DetailsShowYamlController controller = Get.put(
      DetailsShowYamlController(item: item),
    );

    return AppBottomSheetWidget(
      title: 'Yaml',
      subtitle: item['metadata']['name'] ?? '',
      icon: Icons.description,
      onClosePressed: () {
        finish(context);
      },
      actionText: 'Close',
      onActionPressed: () {
        finish(context);
      },
      child: Form(
        child: ListView(
          physics: const ClampingScrollPhysics(),
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
