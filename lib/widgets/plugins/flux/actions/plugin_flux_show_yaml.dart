import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:code_text_field/code_text_field.dart';
import 'package:highlight/languages/json.dart' as highlight_json;
import 'package:highlight/languages/yaml.dart' as highlight_yaml;
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/services/helpers_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/utils/themes.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

/// The [PluginFluxShowYaml] widget is used to show the yaml or json
/// representation of the provided [item]. The [item] is encoded with the
/// [encodeItem] function and displayed in a [CodeField] widget. The user can
/// export the manifest as json or yaml file with the name of the resource.
class PluginFluxShowYaml<T> extends StatefulWidget {
  const PluginFluxShowYaml({
    super.key,
    required this.name,
    required this.namespace,
    required this.item,
    required this.encodeItem,
  });

  final String name;
  final String namespace;
  final T item;
  final String Function(T item) encodeItem;

  @override
  State<PluginFluxShowYaml> createState() => _PluginFluxShowYamlState<T>();
}

class _PluginFluxShowYamlState<T> extends State<PluginFluxShowYaml> {
  CodeController _codeController = CodeController();
  bool _isLoading = false;

  /// [_init] is used to initialize the [_codeController] with the encoded
  /// [widget.item]. The encoding is done with the [widget.encodeItem] function.
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
      final jsonStr = await compute(widget.encodeItem, widget.item);

      if (appRepository.settings.editorFormat == 'json') {
        _codeController.text = jsonStr;
      } else {
        final data = await HelpersService().prettifyYAML(jsonStr);
        _codeController.text = data;
      }
    } catch (err) {
      Logger.log(
        'PluginFluxShowYaml _init',
        'Encoding Failed',
        err,
      );
    }
  }

  /// [_export] is used to export the manifest as json or yaml file. The file
  /// is saved in the application documents directory with the name of the
  /// resource.
  /// The user gets a snackbar message if the export was successful or failed.
  Future<void> _export() async {
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: false,
    );

    try {
      setState(() {
        _isLoading = true;
      });
      final directory = await getApplicationDocumentsDirectory();
      final file = File(
        '${directory.path}/${widget.name}.${appRepository.settings.editorFormat}',
      );
      await file.writeAsString(_codeController.text);

      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          'Manifest Exported',
          'The manifest was exported as ${widget.name}.${appRepository.settings.editorFormat}',
        );
        Navigator.pop(context);
      }
    } catch (err) {
      Logger.log(
        'PluginFluxShowYaml _export',
        'Export Failed',
        err,
      );
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          'Export Failed',
          err.toString(),
        );
      }
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
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: true,
    );

    return AppBottomSheetWidget(
      title: appRepository.settings.editorFormat == 'json' ? 'Json' : 'Yaml',
      subtitle: '${widget.namespace}/${widget.name}',
      icon: Icons.description,
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Export',
      actionPressed: () {
        _export();
      },
      actionIsLoading: _isLoading,
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
