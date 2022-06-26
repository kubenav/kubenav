import 'dart:io';

import 'package:flutter/material.dart';

import 'package:code_text_field/code_text_field.dart';
import 'package:flutter_highlight/themes/nord.dart';
import 'package:get/get.dart';
import 'package:highlight/languages/yaml.dart';

import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/app_bottom_sheet_widget.dart';

class DetailsTemplateController extends GetxController {
  String template;
  CodeController? codeController;

  DetailsTemplateController({required this.template});

  @override
  void onInit() {
    codeController = CodeController(
      text: template,
      theme: nordTheme,
    );

    super.onInit();
  }
}

class DetailsTemplateWidget extends StatelessWidget {
  const DetailsTemplateWidget({
    Key? key,
    required this.name,
    required this.template,
  }) : super(key: key);

  final String name;
  final String template;

  @override
  Widget build(BuildContext context) {
    DetailsTemplateController controller = Get.put(
      DetailsTemplateController(template: template),
    );

    return AppBottomSheetWidget(
      title: 'Template',
      subtitle: name,
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
