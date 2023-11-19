import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:code_text_field/code_text_field.dart';
import 'package:flutter_highlight/themes/nord.dart';
import 'package:highlight/languages/json.dart' as highlight_json;
import 'package:highlight/languages/yaml.dart' as highlight_yaml;
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/services/helpers_service.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

/// The [DetailsShowYaml] widget can be used to show the manifest file for a
/// provided resource [item]. The manifest is either displayed as a yaml
/// document or a json document depending on the users settings.
class DetailsShowYaml extends StatefulWidget {
  const DetailsShowYaml({
    super.key,
    required this.item,
  });

  final dynamic item;

  @override
  State<DetailsShowYaml> createState() => _DetailsShowYamlState();
}

class _DetailsShowYamlState extends State<DetailsShowYaml> {
  CodeController _codeController = CodeController();
  bool _isLoading = false;

  /// [_init] is called when the widget is initialized. Within the [_init]
  /// function we prettify the provided [widget.item] and convert it to
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
        _codeController.text = encoder.convert(widget.item);
      } else {
        final data = await HelpersService().prettifyYAML(widget.item);
        _codeController.text = data;
      }
    } catch (err) {
      Logger.log(
        'DetailsShowYaml _init',
        'An error was returned while prettyfing template',
        err,
      );
    }
  }

  /// [_export] can be used to export the manifest file for the viewed resource.
  /// The manifest is exported as json or yaml document with the name of the
  /// resource [widget.item] as name.
  /// When the manifest was exported sucessfully a snackbar is shown with the
  /// name of the exported document and the modal is closed. When the export
  /// fails we display an snackbar with the thrown exception.
  Future<void> _export() async {
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: false,
    );

    try {
      setState(() {
        _isLoading = true;
      });
      final name = widget.item.containsKey('metadata') &&
              widget.item['metadata'].containsKey('name')
          ? widget.item['metadata']['name']
          : 'manifest';

      final directory = await getApplicationDocumentsDirectory();
      final file = File(
          '${directory.path}/$name.${appRepository.settings.editorFormat}');
      await file.writeAsString(_codeController.text);

      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          'Manifest was exported',
          'The manifest was exported as $name.yaml',
        );
        Navigator.pop(context);
      }
    } catch (err) {
      Logger.log(
        'DetailsShowYaml _export',
        'Could not export manifest: $err',
        err,
      );
      setState(() {
        _isLoading = false;
      });
      if (!context.mounted) return;
      showSnackbar(
        context,
        'Could not export manifest',
        err.toString(),
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
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: true,
    );

    return AppBottomSheetWidget(
      title: appRepository.settings.editorFormat == 'json' ? 'Json' : 'Yaml',
      subtitle: widget.item['metadata']['name'] ?? '',
      icon: Icons.description,
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Export',
      actionPressed: () {
        _export();
      },
      actionIsLoading: _isLoading,
      child: Form(
        child: ListView(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: false,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              child: CodeTheme(
                data: const CodeThemeData(styles: nordTheme),
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
          ],
        ),
      ),
    );
  }
}
