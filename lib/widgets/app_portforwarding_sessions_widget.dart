import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'package:kubenav/controllers/cluster_controller.dart';
import 'package:kubenav/controllers/portforwarding_controller.dart';
import 'package:kubenav/models/portforwarding_session_model.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/widgets/app_actions_widget.dart';

class AppPortForwardingSessionsController extends GetxController {
  PortForwardingController portForwardingController = Get.find();
  ClusterController clusterController = Get.find();

  @override
  void onInit() {
    getSessionFromServer();

    super.onInit();
  }

  void getSessionFromServer() async {
    try {
      final cluster = clusterController
          .clusters[clusterController.activeClusterIndex.value].value;

      final result =
          await KubernetesService(cluster: cluster).getPortForwardingSession();
      Logger.log(
        'AppPortForwardingSessionsController getSessionFromServer',
        'The server returned ${result['sessions'].length} session',
        result['sessions'],
      );

      final List<PortForwardingSession> newSessions = [];
      for (var session in result['sessions']) {
        newSessions.add(PortForwardingSession.fromJson(session));
      }
      print("SET SESSIONS");
      portForwardingController.setSession(newSessions);
    } catch (err) {
      Logger.log(
        'AppPortForwardingSessionsController getSessionFromServer',
        'Could not get port forwarding sessions',
        err,
      );
    }
  }
}

class AppPortForwardingSessionsWidget extends StatelessWidget {
  const AppPortForwardingSessionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppPortForwardingSessionsController controller = Get.put(
      AppPortForwardingSessionsController(),
    );

    return Obx(
      () {
        return AppActionsWidget(
          actions: List.generate(
            controller.portForwardingController.sessions.length,
            (index) => AppActionsWidgetAction(
              title:
                  '${controller.portForwardingController.sessions[index].name} ${controller.portForwardingController.sessions[index].remotePort}:${controller.portForwardingController.sessions[index].localPort}',
              color: Constants.colorPrimary,
              onTap: () {
                finish(context);
                controller.portForwardingController
                    .showSessionBottomSheet(index);
              },
            ),
          ),
        );
      },
    );
  }
}

class AppPortForwardingSessionController extends GetxController {
  PortForwardingController portForwardingController = Get.find();
  ClusterController clusterController = Get.find();

  void deletePortForwardingSession(int sessionIndex) async {
    final session = portForwardingController.sessions[sessionIndex];

    try {
      final cluster = clusterController
          .clusters[clusterController.activeClusterIndex.value].value;

      await KubernetesService(cluster: cluster)
          .deletePortForwardingSession(session.id);
    } catch (err) {
      Logger.log(
        'AppPortForwardingSessionController deletePortForwardingSession',
        'Could not delete port forwarding session',
        err,
      );
    }

    portForwardingController.removeSession(sessionIndex);
    snackbar(
      'Port forwarding session was deleted',
      'The port forwarding session for ${session.name} ${session.remotePort}:${session.localPort} was deleted',
    );
  }
}

class AppPortForwardingSessionWidget extends StatelessWidget {
  const AppPortForwardingSessionWidget({
    Key? key,
    required this.sessionIndex,
  }) : super(key: key);

  final int sessionIndex;

  @override
  Widget build(BuildContext context) {
    AppPortForwardingSessionController controller = Get.put(
      AppPortForwardingSessionController(),
    );

    return AppActionsWidget(
      actions: [
        AppActionsWidgetAction(
          title: 'Open',
          color: Constants.colorPrimary,
          onTap: () {
            finish(context);
            controller.portForwardingController.openSession(
              controller
                  .portForwardingController.sessions[sessionIndex].localPort,
            );
          },
        ),
        AppActionsWidgetAction(
          title: 'Copy',
          color: Constants.colorPrimary,
          onTap: () {
            finish(context);
            Clipboard.setData(
              ClipboardData(
                text:
                    '${controller.portForwardingController.sessions[sessionIndex].localPort}',
              ),
            );
          },
        ),
        AppActionsWidgetAction(
          title: 'Delete',
          color: Constants.colorDanger,
          onTap: () {
            finish(context);
            controller.deletePortForwardingSession(sessionIndex);
          },
        ),
      ],
    );
  }
}
