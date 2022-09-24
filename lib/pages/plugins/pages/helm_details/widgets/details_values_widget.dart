import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:code_text_field/code_text_field.dart';
import 'package:flutter_highlight/themes/nord.dart';
import 'package:get/get.dart';
import 'package:highlight/languages/json.dart';
import 'package:highlight/languages/yaml.dart';

import 'package:kubenav/controllers/global_settings_controller.dart';
import 'package:kubenav/models/helm_model.dart';
import 'package:kubenav/services/helpers_service.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/widgets/app_bottom_sheet_widget.dart';

class DetailsValuesController extends GetxController {
  GlobalSettingsController globalSettingsController = Get.find();

  Release item;
  CodeController? codeController;

  DetailsValuesController({required this.item});

  @override
  void onInit() {
    codeController = CodeController(
      text: '',
      language:
          globalSettingsController.editorFormat.value == 'json' ? json : yaml,
      theme: nordTheme,
    );
    prettifyYAML();

    super.onInit();
  }

  void prettifyYAML() async {
    try {
      if (globalSettingsController.editorFormat.value == 'json') {
        JsonEncoder encoder = const JsonEncoder.withIndent('  ');
        codeController?.text = encoder.convert(item.config);
      } else {
        final data = await HelpersService().prettifyYAML(item.config);
        codeController?.text = data;
      }
    } catch (err) {
      Logger.log(
        'DetailsValuesController prettifyYAML',
        'An error was returned while prettyfing yaml',
        err,
      );
    }
  }
}

class DetailsValuesWidget extends StatelessWidget {
  const DetailsValuesWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Release item;

  @override
  Widget build(BuildContext context) {
    DetailsValuesController controller = Get.put(
      DetailsValuesController(item: item),
    );

    return AppBottomSheetWidget(
      title: 'Values',
      subtitle: item.name ?? '',
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
                  fontFamily: getMonospaceFontFamily(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
