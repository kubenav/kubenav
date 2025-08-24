import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:kubenav/utils/logger.dart';

/// [awsRegions] is a list of all available AWS regions. If AWS adds a new
/// region it must be added to this list, so that a user can use the new region.
const awsRegions = [
  'us-east-1',
  'us-east-2',
  'us-west-1',
  'us-west-2',
  'us-gov-east-1',
  'us-gov-west-1',
  'af-south-1',
  'ap-east-1',
  'ap-south-1',
  'ap-northeast-1',
  'ap-northeast-2',
  'ap-northeast-3',
  'ap-southeast-1',
  'ap-southeast-2',
  'ap-southeast-3',
  'ap-southeast-5',
  'ca-central-1',
  'cn-north-1',
  'cn-northwest-1',
  'eu-central-1',
  'eu-west-1',
  'eu-west-2',
  'eu-west-3',
  'eu-south-1',
  'eu-south-2',
  'eu-north-1',
  'me-south-1',
  'sa-east-1',
];

/// [AWSCluster] is the format of a single cluster in the list of AWS clusters.
/// Each cluster contains a [endpoint], a [name] and the [certificateAuthority].
class AWSCluster {
  String? name;
  String? endpoint;
  AWSClusterCertificateAuthority? certificateAuthority;

  AWSCluster({
    required this.name,
    required this.endpoint,
    required this.certificateAuthority,
  });

  factory AWSCluster.fromJson(Map<String, dynamic> data) {
    return AWSCluster(
      name: data.containsKey('Name') ? data['Name'] : null,
      endpoint: data.containsKey('Endpoint') ? data['Endpoint'] : null,
      certificateAuthority:
          data.containsKey('CertificateAuthority') &&
              data['CertificateAuthority'] != null
          ? AWSClusterCertificateAuthority.fromJson(
              data['CertificateAuthority'],
            )
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Endpoint': endpoint,
      'CertificateAuthority': certificateAuthority?.toJson(),
    };
  }
}

/// [AWSClusterCertificateAuthority] contains the certificate authority [data]
/// for an AWS cluster.
class AWSClusterCertificateAuthority {
  String? data;

  AWSClusterCertificateAuthority({required this.data});

  factory AWSClusterCertificateAuthority.fromJson(Map<String, dynamic> data) {
    return AWSClusterCertificateAuthority(
      data: data.containsKey('Data') ? data['Data'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'Data': data};
  }
}

/// [AWSSSOConfig] contains sso configuration for AWS. It contains the [client]
/// and [device] information, which can be used to complete the SSO flow.
class AWSSSOConfig {
  AWSSSOConfigClient? client;
  AWSSSOConfigDevice? device;

  AWSSSOConfig({required this.client, required this.device});

  factory AWSSSOConfig.fromJson(Map<String, dynamic> data) {
    return AWSSSOConfig(
      client: data.containsKey('client') && data['client'] != null
          ? AWSSSOConfigClient.fromJson(data['client'])
          : null,
      device: data.containsKey('device') && data['device'] != null
          ? AWSSSOConfigDevice.fromJson(data['device'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'client': client?.toJson(), 'device': device?.toJson()};
  }
}

/// [AWSSSOConfigClient] contains the client information for the AWS SSO flow.
/// This includes the [clientId], [clientIdIssuedAt], [clientSecret] and
/// [clientSecretExpiresAt].
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

  factory AWSSSOConfigClient.fromJson(Map<String, dynamic> data) {
    return AWSSSOConfigClient(
      clientId: data.containsKey('ClientId') ? data['ClientId'] : null,
      clientIdIssuedAt: data.containsKey('ClientIdIssuedAt')
          ? data['ClientIdIssuedAt']
          : null,
      clientSecret: data.containsKey('ClientSecret')
          ? data['ClientSecret']
          : null,
      clientSecretExpiresAt: data.containsKey('ClientSecretExpiresAt')
          ? data['ClientSecretExpiresAt']
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ClientId': clientId,
      'ClientIdIssuedAt': clientIdIssuedAt,
      'ClientSecret': clientSecret,
      'ClientSecretExpiresAt': clientSecretExpiresAt,
    };
  }
}

/// [AWSSSOConfigDevice] contains the device information for the AWS SSO flow.
/// This includes the [deviceCode], [expiresIn], [interval], [userCode] and
/// [verificationUri] and [verificationUriComplete].
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

