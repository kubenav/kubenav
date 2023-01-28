import 'package:kubenav/services/providers/aws_service.dart';

/// A [ClusterProvider] is the model with the configuration for all supported
/// [ClusterProviderType]s. The cluster provider contains all information to get
/// an access token for a specific privider, so that we can access the provider
/// API to get a list of clusters and to authenticate the Kubernetes requests
/// of an user.
class ClusterProvider {
  String? id;
  String? name;
  ClusterProviderType? type;
  ClusterProviderAWS? aws;
  ClusterProviderAWSSSO? awssso;
  ClusterProviderAzure? azure;
  ClusterProviderDigitalOcean? digitalocean;
  ClusterProviderGoogle? google;
  ClusterProviderOIDC? oidc;
  ClusterProviderRancher? rancher;

  ClusterProvider({
    required this.id,
    required this.name,
    required this.type,
    this.aws,
    this.awssso,
    this.azure,
    this.digitalocean,
    this.google,
    this.oidc,
    this.rancher,
  });

  factory ClusterProvider.fromJson(Map<String, dynamic> data) {
    return ClusterProvider(
      id: data.containsKey('id') ? data['id'] : null,
      name: data.containsKey('name') ? data['name'] : null,
      type: data.containsKey('type')
          ? getClusterProviderType(data['type'])
          : null,
      aws: data.containsKey('aws') && data['aws'] != null
          ? ClusterProviderAWS.fromJson(data['aws'])
          : null,
      awssso: data.containsKey('awssso') && data['awssso'] != null
          ? ClusterProviderAWSSSO.fromJson(data['awssso'])
          : null,
      azure: data.containsKey('azure') && data['azure'] != null
          ? ClusterProviderAzure.fromJson(data['azure'])
          : null,
      digitalocean:
          data.containsKey('digitalocean') && data['digitalocean'] != null
              ? ClusterProviderDigitalOcean.fromJson(data['digitalocean'])
              : null,
      google: data.containsKey('google') && data['google'] != null
          ? ClusterProviderGoogle.fromJson(data['google'])
          : null,
      oidc: data.containsKey('oidc') && data['oidc'] != null
          ? ClusterProviderOIDC.fromJson(data['oidc'])
          : null,
      rancher: data.containsKey('rancher') && data['rancher'] != null
          ? ClusterProviderRancher.fromJson(data['rancher'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type?.toShortString(),
      'aws': aws?.toJson(),
      'awssso': awssso?.toJson(),
      'azure': azure?.toJson(),
      'digitalocean': digitalocean?.toJson(),
      'google': google?.toJson(),
      'oidc': oidc?.toJson(),
      'rancher': rancher?.toJson(),
    };
  }
}

/// A [ClusterProviderAWS] represents the provider configuration for the
/// [ClusterProviderType.aws] provider. To get the clusters from AWS we need the
/// [accessKeyID], [secretKey], [region] and a optional [sessionToken].
class ClusterProviderAWS {
  String? accessKeyID;
  String? secretKey;
  String? region;
  String? sessionToken;
  String? roleArn;

  ClusterProviderAWS({
    required this.accessKeyID,
    required this.secretKey,
    required this.region,
    required this.sessionToken,
    required this.roleArn,
  });

  factory ClusterProviderAWS.fromJson(Map<String, dynamic> data) {
    return ClusterProviderAWS(
      accessKeyID: data.containsKey('accessKeyID') ? data['accessKeyID'] : null,
      secretKey: data.containsKey('secretKey') ? data['secretKey'] : null,
      region: data.containsKey('region') ? data['region'] : null,
      sessionToken:
          data.containsKey('sessionToken') ? data['sessionToken'] : null,
      roleArn: data.containsKey('roleArn') ? data['roleArn'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessKeyID': accessKeyID,
      'secretKey': secretKey,
      'region': region,
      'sessionToken': sessionToken,
      'roleArn': roleArn,
    };
  }
}

/// A [ClusterProviderAWSSSO] represents the provider configuration for the
/// [ClusterProviderType.awssso] provider. To authenticate the user via AWS SSO
/// we need the [startURL], [accountID], [roleName], [ssoRegion] and [region].
/// These values are then used to generate the [ssoConfig] and [ssoCredentials].
class ClusterProviderAWSSSO {
  String? startURL;
  String? accountID;
  String? roleName;
  String? ssoRegion;
  String? region;
  AWSSSOConfig? ssoConfig;
  AWSSSOCredentials? ssoCredentials;

  ClusterProviderAWSSSO({
    required this.startURL,
    required this.accountID,
    required this.roleName,
    required this.ssoRegion,
    required this.region,
    required this.ssoConfig,
    required this.ssoCredentials,
  });

  factory ClusterProviderAWSSSO.fromJson(Map<String, dynamic> data) {
    return ClusterProviderAWSSSO(
      startURL: data.containsKey('startURL') ? data['startURL'] : null,
      accountID: data.containsKey('accountID') ? data['accountID'] : null,
      roleName: data.containsKey('roleName') ? data['roleName'] : null,
      ssoRegion: data.containsKey('ssoRegion') ? data['ssoRegion'] : null,
      region: data.containsKey('region') ? data['region'] : null,
      ssoConfig: data.containsKey('ssoConfig') && data['ssoConfig'] != null
          ? AWSSSOConfig.fromJson(data['ssoConfig'])
          : null,
      ssoCredentials:
          data.containsKey('ssoCredentials') && data['ssoCredentials'] != null
              ? AWSSSOCredentials.fromJson(data['ssoCredentials'])
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'startURL': startURL,
      'accountID': accountID,
      'roleName': roleName,
      'ssoRegion': ssoRegion,
      'region': region,
      'ssoConfig': ssoConfig?.toJson(),
      'ssoCredentials': ssoCredentials?.toJson(),
    };
  }
}

/// A [ClusterProviderAzure] represents the provider configuration for the
/// [ClusterProviderType.azure] provider. To get the clusters from Azure we need
/// the [subscriptionID], [tenantID], [clientID], [clientSecret]. The user can
/// also set the [isAdmin] flag so that we load the cluster admin configuration
/// instead of the "normal" one.
class ClusterProviderAzure {
  String? subscriptionID;
  String? tenantID;
  String? clientID;
  String? clientSecret;
  bool? isAdmin;

  ClusterProviderAzure({
    required this.subscriptionID,
    required this.tenantID,
    required this.clientID,
    required this.clientSecret,
    required this.isAdmin,
  });

  factory ClusterProviderAzure.fromJson(Map<String, dynamic> data) {
    return ClusterProviderAzure(
      subscriptionID:
          data.containsKey('subscriptionID') ? data['subscriptionID'] : null,
      tenantID: data.containsKey('tenantID') ? data['tenantID'] : null,
      clientID: data.containsKey('clientID') ? data['clientID'] : null,
      clientSecret:
          data.containsKey('clientSecret') ? data['clientSecret'] : null,
      isAdmin: data.containsKey('isAdmin') ? data['isAdmin'] : false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subscriptionID': subscriptionID,
      'tenantID': tenantID,
      'clientID': clientID,
      'clientSecret': clientSecret,
      'isAdmin': isAdmin,
    };
  }
}

/// A [ClusterProviderDigitalOcean] represents the provider configuration for
/// the [ClusterProviderType.digitalocean] provider. To get the clusters from
/// DigitalOcean an API [token] is required.
class ClusterProviderDigitalOcean {
  String? token;

  ClusterProviderDigitalOcean({
    required this.token,
  });

  factory ClusterProviderDigitalOcean.fromJson(Map<String, dynamic> data) {
    return ClusterProviderDigitalOcean(
      token: data.containsKey('token') ? data['token'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
    };
  }
}

/// A [ClusterProviderGoogle] represents the provider configuration for the
/// [ClusterProviderType.google] provider. To get the clusters from Google an
/// API [clientID] and [clientSecret] is required. All other values are
/// retrieved during the authentication process.
class ClusterProviderGoogle {
  String? clientID;
  String? clientSecret;
  String? code;
  String? accessToken;
  int? accessTokenExpires;
  String? refreshToken;

  ClusterProviderGoogle({
    required this.clientID,
    required this.clientSecret,
    required this.code,
    required this.accessToken,
    required this.accessTokenExpires,
    required this.refreshToken,
  });

  factory ClusterProviderGoogle.fromJson(Map<String, dynamic> data) {
    return ClusterProviderGoogle(
      clientID: data.containsKey('clientID') ? data['clientID'] : null,
      clientSecret:
          data.containsKey('clientSecret') ? data['clientSecret'] : null,
      code: data.containsKey('code') ? data['code'] : null,
      accessToken: data.containsKey('accessToken') ? data['accessToken'] : null,
      accessTokenExpires: data.containsKey('accessTokenExpires')
          ? data['accessTokenExpires']
          : null,
      refreshToken:
          data.containsKey('refreshToken') ? data['refreshToken'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'clientID': clientID,
      'clientSecret': clientSecret,
      'code': code,
      'accessToken': accessToken,
      'accessTokenExpires': accessTokenExpires,
      'refreshToken': refreshToken,
    };
  }
}

/// A [ClusterProviderOIDC] represents the provider configuration for the
/// [ClusterProviderType.oidc] provider.
class ClusterProviderOIDC {
  String? discoveryURL;
  String? clientID;
  String? clientSecret;
  String? certificateAuthority;
  String? scopes;
  String? pkceMethod;
  String? verifier;
  String? code;
  String? idToken;
  String? refreshToken;

  ClusterProviderOIDC({
    required this.discoveryURL,
    required this.clientID,
    required this.clientSecret,
    required this.certificateAuthority,
    required this.scopes,
    required this.pkceMethod,
    required this.verifier,
    required this.code,
    required this.idToken,
    required this.refreshToken,
  });

  factory ClusterProviderOIDC.fromJson(Map<String, dynamic> data) {
    return ClusterProviderOIDC(
      discoveryURL:
          data.containsKey('discoveryURL') ? data['discoveryURL'] : null,
      clientID: data.containsKey('clientID') ? data['clientID'] : null,
      clientSecret:
          data.containsKey('clientSecret') ? data['clientSecret'] : null,
      certificateAuthority: data.containsKey('certificateAuthority')
          ? data['certificateAuthority']
          : null,
      scopes: data.containsKey('scopes') ? data['scopes'] : null,
      pkceMethod: data.containsKey('pkceMethod') ? data['pkceMethod'] : null,
      verifier: data.containsKey('verifier') ? data['verifier'] : null,
      code: data.containsKey('code') ? data['code'] : null,
      idToken: data.containsKey('idToken') ? data['idToken'] : null,
      refreshToken:
          data.containsKey('refreshToken') ? data['refreshToken'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'discoveryURL': discoveryURL,
      'clientID': clientID,
      'clientSecret': clientSecret,
      'certificateAuthority': certificateAuthority,
      'scopes': scopes,
      'pkceMethod': pkceMethod,
      'verifier': verifier,
      'code': code,
      'idToken': idToken,
      'refreshToken': refreshToken,
    };
  }
}

/// A [ClusterProviderRancher] represents the provider configuration for the
/// [ClusterProviderType.rancher] provider.
class ClusterProviderRancher {
  String? serverAddress;
  bool? allowInsecureConnections;
  String? username;
  String? password;
  String? token;

  ClusterProviderRancher({
    required this.serverAddress,
    required this.allowInsecureConnections,
    required this.username,
    required this.password,
    required this.token,
  });

  factory ClusterProviderRancher.fromJson(Map<String, dynamic> data) {
    return ClusterProviderRancher(
      serverAddress:
          data.containsKey('serverAddress') ? data['serverAddress'] : null,
      allowInsecureConnections: data.containsKey('allowInsecureConnections')
          ? data['allowInsecureConnections']
          : false,
      username: data.containsKey('username') ? data['username'] : null,
      password: data.containsKey('password') ? data['password'] : null,
      token: data.containsKey('token') ? data['token'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'serverAddress': serverAddress,
      'allowInsecureConnections': allowInsecureConnections,
      'username': username,
      'password': password,
      'token': token,
    };
  }
}

/// [ClusterProviderType] is an enum value which represents all supported
/// cluster providers. This means clusters can only be added via one of the
/// supported types.
///
/// The supported providers are: [kubeconfig], [google], [aws], [awssso],
/// [azure], [oidc], [digitalocean] and [manual].
enum ClusterProviderType {
  kubeconfig,
  google,
  aws,
  awssso,
  azure,
  oidc,
  digitalocean,
  rancher,
  manual,
}

extension ClusterProviderTypeExtension on ClusterProviderType {
  /// [toShortString] returns a short string of the cluster provider type, so
  /// that we can use the type within the json encode and decode functions.
  String toShortString() {
    return toString().split('.').last;
  }

  /// [title] returns the title for the [ClusterProviderType] enum value.
  String title() {
    switch (this) {
      case ClusterProviderType.kubeconfig:
        return 'Kubeconfig';
      case ClusterProviderType.google:
        return 'Google Cloud Platform';
      case ClusterProviderType.aws:
        return 'Amazon Web Services';
      case ClusterProviderType.awssso:
        return 'AWS Single Sign-On';
      case ClusterProviderType.azure:
        return 'Azure';
      case ClusterProviderType.oidc:
        return 'OIDC';
      case ClusterProviderType.digitalocean:
        return 'DigitalOcean';
      case ClusterProviderType.rancher:
        return 'Rancher';
      case ClusterProviderType.manual:
        return 'Manual';
      default:
        return 'Manual';
    }
  }

  /// [subtitle] returns the subtitle for the [ClusterProviderType] enum value.
  String subtitle() {
    switch (this) {
      case ClusterProviderType.kubeconfig:
        return 'Import Clusters via Kubeconfig';
      case ClusterProviderType.google:
        return 'Import your GKE Clusters';
      case ClusterProviderType.aws:
        return 'Import your EKS Clusters';
      case ClusterProviderType.awssso:
        return 'Import your EKS Clusters via AWS SSO';
      case ClusterProviderType.azure:
        return 'Import your AKS Clusters';
      case ClusterProviderType.oidc:
        return 'OIDC Cluster Configuration';
      case ClusterProviderType.digitalocean:
        return 'Import your DOKS Clusters';
      case ClusterProviderType.rancher:
        return 'Import your Rancher Clusters';
      case ClusterProviderType.manual:
        return 'Manual Cluster Configuration';
      default:
        return 'Manual Cluster Configuration';
    }
  }

  /// [icon] returns the a icon for the [ClusterProviderType] enum value.
  String icon() {
    switch (this) {
      case ClusterProviderType.kubeconfig:
        return 'assets/providers/kubeconfig.svg';
      case ClusterProviderType.google:
        return 'assets/providers/google.svg';
      case ClusterProviderType.aws:
        return 'assets/providers/aws.svg';
      case ClusterProviderType.awssso:
        return 'assets/providers/aws.svg';
      case ClusterProviderType.azure:
        return 'assets/providers/azure.svg';
      case ClusterProviderType.oidc:
        return 'assets/providers/oidc.svg';
      case ClusterProviderType.digitalocean:
        return 'assets/providers/digitalocean.svg';
      case ClusterProviderType.rancher:
        return 'assets/providers/rancher.svg';
      case ClusterProviderType.manual:
        return 'assets/providers/manual.svg';
      default:
        return 'assets/providers/manual.svg';
    }
  }
}

/// [getClusterProviderType] returns the [ClusterProviderType] from the string
/// representation, created via the [ClusterProviderTypeExtension.toShortString]
/// method.
ClusterProviderType getClusterProviderType(String state) {
  for (ClusterProviderType element in ClusterProviderType.values) {
    if (element.toShortString() == state) {
      return element;
    }
  }
  return ClusterProviderType.manual;
}
