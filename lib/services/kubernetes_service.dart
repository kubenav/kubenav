import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';

import 'package:kubenav/controllers/cluster_controller.dart';
import 'package:kubenav/controllers/provider_config_controller.dart';
import 'package:kubenav/models/cluster_model.dart';
import 'package:kubenav/models/helm_model.dart';
import 'package:kubenav/services/aws_service.dart';
import 'package:kubenav/services/google_service.dart';
import 'package:kubenav/services/oidc_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/logger.dart';

/// [KubernetesService] implements a service to interactiv with the Kubernetes functions from our Go code. The
/// implementation details of each Go function can be found in the `cmd/kubenav/kubernetes.go` file.
///
/// To use the [KubernetesService] a user must provide a Kubernetes [cluster] during the initialization of the service.
class KubernetesService {
  ClusterController clusterController = Get.find();
  ProviderConfigController providerConfigController = Get.find();

  static const platform = MethodChannel('kubenav.io');
  Cluster cluster;

  KubernetesService({
    required this.cluster,
  });

  /// [_getAccessToken] is our internal function for the [KubernetesService] to get a valid access token to access the
  /// Kubernetes API. The logic for the different providers is as follows:
  ///
  /// - `aws`: Check if the token is expired or empty -> get a new access token and set the token for the current
  ///   cluster (the token is valid for 10 minutes)
  /// - For all other providers we are using the token saved in the cluster configuration
  Future<String> _getAccessToken() async {
    try {
      final tokenExpireTimestamp =
          DateTime.fromMicrosecondsSinceEpoch(cluster.userTokenExpireTimestamp);

      if (cluster.provider == 'aws' &&
          (tokenExpireTimestamp.isBefore(DateTime.now()) ||
              cluster.userToken == '')) {
        final providerConfig =
            providerConfigController.getConfig(cluster.providerConfig);
        if (providerConfig != null && providerConfig.aws != null) {
          final token = await AWSService().getToken(
            providerConfig.aws!.accessKeyID,
            providerConfig.aws!.secretKey,
            providerConfig.aws!.region,
            providerConfig.aws!.sessionToken,
            cluster.providerConfigInternal,
          );
          clusterController.setNewToken(
            cluster.name,
            token,
            DateTime.now()
                .add(const Duration(minutes: 10))
                .microsecondsSinceEpoch,
          );
          return token;
        } else {
          Future.error('could not get access token');
        }
      } else if (cluster.provider == 'awssso' &&
          (tokenExpireTimestamp.isBefore(DateTime.now()) ||
              cluster.userToken == '')) {
        final providerConfig =
            providerConfigController.getConfig(cluster.providerConfig);
        if (providerConfig != null && providerConfig.awssso != null) {
          if (providerConfig.awssso!.ssoConfig.client!.clientSecretExpiresAt! *
                  1000 <
              DateTime.now().millisecondsSinceEpoch) {
            Future.error(
                'client secret is expired, you have to re-start the sso flow');
          }

          final credentials = await AWSService().getSSOToken(
            providerConfig.awssso!.accountID,
            providerConfig.awssso!.roleName,
            providerConfig.awssso!.ssoRegion,
            providerConfig.awssso!.ssoConfig.client!.clientId!,
            providerConfig.awssso!.ssoConfig.client!.clientSecret!,
            providerConfig.awssso!.ssoConfig.device!.deviceCode!,
            providerConfig.awssso!.ssoCredentials.accessToken!,
            providerConfig.awssso!.ssoCredentials.accessTokenExpire!,
          );

          Logger.log(
            'KubernetesService _getAccessToken',
            'getSSOToken',
            credentials,
          );

          providerConfig.awssso!.ssoCredentials = credentials;
          providerConfigController.editConfigByName(
            providerConfig.name,
            providerConfig,
          );

          final token = await AWSService().getToken(
            credentials.accessKeyId!,
            credentials.secretAccessKey!,
            providerConfig.awssso!.region,
            credentials.sessionToken!,
            cluster.providerConfigInternal,
          );

          Logger.log(
            'KubernetesService _getAccessToken',
            'getToken',
            credentials,
          );

          clusterController.setNewToken(
            cluster.name,
            token,
            DateTime.now()
                .add(const Duration(minutes: 10))
                .microsecondsSinceEpoch,
          );
          return token;
        } else {
          Future.error('could not get access token');
        }
      } else if (cluster.provider == 'google') {
        final providerConfig =
            providerConfigController.getConfig(cluster.providerConfig);

        if (DateTime.fromMillisecondsSinceEpoch(
                providerConfig!.google!.accessTokenExpires)
            .isBefore(DateTime.now())) {
          final googleTokens = await GoogleService().getTokensFromRefreshToken(
            providerConfig.google!.clientID,
            providerConfig.google!.clientSecret,
            providerConfig.google!.refreshToken,
          );

          Logger.log(
            'KubernetesService _getAccessToken',
            'getToken',
            googleTokens,
          );

          final expires = DateTime.now().millisecondsSinceEpoch +
              googleTokens.expiresIn! * 1000;
          providerConfig.google!.accessToken = googleTokens.accessToken!;
          providerConfig.google!.accessTokenExpires = expires;

          providerConfigController.editConfigByName(
            providerConfig.name,
            providerConfig,
          );

          return googleTokens.accessToken!;
        } else {
          return providerConfig.google!.accessToken;
        }
      } else if (cluster.provider == 'oidc') {
        final providerConfig =
            providerConfigController.getConfig(cluster.providerConfig);

        DateTime? expiryDate = Jwt.getExpiryDate(providerConfig!.oidc!.idToken);

        if (expiryDate != null && expiryDate.isBefore(DateTime.now())) {
          final oidcResponse = await OIDCService().getAccessToken(
            providerConfig.oidc!.discoveryURL,
            providerConfig.oidc!.clientID,
            providerConfig.oidc!.clientSecret,
            providerConfig.oidc!.certificateAuthority,
            providerConfig.oidc!.scopes,
            Constants.oidcRedirectURI,
            providerConfig.oidc!.refreshToken,
          );

          Logger.log(
            'KubernetesService _getAccessToken',
            'getToken',
            oidcResponse,
          );

          if (oidcResponse.idToken != null) {
            providerConfig.oidc!.idToken = oidcResponse.idToken!;
          }

          if (oidcResponse.refreshToken != null &&
              oidcResponse.refreshToken != "") {
            providerConfig.oidc!.refreshToken = oidcResponse.refreshToken!;
          }

          providerConfigController.editConfigByName(
            providerConfig.name,
            providerConfig,
          );

          return oidcResponse.idToken!;
        } else {
          return providerConfig.oidc!.idToken;
        }
      }

      return cluster.userToken;
    } catch (err) {
      Logger.log(
        'KubernetesService _getAccessToken',
        'Could not get access token',
        err,
      );
      return Future.error(err);
    }
  }

