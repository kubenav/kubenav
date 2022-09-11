import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';
import 'package:xterm/theme/terminal_theme.dart';
import 'package:xterm/xterm.dart' as xterm;

import 'package:kubenav/controllers/cluster_controller.dart';
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
    if (terminalFormKey.currentState != null &&
        terminalFormKey.currentState!.validate()) {
      try {
        final cluster = clusterController
            .clusters[clusterController.activeClusterIndex.value].value;

        final isStarted =
            await KubernetesService(cluster: cluster).startServer();
        if (isStarted) {
          Logger.log(
            'DetailsTerminalController getTerminal',
            'Internal http server is started and healthy, try to create terminal',
          );

          final channel = IOWebSocketChannel.connect(
            'ws://localhost:14122/terminal?name=${item['metadata']['name']}&namespace=${item['metadata']['namespace']}&container=${container.value}&shell=$shell',
            headers: <String, String>{
              'X-CLUSTER-SERVER': cluster.clusterServer,
              'X-CLUSTER-CERTIFICATE-AUTHORITY-DATA':
                  cluster.clusterCertificateAuthorityData,
              'X-CLUSTER-INSECURE-SKIP-TLS-VERIFY':
                  '${cluster.clusterInsecureSkipTLSVerify}',
              'X-USER-CLIENT-CERTIFICATE-DATA':
                  cluster.userClientCertificateData,
              'X-USER-CLIENT-KEY-DATA': cluster.userClientKeyData,
              'X-USER-TOKEN': cluster.userToken,
              'X-USER-USERNAME': cluster.userUsername,
              'X-USER-PASSWORD': cluster.userPassword,
            },
          );

          TerminalBackend backend = TerminalBackend(channel: channel);
          xterm.Terminal terminal = xterm.Terminal(
            backend: backend,
            maxLines: 10000,
            theme: const TerminalTheme(
              cursor: 0xffd8dee9,
              selection: 0xff434c5ecc,
              foreground: 0xffd8dee9,
              background: 0xff2e3440,
              black: 0xff3b4251,
              red: 0xffbf6069,
              green: 0xffa3be8b,
              yellow: 0xffeacb8a,
              blue: 0xff81a1c1,
              magenta: 0xffb48dac,
              cyan: 0xff88c0d0,
              white: 0xffe5e9f0,
              brightBlack: 0xff4c556a,
              brightRed: 0xffbf6069,
              brightGreen: 0xffa3be8b,
              brightYellow: 0xffeacb8a,
              brightBlue: 0xff81a1c1,
              brightMagenta: 0xffb48dac,
              brightCyan: 0xff8fbcbb,
              brightWhite: 0xffeceef4,
              searchHitBackground: 0xffeacb8a,
              searchHitBackgroundCurrent: 0xffeacb8a,
              searchHitForeground: 0xff2e3440,
            ),
          );

          terminalController.addTerminal(
            TerminalType.exec,
            container.value,
            null,
            terminal,
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
        controller.getTerminal();
        finish(context);
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
