import 'package:flutter/material.dart';

import 'package:kubenav/models/cluster.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/logger.dart';

/// A [PortForwardingSession] represents a single port forwarding session. Each
/// port forwarding session requires the [id] of the session and the
/// [localPort].
class PortForwardingSession {
  String id;
  String name;
  String namespace;
  String container;
  int remotePort;
  int localPort;

  PortForwardingSession({
    required this.id,
    required this.name,
    required this.namespace,
    required this.container,
    required this.remotePort,
    required this.localPort,
  });

  factory PortForwardingSession.fromJson(Map<String, dynamic> json) {
    return PortForwardingSession(
      id: json['id'],
      name: json['name'],
      namespace: json['namespace'],
      container: json['container'],
      remotePort: json['remotePort'],
      localPort: json['localPort'],
    );
  }
}

/// The [PortForwardingRepository] manages the all port forwarding session in
/// the app. The sessions can be retrieved via the [sessions] getter, but before
/// the sessions are shown, we should always call the [showSessions] function
/// to check that the sessions are still available at the server side. To create
/// a new sessions the [createSession] function can be used. The [deleteSession]
/// function can be used to remove a session.
class PortForwardingRepository with ChangeNotifier {
  List<PortForwardingSession> _sessions = <PortForwardingSession>[];

  List<PortForwardingSession> get sessions => _sessions;

  /// [showSessions] gets all port forwarding sessions from the started HTTP
  /// server in the [createSession] function. We have to get all sessions from
  /// the server to ensure that the session we are manging in the UI are the
  /// same as in the server, because it could happen that a session is closed on
  /// the server side which we wouldn't notice in the ui.
  Future<void> showSessions(
    Cluster cluster,
    String proxy,
    int timeout,
  ) async {
    try {
      final result = await KubernetesService(
        cluster: cluster,
        proxy: proxy,
        timeout: timeout,
      ).getPortForwardingSession();
      Logger.log(
        'PortForwardingRepository showSessions',
        'The server returned ${result['sessions'].length} session',
        result['sessions'],
      );

      final List<PortForwardingSession> newSessions = [];
      for (var session in result['sessions']) {
        newSessions.add(PortForwardingSession.fromJson(session));
      }

      _sessions = newSessions;
      notifyListeners();
    } catch (err) {
      Logger.log(
        'PortForwardingRepository showSessions',
        'Could not get port forwarding sessions',
        err,
      );
      rethrow;
    }
  }

  /// [deleteSession] deletes the session with the provided [sessionIndex] on
  /// the server and then the session is also removed in the ui.
  Future<void> deleteSession(
    Cluster cluster,
    String proxy,
    int timeout,
    int sessionIndex,
  ) async {
    final session = _sessions[sessionIndex];

    try {
      await KubernetesService(
        cluster: cluster,
        proxy: proxy,
        timeout: timeout,
      ).deletePortForwardingSession(session.id);
      _sessions.removeAt(sessionIndex);
      notifyListeners();
    } catch (err) {
      Logger.log(
        'PortForwardingRepository deleteSession',
        'Could not delete port forwarding session',
        err,
      );
      rethrow;
    }
  }

  /// [createSession] creates a new port forwarding session, to the provided
  /// [container] and [port]. To create the session we have to ensure that the
  /// internal http server is running before we can create the session. The
  /// created session is then added to the [_sessions] list and can be viewed
  /// by a user via the corresponding floating action button.
  ///
  /// If the [container] is an empty string and [port] the port is 0 the
  /// [serviceSelector] and [serviceTargetPort] must be provided to establish a
  /// port forwading session via the a service.
  Future<void> createSession(
    Cluster cluster,
    String proxy,
    int timeout,
    String name,
    String namespace,
    String container,
    int port,
    String serviceSelector,
    String serviceTargetPort,
  ) async {
    try {
      final isStarted = await KubernetesService(
        cluster: cluster,
        proxy: proxy,
        timeout: timeout,
      ).startServer();
      if (isStarted) {
        Logger.log(
          'PortForwardingRepository createSession',
          'Internal http server is started and healthy, try to establish port forwarding',
        );

        final result = await KubernetesService(
          cluster: cluster,
          proxy: proxy,
          timeout: timeout,
        ).portForwarding(
          name,
          namespace,
          port,
          serviceSelector,
          serviceTargetPort,
        );

        _sessions.add(PortForwardingSession.fromJson(result));
        notifyListeners();
      }
    } catch (err) {
      Logger.log(
        'PortForwardingRepository createSession',
        'Could not establish port forwarding',
        err,
      );
      rethrow;
    }
  }
}