  /// [checkHealth] can be used to check the health of a Kubernetes cluster. The health of a cluster can be checked by
  /// calling the `/readyz` endpoint of the cluster. If the cluster is healthy it should return 200, if it isn't healthy
  /// it returns an other response code.
  Future<bool> checkHealth() async {
    try {
      final token = await _getAccessToken();

      final String result = await platform.invokeMethod(
        'kubernetesRequest',
        <String, dynamic>{
          'clusterServer': cluster.clusterServer,
          'clusterCertificateAuthorityData':
              cluster.clusterCertificateAuthorityData,
          'clusterInsecureSkipTLSVerify': cluster.clusterInsecureSkipTLSVerify,
          'userClientCertificateData': cluster.userClientCertificateData,
          'userClientKeyData': cluster.userClientKeyData,
          'userToken': token,
          'userUsername': cluster.userUsername,
          'userPassword': cluster.userPassword,
          'requestMethod': 'GET',
          'requestURL': '/readyz',
          'requestBody': '',
        },
      );

      Logger.log(
        'KubernetesService checkHealth',
        'Health check was ok',
        result,
      );
      return true;
    } catch (err) {
      Logger.log(
        'KubernetesService checkHealth',
        'Health check failed',
        err,
      );
      return Future.error(err);
    }
  }