  factory AWSSSOConfigDevice.fromJson(Map<String, dynamic> data) {
    return AWSSSOConfigDevice(
      deviceCode: data.containsKey('DeviceCode') ? data['DeviceCode'] : null,
      expiresIn: data.containsKey('ExpiresIn') ? data['ExpiresIn'] : null,
      interval: data.containsKey('Interval') ? data['Interval'] : null,
      userCode: data.containsKey('UserCode') ? data['UserCode'] : null,
      verificationUri: data.containsKey('VerificationUri')
          ? data['VerificationUri']
          : null,
      verificationUriComplete: data.containsKey('VerificationUriComplete')
          ? data['VerificationUriComplete']
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'DeviceCode': deviceCode,
      'ExpiresIn': expiresIn,
      'Interval': interval,
      'UserCode': userCode,
      'VerificationUri': verificationUri,
      'VerificationUriComplete': verificationUriComplete,
    };
  }
}

/// [AWSSSOCredentials] contains the credentials returned by the sso flow to
/// access the AWS API.
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

  factory AWSSSOCredentials.fromJson(Map<String, dynamic> data) {
    return AWSSSOCredentials(
      accessKeyId: data.containsKey('accessKeyId') ? data['accessKeyId'] : null,
      secretAccessKey: data.containsKey('secretAccessKey')
          ? data['secretAccessKey']
          : null,
      sessionToken: data.containsKey('sessionToken')
          ? data['sessionToken']
          : null,
      expire: data.containsKey('expire') ? data['expire'] : null,
      accessToken: data.containsKey('accessToken') ? data['accessToken'] : null,
      accessTokenExpire: data.containsKey('accessTokenExpire')
          ? data['accessTokenExpire']
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessKeyId': accessKeyId,
      'secretAccessKey': secretAccessKey,
      'sessionToken': sessionToken,
      'expire': expire,
      'accessToken': accessToken,
      'accessTokenExpire': accessTokenExpire,
    };
  }
}

/// [AWSSSOAccount] represents a account including all roles which can be used
/// to create a new AWS SSO provider.
class AWSSSOAccount {
  String? accountId;
  String? accountName;
  List<String>? roles;
  String? accessToken;
  int? accessTokenExpire;

  AWSSSOAccount({
    required this.accountId,
    required this.accountName,
    required this.roles,
    required this.accessToken,
    required this.accessTokenExpire,
  });

  factory AWSSSOAccount.fromJson(Map<String, dynamic> data) {
    return AWSSSOAccount(
      accountId: data.containsKey('accountId') ? data['accountId'] : null,
      accountName: data.containsKey('accountName') ? data['accountName'] : null,
      roles: data.containsKey('roles')
          ? List<String>.from(data['roles'].map((v) => v))
          : null,
      accessToken: data.containsKey('accessToken') ? data['accessToken'] : null,
      accessTokenExpire: data.containsKey('accessTokenExpire')
          ? data['accessTokenExpire']
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accountId': accountId,
      'accountName': accountName,
      'roles': roles,
      'accessToken': accessToken,
      'accessTokenExpire': accessTokenExpire,
    };
  }
}

/// [AWSService] implements a service to interactiv with the AWS functions from
/// our Go code. The implementation details of each Go function can be found in
/// the `cmd/kubenav/aws.go` file.
class AWSService {
  static const platform = MethodChannel('kubenav.io');

  /// [getClusters] can be used to get all AWS clusters which can be accessed
  /// using the provided credentials.
  Future<List<AWSCluster>> getClusters(
    String accessKeyID,
    String secretKey,
    String region,
    String sessionToken,
    String roleArn,
  ) async {
    try {
      final String result = await platform
          .invokeMethod('awsGetClusters', <String, dynamic>{
            'accessKeyID': accessKeyID,
            'secretKey': secretKey,
            'region': region,
            'sessionToken': sessionToken,
            'roleArn': roleArn,
          });

      Logger.log('AWSService getClusters', 'Clusters Returned', result);

      if (result.isEmpty) {
        throw Exception('An unknown error occured');
      }

      List<dynamic> tmpClusters = json.decode(result);
      List<AWSCluster> clusters = [];
      for (var tmpCluster in tmpClusters) {
        clusters.add(AWSCluster.fromJson(tmpCluster));
      }
      return clusters;
    } catch (err) {
      Logger.log('AWSService getClusters', 'Failed to Get AWS Clusters', err);
      rethrow;
    }
  }

