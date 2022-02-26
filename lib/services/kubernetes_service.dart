import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:kubenav/models/cluster_model.dart';

// KubernetesService implements a service to interactiv with the Kubernetes functions from our Go code. The
// implementation details of each Go function can be found in the 'cmd/kubenav/helpers.go' file.
//
// To use the KubernetesService a user must provide a Kubernetes cluster during the initialization of the service.
class KubernetesService {
  static const platform = MethodChannel('kubenav.io');
  Cluster cluster;

  KubernetesService({
    required this.cluster,
  });

  // checkHealth can be used to check the health of a Kubernetes cluster. The health of a cluster can be checked by
  // calling the '/readyz' endpoint of the cluster. If the cluster is healthy it should return 200, if it isn't healthy
  // it returns an other response code.
  Future<bool> checkHealth() async {
    try {
      final String result = await platform.invokeMethod(
        'kubernetesRequest',
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
          'requestMethod': 'GET',
          'requestURL': '/readyz',
          'requestBody': '',
        },
      );

      debugPrint('checkHealth result: $result');
      return true;
    } catch (err) {
      debugPrint('checkHealth error: $err');
      return Future.error(err);
    }
  }

  // getRequest can be used to run a get request against a Kubernetes cluster. For that a user can pass in the url,
  // which should be called, the function then returns an error or a json object of the response from the Kubernetes
  // API.
  Future<Map<String, dynamic>> getRequest(String url) async {
    try {
      final String result = await platform.invokeMethod(
        'kubernetesRequest',
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
          'requestMethod': 'GET',
          'requestURL': url,
          'requestBody': '',
        },
      );

      debugPrint('getRequest result: $result');
      Map<String, dynamic> jsonData = json.decode(result);
      return jsonData;
    } catch (err) {
      debugPrint('getRequest error: $err');
      return Future.error(err);
    }
  }

  // deleteRequest can be used to run a delete request against a Kubernetes cluster. Besides the url of the resource,
  // which should be deleted, we can also pass a body to the function. E.g. the body can be used to force delete a
  // resource. The function doesn't return anything, expect an error in case there was one.
  Future<void> deleteRequest(String url, String? body) async {
    try {
      final String result = await platform.invokeMethod(
        'kubernetesRequest',
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
          'requestMethod': 'DELETE',
          'requestURL': url,
          'requestBody': body ?? '',
        },
      );

      debugPrint('deleteRequest result: $result');
      return;
    } catch (err) {
      debugPrint('deleteRequest error: $err');
      return Future.error(err);
    }
  }
}
