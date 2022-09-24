import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';

import 'package:kubenav/controllers/cluster_controller.dart';
import 'package:kubenav/controllers/global_settings_controller.dart';
import 'package:kubenav/controllers/terminal_controller.dart';
import 'package:kubenav/models/terminal_model.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/terminal_backend.dart';
import 'package:kubenav/widgets/app_bottom_sheet_widget.dart';

class DetailsTerminalController extends GetxController {
  final String name;
  final String namespace;
  final dynamic item;

  GlobalSettingsController globalSettingsController = Get.find();
  ClusterController clusterController = Get.find();
  TerminalController terminalController = Get.find();

  final terminalFormKey = GlobalKey<FormState>();
  RxString container = ''.obs;
  RxList<String> containers = <String>[''].obs;
  RxString shell = 'sh'.obs;

  DetailsTerminalController({
    required this.name,
    required this.namespace,
    required this.item,
  });

  @override
  void onInit() {
    List<String> tmpContainers = [];

    if (item['spec'] != null) {
      if (item['spec']['initContainers'] != null) {
        for (var initContainer in item['spec']['initContainers']) {
          tmpContainers.add(initContainer['name']);
        }
      }

      if (item['spec']['containers'] != null) {
        for (var container in item['spec']['containers']) {
          tmpContainers.add(container['name']);
        }
      }
    }

    if (tmpContainers.isNotEmpty) {
      containers.value = tmpContainers;
      container.value = tmpContainers[0];
    }

    super.onInit();
  }

  void getTerminal() async {
    try {
      snackbar(
        'Terminal',
        'Terminal is created ...',
      );
      final cluster = clusterController
          .clusters[clusterController.activeClusterIndex.value].value;

      final isStarted = await KubernetesService(cluster: cluster).startServer();
      if (isStarted) {
        Logger.log(
          'DetailsTerminalController getTerminal',
          'Internal http server is started and healthy, try to create terminal',
        );

        final channel = IOWebSocketChannel.connect(
          'ws://localhost:14122/terminal?name=${item['metadata']['name']}&namespace=${item['metadata']['namespace']}&container=${container.value}&shell=$shell',
          headers: <String, dynamic>{
            'X-CONTEXT-NAME': cluster.name,
            'X-CLUSTER-SERVER': cluster.clusterServer,
            'X-CLUSTER-CERTIFICATE-AUTHORITY-DATA':
                cluster.clusterCertificateAuthorityData,
            'X-CLUSTER-INSECURE-SKIP-TLS-VERIFY':
                '${cluster.clusterInsecureSkipTLSVerify}',
            'X-USER-CLIENT-CERTIFICATE-DATA': cluster.userClientCertificateData,
            'X-USER-CLIENT-KEY-DATA': cluster.userClientKeyData,
            'X-USER-TOKEN': cluster.userToken,
            'X-USER-USERNAME': cluster.userUsername,
            'X-USER-PASSWORD': cluster.userPassword,
            'X-PROXY': globalSettingsController.proxy.value,
            'X-TIMEOUT': globalSettingsController.timeout.value,
          },
        );

        terminalController.addTerminal(
          TerminalType.exec,
          container.value,
          null,
          TerminalBackend(channel),
        );
      } else {
        snackbar(
          'Could not create terminal',
          'The internal http server is unhealthy',
        );
      }
    } on PlatformException catch (err) {
      Logger.log(
        'DetailsTerminalController getLogs',
        'An error was returned while getting the logs',
        'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}',
      );
      snackbar(
        'Could not get logs',
        'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}',
      );
    } catch (err) {
      Logger.log(
        'An error was returned while getting the logs',
        'An error was returned while scaling the resource',
        err,
      );
      snackbar('Could not get logs', err.toString());
    }
  }
}

class DetailsTerminalWidget extends StatelessWidget {
  const DetailsTerminalWidget({
    Key? key,
    required this.name,
    required this.namespace,
    required this.item,
  }) : super(key: key);

  final String name;
  final String namespace;
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    DetailsTerminalController controller = Get.put(
      DetailsTerminalController(
        name: name,
        namespace: namespace,
        item: item,
      ),
    );

    return AppBottomSheetWidget(
      title: 'Terminal',
      subtitle: name,
      icon: Icons.terminal,
      onClosePressed: () {
        finish(context);
      },
      actionText: 'Get Terminal',
      onActionPressed: () {
        if (controller.terminalFormKey.currentState != null &&
            controller.terminalFormKey.currentState!.validate()) {
          controller.getTerminal();
          finish(context);
        }
      },
      child: Form(
        key: controller.terminalFormKey,
        child: ListView(
          shrinkWrap: false,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Container'),
                  Obx(
                    () => DropdownButton(
                      value: controller.container.value,
                      underline: Container(
                        height: 2,
                        color: Constants.colorPrimary,
                      ),
                      onChanged: (String? newValue) {
                        controller.container.value = newValue ?? '';
                      },
                      items: controller.containers.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .color,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Shell'),
                  Obx(
                    () => DropdownButton(
                      value: controller.shell.value,
                      underline: Container(
                        height: 2,
                        color: Constants.colorPrimary,
                      ),
                      onChanged: (String? newValue) {
                        controller.shell.value = newValue ?? 'sh';
                      },
                      items: [
                        'sh',
                        'bash',
                        'pwsh',
                        'cmd',
                      ].map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .color,
                            ),
                          ),
                        );
                      }).toList(),
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