  /// [getRequest] can be used to run a get request against a Kubernetes cluster. For that a user can pass in the [url],
  /// which should be called, the function then returns an error or a json object of the response from the Kubernetes
  /// API.
  Future<Map<String, dynamic>> getRequest(String url) async {
    try {
      final token = await _getAccessToken();

      final String result = await platform.invokeMethod(
        'kubernetesRequest',
        <String, dynamic>{
          'clusterServer': cluster.clusterServer,
          'clusterCertificateAuthorityData':
              cluster.clusterCertificateAuthorityData,
          'clusterInsecureSkipTLSVerify': cluster.clusterInsecureSkipTLSVerify,
          'userClientCertificateData': cluster.userClientCertificateData,
          'userClientKeyData': cluster.userClientKeyData,
          'userToken': token,
          'userUsername': cluster.userUsername,
          'userPassword': cluster.userPassword,
          'requestMethod': 'GET',
          'requestURL': url,
          'requestBody': '',
        },
      );

      Logger.log(
        'KubernetesService getRequest',
        'Get request was ok',
        result,
      );
      Map<String, dynamic> jsonData = json.decode(result);
      return jsonData;
    } catch (err) {
      Logger.log(
        'KubernetesService getRequest',
        'Get request failed',
        err,
      );
      return Future.error(err);
    }
  }

  /// [deleteRequest] can be used to run a delete request against a Kubernetes cluster. Besides the [url] of the
  /// resource, which should be deleted, we can also pass a [body] to the function. E.g. the body can be used to force
  /// delete a resource. The function doesn't return anything, expect an error in case there was one.
  Future<void> deleteRequest(String url, String? body) async {
    try {
      final token = await _getAccessToken();

      final String result = await platform.invokeMethod(
        'kubernetesRequest',
        <String, dynamic>{
          'clusterServer': cluster.clusterServer,
          'clusterCertificateAuthorityData':
              cluster.clusterCertificateAuthorityData,
          'clusterInsecureSkipTLSVerify': cluster.clusterInsecureSkipTLSVerify,
          'userClientCertificateData': cluster.userClientCertificateData,
          'userClientKeyData': cluster.userClientKeyData,
          'userToken': token,
          'userUsername': cluster.userUsername,
          'userPassword': cluster.userPassword,
          'requestMethod': 'DELETE',
          'requestURL': url,
          'requestBody': body ?? '',
        },
      );

      Logger.log(
        'KubernetesService deleteRequest',
        'Delete request was ok',
        result,
      );
      return;
    } catch (err) {
      Logger.log(
        'KubernetesService deleteRequest',
        'Delete request failed',
        err,
      );
      return Future.error(err);
    }
  }

  /// [patchRequest] can be used to run a patch request against a Kubernetes cluster. Besides the [url] of the resource,
  /// which should be patched, we also have to pass a [body] to the function. The [body] must be a valid json patch.
  Future<void> patchRequest(String url, String body) async {
    try {
      final token = await _getAccessToken();

      final String result = await platform.invokeMethod(
        'kubernetesRequest',
        <String, dynamic>{
          'clusterServer': cluster.clusterServer,
          'clusterCertificateAuthorityData':
              cluster.clusterCertificateAuthorityData,
          'clusterInsecureSkipTLSVerify': cluster.clusterInsecureSkipTLSVerify,
          'userClientCertificateData': cluster.userClientCertificateData,
          'userClientKeyData': cluster.userClientKeyData,
          'userToken': token,
          'userUsername': cluster.userUsername,
          'userPassword': cluster.userPassword,
          'requestMethod': 'PATCH',
          'requestURL': url,
          'requestBody': body,
        },
      );

      Logger.log(
        'KubernetesService patchRequest',
        'Patch request was ok',
        result,
      );
      return;
    } catch (err) {
      Logger.log(
        'KubernetesService patchRequest',
        'Patch request failed',
        err,
      );
      return Future.error(err);
    }
  }

  /// [postRequest] can be used to run a post request against a Kubernetes cluster. Besides the [url] of the resource,
  /// which should be created, we also have to pass a [body] to the function. The [body] must be contain the Kubernetes
  /// manifest which should be created.
  Future<void> postRequest(String url, String body) async {
    try {
      final token = await _getAccessToken();

      final String result = await platform.invokeMethod(
        'kubernetesRequest',
        <String, dynamic>{
          'clusterServer': cluster.clusterServer,
          'clusterCertificateAuthorityData':
              cluster.clusterCertificateAuthorityData,
          'clusterInsecureSkipTLSVerify': cluster.clusterInsecureSkipTLSVerify,
          'userClientCertificateData': cluster.userClientCertificateData,
          'userClientKeyData': cluster.userClientKeyData,
          'userToken': token,
          'userUsername': cluster.userUsername,
          'userPassword': cluster.userPassword,
          'requestMethod': 'POST',
          'requestURL': url,
          'requestBody': body,
        },
      );

      Logger.log(
        'KubernetesService postRequest',
        'Post request was ok',
        result,
      );
      return;
    } catch (err) {
      Logger.log(
        'KubernetesService postRequest',
        'Post request failed',
        err,
      );
      return Future.error(err);
    }
  }

