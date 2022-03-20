import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:kubenav/utils/logger.dart';

/// [AWSCluster] is the format of a single cluster in the list of AWS clusters. Each cluster contains a [endpoint], a
/// [name] and the [certificateAuthority].
class AWSCluster {
  String? name;
  String? endpoint;
  AWSClusterCertificateAuthority? certificateAuthority;

  AWSCluster({
    required this.name,
    required this.endpoint,
    required this.certificateAuthority,
  });

  AWSCluster.fromJson(
    Map<String, dynamic> json,
  ) {
    name = json['Name'];
    endpoint = json['Endpoint'];
    certificateAuthority = json['CertificateAuthority'] != null
        ? AWSClusterCertificateAuthority.fromJson(json['CertificateAuthority'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Name'] = name;
    data['Endpoint'] = endpoint;
    if (certificateAuthority != null) {
      data['CertificateAuthority'] = certificateAuthority!.toJson();
    }
    return data;
  }
}

/// [AWSClusterCertificateAuthority] contains the certificate authority [data] for an AWS cluster.
class AWSClusterCertificateAuthority {
  String? data;

  AWSClusterCertificateAuthority({
    required this.data,
  });

  AWSClusterCertificateAuthority.fromJson(
    Map<String, dynamic> json,
  ) {
    data = json['Data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = <String, dynamic>{};
    jsonData['Data'] = data;
    return jsonData;
  }
}

/// [AWSService] implements a service to interactiv with the AWS functions from our Go code. The implementation details
/// of each Go function can be found in the `cmd/kubenav/aws.go` file.
class AWSService {
  static const platform = MethodChannel('kubenav.io');

  AWSService();

  /// [getClusters] can be used to get all AWS clusters which can be accessed using the provided credentials.
  Future<List<AWSCluster>> getClusters(
    String accessKeyID,
    String secretKey,
    String region,
    String sessionToken,
  ) async {
    try {
      final String result = await platform.invokeMethod(
        'awsGetClusters',
        <String, dynamic>{
          'accessKeyID': accessKeyID,
          'secretKey': secretKey,
          'region': region,
          'sessionToken': sessionToken,
        },
      );

      List<dynamic> tmpClusters = json.decode(result);
      Logger.log(
        'AWSService getClusters',
        '${tmpClusters.length} clusters were returned',
        result,
      );

      List<AWSCluster> clusters = [];
      for (var tmpCluster in tmpClusters) {
        clusters.add(AWSCluster.fromJson(tmpCluster));
      }
      return clusters;
    } catch (err) {
      Logger.log(
        'AWSService getClusters',
        'Could not get AWS clusters',
        err,
      );
      return Future.error(err);
    }
  }

  /// [getToken] can be used to get a token to access the Kubernetes API of an AWS cluster.
  Future<String> getToken(
    String accessKeyID,
    String secretKey,
    String region,
    String sessionToken,
    String clusterID,
  ) async {
    try {
      final String result = await platform.invokeMethod(
        'awsGetToken',
        <String, dynamic>{
          'accessKeyID': accessKeyID,
          'secretKey': secretKey,
          'region': region,
          'sessionToken': sessionToken,
          'clusterID': clusterID,
        },
      );

      Logger.log(
        'AWSService getToken',
        'A new access token was returned',
        result,
      );
      return result;
    } catch (err) {
      Logger.log(
        'AWSService getToken',
        'Could not get access token',
        err,
      );
      return Future.error(err);
    }
  }
}
