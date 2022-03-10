import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'package:kubenav/controllers/cluster_controller.dart';
import 'package:kubenav/controllers/terminal_controller.dart';
import 'package:kubenav/models/terminal_model.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/widgets/app_bottom_sheet_widget.dart';

Map<String, int> sinceOptions = {
  '5 Minutes': 300,
  '15 Minutes': 900,
  '30 Minutes': 1800,
  '1 Hour': 3600,
  '3 Hours': 10800,
  '6 Hours': 21600,
  '12 Hours': 43200,
  '1 Day': 86400,
  '2 Days': 172800,
  '7 Days': 604800,
};

class DetailsGetLogsController extends GetxController {
  final String name;
  final String namespace;
  final dynamic item;

  ClusterController clusterController = Get.find();
  TerminalController terminalController = Get.find();

  final logsFormKey = GlobalKey<FormState>();
  RxString container = ''.obs;
  RxList<String> containers = <String>[''].obs;
  RxString since = '5 Minutes'.obs;
  final filter = TextEditingController();
  RxBool previous = false.obs;

  DetailsGetLogsController({
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

  void getLogs(BuildContext context) async {
    if (logsFormKey.currentState != null &&
        logsFormKey.currentState!.validate()) {
      try {
        final cluster = clusterController
            .clusters[clusterController.activeClusterIndex.value].value;

        final logs = await KubernetesService(cluster: cluster).getLogs(
          item['metadata']['name'],
          item['metadata']['namespace'],
          container.value,
          sinceOptions[since.value]!,
          filter.text,
          previous.value,
        );

        Logger.log(
          'DetailsGetLogsController getLogs',
          'The get logs request returned ${logs.length} log lines',
          logs,
        );

        finish(context);
        terminalController.addTerminal(
          TerminalType.log,
          container.value,
          logs,
        );
      } on PlatformException catch (err) {
        Logger.log(
          'DetailsGetLogsController getLogs',
          'An error was returned while getting the logs',
          'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}',
        );
        snackbar(
          'Could not get logs',
          'Code: ${err.code}\nMessage: ${err.message}\nDetails: ${err.details.toString()}',
        );
        finish(context);
      } catch (err) {
        Logger.log(
          'An error was returned while getting the logs',
          'An error was returned while scaling the resource',
          err,
        );
        snackbar('Could not get logs', err.toString());
        finish(context);
      }
    } else {
      finish(context);
    }
  }
}

class DetailsGetLogsWidget extends StatelessWidget {
  const DetailsGetLogsWidget({
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
    DetailsGetLogsController controller = Get.put(
      DetailsGetLogsController(
        name: name,
        namespace: namespace,
        item: item,
      ),
    );

    return AppBottomSheetWidget(
      title: 'Logs',
      subtitle: name,
      icon: Icons.subject,
      onClosePressed: () {
        finish(context);
      },
      actionText: 'Get Logs',
      onActionPressed: () {
        controller.getLogs(context);
      },
      child: Form(
        key: controller.logsFormKey,
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
                  const Text("Container"),
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
                          child: Text(value),
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
                  const Text("Container"),
                  Obx(
                    () => DropdownButton(
                      value: controller.since.value,
                      underline: Container(
                        height: 2,
                        color: Constants.colorPrimary,
                      ),
                      onChanged: (String? newValue) {
                        controller.since.value = newValue ?? '';
                      },
                      items: [
                        '5 Minutes',
                        '15 Minutes',
                        '30 Minutes',
                        '1 Hour',
                        '3 Hours',
                        '6 Hours',
                        '12 Hours',
                        '1 Day',
                        '2 Days',
                        '7 Days',
                      ].map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
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
              child: TextFormField(
                controller: controller.filter,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Filter',
                ),
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
                  const Text("Previous"),
                  Obx(
                    () => Switch(
                      activeColor: Constants.colorPrimary,
                      onChanged: (val) => controller.previous.value =
                          !controller.previous.value,
                      value: controller.previous.value,
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
