import 'dart:convert';
import 'dart:io' show Platform;

import 'package:code_text_field/code_text_field.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlight/themes/nord.dart';
import 'package:highlight/languages/yaml.dart';
import 'package:yaml/yaml.dart';

import 'package:kubenav/controllers/cluster_controller.dart';
import 'package:kubenav/services/helpers_service.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/widgets/app_bottom_sheet_widget.dart';

class ListCreateResourceController extends GetxController {
  final String resource;
  final String path;
  final String template;

  ClusterController clusterController = Get.find();
  CodeController? codeController;

  ListCreateResourceController({
    required this.resource,
    required this.path,
    required this.template,
  });

  @override
  void onInit() {
    codeController = CodeController(
      text: '',
      language: yaml,
      theme: nordTheme,
    );
    prettifyYAML();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  /// [prettifyYAML] formats the given resource template as yaml.
  void prettifyYAML() async {
    try {
      final data = await HelpersService().prettifyYAML(template);
      codeController?.text = data;
    } catch (err) {
      Logger.log(
        'DetailsEditResourceController prettifyYAML',
        'An error was returned while prettyfing yaml',
        err,
      );
    }
  }

  /// [createResource] creates the given resource with the manifest provided by a user.
  void createResource(BuildContext context) async {
    try {
      final manifest = loadYaml(codeController!.text);
      final name =
          manifest['metadata'] != null && manifest['metadata']['name'] != null
              ? manifest['metadata']['name']
              : '';
      final namespace = manifest['metadata'] != null &&
              manifest['metadata']['namespace'] != null
          ? manifest['metadata']['namespace']
          : '';

      final cluster = clusterController
          .clusters[clusterController.activeClusterIndex.value].value;

      final url =
          '$path${namespace != null && namespace != '' ? '/namespaces/$namespace' : ''}/$resource';

      Logger.log(
        'ListCreateResourceController createResource',
        'Try to create resource $resource at path $path',
        'Url: $url Manifest: $manifest',
      );
      await KubernetesService(cluster: cluster)
          .postRequest(url, jsonEncode(manifest));
      snackbar(
        'Resource was created',
        namespace != null && namespace != ''
            ? 'The resource $name in namespace $namespace was created'
            : 'The resource $name was created',
      );
      finish(context);
    } on PlatformException catch (err) {
      Logger.log(
        'ListCreateResourceController createResource',
        'An error was returned while creating the resource',
        'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}',
      );
      snackbar(
        'Could not create resource',
        'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}',
      );
    } catch (err) {
      Logger.log(
        'ListCreateResourceController createResource',
        'An error was returned while creating the resource',
        err,
      );
      snackbar('Could not create resource', err.toString());
    }
  }
}

class ListCreateResourceWidget extends StatelessWidget {
  const ListCreateResourceWidget({
    Key? key,
    required this.title,
    required this.resource,
    required this.path,
    required this.template,
  }) : super(key: key);

  final String title;
  final String resource;
  final String path;
  final String template;

  @override
  Widget build(BuildContext context) {
    ListCreateResourceController controller = Get.put(
      ListCreateResourceController(
        resource: resource,
        path: path,
        template: template,
      ),
    );

    return AppBottomSheetWidget(
      title: 'Create',
      subtitle: title,
      icon: Icons.create,
      onClosePressed: () {
        finish(context);
      },
      actionText: 'Create',
      onActionPressed: () {
        controller.createResource(context);
      },
      child: Form(
        child: ListView(
          shrinkWrap: false,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              child: CodeField(
                controller: controller.codeController!,
                enabled: true,
                textStyle: TextStyle(
                  fontSize: 14,
                  fontFamily: Platform.isIOS ? 'Courier' : 'monospace',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
