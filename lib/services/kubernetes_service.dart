import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;

import 'package:kubenav/models/cluster.dart';
import 'package:kubenav/models/plugins/helm.dart';
import 'package:kubenav/models/plugins/prometheus.dart';
import 'package:kubenav/services/kubenav_desktop.dart';
import 'package:kubenav/services/kubenav_mobile.dart';
import 'package:kubenav/utils/logger.dart';

/// [KubernetesService] implements a service to interactiv with the Kubernetes
/// functions from our Go code. The implementation details of each Go function
/// can be found in the `cmd/kubenav/kubernetes.go` file.
///
/// To use the [KubernetesService] a user must provide a Kubernetes [cluster]
/// during the initialization of the service.
class KubernetesService {
  static const platform = MethodChannel('kubenav.io');

  Cluster cluster;
  String proxy;
  int timeout;

  KubernetesService({
    required this.cluster,
    required this.proxy,
    required this.timeout,
  });

  /// [checkHealth] can be used to check the health of a Kubernetes cluster. The
  /// health of a cluster can be checked by calling the `/readyz` endpoint of
  /// the cluster. If the cluster is healthy it should return 200, if it isn't
  /// healthy it returns an other response code.
  Future<bool> checkHealth() async {
    try {
      if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
        final result = await KubenavDesktop().kubernetesRequest(
          cluster.name,
          proxy,
          timeout,
          'GET',
          '/readyz',
          '',
        );
        if (result == 'ok') {
          return true;
        }
        return false;
      } else {
        final result = await KubenavMobile().kubernetesRequest(
          cluster,
          proxy,
          timeout,
          'GET',
          '/readyz',
          '',
        );
        if (result == 'ok') {
          return true;
        }
        return false;
      }
    } catch (err) {
      Logger.log(
        'KubernetesService checkHealth',
        'Health check failed',
        err,
      );
      rethrow;
    }
  }

  /// [getRequest] can be used to run a get request against a Kubernetes
  /// cluster. For that a user can pass in the [url], which should be called,
  /// the function then returns an error or a json object of the response from
  /// the Kubernetes API.
  Future<Map<String, dynamic>> getRequest(String url) async {
    try {
      if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
        final result = await KubenavDesktop().kubernetesRequest(
          cluster.name,
          proxy,
          timeout,
          'GET',
          url,
          '',
        );
        return json.decode(result);
      } else {
        final result = await KubenavMobile().kubernetesRequest(
          cluster,
          proxy,
          timeout,
          'GET',
          url,
          '',
        );
        return json.decode(result);
      }
    } catch (err) {
      Logger.log(
        'KubernetesService getRequest',
        'Get request failed',
        err,
      );
      rethrow;
    }
  }

  /// [deleteRequest] can be used to run a delete request against a Kubernetes
  /// cluster. Besides the [url] of the resource, which should be deleted, we
  /// can also pass a [body] to the function. E.g. the body can be used to force
  /// delete a resource. The function doesn't return anything, expect an error
  /// in case there was one.
  Future<void> deleteRequest(String url, String? body) async {
    try {
      if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
        await KubenavDesktop().kubernetesRequest(
          cluster.name,
          proxy,
          timeout,
          'DELETE',
          url,
          body ?? '',
        );
        return;
      } else {
        await KubenavMobile().kubernetesRequest(
          cluster,
          proxy,
          timeout,
          'DELETE',
          url,
          body ?? '',
        );
        return;
      }
    } catch (err) {
      Logger.log(
        'KubernetesService deleteRequest',
        'Delete request failed',
        err,
      );
      rethrow;
    }
  }

  /// [patchRequest] can be used to run a patch request against a Kubernetes
  /// cluster. Besides the [url] of the resource, which should be patched, we
  /// also have to pass a [body] to the function. The [body] must be a valid
  /// json patch.
  Future<void> patchRequest(String url, String body) async {
    try {
      if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
        await KubenavDesktop().kubernetesRequest(
          cluster.name,
          proxy,
          timeout,
          'PATCH',
          url,
          body,
        );
        return;
      } else {
        await KubenavMobile().kubernetesRequest(
          cluster,
          proxy,
          timeout,
          'PATCH',
          url,
          body,
        );
        return;
      }
    } catch (err) {
      Logger.log(
        'KubernetesService patchRequest',
        'Patch request failed',
        err,
      );
      rethrow;
    }
  }

  /// [postRequest] can be used to run a post request against a Kubernetes
  /// cluster. Besides the [url] of the resource, which should be created, we
  /// also have to pass a [body] to the function. The [body] must be contain the
  /// Kubernetes manifest which should be created.
  Future<void> postRequest(String url, String body) async {
    try {
      if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
        await KubenavDesktop().kubernetesRequest(
          cluster.name,
          proxy,
          timeout,
          'POST',
          url,
          body,
        );
        return;
      } else {
        await KubenavMobile().kubernetesRequest(
          cluster,
          proxy,
          timeout,
          'POST',
          url,
          body,
        );
        return;
      }
    } catch (err) {
      Logger.log(
        'KubernetesService postRequest',
        'Post request failed',
        err,
      );
      rethrow;
    }
  }

  /// [getLogs] returns the logs for a list of pods (containers). The pod names
  /// are must be provided via the [names] argument, which should be a commans
  /// separated list of pod names.
  Future<List<dynamic>> getLogs(
    String names,
    String namespace,
    String container,
    int since,
    String filter,
    bool previous,
  ) async {
    try {
      if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
        final result = await KubenavDesktop().kubernetesGetLogs(
          cluster.name,
          proxy,
          timeout,
          names,
          namespace,
          container,
          since,
          filter,
          previous,
        );
        Map<String, dynamic> jsonData = json.decode(result);
        return jsonData['logs'] ?? [];
      } else {
        final result = await KubenavMobile().kubernetesGetLogs(
          cluster,
          proxy,
          timeout,
          names,
          namespace,
          container,
          since,
          filter,
          previous,
        );
        Map<String, dynamic> jsonData = json.decode(result);
        return jsonData['logs'] ?? [];
      }
    } catch (err) {
      Logger.log(
        'KubernetesService getLogs',
        'Get logs request failed',
        err,
      );
      rethrow;
    }
  }

  /// [startServer] starts the internal Go server, which is responsible for
  /// features like port forwarding and getting a shell in a container.
  ///
  /// To start the server we call the `kubernetesStartServer` method, after that
  /// we are waiting 3 seconds and check if the server is healthy. This is
  /// necessary, because we directly return when the server is started and we do
  /// not have the chance to wait if the server is really started.
  Future<bool> startServer() async {
    try {
      final isServerHealthy = await _checkServerHealth();
      if (isServerHealthy) {
        return true;
      } else {
        if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
          await KubenavDesktop().kubernetesStartServer();
          await Future.delayed(const Duration(seconds: 3));
          return await _checkServerHealth();
        } else {
          await KubenavMobile().kubernetesStartServer();
          await Future.delayed(const Duration(seconds: 3));
          return await _checkServerHealth();
        }
      }
    } catch (err) {
      Logger.log(
        'KubernetesService startServer',
        'Could not start server',
        err,
      );
      rethrow;
    }
  }

  /// [_checkServerHealth] is an internal helper funtion, which checks if our
  /// internal http server is healthy. If this is the case the function returns
  /// `true`. If the server is unhealthy it returns `false`.
  ///
  /// The function can be used to determine if the internal http server must be
  /// started or if he was started successfully.
  Future<bool> _checkServerHealth() async {
    try {
      final response = await http.get(
        Uri.parse('http://localhost:14122/health'),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        Logger.log(
          'KubernetesService _checkServerHealth',
          'Health check for internal http server failed with status code ${response.statusCode}',
          response,
        );
        return false;
      }
    } catch (err) {
      Logger.log(
        'KubernetesService _checkServerHealth',
        'An error was returned while checking the health of the internal http server',
        err,
      );
      return false;
    }
  }

  /// [portForwarding] creates a new port forwarding session to the remote port
  /// of the given Pod name, by using the `portforwarding` endpoint of the
  /// internal http server.
  Future<Map<String, dynamic>> portForwarding(
    String name,
    String namespace,
    int port,
    String serviceSelector,
    String serviceTargetPort,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:14122/portforwarding'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'contextName': cluster.name,
          'clusterServer': cluster.clusterServer,
          'clusterCertificateAuthorityData':
              cluster.clusterCertificateAuthorityData,
          'clusterInsecureSkipTLSVerify': cluster.clusterInsecureSkipTLSVerify,
          'userClientCertificateData': cluster.userClientCertificateData,
          'userClientKeyData': cluster.userClientKeyData,
          'userToken': cluster.userToken,
          'userUsername': cluster.userUsername,
          'userPassword': cluster.userPassword,
          'proxy': proxy,
          'timeout': timeout,
          'podName': name,
          'podNamespace': namespace,
          'podPort': port,
          'serviceSelector': serviceSelector,
          'serviceTargetPort': serviceTargetPort,
        }),
      );

      Logger.log(
        'KubernetesService portForwarding',
        'Port forwarding returnes a response with status code ${response.statusCode}',
        response.body,
      );

      Map<String, dynamic> jsonData = json.decode(response.body);

      if (response.statusCode == 200) {
        return jsonData;
      } else {
        Logger.log(
          'KubernetesService portForwarding',
          'Port forwarding failed with status code ${response.statusCode}',
          jsonData,
        );
        throw Exception(jsonData);
      }
    } catch (err) {
      Logger.log(
        'KubernetesService portForwarding',
        'An error was returned while establishing the port forwarding connection',
        err,
      );
      rethrow;
    }
  }

  /// [deletePortForwardingSession] deletes a port forwarding session by the
  /// given id. This just deletes the session in our internal http server. The
  /// user must take care of the deliting the session also on the client side by
  /// calling the `removeSession` of the `PortForwardingController`.
  Future<void> deletePortForwardingSession(String sessionID) async {
    try {
      final response = await http.delete(
        Uri.parse('http://localhost:14122/portforwarding'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'sessionID': sessionID,
        }),
      );

      if (response.statusCode == 200) {
        return;
      } else {
        Map<String, dynamic> jsonData = json.decode(response.body);
        Logger.log(
          'KubernetesService deletePortForwardingSession',
          'Deleting the port forwarding session failed with response code ${response.statusCode}',
          jsonData,
        );
        throw Exception(jsonData);
      }
    } catch (err) {
      Logger.log(
        'KubernetesService deletePortForwardingSession',
        'An error was returned while deleting the port forwarding connection',
        err,
      );
      rethrow;
    }
  }

  /// [getPortForwardingSession] returns a list of session from our internal
  /// http server, which can be used to replace the current list of sessions
  /// hold by the `PortForwardingController`.
  Future<Map<String, dynamic>> getPortForwardingSession() async {
    try {
      final response = await http.get(
        Uri.parse('http://localhost:14122/portforwarding'),
      );

      Map<String, dynamic> jsonData = json.decode(response.body);

      if (response.statusCode == 200) {
        return jsonData;
      } else {
        Logger.log(
          'KubernetesService getPortForwardingSession',
          'Could not sessions, with response code ${response.statusCode}',
          jsonData,
        );
        throw Exception(jsonData);
      }
    } catch (err) {
      Logger.log(
        'KubernetesService getPortForwardingSession',
        'An error was returned while returning port forwarding sessions',
        err,
      );
      rethrow;
    }
  }

  /// [helmListCharts] lists all Helm charts in the provided namespace.
  Future<List<Release>> helmListCharts(String namespace) async {
    try {
      if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
        final result = await KubenavDesktop().helmListCharts(
          cluster.name,
          proxy,
          timeout,
          namespace,
        );
        if (result == 'null') {
          return [];
        }

        List<dynamic> jsonData = json.decode(result);
        final releases = <Release>[];
        for (var release in jsonData) {
          releases.add(Release.fromJson(release));
        }
        return releases;
      } else {
        final result = await KubenavMobile().helmListCharts(
          cluster,
          proxy,
          timeout,
          namespace,
        );
        if (result == 'null') {
          return [];
        }

        List<dynamic> jsonData = json.decode(result);
        final releases = <Release>[];
        for (var release in jsonData) {
          releases.add(Release.fromJson(release));
        }
        return releases;
      }
    } catch (err) {
      Logger.log(
        'KubernetesService helmListCharts',
        'List Helm charts failed',
        err,
      );
      rethrow;
    }
  }

  /// [helmGetChart] retruns the provided [version] for a Helm chart with the
  /// provided [name] in the provided [namespace].
  Future<Release> helmGetChart(
    String namespace,
    String name,
    int version,
  ) async {
    try {
      if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
        final result = await KubenavDesktop().helmGetChart(
          cluster.name,
          proxy,
          timeout,
          namespace,
          name,
          version,
        );
        return Release.fromJson(json.decode(result));
      } else {
        final result = await KubenavMobile().helmGetChart(
          cluster,
          proxy,
          timeout,
          namespace,
          name,
          version,
        );
        Map<String, dynamic> jsonData = json.decode(result);
        Release release = Release.fromJson(jsonData);
        return release;
      }
    } catch (err) {
      Logger.log(
        'KubernetesService helmGetChart',
        'Get Helm chart failed',
        err,
      );
      rethrow;
    }
  }

  /// [helmGetHistory] returns the history for the Helm chart with the provided
  /// [name] and [namespace].
  Future<List<Release>> helmGetHistory(
    String namespace,
    String name,
  ) async {
    try {
      if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
        final result = await KubenavDesktop().helmGetHistory(
          cluster.name,
          proxy,
          timeout,
          namespace,
          name,
        );
        if (result == 'null') {
          return [];
        }

        List<dynamic> jsonData = json.decode(result);
        final releases = <Release>[];
        for (var release in jsonData) {
          releases.add(Release.fromJson(release));
        }
        return releases;
      } else {
        final result = await KubenavMobile().helmGetHistory(
          cluster,
          proxy,
          timeout,
          namespace,
          name,
        );
        if (result == 'null') {
          return [];
        }

        List<dynamic> jsonData = json.decode(result);
        final releases = <Release>[];
        for (var release in jsonData) {
          releases.add(Release.fromJson(release));
        }
        return releases;
      }
    } catch (err) {
      Logger.log(
        'KubernetesService helmGetHistory',
        'Get Helm history failed',
        err,
      );
      rethrow;
    }
  }

  /// [prometheusGetData] returns the data for a PromQL query, which can be used
  /// to render a chart for the query.
  Future<List<Metric>> prometheusGetData(
    Map<String, dynamic> prometheus,
    Map<String, dynamic> manifest,
    List<Query> queries,
    int timeStart,
    int timeEnd,
  ) async {
    try {
      final request = Request(
        prometheus: prometheus,
        manifest: manifest,
        queries: queries,
        timeStart: timeStart,
        timeEnd: timeEnd,
      ).toString();

      if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
        final result = await KubenavDesktop().prometheusGetData(
          cluster.name,
          proxy,
          timeout,
          request,
        );
        if (result == 'null') {
          return [];
        }

        List<dynamic> jsonData = json.decode(result);
        final metrics = <Metric>[];
        for (var metric in jsonData) {
          metrics.add(Metric.fromJson(metric));
        }
        return metrics;
      } else {
        final result = await KubenavMobile().prometheusGetData(
          cluster,
          proxy,
          timeout,
          request,
        );
        if (result == 'null') {
          return [];
        }

        List<dynamic> jsonData = json.decode(result);
        final metrics = <Metric>[];
        for (var metric in jsonData) {
          metrics.add(Metric.fromJson(metric));
        }
        return metrics;
      }
    } catch (err) {
      Logger.log(
        'KubernetesService prometheusGetData',
        'List Helm charts failed',
        err,
      );
      rethrow;
    }
  }
}
