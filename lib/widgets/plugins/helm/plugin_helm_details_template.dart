import 'package:flutter/material.dart';

import 'package:code_text_field/code_text_field.dart';

import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/themes.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

/// The [PluginHelmDetailsTemplate] widget can be used to render a template file
/// from a Helm chart in a modal bottom sheet. The template will be rendered in
/// a code editor.
class PluginHelmDetailsTemplate extends StatefulWidget {
  const PluginHelmDetailsTemplate({
    super.key,
    required this.name,
    required this.template,
  });

  final String name;
  final String template;

  @override
  State<PluginHelmDetailsTemplate> createState() =>
      _PluginHelmDetailsTemplateState();
}

class _PluginHelmDetailsTemplateState extends State<PluginHelmDetailsTemplate> {
  CodeController _codeController = CodeController();

  @override
  void initState() {
    super.initState();
    _codeController = CodeController(text: widget.template);
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: 'Template',
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
