import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:code_text_field/code_text_field.dart';
import 'package:highlight/languages/json.dart' as highlight_json;
import 'package:highlight/languages/yaml.dart' as highlight_yaml;
import 'package:provider/provider.dart';
import 'package:yaml/yaml.dart';

import 'package:kubenav/models/kubernetes/schema.models.swagger.dart';
import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/utils/themes.dart';
import 'package:kubenav/widgets/resources/resources/resources_pods.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

/// [_debugTemplate] returns a template for a debug container in yaml or json
/// format. The template is used to create a new debug container for a pod.
String _debugTemplate(String editorFormat) {
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

/// [_Name] is a helper class to create the strategic merge patch for adding
/// an ephemeral container to a Pod. It is used to set the order of the
/// ephemeral containers within the Pod spec.
class _Name {
  String name;

  _Name({required this.name});

  Map<String, dynamic> toJson() => {'name': name};
}

class CreateDebugContainer extends StatefulWidget {
  const CreateDebugContainer({
    super.key,
    required this.name,
    required this.namespace,
    required this.pod,
  });

  final String name;
  final String namespace;
  final IoK8sApiCoreV1Pod pod;

  @override
  State<CreateDebugContainer> createState() => _CreateDebugContainerState();
}

class _CreateDebugContainerState extends State<CreateDebugContainer> {
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
      text: _debugTemplate(appRepository.settings.editorFormat),
      language: appRepository.settings.editorFormat == 'json'
          ? highlight_json.json
          : highlight_yaml.yaml,
    );
  }

  /// [_create] creates a new ephemeral container for the Pod. For that we
  /// create a strategic merge patch. The json patch is then send to the
  /// Kubernetes API server. When the API call succeeds we display a snackbar
  /// with the success message and close the widget. If the API call fails we
  /// only show a snackbar with the error.
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

      final ephemeralContainer = appRepository.settings.editorFormat == 'json'
          ? json.decode(_codeController.text)
          : json.decode(json.encode(loadYaml(_codeController.text)));
      final names =
          widget.pod.spec?.ephemeralContainers
              ?.map((e) => _Name(name: e.name))
              .toList() ??
          [];
      names.add(_Name(name: ephemeralContainer['name']));

      final String body =
          widget.pod.spec?.ephemeralContainers == null ||
              widget.pod.spec!.ephemeralContainers!.isEmpty
          ? '{"spec":{"ephemeralContainers":[${json.encode(ephemeralContainer)}]}}'
          : '{"spec":{"\$setElementOrder/ephemeralContainers":[${names.map((e) => json.encode(e.toJson())).join(',')}],"ephemeralContainers":[${json.encode(ephemeralContainer)}]}}';

      final cluster = await clustersRepository.getClusterWithCredentials(
        clustersRepository.activeClusterId,
      );
      final url =
          '${resourcePod.path}/namespaces/${widget.namespace}/${resourcePod.resource}/${widget.name}/ephemeralcontainers';

      Logger.log(
        'CreateDebugContainer _create',
        'Apply Strategic Merge Patch for $url',
        body,
      );

      await KubernetesService(
        cluster: cluster!,
        proxy: appRepository.settings.proxy,
        timeout: appRepository.settings.timeout,
      ).patchRequest(PatchType.strategicMergePatch, url, body);

      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          'Debug Container was Created',
          'The debug container was created, you can now exec into the newly created debug container.',
        );
        Navigator.pop(context);
      }
    } catch (err) {
      Logger.log(
        'CreateDebugContainer _create',
        'Failed to Create Debug Container',
        err,
      );
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          'Failed to Create Debug Container',
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
      subtitle: '${widget.namespace}/${widget.name}',
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
