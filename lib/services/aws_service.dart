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

/// [AWSSSOConfig] contains sso configuration for AWS. It contains the [client] and [device] information, which can be
/// used to complete the SSO flow.
class AWSSSOConfig {
  AWSSSOConfigClient? client;
  AWSSSOConfigDevice? device;

  AWSSSOConfig({
    required this.client,
    required this.device,
  });

  AWSSSOConfig.fromJson(
    Map<String, dynamic> json,
  ) {
    client = AWSSSOConfigClient.fromJson(json['client']);
    device = AWSSSOConfigDevice.fromJson(json['device']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = <String, dynamic>{};
    if (client != null) {
      jsonData['client'] = client!.toJson();
    }
    if (device != null) {
      jsonData['device'] = device!.toJson();
    }
    return jsonData;
  }
}

/// [AWSSSOConfigClient] contains the client information for the AWS SSO flow. This includes the [clientId],
/// [clientIdIssuedAt], [clientSecret] and [clientSecretExpiresAt].
class AWSSSOConfigClient {
  String? clientId;
  int? clientIdIssuedAt;
  String? clientSecret;
  int? clientSecretExpiresAt;

  AWSSSOConfigClient({
    required this.clientId,
    required this.clientIdIssuedAt,
    required this.clientSecret,
    required this.clientSecretExpiresAt,
  });

  AWSSSOConfigClient.fromJson(Map<String, dynamic> json) {
    clientId = json['ClientId'];
    clientIdIssuedAt = json['ClientIdIssuedAt'];
    clientSecret = json['ClientSecret'];
    clientSecretExpiresAt = json['ClientSecretExpiresAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = <String, dynamic>{};
    jsonData['ClientId'] = clientId;
    jsonData['ClientIdIssuedAt'] = clientIdIssuedAt;
    jsonData['ClientSecret'] = clientSecret;
    jsonData['ClientSecretExpiresAt'] = clientSecretExpiresAt;
    return jsonData;
  }
}

/// [AWSSSOConfigDevice] contains the device information for the AWS SSO flow. This includes the [deviceCode],
/// [expiresIn], [interval], [userCode] and [verificationUri] and [verificationUriComplete].
class AWSSSOConfigDevice {
  String? deviceCode;
  int? expiresIn;
  int? interval;
  String? userCode;
  String? verificationUri;
  String? verificationUriComplete;

  AWSSSOConfigDevice({
    required this.deviceCode,
    required this.expiresIn,
    required this.interval,
    required this.userCode,
    required this.verificationUri,
    required this.verificationUriComplete,
  });

  AWSSSOConfigDevice.fromJson(Map<String, dynamic> json) {
    deviceCode = json['DeviceCode'];
    expiresIn = json['ExpiresIn'];
    interval = json['Interval'];
    userCode = json['UserCode'];
    verificationUri = json['VerificationUri'];
    verificationUriComplete = json['VerificationUriComplete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = <String, dynamic>{};
    jsonData['DeviceCode'] = deviceCode;
    jsonData['ExpiresIn'] = expiresIn;
    jsonData['Interval'] = interval;
    jsonData['UserCode'] = userCode;
    jsonData['VerificationUri'] = verificationUri;
    jsonData['VerificationUriComplete'] = verificationUriComplete;
    return jsonData;
  }
}

/// [AWSSSOCredentials] contains the credentials returned by the sso flow to access the AWS API.
class AWSSSOCredentials {
  String? accessKeyId;
  String? secretAccessKey;
  String? sessionToken;
  int? expire;
  String? accessToken;
  int? accessTokenExpire;

  AWSSSOCredentials({
    required this.accessKeyId,
    required this.secretAccessKey,
    required this.sessionToken,
    required this.expire,
    required this.accessToken,
    required this.accessTokenExpire,
  });

  AWSSSOCredentials.fromJson(Map<String, dynamic> json) {
    accessKeyId = json['accessKeyId'];
    secretAccessKey = json['secretAccessKey'];
    sessionToken = json['sessionToken'];
    expire = json['expire'];
    accessToken = json['accessToken'];
    accessTokenExpire = json['accessTokenExpire'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = <String, dynamic>{};
    jsonData['accessKeyId'] = accessKeyId;
    jsonData['secretAccessKey'] = secretAccessKey;
    jsonData['sessionToken'] = sessionToken;
    jsonData['expire'] = expire;
    jsonData['accessToken'] = accessToken;
    jsonData['accessTokenExpire'] = accessTokenExpire;
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

  /// [getSSOConfig] can be used to get the sso config which can be used with the AWS SSO provider.
  Future<AWSSSOConfig> getSSOConfig(
    String ssoRegion,
    String startURL,
  ) async {
    try {
      final String result = await platform.invokeMethod(
        'awsGetSSOConfig',
        <String, dynamic>{
          'ssoRegion': ssoRegion,
          'startURL': startURL,
        },
      );

      Logger.log(
        'AWSService getSSOConfig',
        'SSO config was returned',
        result,
      );

      Map<String, dynamic> jsonData = json.decode(result);
      AWSSSOConfig tmpSSOConfig = AWSSSOConfig.fromJson(jsonData);
      return tmpSSOConfig;
    } catch (err) {
      Logger.log(
        'AWSService getSSOConfig',
        'Could not get SSO config',
        err,
      );
      return Future.error(err);
    }
  }

  /// [getSSOToken] can be used to get the sso token for an AWS SSO provider.
  Future<AWSSSOCredentials> getSSOToken(
    String accountID,
    String roleName,
    String ssoRegion,
    String ssoClientID,
    String ssoClientSecret,
    String ssoDeviceCode,
    String accessToken,
    int accessTokenExpire,
  ) async {
    try {
      final String result = await platform.invokeMethod(
        'awsGetSSOToken',
        <String, dynamic>{
          'accountID': accountID,
          'roleName': roleName,
          'ssoRegion': ssoRegion,
          'ssoClientID': ssoClientID,
          'ssoClientSecret': ssoClientSecret,
          'ssoDeviceCode': ssoDeviceCode,
          'accessToken': accessToken,
          'accessTokenExpire': accessTokenExpire,
        },
      );

      Logger.log(
        'AWSService getSSOToken',
        'SSO token was returned',
        result,
      );

      Map<String, dynamic> jsonData = json.decode(result);
      AWSSSOCredentials tmpSSOCredentials =
          AWSSSOCredentials.fromJson(jsonData);
      return tmpSSOCredentials;
    } catch (err) {
      Logger.log(
        'AWSService getSSOToken',
        'Could not get SSO token',
        err,
      );
      return Future.error(err);
    }
  }
}
