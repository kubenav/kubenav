import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/models/portforwarding_session_model.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/app_browser_widget.dart';
import 'package:kubenav/widgets/app_portforwarding_sessions_widget.dart';

/// The [PortForwardingController] is responsible for handling all port forwarding session which are saved in the
/// [sessions] list.
class PortForwardingController extends GetxController {
  RxList<PortForwardingSession> sessions = <PortForwardingSession>[].obs;
  RxBool showSessions = false.obs;

  void showSessionsBottomSheet() {
    showSessions.value = true;

    Get.bottomSheet(
      BottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.sizeBorderRadius),
        ),
        onClosing: () {},
        enableDrag: false,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return const AppPortForwardingSessionsWidget();
        },
      ),
      isScrollControlled: true,
    ).whenComplete(() => hideSessionsBottomSheet());
  }

  void showSessionBottomSheet(int sessionIndex) {
    showSessions.value = true;

    Get.bottomSheet(
      BottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.sizeBorderRadius),
        ),
        onClosing: () {},
        enableDrag: false,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return AppPortForwardingSessionWidget(sessionIndex: sessionIndex);
        },
      ),
      isScrollControlled: true,
    ).whenComplete(() => hideSessionsBottomSheet());
  }

  void hideSessionsBottomSheet() {
    showSessions.value = false;
  }

  void setSession(List<PortForwardingSession> newSessions) {
    sessions.value = newSessions;
  }

  void addSession(
    String id,
    String name,
    String namespace,
    String container,
    int remotePort,
    int localPort,
  ) {
    sessions.add(
      PortForwardingSession(
        id: id,
        name: name,
        namespace: namespace,
        container: container,
        remotePort: remotePort,
        localPort: localPort,
      ),
    );

    snackbar(
      'Port forwarding was established',
      'Click here to open the forwarded port in your browser',
      onTap: () {
        openSession(localPort);
      },
    );
  }

  void openSession(int localPort) {
    Get.bottomSheet(
      BottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.sizeBorderRadius),
        ),
        onClosing: () {},
        enableDrag: false,
        builder: (builder) {
          return AppBrowserWidget(
            initialUrl: 'http://localhost:$localPort',
            onClosePressed: () {
              if (Get.context != null) {
                finish(Get.context!);
              }
            },
          );
        },
      ),
      isScrollControlled: true,
    );
  }

  void removeSession(int index) async {
    sessions.removeAt(index);
  }
}