  /// [getLogs] returns the logs for a list of pods (containers). The pod names are must be provided via the [names]
  /// argument, which should be a commans separated list of pod names.
  Future<List<dynamic>> getLogs(
    String names,
    String namespace,
    String container,
    int since,
    String filter,
    bool previous,
  ) async {
    try {
      final token = await _getAccessToken();

      final String result = await platform.invokeMethod(
        'kubernetesGetLogs',
        <String, dynamic>{
          'clusterServer': cluster.clusterServer,
          'clusterCertificateAuthorityData':
              cluster.clusterCertificateAuthorityData,
          'clusterInsecureSkipTLSVerify': cluster.clusterInsecureSkipTLSVerify,
          'userClientCertificateData': cluster.userClientCertificateData,
          'userClientKeyData': cluster.userClientKeyData,
          'userToken': token,
          'userUsername': cluster.userUsername,
          'userPassword': cluster.userPassword,
          'names': names,
          'namespace': namespace,
          'container': container,
          'since': since,
          'filter': filter,
          'previous': previous,
        },
      );

      Logger.log(
        'KubernetesService getLogs',
        'Get logs request was ok',
        result,
      );
      Map<String, dynamic> jsonData = json.decode(result);
      return jsonData['logs'] ?? [];
    } catch (err) {
      Logger.log(
        'KubernetesService getLogs',
        'Get logs request failed',
        err,
      );
      return Future.error(err);
    }
  }

