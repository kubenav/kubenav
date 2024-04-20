import 'package:flutter/material.dart';

import 'package:code_text_field/code_text_field.dart';
import 'package:highlight/languages/yaml.dart' as highlight_yaml;

import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/themes.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

/// The [PluginHelmDetailsManifest] widget can be used to show the manifest of a
/// Helm chart. The manifest is shown as yaml.
class PluginHelmDetailsManifest extends StatefulWidget {
  const PluginHelmDetailsManifest({
    super.key,
    required this.name,
    required this.manifest,
  });

  final String name;
  final String manifest;

  @override
  State<PluginHelmDetailsManifest> createState() =>
      _PluginHelmDetailsManifestState();
}

class _PluginHelmDetailsManifestState extends State<PluginHelmDetailsManifest> {
  CodeController _codeController = CodeController();

  /// [_init] is called when the widget is initialized. Within the [_init]
  /// function we set the manifest and highlight it as yaml.
  Future<void> _init() async {
    _codeController = CodeController(
      text: widget.manifest,
      language: highlight_yaml.yaml,
    );
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
