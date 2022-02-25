import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:kubenav/models/cluster_model.dart';

class ClusterService {
  static const platform = MethodChannel('kubenav.io');
  Cluster cluster;

  ClusterService({
    required this.cluster,
  });

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

  Future<void> deleteRequest(String url, String? body) async {}
}
