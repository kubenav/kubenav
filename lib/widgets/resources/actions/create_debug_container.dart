import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:code_text_field/code_text_field.dart';
import 'package:highlight/languages/json.dart' as highlight_json;
import 'package:highlight/languages/yaml.dart' as highlight_yaml;
import 'package:provider/provider.dart';
import 'package:yaml/yaml.dart';

import 'package:kubenav/models/kubernetes/schema.models.swagger.dart';
import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/helpers_service.dart';
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

/// The [PrepareJSONPatchData] class is used to prepare the data for the JSON
/// patch via the [_prepareJSONPatch] function.
class PrepareJSONPatchData {
  IoK8sApiCoreV1Pod pod;
  String editorFormat;
  String ephemeralContainer;

  PrepareJSONPatchData({
    required this.pod,
    required this.editorFormat,
    required this.ephemeralContainer,
  });
}

/// The [_prepareJSONPatch] function is used to prepare the source and target
/// string for the [HelpersService.createJSONPatch] function. We do this in an
/// additional function so this can be run in an isolate.
List<String> _prepareJSONPatch(PrepareJSONPatchData data) {
  final copy = IoK8sApiCoreV1Pod.fromJson(resourcePod.toJson(data.pod));
  final ephemeralContainer = data.editorFormat == 'json'
      ? IoK8sApiCoreV1EphemeralContainer.fromJson(
          json.decode(data.ephemeralContainer),
        )
      : IoK8sApiCoreV1EphemeralContainer.fromJson(
          json.decode(json.encode(loadYaml(data.ephemeralContainer))),
        );

  if (copy.spec!.ephemeralContainers == null) {
    copy.spec!.copyWith(ephemeralContainers: [ephemeralContainer]);
  } else {
    copy.spec!.ephemeralContainers!.add(ephemeralContainer);
  }

  final source = resourcePod.encodeItem(data.pod);
  final target = resourcePod.encodeItem(copy);
  return [source, target];
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

      final prepared = await compute(
        _prepareJSONPatch,
        PrepareJSONPatchData(
          pod: widget.pod,
          editorFormat: appRepository.settings.editorFormat,
          ephemeralContainer: _codeController.text,
        ),
      );
      final jsonPatch = await HelpersService().createJSONPatch(
        prepared[0],
        prepared[1],
      );

      if (jsonPatch == '') {
        throw Exception('Failed to Create JSON Patch');
      }

      final jsonPatchBody = jsonPatch.startsWith('[') && jsonPatch.endsWith(']')
          ? jsonPatch
          : '[$jsonPatch]';
      final cluster = await clustersRepository.getClusterWithCredentials(
        clustersRepository.activeClusterId,
      );
      final url =
          '${resourcePod.path}/namespaces/${widget.namespace}/${resourcePod.resource}/${widget.name}/ephemeralcontainers';

      Logger.log(
        'CreateDebugContainer _create',
        'Apply JSON Patch for $url',
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
