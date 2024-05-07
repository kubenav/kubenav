import 'dart:convert';

import 'package:flutter/foundation.dart';
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
import 'package:kubenav/widgets/resources/resources/resources.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

/// The [PrepareJSONPatchData] class is used to prepare the data for the JSON
/// patch via the [_prepareJSONPatch] function.
class PrepareJSONPatchData {
  Resource resource;
  String editorFormat;
  dynamic source;
  dynamic target;

  PrepareJSONPatchData({
    required this.resource,
    required this.editorFormat,
    required this.source,
    required this.target,
  });
}

/// The [_prepareJSONPatch] function is used to prepare the source and target
/// string for the [HelpersService.createJSONPatch] function. We do this in an
/// additional function so this can be run in an isolate.
List<String> _prepareJSONPatch(PrepareJSONPatchData data) {
  final source = data.resource.encodeItem(data.source);
  final target = data.editorFormat == 'json'
      ? data.target
      : json.encode(loadYaml(data.target));

  return [source, target];
}

/// The [EditResource] widget is used to edit the provided [item]. The user can
/// edit the manifest in a [CodeField] widget and save the changes. The changes
/// are saved by creating a JSON Patch and applying the patch to the resource.
class EditResource extends StatefulWidget {
  const EditResource({
    super.key,
    required this.name,
    required this.namespace,
    required this.item,
    required this.resource,
  });

  final String name;
  final String? namespace;
  final dynamic item;
  final Resource resource;

  @override
  State<EditResource> createState() => _EditResourceState();
}

class _EditResourceState extends State<EditResource> {
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
      final jsonStr = await compute(widget.resource.encodeItem, widget.item);

      if (appRepository.settings.editorFormat == 'json') {
        _codeController.text = jsonStr;
      } else {
        final data = await HelpersService().prettifyYAML(jsonStr);
        _codeController.text = data;
      }
    } catch (err) {
      Logger.log(
        'EditResource _init',
        'Encoding Failed',
        err,
      );
    }
  }

  /// [_save] is used to save the changes of the manifest. The changes are saved
  /// by creating a JSON Patch and applying the patch to the resource. The user
  /// gets a snackbar message if the saving was successful or failed.
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

      final prepared = await compute(
        _prepareJSONPatch,
        PrepareJSONPatchData(
          resource: widget.resource,
          editorFormat: appRepository.settings.editorFormat,
          source: widget.item,
          target: _codeController.text,
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
      final url = widget.namespace == null
          ? '${widget.resource.path}/${widget.resource.resource}/${widget.name}'
          : '${widget.resource.path}/namespaces/${widget.namespace}/${widget.resource.resource}/${widget.name}';

      Logger.log(
        'EditResource _save',
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
          '${widget.resource.singular} Saved',
          widget.namespace == null
              ? 'The ${widget.resource.singular} ${widget.name} was saved'
              : 'The ${widget.resource.singular} ${widget.namespace}/${widget.name} was saved',
        );
        Navigator.pop(context);
      }
    } catch (err) {
      Logger.log(
        'EditResource _save',
        'Failed to Save ${widget.resource.singular}',
        err,
      );
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          'Failed to Save ${widget.resource.singular}',
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
      subtitle: widget.namespace == null
          ? widget.name
          : '${widget.namespace}/${widget.name}',
      icon: Icons.edit,
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Save',
      actionPressed: () {
        _save();
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
