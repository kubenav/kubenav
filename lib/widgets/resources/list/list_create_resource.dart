import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

/// The [ListCreateResource] widget can be used to create a new [resource] under
/// the provided [path]. When a [template] is provided, the template will be
/// displayed in the code editor. The template can then be modified by the user
/// and is then used to create the resource.
class ListCreateResource extends StatefulWidget {
  const ListCreateResource({
    super.key,
    required this.title,
    required this.resource,
    required this.path,
    required this.template,
  });

  final String title;
  final String resource;
  final String path;
  final String template;

  @override
  State<ListCreateResource> createState() => _ListCreateResourceState();
}

class _ListCreateResourceState extends State<ListCreateResource> {
  CodeController _codeController = CodeController();
  bool _isLoading = false;

  /// [_init] is called when the widget is initialized. Within the [_init]
  /// function we prettify the provided [widget.template] and convert it to
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
      final parsedTemplate = json.decode(widget.template);

      if (appRepository.settings.editorFormat == 'json') {
        JsonEncoder encoder = const JsonEncoder.withIndent('  ');
        _codeController.text = encoder.convert(parsedTemplate);
      } else {
        final data = await HelpersService().prettifyYAML(parsedTemplate);
        _codeController.text = data;
      }
    } catch (err) {
      Logger.log(
        'ListCreateResource _init',
        'An error was returned while prettyfing template',
        err,
      );
    }
  }

  /// [_createResource] creates the resources, which was defined by the user via
  /// the code editor. To create the resource we have to extract the name and
  /// namespace of the resource from the user defined template. Then we run a
  /// post request against the Kubernetes API to create the resource. If the API
  /// call returns successfully we pop the widget from the stack and show an
  /// success message. In case of an error we just show a snackbar with the
  /// error message and keep the widget open.
  Future<void> _createResource() async {
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

      final cluster = await clustersRepository.getClusterWithCredentials(
        clustersRepository.activeClusterId,
      );
      final manifest = appRepository.settings.editorFormat == 'json'
          ? json.decode(_codeController.text)
          : loadYaml(_codeController.text);
      final name =
          manifest['metadata'] != null && manifest['metadata']['name'] != null
              ? manifest['metadata']['name']
              : '';
      final namespace = manifest['metadata'] != null &&
              manifest['metadata']['namespace'] != null
          ? manifest['metadata']['namespace']
          : '';
      final url =
          '${widget.path}${namespace != null && namespace != '' ? '/namespaces/$namespace' : ''}/${widget.resource}';

      Logger.log(
        'ListCreateResource _createResource',
        'Try to create resource ${widget.resource} at path ${widget.path}',
        'Url: $url Manifest: $manifest',
      );

      await KubernetesService(
        cluster: cluster!,
        proxy: appRepository.settings.proxy,
        timeout: appRepository.settings.timeout,
      ).postRequest(url, jsonEncode(manifest));

      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          'Resource was created',
          namespace != null && namespace != ''
              ? 'The resource $name in namespace $namespace was created'
              : 'The resource $name was created',
        );
        Navigator.pop(context);
      }
    } on PlatformException catch (err) {
      Logger.log(
        'ListCreateResource _createResource',
        'An error was returned while creating the resource',
        'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}',
      );
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          'Could not create resource',
          'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}',
        );
      }
    } catch (err) {
      Logger.log(
        'ListCreateResource _createResource',
        'An error was returned while creating the resource',
        err,
      );
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          'Could not create resource',
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
      title: 'Create',
      subtitle: widget.title,
      icon: Icons.create,
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Create',
      actionPressed: () {
        _createResource();
      },
      actionIsLoading: _isLoading,
      child: Form(
        child: ListView(
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
