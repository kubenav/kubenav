import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:kubenav/controllers/cluster_controller.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/widgets/app_bottom_sheet_widget.dart';

class DetailsScaleResourceController extends GetxController {
  final String resource;
  final String path;
  final String name;
  final String namespace;
  final dynamic item;

  ClusterController clusterController = Get.find();
  final scaleFormKey = GlobalKey<FormState>();
  final replicas = TextEditingController();

  DetailsScaleResourceController({
    required this.resource,
    required this.path,
    required this.name,
    required this.namespace,
    required this.item,
  });

  @override
  void onInit() {
    replicas.text = item['spec'] != null && item['spec']['replicas'] != null
        ? '${item['spec']['replicas']}'
        : '0';

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

  /// [validator] is used to validate the required field [replicas]. If the value is empty or not a number the
  /// validation fails.
  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    final parsedValue = int.tryParse(value);
    if (parsedValue == null) {
      return 'The field must be a number';
    }

    if (parsedValue < 0) {
      return 'The field must be a positive number';
    }

    return null;
  }

  void scaleResource(BuildContext context) async {
    if (scaleFormKey.currentState != null &&
        scaleFormKey.currentState!.validate()) {
      try {
        final newReplicas = int.parse(replicas.text);

        final cluster = clusterController
            .clusters[clusterController.activeClusterIndex.value].value;

        final url = '$path/namespaces/$namespace/$resource/$name';

        await KubernetesService(cluster: cluster).patchRequest(url,
            '[{"op": "replace", "path": "/spec/replicas", "value": $newReplicas}]');
        snackbar(
          'Resource is scaled',
          'The resource $name in namespace $namespace is scaled',
        );
      } on PlatformException catch (err) {
        Logger.log(
          'DetailsScaleResourceController scaleResource',
          'An error was returned while scaling the resource',
          'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}',
        );
        snackbar(
          'Could not scale resource',
          'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}',
        );
      } catch (err) {
        Logger.log(
          'DetailsScaleResourceController scaleResource',
          'An error was returned while scaling the resource',
          err,
        );
        snackbar('Could not scale resource', err.toString());
      }

      finish(context);
    }
  }
}

class DetailsScaleResourceWidget extends StatelessWidget {
  const DetailsScaleResourceWidget({
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
  final String namespace;
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    DetailsScaleResourceController controller = Get.put(
      DetailsScaleResourceController(
        resource: resource,
        path: path,
        name: name,
        namespace: namespace,
        item: item,
      ),
    );

    return AppBottomSheetWidget(
      title: 'Scale',
      subtitle: name,
      icon: Icons.difference,
      onClosePressed: () {
        finish(context);
      },
      actionText: 'Scale',
      onActionPressed: () {
        controller.scaleResource(context);
      },
      child: Form(
        key: controller.scaleFormKey,
        child: ListView(
          shrinkWrap: false,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: Text(
                  'Change the number of replicas for $name in namespace $namespace:'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
                controller: controller.replicas,
                keyboardType: TextInputType.number,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Replicas',
                ),
                validator: controller.validator,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
