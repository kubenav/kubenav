import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:kubenav/controllers/cluster_controller.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/app_bottom_sheet_widget.dart';

class DetailsDeleteResourceController extends GetxController {
  final String resource;
  final String path;
  final String name;
  final String? namespace;

  RxBool force = false.obs;
  ClusterController clusterController = Get.find();

  DetailsDeleteResourceController({
    required this.resource,
    required this.path,
    required this.name,
    required this.namespace,
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

  void toggleForce() => force.value = force.value ? false : true;

  void deleteResource(BuildContext context) async {
    String? body;
    if (force.value) {
      body = '{"gracePeriodSeconds": 0}';
    }

    try {
      final cluster = clusterController
          .clusters[clusterController.activeClusterIndex.value].value;

      final url = namespace == null
          ? '$path/$resource/$name'
          : '$path/namespaces/$namespace/$resource/$name';

      await KubernetesService(cluster: cluster).deleteRequest(url, body);
      snackbar(
          'Resource is deleted',
          namespace == null
              ? 'The resource $name is deleted'
              : 'The resource $name in namespace $namespace is deleted');
    } on PlatformException catch (err) {
      debugPrint('deleteResource error: $err');
      snackbar(
        'Could not delete resource',
        'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}',
      );
    } catch (err) {
      debugPrint('deleteResource error: $err');
      snackbar('Could not delete resource', err.toString());
    }

    finish(context);
  }
}

class DetailsDeleteResourceWidget extends StatelessWidget {
  const DetailsDeleteResourceWidget({
    Key? key,
    required this.resource,
    required this.path,
    required this.name,
    required this.namespace,
  }) : super(key: key);

  final String resource;
  final String path;
  final String name;
  final String? namespace;

  @override
  Widget build(BuildContext context) {
    DetailsDeleteResourceController controller = Get.put(
      DetailsDeleteResourceController(
        resource: resource,
        path: path,
        name: name,
        namespace: namespace,
      ),
    );

    return AppBottomSheetWidget(
      title: 'Delete',
      subtitle: name,
      icon: Icons.delete,
      onClosePressed: () {
        debugPrint('Close show yaml widget buttom sheet');
        finish(context);
      },
      actionText: 'Delete',
      onActionPressed: () {
        debugPrint('Delete resource');
        controller.deleteResource(context);
      },
      child: Form(
        child: ListView(
          shrinkWrap: false,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: namespace != null
                  ? Text(
                      'Do you really want to delete $name in namespace $namespace?')
                  : Text('Do you really want to delete $name?'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Force"),
                  Obx(
                    () => Switch(
                      activeColor: Constants.colorPrimary,
                      onChanged: (val) => controller.toggleForce(),
                      value: controller.force.value,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