  /// [getToken] can be used to get a token to access the Kubernetes API of an
  /// AWS cluster.
  Future<String> getToken(
    String accessKeyID,
    String secretKey,
    String region,
    String sessionToken,
    String roleArn,
    String clusterID,
  ) async {
    try {
      final String result = await platform
          .invokeMethod('awsGetToken', <String, dynamic>{
            'accessKeyID': accessKeyID,
            'secretKey': secretKey,
            'region': region,
            'sessionToken': sessionToken,
            'roleArn': roleArn,
            'clusterID': clusterID,
          });

      Logger.log('AWSService getToken', 'New Access Token Returned', result);

      if (result.isEmpty) {
        throw Exception('An unknown error occured');
      }

      return result;
    } catch (err) {
      Logger.log('AWSService getToken', 'Failed to Get Access Token', err);
      rethrow;
    }
  }

  /// [getSSOConfig] can be used to get the sso config which can be used with
  /// the AWS SSO provider.
  Future<AWSSSOConfig> getSSOConfig(String ssoRegion, String startURL) async {
    try {
      final String result = await platform.invokeMethod(
        'awsGetSSOConfig',
        <String, dynamic>{'ssoRegion': ssoRegion, 'startURL': startURL},
      );

      Logger.log('AWSService getSSOConfig', 'SSO Config Returned', result);

      if (result.isEmpty) {
        throw Exception('An unknown error occured');
      }

      Map<String, dynamic> jsonData = json.decode(result);
      AWSSSOConfig tmpSSOConfig = AWSSSOConfig.fromJson(jsonData);
      return tmpSSOConfig;
    } catch (err) {
      Logger.log('AWSService getSSOConfig', 'Failed to Get SSO Config', err);
      rethrow;
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
      final String result = await platform
          .invokeMethod('awsGetSSOToken', <String, dynamic>{
            'accountID': accountID,
            'roleName': roleName,
            'ssoRegion': ssoRegion,
            'ssoClientID': ssoClientID,
            'ssoClientSecret': ssoClientSecret,
            'ssoDeviceCode': ssoDeviceCode,
            'accessToken': accessToken,
            'accessTokenExpire': accessTokenExpire,
          });

      Logger.log('AWSService getSSOToken', 'SSO Token Returned', result);

      if (result.isEmpty) {
        throw Exception('An unknown error occured');
      }

      Map<String, dynamic> jsonData = json.decode(result);
      AWSSSOCredentials tmpSSOCredentials = AWSSSOCredentials.fromJson(
        jsonData,
      );
      return tmpSSOCredentials;
    } catch (err) {
      Logger.log('AWSService getSSOToken', 'Failed to Get SSO Token', err);
      rethrow;
    }
  }

  /// [getSSOAccounts] can be used to get a list of AWS SSO accounts and all the
  /// available roles for a user.
  Future<List<AWSSSOAccount>> getSSOAccounts(
    String ssoRegion,
    String ssoClientID,
    String ssoClientSecret,
    String ssoDeviceCode,
  ) async {
    try {
      final String result = await platform
          .invokeMethod('awsGetSSOAccounts', <String, dynamic>{
            'ssoRegion': ssoRegion,
            'ssoClientID': ssoClientID,
            'ssoClientSecret': ssoClientSecret,
            'ssoDeviceCode': ssoDeviceCode,
          });

      Logger.log('AWSService getSSOAccounts', 'Accounts Returned', result);

      if (result.isEmpty) {
        throw Exception('An unknown error occured');
      }

      List<dynamic> jsonData = json.decode(result);
      final accounts = <AWSSSOAccount>[];
      for (var account in jsonData) {
        accounts.add(AWSSSOAccount.fromJson(account));
      }
      return accounts;
    } catch (err) {
      Logger.log(
        'AWSService getSSOAccounts',
        'Failed to Get AWS SSO Accounts',
        err,
      );
      rethrow;
    }
  }
}
