import 'dart:io' show Platform;

import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/themes/nord.dart';
import 'package:get/get.dart';
import 'package:highlight/languages/yaml.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:yaml/yaml.dart';

import 'package:kubenav/controllers/cluster_controller.dart';
import 'package:kubenav/services/helpers_service.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/widgets/app_bottom_sheet_widget.dart';

class DetailsEditResourceController extends GetxController {
  String resource;
  String path;
  String name;
  String? namespace;
  dynamic item;

  ClusterController clusterController = Get.find();
  CodeController? codeController;

  DetailsEditResourceController({
    required this.resource,
    required this.path,
    required this.name,
    required this.namespace,
    required this.item,
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

  /// [prettifyYAML] formats the given resource item as yaml.
  void prettifyYAML() async {
    try {
      final data = await HelpersService().prettifyYAML(item);
      codeController?.text = data;
    } catch (err) {
      Logger.log(
        'DetailsEditResourceController prettifyYAML',
        'An error was returned while prettyfing yaml',
        err,
      );
    }
  }

  /// [save] saves the changes made to the resources manifest file. To apply all the changes made by the user, we have
  /// to create a json patch and send it to the Kubernetes API.
  void save(BuildContext context) async {
    try {
      if (codeController != null) {
        final jsonPatch = await HelpersService().createJSONPatch(
          item,
          loadYaml(codeController!.text),
        );

        if (jsonPatch != "") {
          final jsonPatchBody =
              jsonPatch.startsWith('[') && jsonPatch.endsWith(']')
                  ? jsonPatch
                  : '[$jsonPatch]';

          final cluster = clusterController
              .clusters[clusterController.activeClusterIndex.value].value;

          final url = namespace == null
              ? '$path/$resource/$name'
              : '$path/namespaces/$namespace/$resource/$name';

          Logger.log(
            'DetailsEditResourceController save',
            'Apply json patch for $url',
            jsonPatchBody,
          );

          await KubernetesService(cluster: cluster)
              .patchRequest(url, jsonPatchBody);
          snackbar(
            'Resource was saved',
            namespace == null
                ? 'The changes for the resource $name are saved'
                : 'The changes for the resource $name in namespace $namespace are saved',
          );
        }

        finish(context);
      }
    } catch (err) {
      Logger.log(
        'DetailsEditResourceController save',
        'An error was returned while prettyfing yaml',
        err,
      );
      snackbar('Could not save resource', err.toString());
    }
  }
}

class DetailsEditResourceWidget extends StatelessWidget {
  const DetailsEditResourceWidget({
    Key? key,
    required this.resource,
    required this.path,
    required this.name,
    required this.namespace,
    required this.item,
  }) : super(key: key);

  final String resource;
  final String path;
  final String name;
  final String? namespace;
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    DetailsEditResourceController controller = Get.put(
      DetailsEditResourceController(
        resource: resource,
        path: path,
        name: name,
        namespace: namespace,
        item: item,
      ),
    );

    return AppBottomSheetWidget(
      title: 'Edit',
      subtitle: item['metadata']['name'] ?? '',
      icon: Icons.edit,
      onClosePressed: () {
        finish(context);
      },
      actionText: 'Save',
      onActionPressed: () {
        controller.save(context);
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