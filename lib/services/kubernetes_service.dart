import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;

import 'package:kubenav/models/cluster.dart';
import 'package:kubenav/models/plugins/helm.dart';
import 'package:kubenav/models/plugins/prometheus.dart';
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

  /// [kubernetesRequest] can be used to make an request against the Kubernetes
  /// API server
  Future<String> kubernetesRequest(
    Cluster cluster,
    String proxy,
    int timeout,
    String method,
    String url,
    String body,
  ) async {
    Logger.log(
      'KubernetesService kubernetesRequest',
      'Run kubernetesRequest function',
      '${cluster.name}, $method, $url, $body',
    );

    final String result = await platform
        .invokeMethod('kubernetesRequest', <String, dynamic>{
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
          'requestMethod': method,
          'requestURL': url,
          'requestBody': body,
        });

    Logger.log(
      'KubernetesService kubernetesRequest',
      'Result of the kubernetesRequest function',
      result,
    );

    if (result.isEmpty) {
      throw Exception('An unknown error occured');
    }

    return result;
  }

  /// [checkHealth] can be used to check the health of a Kubernetes cluster. The
  /// health of a cluster can be checked by calling the `/readyz` endpoint of
  /// the cluster. If the cluster is healthy it should return 200, if it isn't
  /// healthy it returns an other response code.
  Future<bool> checkHealth() async {
    try {
      final result = await kubernetesRequest(
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
    } catch (err) {
      Logger.log('KubernetesService checkHealth', 'Health check failed', err);
      rethrow;
    }
  }

  /// [getRequest] can be used to run a get request against a Kubernetes
  /// cluster. For that a user can pass in the [url], which should be called,
  /// the function then returns an error or a json object of the response from
  /// the Kubernetes API.
  Future<String> getRequest(String url) async {
    try {
      final result = await kubernetesRequest(
        cluster,
        proxy,
        timeout,
        'GET',
        url,
        '',
      );
      return result;
    } catch (err) {
      Logger.log('KubernetesService getRequest', 'Get request failed', err);
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
      await kubernetesRequest(
        cluster,
        proxy,
        timeout,
        'DELETE',
        url,
        body ?? '',
      );
      return;
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
      await kubernetesRequest(cluster, proxy, timeout, 'PATCH', url, body);
      return;
    } catch (err) {
      Logger.log('KubernetesService patchRequest', 'Patch request failed', err);
      rethrow;
    }
  }

  /// [postRequest] can be used to run a post request against a Kubernetes
  /// cluster. Besides the [url] of the resource, which should be created, we
  /// also have to pass a [body] to the function. The [body] must be contain the
  /// Kubernetes manifest which should be created.
  Future<void> postRequest(String url, String body) async {
    try {
      await kubernetesRequest(cluster, proxy, timeout, 'POST', url, body);
      return;
    } catch (err) {
      Logger.log('KubernetesService postRequest', 'Post request failed', err);
      rethrow;
    }
  }

  /// [putRequest] can be used to run a put request against a Kubernetes
  /// cluster. Besides the [url] of the resource, which should be updated, we
  /// also have to pass a [body] to the function. The [body] must be contain the
  /// Kubernetes manifest which is used for the update.
  Future<void> putRequest(String url, String body) async {
    try {
      await kubernetesRequest(cluster, proxy, timeout, 'PUT', url, body);
      return;
    } catch (err) {
      Logger.log('KubernetesService putRequest', 'Put request failed', err);
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
      Logger.log(
        'KubernetesService kubernetesGetLogs',
        'Run kubernetesGetLogs function',
        '${cluster.name}, $names, $namespace, $container, $since, $filter, $previous',
      );

      final String result = await platform.invokeMethod(
        'kubernetesGetLogs',
        <String, dynamic>{
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
          'names': names,
          'namespace': namespace,
          'container': container,
          'since': since,
          'filter': filter,
          'previous': previous,
        },
      );

      Logger.log(
        'KubernetesService kubernetesGetLogs',
        'Get logs request was ok',
        result,
      );

      if (result.isEmpty) {
        throw Exception('An unknown error occured');
      }

      Map<String, dynamic> jsonData = json.decode(result);
      return jsonData['logs'] ?? [];
    } catch (err) {
      Logger.log('KubernetesService getLogs', 'Get logs request failed', err);
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
        Logger.log(
          'KubernetesService kubernetesStartServer',
          'Run kubernetesStartServer function',
        );

        await platform.invokeMethod('kubernetesStartServer');

        Logger.log(
          'KubernetesService startServer',
          'Internal http server was started',
        );
        await Future.delayed(const Duration(seconds: 3));
        return await _checkServerHealth();
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
        headers: {'Content-Type': 'application/json'},
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
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'sessionID': sessionID}),
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

  /// [helmListReleases] lists all Helm releases in the provided namespace.
  Future<List<Release>> helmListReleases(String namespace) async {
    try {
      Logger.log(
        'KubernetesService helmListReleases',
        'Run helmListReleases function',
        '${cluster.name}, $namespace',
      );

      final String result = await platform.invokeMethod(
        'helmListReleases',
        <String, dynamic>{
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
          'namespace': namespace,
        },
      );

      Logger.log('KubernetesService helmListReleases', 'Helm Releases', result);

      if (result.isEmpty) {
        throw Exception('An unknown error occured');
      }

      if (result == 'null') {
        return [];
      }

      return compute(_decodeHelmListReleases, result);
    } catch (err) {
      Logger.log(
        'KubernetesService helmListReleases',
        'Failed to Get Helm Releases',
        err,
      );
      rethrow;
    }
  }

  /// [helmGetRelease] retruns the provided [version] for a Helm release with
  /// the provided [name] in the provided [namespace].
  Future<Release> helmGetRelease(
    String namespace,
    String name,
    int version,
  ) async {
    try {
      Logger.log(
        'KubernetesService helmGetRelease',
        'Run helmGetRelease function',
        '${cluster.name}, $namespace, $name, $version',
      );
      final String result = await platform.invokeMethod(
        'helmGetRelease',
        <String, dynamic>{
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
          'namespace': namespace,
          'name': name,
          'version': version,
        },
      );

      Logger.log('KubernetesService helmGetRelease', 'Helm Release', result);

      if (result.isEmpty) {
        throw Exception('An unknown error occured');
      }

      return compute(_decodeHelmGetRelease, result);
    } catch (err) {
      Logger.log(
        'KubernetesService helmGetRelease',
        'Failed to Get Helm Release',
        err,
      );
      rethrow;
    }
  }

  /// [helmListReleaseHistory] returns the history for the Helm release with the
  /// provided [name] and [namespace].
  Future<List<Release>> helmListReleaseHistory(
    String namespace,
    String name,
  ) async {
    try {
      Logger.log(
        'KubernetesService helmListReleaseHistory',
        'Run helmListReleaseHistory function',
        '${cluster.name}, $namespace, $name',
      );

      final String result = await platform.invokeMethod(
        'helmListReleaseHistory',
        <String, dynamic>{
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
          'namespace': namespace,
          'name': name,
        },
      );

      Logger.log(
        'KubernetesService helmListReleaseHistory',
        'Helm Release History',
        result,
      );

      if (result.isEmpty) {
        throw Exception('An unknown error occured');
      }

      if (result == 'null') {
        return [];
      }

      return compute(_decodeHelmListReleases, result);
    } catch (err) {
      Logger.log(
        'KubernetesService helmListReleaseHistory',
        'Failed to Get Helm Release History',
        err,
      );
      rethrow;
    }
  }

  /// [helmRollbackRelease] rolls back the Helm release with the provided [name]
  /// and [namespace] to the provided [version].
  Future<void> helmRollbackRelease(
    String namespace,
    String name,
    int version,
    String options,
  ) async {
    try {
      Logger.log(
        'KubernetesService helmRollbackRelease',
        'Run helmRollbackRelease function',
        '${cluster.name}, $namespace, $name, $version',
      );

      await platform.invokeMethod('helmRollbackRelease', <String, dynamic>{
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
        'namespace': namespace,
        'name': name,
        'version': version,
        'options': options,
      });

      Logger.log('KubernetesService helmRollbackRelease', 'Rollback Succeeded');

      return;
    } catch (err) {
      Logger.log(
        'KubernetesService helmRollbackRelease',
        'Rollback Failed',
        err,
      );
      rethrow;
    }
  }

  Future<String> helmUninstallRelease(
    String namespace,
    String name,
    String options,
  ) async {
    try {
      Logger.log(
        'KubernetesService helmUninstallRelease',
        'Run helmUninstallRelease function',
        '${cluster.name}, $namespace, $name',
      );

      final message = await platform.invokeMethod(
        'helmUninstallRelease',
        <String, dynamic>{
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
          'namespace': namespace,
          'name': name,
          'options': options,
        },
      );

      Logger.log(
        'KubernetesService helmUninstallRelease',
        'Uninstall Succeeded',
        message,
      );

      return message;
    } catch (err) {
      Logger.log(
        'KubernetesService helmUninstallRelease',
        'Uninstall Failed',
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
      final request =
          Request(
            prometheus: prometheus,
            manifest: manifest,
            queries: queries,
            timeStart: timeStart,
            timeEnd: timeEnd,
          ).toString();

      Logger.log(
        'KubernetesService prometheusGetData',
        'Run prometheusGetData function',
        '${cluster.name}, $request',
      );

      final String result = await platform.invokeMethod(
        'prometheusGetData',
        <String, dynamic>{
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
          'request': request,
        },
      );

      Logger.log(
        'KubernetesService prometheusGetData',
        'List Helm charts was ok',
        result,
      );

      if (result.isEmpty) {
        throw Exception('An unknown error occured');
      }

      if (result == 'null') {
        return [];
      }

      return await compute(_decodePrometheusGetData, result);
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

/// [_decodePrometheusGetData] is a helper function to decode the result of the
/// `prometheusGetData` function, within the `compute` function. The functions
/// takes the [result] as parameter and returns a list of [Metric] objects.
List<Metric> _decodePrometheusGetData(String result) {
  List<dynamic> jsonData = json.decode(result);
  final metrics = <Metric>[];
  for (var metric in jsonData) {
    metrics.add(Metric.fromJson(metric));
  }
  return metrics;
}

/// [_decodeHelmListReleases] is a helper function to decode the result of the
/// `helmListReleases` and `helmListReleaseHistory` function, within the
/// `compute` function. The functions takes the [result] as parameter and
/// returns a list of [Release] objects.
List<Release> _decodeHelmListReleases(String result) {
  List<dynamic> jsonData = json.decode(result);
  final releases = <Release>[];
  for (var release in jsonData) {
    releases.add(Release.fromJson(release));
  }
  return releases;
}

/// [_decodeHelmGetRelease] is a helper function to decode the result of the
/// `helmGetRelease` function, within the `compute` function. The functions
/// takes the [result] as parameter and returns a [Release] object.
Release _decodeHelmGetRelease(String result) {
  Map<String, dynamic> jsonData = json.decode(result);
  Release release = Release.fromJson(jsonData);
  return release;
}
