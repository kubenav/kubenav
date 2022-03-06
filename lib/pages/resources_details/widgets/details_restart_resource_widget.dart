import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:kubenav/controllers/cluster_controller.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/widgets/app_bottom_sheet_widget.dart';

class DetailsRestartResourceController extends GetxController {
  final String resource;
  final String path;
  final String name;
  final String namespace;
  final dynamic item;

  ClusterController clusterController = Get.find();

  DetailsRestartResourceController({
    required this.resource,
    required this.path,
    required this.name,
    required this.namespace,
    required this.item,
  });

  @override
  void onInit() {
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

  void restartResource(BuildContext context) async {
    try {
      final now = DateTime.now().toIso8601String();
      final String body = item['spec'] != null &&
              item['spec']['template'] != null &&
              item['spec']['template']['metadata'] != null &&
              item['spec']['template']['metadata']['annotations'] != null &&
              item['spec']['template']['metadata']['annotations']
                      ['kubenav.io/restartedAt'] !=
                  null
          ? '[{"op": "replace", "path": "/spec/template/metadata/annotations/kubenav.io~1restartedAt", "value": "$now"}]'
          : '[{"op": "add", "path": "/spec/template/metadata/annotations/kubenav.io~1restartedAt", "value": "$now"}]';

      final cluster = clusterController
          .clusters[clusterController.activeClusterIndex.value].value;

      final url = '$path/namespaces/$namespace/$resource/$name';

      await KubernetesService(cluster: cluster).patchRequest(url, body);
      snackbar(
        'Resource is restarted',
        'The resource $name in namespace $namespace is restarted',
      );
    } on PlatformException catch (err) {
      Logger.log(
        'DetailsRestartResourceController restartResource',
        'An error was returned while restarting the resource',
        'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}',
      );
      snackbar(
        'Could not restart resource',
        'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}',
      );
    } catch (err) {
      Logger.log(
        'DetailsRestartResourceController restartResource',
        'An error was returned while restarting the resource',
        err,
      );
      snackbar('Could not restart resource', err.toString());
    }

    finish(context);
  }
}

class DetailsRestartResourceWidget extends StatelessWidget {
  const DetailsRestartResourceWidget({
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
    DetailsRestartResourceController controller = Get.put(
      DetailsRestartResourceController(
        resource: resource,
        path: path,
        name: name,
        namespace: namespace,
        item: item,
      ),
    );

    return AppBottomSheetWidget(
      title: 'Restart',
      subtitle: name,
      icon: Icons.restart_alt,
      onClosePressed: () {
        finish(context);
      },
      actionText: 'Restart',
      onActionPressed: () {
        controller.restartResource(context);
      },
      child: Form(
        child: ListView(
          shrinkWrap: false,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: Text(
                  'Do you really want to restart $name in namespace $namespace?'),
            ),
          ],
        ),
      ),
    );
  }
}
