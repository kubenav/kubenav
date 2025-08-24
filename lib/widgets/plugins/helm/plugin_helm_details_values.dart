import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:code_text_field/code_text_field.dart';
import 'package:highlight/languages/json.dart' as highlight_json;
import 'package:highlight/languages/yaml.dart' as highlight_yaml;
import 'package:provider/provider.dart';

import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/services/helpers_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/themes.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

String _encodeValues(Map<String, dynamic>? values) {
  JsonEncoder encoder = const JsonEncoder.withIndent('  ');
  return encoder.convert(values);
}

/// The [PluginHelmDetailsValues] widget can be used to render the values file
/// of a Helm release in a modal bottom sheet. The values file will be displayed
/// in a code editor as yaml or json document, depending on the users settings.
class PluginHelmDetailsValues extends StatefulWidget {
  const PluginHelmDetailsValues({
    super.key,
    required this.title,
    required this.name,
    required this.values,
  });

  final String title;
  final String name;
  final Map<String, dynamic>? values;

  @override
  State<PluginHelmDetailsValues> createState() =>
      _PluginHelmDetailsValuesState();
}

class _PluginHelmDetailsValuesState extends State<PluginHelmDetailsValues> {
  CodeController _codeController = CodeController();

  /// [_init] is used to initialize the [_codeController] with the encoded
  /// [widget.values]. The encoding is done with the [_encodeValues] function.
  /// When the encoding is done the result is displayed in the [CodeField]
  /// widget.
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
      final jsonStr = await compute(_encodeValues, widget.values);

      if (appRepository.settings.editorFormat == 'json') {
        _codeController.text = jsonStr;
      } else {
        final data = await HelpersService().prettifyYAML(jsonStr);
        _codeController.text = data;
      }
    } catch (err) {
      Logger.log('PluginHelmDetailsValues _init', 'Encoding Failed', err);
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
      title: widget.title,
      subtitle: widget.name,
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
              readOnly: true,
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
