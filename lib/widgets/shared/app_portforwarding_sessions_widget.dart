import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/repositories/portforwarding_repository.dart';
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/shared/app_actions_widget.dart';

/// The [AppPortForwardingSessionsWidget] widget shows a list of all available
/// port forwarding sessions in an actions menu. A user can then select one of
/// the session, which will show then show the actions for this specific
/// sessions via the [AppPortForwardingSessionWidget] widget.
class AppPortForwardingSessionsWidget extends StatelessWidget {
  const AppPortForwardingSessionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    PortForwardingRepository portForwardingRepository =
        Provider.of<PortForwardingRepository>(
      context,
      listen: true,
    );

    return AppActionsWidget(
      actions: List.generate(
        portForwardingRepository.sessions.length,
        (index) => AppActionsWidgetAction(
          title:
              '${portForwardingRepository.sessions[index].name} ${portForwardingRepository.sessions[index].remotePort}:${portForwardingRepository.sessions[index].localPort}',
          color: theme(context).colorPrimary,
          onTap: () {
            Navigator.pop(context);
            showActions(
              context,
              AppPortForwardingSessionWidget(
                sessionIndex: index,
              ),
            );
          },
        ),
      ),
    );
  }
}

/// The [AppPortForwardingSessionWidget] widget shows all available actions for
/// the the session with the provided [sessionIndex]. A user can select from the
/// following actions:
/// - Open a browser window on the local port which was used for the port
///   forwarding session.
/// - Copy the local port number of the port forwarding session.
/// - Delete the port forwarding session.
class AppPortForwardingSessionWidget extends StatefulWidget {
  const AppPortForwardingSessionWidget({
    super.key,
    required this.sessionIndex,
  });

  final int sessionIndex;

  @override
  State<AppPortForwardingSessionWidget> createState() =>
      _AppPortForwardingSessionWidgetState();
}

class _AppPortForwardingSessionWidgetState
    extends State<AppPortForwardingSessionWidget> {
  /// [_deleteSession] deletes the port forwarding session with the provided
  /// [widget.sessionIndex]. When the session was deleted the action menu is
  /// closed. If we are not able to delete the port forwading session the error
  /// is shown via a snacbar message.
  Future<void> _deleteSession() async {
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: false,
    );
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: false,
    );
    PortForwardingRepository portForwardingRepository =
        Provider.of<PortForwardingRepository>(
      context,
      listen: false,
    );

    try {
      final cluster = await clustersRepository.getClusterWithCredentials(
        clustersRepository.activeClusterId,
      );
      await portForwardingRepository.deleteSession(
        cluster!,
        appRepository.settings.proxy,
        appRepository.settings.timeout,
        widget.sessionIndex,
      );

      if (mounted) {
        Navigator.pop(context);
      }
    } catch (err) {
      if (!context.mounted) return;
      showSnackbar(
        context,
        'Port Forwarding Session was not deleted',
        err.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    PortForwardingRepository portForwardingRepository =
        Provider.of<PortForwardingRepository>(
      context,
      listen: true,
    );

    return AppActionsWidget(
      actions: [
        AppActionsWidgetAction(
          title: 'Open',
          color: theme(context).colorPrimary,
          onTap: () {
            Navigator.pop(context);
            openUrl(
              'http://localhost:${portForwardingRepository.sessions[widget.sessionIndex].localPort}',
            );
          },
        ),
        AppActionsWidgetAction(
          title: 'Copy',
          color: theme(context).colorPrimary,
          onTap: () {
            Navigator.pop(context);
            Clipboard.setData(
              ClipboardData(
                text:
                    '${portForwardingRepository.sessions[widget.sessionIndex].localPort}',
              ),
            );
          },
        ),
        AppActionsWidgetAction(
          title: 'Delete',
          color: theme(context).colorDanger,
          onTap: () {
            _deleteSession();
          },
        ),
      ],
    );
  }
}
