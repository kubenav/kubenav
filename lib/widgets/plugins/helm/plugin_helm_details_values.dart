import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:code_text_field/code_text_field.dart';
import 'package:highlight/languages/json.dart' as highlight_json;
import 'package:highlight/languages/yaml.dart' as highlight_yaml;
import 'package:provider/provider.dart';

import 'package:kubenav/models/plugins/helm.dart';
import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/services/helpers_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/themes.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

/// The [PluginHelmDetailsValues] widget can be used to render the values file
/// of a Helm release in a modal bottom sheet. The values file will be displayed
/// in a code editor as yaml or json document, depending on the users settings.
class PluginHelmDetailsValues extends StatefulWidget {
  const PluginHelmDetailsValues({
    super.key,
    required this.release,
  });

  final Release release;

  @override
  State<PluginHelmDetailsValues> createState() =>
      _PluginHelmDetailsValuesState();
}

class _PluginHelmDetailsValuesState extends State<PluginHelmDetailsValues> {
  CodeController _codeController = CodeController();

  /// [_init] is called when the widget is initialized. Within the [_init]
  /// function we prettify the provided [widget.release] and convert it to
  /// either a json document or a yaml document depending on the users settings.
  Future<void> _init() async {
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: false,
    );

    _codeController = CodeController(
      text: '',
      language: appRepository.settings.editorFormat == 'json'
          ? highlight_json.json
          : highlight_yaml.yaml,
    );

    try {
      if (appRepository.settings.editorFormat == 'json') {
        JsonEncoder encoder = const JsonEncoder.withIndent('  ');
        _codeController.text = encoder.convert(widget.release.config);
      } else {
        final data = await HelpersService().prettifyYAML(widget.release.config);
        _codeController.text = data;
      }
    } catch (err) {
      Logger.log(
        'PluginHelmDetailsValues _init',
        'An error was returned while prettyfing template',
        err,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: 'Values',
      subtitle: widget.release.name ?? '',
      icon: Icons.description,
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Close',
      actionPressed: () {
        Navigator.pop(context);
      },
      actionIsLoading: false,
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(
            top: Constants.spacingMiddle,
            bottom: Constants.spacingMiddle,
            left: Constants.spacingMiddle,
            right: Constants.spacingMiddle,
          ),
          child: CodeTheme(
            data: CodeThemeData(
              styles: Theme.of(context).extension<EditorColors>()!.getTheme(),
            ),
            child: CodeField(
              controller: _codeController,
              enabled: false,
              textStyle: TextStyle(
                fontSize: 14,
                fontFamily: getMonospaceFontFamily(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
