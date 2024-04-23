import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:code_text_field/code_text_field.dart';
import 'package:highlight/languages/json.dart' as highlight_json;
import 'package:highlight/languages/yaml.dart' as highlight_yaml;
import 'package:provider/provider.dart';
import 'package:yaml/yaml.dart';

import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/helpers_service.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/utils/themes.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

/// [debugTemplate] returns a template for a debug container in yaml or json
/// format. The template is used to create a new debug container for a pod.
String debugTemplate(String editorFormat) {
  if (editorFormat == 'json') {
    return '''{
  "name": "debugger-${generateRandomString(6)}",
  "image": "busybox",
  "command": [
    "sh"
  ],
  "terminationMessagePolicy": "File",
  "imagePullPolicy": "IfNotPresent",
  "stdin": true,
  "tty": true
}''';
  }

  return '''name: debugger-${generateRandomString(6)}
image: busybox
command:
  - sh
terminationMessagePolicy: File
imagePullPolicy: IfNotPresent
stdin: true
tty: true''';
}

class DetailsDebugPod extends StatefulWidget {
  const DetailsDebugPod({
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
  State<DetailsDebugPod> createState() => _DetailsDebugPodState();
}

class _DetailsDebugPodState extends State<DetailsDebugPod> {
  CodeController _codeController = CodeController();
  bool _isLoading = false;

  /// [_init] is called when the widget is initialized. Within the [_init]
  /// function we set the template for the debug container which should be
  /// created.
  Future<void> _init() async {
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: false,
    );

    _codeController = CodeController(
      text: debugTemplate(appRepository.settings.editorFormat),
      language: appRepository.settings.editorFormat == 'json'
          ? highlight_json.json
          : highlight_yaml.yaml,
    );
  }

  /// [_create] creates a new ephemeral container for the Pod. For that we
  /// create a copy of the [widget.item] and add the new container to the
  /// spec. We then create a json patch and send it to the Kubernetes API
  /// server. When the API call succeeds we display a snackbar with the success
  /// message and close the widget. If the API call fails we only show a
  /// snackbar with the error.
  Future<void> _create() async {
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
      final copy = json.decode(json.encode(widget.item));

      if (copy['spec'].containsKey('ephemeralContainers') &&
          copy['spec']['ephemeralContainers'] != null &&
          copy['spec']['ephemeralContainers'].length > 0) {
        copy['spec']['ephemeralContainers'].add(
          appRepository.settings.editorFormat == 'json'
              ? json.decode(_codeController.text)
              : loadYaml(_codeController.text),
        );
      } else {
        copy['spec']['ephemeralContainers'] = [
          appRepository.settings.editorFormat == 'json'
              ? json.decode(_codeController.text)
              : loadYaml(_codeController.text),
        ];
      }

      final jsonPatch = await HelpersService().createJSONPatch(
        widget.item,
        copy,
      );

      if (jsonPatch == '') {
        throw Exception('Failed to create json patch');
      }

      final jsonPatchBody = jsonPatch.startsWith('[') && jsonPatch.endsWith(']')
          ? jsonPatch
          : '[$jsonPatch]';
      final cluster = await clustersRepository.getClusterWithCredentials(
        clustersRepository.activeClusterId,
      );
      final url =
          '${widget.path}/namespaces/${widget.namespace}/${widget.resource}/${widget.name}/ephemeralcontainers';

      Logger.log(
        'DetailsDebugPodController _create',
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
          'Debug container was created',
          'You can now exec into the debug container.',
        );
        Navigator.pop(context);
      }
    } catch (err) {
      Logger.log(
        'DetailsDebugPodController _create',
        'Failed to create debug container',
        err,
      );
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          'Failed to create debug container',
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
      title: 'Debug',
      subtitle: widget.item['metadata']['name'] ?? '',
      icon: Icons.bug_report,
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Create Debug Container',
      actionPressed: () {
        _create();
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
              enabled: true,
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