  /// [startServer] starts the internal Go server, which is responsible for features like port forwarding and getting a
  /// shell in a container.
  ///
  /// To start the server we call the `kubernetesStartServer` method, after that we are waiting 3 seconds and check if
  /// the server is healthy. This is necessary, because we directly return when the server is started and we do not have
  /// the chance to wait if the server is really started.
  Future<bool> startServer() async {
    try {
      final isServerHealthy = await _checkServerHealth();
      if (isServerHealthy) {
        return true;
      } else {
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
      return Future.error(err);
    }
  }

  /// [_checkServerHealth] is an internal helper funtion, which checks if our internal http server is healthy. If this
  /// is the case the function returns `true`. If the server is unhealthy it returns `false`.
  ///
  /// The function can be used to determine if the internal http server must be started or if he was started
  /// successfully.
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

  /// [portForwarding] creates a new port forwarding session to the remote port of the given Pod name, by using the
  /// `portforwarding` endpoint of the internal http server.
  Future<Map<String, dynamic>> portForwarding(
      String name, String namespace, int port) async {
    try {
      final token = await _getAccessToken();

      final response = await http.post(
        Uri.parse('http://localhost:14122/portforwarding'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'clusterServer': cluster.clusterServer,
          'clusterCertificateAuthorityData':
              cluster.clusterCertificateAuthorityData,
          'clusterInsecureSkipTLSVerify': cluster.clusterInsecureSkipTLSVerify,
          'userClientCertificateData': cluster.userClientCertificateData,
          'userClientKeyData': cluster.userClientKeyData,
          'userToken': token,
          'userUsername': cluster.userUsername,
          'userPassword': cluster.userPassword,
          'podName': name,
          'podNamespace': namespace,
          'podPort': port,
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
        return Future.error(jsonData);
      }
    } catch (err) {
      Logger.log(
        'KubernetesService portForwarding',
        'An error was returned while establishing the port forwarding connection',
        err,
      );
      return Future.error(err);
    }
  }

  /// [deletePortForwardingSession] deletes a port forwarding session by the given id. This just deletes the session in
  /// our internal http server. The user must take care of the deliting the session also on the client side by calling
  /// the `removeSession` of the `PortForwardingController`.
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
        return Future.error(jsonData);
      }
    } catch (err) {
      Logger.log(
        'KubernetesService deletePortForwardingSession',
        'An error was returned while deleting the port forwarding connection',
        err,
      );
      return Future.error(err);
    }
  }

  /// [getPortForwardingSession] returns a list of session from our internal http server, which can be used to replace
  /// the current list of sessions hold by the `PortForwardingController`.
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
        return Future.error(jsonData);
      }
    } catch (err) {
      Logger.log(
        'KubernetesService getPortForwardingSession',
        'An error was returned while returning port forwarding sessions',
        err,
      );
      return Future.error(err);
    }
  }

  /// [helmListCharts]
  Future<List<Release>> helmListCharts(String namespace) async {
    try {
      final token = await _getAccessToken();

      final String result = await platform.invokeMethod(
        'helmListCharts',
        <String, dynamic>{
          'clusterServer': cluster.clusterServer,
          'clusterCertificateAuthorityData':
              cluster.clusterCertificateAuthorityData,
          'clusterInsecureSkipTLSVerify': cluster.clusterInsecureSkipTLSVerify,
          'userClientCertificateData': cluster.userClientCertificateData,
          'userClientKeyData': cluster.userClientKeyData,
          'userToken': token,
          'userUsername': cluster.userUsername,
          'userPassword': cluster.userPassword,
          'namespace': namespace,
        },
      );

      Logger.log(
        'KubernetesService helmListCharts',
        'List Helm charts was ok',
        result,
      );

      List<dynamic> jsonData = json.decode(result);
      final releases = <Release>[];
      for (var release in jsonData) {
        releases.add(Release.fromJson(release));
      }
      return releases;
    } catch (err) {
      Logger.log(
        'KubernetesService helmListCharts',
        'List Helm charts failed',
        err,
      );
      return Future.error(err);
    }
  }

  /// [helmGetChart]
  Future<Release> helmGetChart(
    String namespace,
    String name,
    int version,
  ) async {
    try {
      final token = await _getAccessToken();

      final String result = await platform.invokeMethod(
        'helmGetChart',
        <String, dynamic>{
          'clusterServer': cluster.clusterServer,
          'clusterCertificateAuthorityData':
              cluster.clusterCertificateAuthorityData,
          'clusterInsecureSkipTLSVerify': cluster.clusterInsecureSkipTLSVerify,
          'userClientCertificateData': cluster.userClientCertificateData,
          'userClientKeyData': cluster.userClientKeyData,
          'userToken': token,
          'userUsername': cluster.userUsername,
          'userPassword': cluster.userPassword,
          'namespace': namespace,
          'name': name,
          'version': version,
        },
      );

      Logger.log(
        'KubernetesService helmGetChart',
        'Get Helm chart was ok',
        result,
      );

      Map<String, dynamic> jsonData = json.decode(result);
      Release release = Release.fromJson(jsonData);
      return release;
    } catch (err) {
      Logger.log(
        'KubernetesService helmGetChart',
        'Get Helm chart failed',
        err,
      );
      return Future.error(err);
    }
  }

  /// [helmGetHistory]
  Future<List<Release>> helmGetHistory(
    String namespace,
    String name,
  ) async {
    try {
      final token = await _getAccessToken();

      final String result = await platform.invokeMethod(
        'helmGetHistory',
        <String, dynamic>{
          'clusterServer': cluster.clusterServer,
          'clusterCertificateAuthorityData':
              cluster.clusterCertificateAuthorityData,
          'clusterInsecureSkipTLSVerify': cluster.clusterInsecureSkipTLSVerify,
          'userClientCertificateData': cluster.userClientCertificateData,
          'userClientKeyData': cluster.userClientKeyData,
          'userToken': token,
          'userUsername': cluster.userUsername,
          'userPassword': cluster.userPassword,
          'namespace': namespace,
          'name': name,
        },
      );

      Logger.log(
        'KubernetesService helmGetHistory',
        'Get Helm history was ok',
        result,
      );

      List<dynamic> jsonData = json.decode(result);
      final releases = <Release>[];
      for (var release in jsonData) {
        releases.add(Release.fromJson(release));
      }
      return releases;
    } catch (err) {
      Logger.log(
        'KubernetesService helmGetHistory',
        'Get Helm history failed',
        err,
      );
      return Future.error(err);
    }
  }
}
