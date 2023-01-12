import 'dart:async';

import 'package:flutter/services.dart';

import 'package:kubenav/models/cluster.dart';
import 'package:kubenav/utils/logger.dart';

class KubenavMobile {
  static const platform = MethodChannel('kubenav.io');

  Future<String> kubernetesRequest(
    Cluster cluster,
    String proxy,
    int timeout,
    String method,
    String url,
    String body,
  ) async {
    Logger.log(
      'KubenavMobile kubernetesRequest',
      'Run kubernetesRequest function',
      '${cluster.name}, $method, $url, $body',
    );

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
        'proxy': proxy,
        'timeout': timeout,
        'requestMethod': method,
        'requestURL': url,
        'requestBody': body,
      },
    );

    Logger.log(
      'KubenavMobile kubernetesRequest',
      'Result of the kubernetesRequest function',
      result,
    );

    return result;
  }

  Future<String> kubernetesGetLogs(
    Cluster cluster,
    String proxy,
    int timeout,
    String names,
    String namespace,
    String container,
    int since,
    String filter,
    bool previous,
  ) async {
    Logger.log(
      'KubenavMobile kubernetesGetLogs',
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
      'KubenavMobile kubernetesGetLogs',
      'Get logs request was ok',
      result,
    );

    return result;
  }

  Future<void> kubernetesStartServer() async {
    Logger.log(
      'KubenavMobile kubernetesStartServer',
      'Run kubernetesStartServer function',
    );

    await platform.invokeMethod('kubernetesStartServer');

    Logger.log(
      'KubenavMobile startServer',
      'Internal http server was started',
    );
  }

  Future<String> prettifyYAML(String jsonStr) async {
    Logger.log(
      'KubenavMobile prettifyYAML',
      'Run prettifyYAML function',
      jsonStr,
    );

    final String result = await platform.invokeMethod(
      'prettifyYAML',
      <String, dynamic>{
        'jsonStr': jsonStr,
      },
    );

    Logger.log(
      'KubenavMobile prettifyYAML',
      'Yaml was prettifyed',
      result,
    );
    return result;
  }

  Future<String> createJSONPatch(String source, String target) async {
    Logger.log(
      'KubenavMobile createJSONPatch',
      'Run createJSONPatch function',
      '$source, $target',
    );

    final String result = await platform.invokeMethod(
      'createJSONPatch',
      <String, dynamic>{
        'source': source,
        'target': target,
      },
    );

    Logger.log(
      'KubenavMobile createJSONPatch',
      'Json patch was created',
      result,
    );
    return result;
  }

  Future<String> helmListCharts(
    Cluster cluster,
    String proxy,
    int timeout,
    String namespace,
  ) async {
    Logger.log(
      'KubenavMobile helmListCharts',
      'Run helmListCharts function',
      '${cluster.name}, $namespace',
    );

    final String result = await platform.invokeMethod(
      'helmListCharts',
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

    Logger.log(
      'KubenavMobile helmListCharts',
      'List Helm charts was ok',
      result,
    );

    return result;
  }

  Future<String> helmGetChart(
    Cluster cluster,
    String proxy,
    int timeout,
    String namespace,
    String name,
    int version,
  ) async {
    Logger.log(
      'KubenavMobile helmGetChart',
      'Run helmGetChart function',
      '${cluster.name}, $namespace, $name, $version',
    );
    final String result = await platform.invokeMethod(
      'helmGetChart',
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

    Logger.log(
      'KubenavMobile helmGetChart',
      'Get Helm chart was ok',
      result,
    );

    return result;
  }

  Future<String> helmGetHistory(
    Cluster cluster,
    String proxy,
    int timeout,
    String namespace,
    String name,
  ) async {
    Logger.log(
      'KubenavMobile helmGetHistory',
      'Run helmGetHistory function',
      '${cluster.name}, $namespace, $name',
    );

    final String result = await platform.invokeMethod(
      'helmGetHistory',
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
      'KubenavMobile helmGetHistory',
      'Get Helm history was ok',
      result,
    );

    return result;
  }

  Future<String> prometheusGetData(
    Cluster cluster,
    String proxy,
    int timeout,
    String request,
  ) async {
    Logger.log(
      'KubenavMobile prometheusGetData',
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
      'KubenavMobile prometheusGetData',
      'List Helm charts was ok',
      result,
    );

    return result;
  }
}
