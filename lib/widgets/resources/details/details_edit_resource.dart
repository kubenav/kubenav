import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:code_text_field/code_text_field.dart';
import 'package:flutter_highlight/themes/nord.dart';
import 'package:highlight/languages/json.dart' as highlight_json;
import 'package:highlight/languages/yaml.dart' as highlight_yaml;
import 'package:provider/provider.dart';
import 'package:yaml/yaml.dart';

import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/helpers_service.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

/// The [DetailsEditResource] widget displays the provided [item] in a code
/// editor, so that the user can modify the yaml / json manifest depending on
/// the users settings. When the user has modified the manifest he can save his
/// changes and we create a json patch based on the users modification and make
/// a Kubernetes API call to update the manifest of the resource.
class DetailsEditResource extends StatefulWidget {
  const DetailsEditResource({
    super.key,
    required this.resource,
    required this.path,
    required this.name,
    required this.namespace,
    required this.item,
  });

  final String resource;
  final String path;
  final String name;
  final String? namespace;
  final dynamic item;

  @override
  State<DetailsEditResource> createState() => _DetailsEditResourceState();
}

class _DetailsEditResourceState extends State<DetailsEditResource> {
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
        'DetailsEditResource _init',
        'An error was returned while prettyfing template',
        err,
      );
    }
  }

  /// [_save] creates a json patch based on the users [widget.item]
  /// modifications he made in the code editor. The json patch is then send to
  /// the Kubernetes API server to update the resource. When the API call
  /// succeeds we display a snackbar with the success message and close the
  /// widget. If the API call fails we only show a snackbar with the error.
  Future<void> _save() async {
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: false,
    );
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: false,
    );

    try {
      setState(() {
        _isLoading = true;
      });
      final jsonPatch = await HelpersService().createJSONPatch(
        widget.item,
        appRepository.settings.editorFormat == 'json'
            ? json.decode(_codeController.text)
            : loadYaml(_codeController.text),
      );

      if (jsonPatch != '') {
        final jsonPatchBody =
            jsonPatch.startsWith('[') && jsonPatch.endsWith(']')
                ? jsonPatch
                : '[$jsonPatch]';
        final cluster = await clustersRepository.getClusterWithCredentials(
          clustersRepository.activeClusterId,
        );
        final url = widget.namespace == null
            ? '${widget.path}/${widget.resource}/${widget.name}'
            : '${widget.path}/namespaces/${widget.namespace}/${widget.resource}/${widget.name}';

        Logger.log(
          'DetailsEditResourceController save',
          'Apply json patch for $url',
          jsonPatchBody,
        );

        await KubernetesService(
          cluster: cluster!,
          proxy: appRepository.settings.proxy,
          timeout: appRepository.settings.timeout,
        ).patchRequest(url, jsonPatchBody);

        setState(() {
          _isLoading = false;
        });
        if (mounted) {
          showSnackbar(
            context,
            'Resource was saved',
            widget.namespace == null
                ? 'The changes for the resource ${widget.name} are saved'
                : 'The changes for the resource ${widget.name} in namespace ${widget.namespace} are saved',
          );
          Navigator.pop(context);
        }
      }
    } catch (err) {
      Logger.log(
        'DetailsEditResourceController save',
        'An error was returned while prettyfing yaml',
        err,
      );
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          'Could not save resource',
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
    return AppBottomSheetWidget(
      title: 'Edit',
      subtitle: widget.item['metadata']['name'] ?? '',
      icon: Icons.edit,
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Save',
      actionPressed: () {
        _save();
      },
      actionIsLoading: _isLoading,
      child: Form(
        child: ListView(
          shrinkWrap: false,
          physics: const ClampingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              child: CodeTheme(
                data: const CodeThemeData(styles: nordTheme),
                child: CodeField(
                  controller: _codeController,
                  enabled: true,
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
