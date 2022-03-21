import 'dart:io';

import 'package:flutter/material.dart';

import 'package:code_text_field/code_text_field.dart';
import 'package:flutter_highlight/themes/nord.dart';
import 'package:get/get.dart';
import 'package:highlight/languages/yaml.dart';
import 'package:path_provider/path_provider.dart';

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

  void export() async {
    try {
      if (codeController != null) {
        final name =
            item.containsKey('metadata') && item['metadata'].containsKey('name')
                ? item['metadata']['name']
                : 'manifest';

        final directory = await getApplicationDocumentsDirectory();
        final file = File('${directory.path}/$name.yaml');
        await file.writeAsString(codeController!.text);

        snackbar(
          'Manifest was exported',
          'The manifest was exported as $name.yaml',
        );
      }
    } catch (err) {
      Logger.log(
        'DetailsShowYamlController export',
        'Could not export manifest: $err',
        err,
      );
      snackbar(
        'Could not export manifest',
        err.toString(),
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
      actionText: 'Export',
      onActionPressed: () {
        controller.export();
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
