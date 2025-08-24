import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/repositories/portforwarding_repository.dart';
import 'package:kubenav/repositories/terminal_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/shared/app_portforwarding_sessions_widget.dart';
import 'package:kubenav/widgets/shared/app_terminals_widget.dart';

class AppFloatingActionButtonsWidget extends StatefulWidget {
  const AppFloatingActionButtonsWidget({super.key});

  @override
  State<AppFloatingActionButtonsWidget> createState() =>
      _AppFloatingActionButtonsWidgetState();
}

class _AppFloatingActionButtonsWidgetState
    extends State<AppFloatingActionButtonsWidget> {
  /// [_showPortForwardingSessions] is triggered when the user clicks on the
  /// floating action button for the port forwarding sessions. Before we show a
  /// list of all port forwarding session we check that the sessions are still
  /// available in our http server by calling the
  /// [portForwardingRepository.showSessions] function. When the function
  /// returns a list of session we show them in an action menu via the
  /// [AppPortForwardingSessionsWidget] widget.
  Future<void> _showPortForwardingSessions() async {
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: false,
    );
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: false,
    );
    PortForwardingRepository portForwardingRepository =
        Provider.of<PortForwardingRepository>(context, listen: false);

    try {
      final cluster = await clustersRepository.getClusterWithCredentials(
        clustersRepository.activeClusterId,
      );
      await portForwardingRepository.showSessions(
        cluster!,
        appRepository.settings.proxy,
        appRepository.settings.timeout,
      );

      if (mounted) {
        showActions(context, const AppPortForwardingSessionsWidget());
      }
    } catch (err) {
      if (mounted) {
        showSnackbar(
          context,
          'Failed to Show Port Forwarding Sessions',
          err.toString(),
        );
      }
    }
  }

  /// [_buildFloatingActionButtons] builds the floating action buttons for the
  /// port forwarding sessions and the terminals. The button are only shown
  /// when a port forwarding session or a terminal was create by the user. If
  /// there is no session or terminal the buttons are not visible.
  List<Widget> _buildFloatingActionButtons() {
    TerminalRepository terminalRepository = Provider.of<TerminalRepository>(
      context,
      listen: false,
    );
    PortForwardingRepository portForwardingRepository =
        Provider.of<PortForwardingRepository>(context, listen: false);

    List<Widget> floatingActionButtons = [];

    if (terminalRepository.terminals.isNotEmpty) {
      floatingActionButtons.add(
        FloatingActionButton(
          heroTag: 'terminal',
          backgroundColor: Theme.of(context).colorScheme.primary,
          onPressed: () {
            showActions(context, const AppTerminalsActionsWidget());
          },
          child: Icon(
            Icons.terminal,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      );
    }

    if (portForwardingRepository.sessions.isNotEmpty) {
      floatingActionButtons.add(
        FloatingActionButton(
          heroTag: 'portforwarding',
          backgroundColor: Theme.of(context).colorScheme.primary,
          onPressed: () {
            _showPortForwardingSessions();
          },
          child: Icon(
            Icons.link,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      );
    }

    return floatingActionButtons;
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<TerminalRepository>(context, listen: true);
    Provider.of<PortForwardingRepository>(context, listen: true);

    return Wrap(
      direction: Axis.vertical,
      spacing: Constants.spacingMiddle,
      children: _buildFloatingActionButtons(),
    );
  }
}
