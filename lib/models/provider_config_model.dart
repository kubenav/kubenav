/// A [ProviderConfig] represents a single provider configuration. It contains all the credentials to get the clusters
/// from a cloud provider and for some providers also the information to get a token for the cluster.
class ProviderConfig {
  String name;
  String provider;
  ProviderConfigAWS? aws;
  ProviderConfigAzure? azure;
  ProviderConfigDigitalOcean? digitalocean;

  ProviderConfig({
    required this.name,
    required this.provider,
    this.aws,
    this.azure,
    this.digitalocean,
  });

  factory ProviderConfig.fromJson(Map<String, dynamic> json) => ProviderConfig(
        name: json['name'] ?? '',
        provider: json['provider'] ?? '',
        aws: json['aws'] != null
            ? ProviderConfigAWS.fromJson(json['aws'])
            : null,
        azure: json['azure'] != null
            ? ProviderConfigAzure.fromJson(json['azure'])
            : null,
        digitalocean: json['digitalocean'] != null
            ? ProviderConfigDigitalOcean.fromJson(json['digitalocean'])
            : null,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['provider'] = provider;
    if (aws != null) {
      data['aws'] = aws!.toJson();
    }
    if (azure != null) {
      data['azure'] = azure!.toJson();
    }
    if (digitalocean != null) {
      data['digitalocean'] = digitalocean!.toJson();
    }
    return data;
  }
}

/// A [ProviderConfigAWS] represents the provider configuration for the `aws` provider. To get the clusters from AWS we
/// need the [accessKeyID], [secretKey], [region] and a optional [sessionToken].
class ProviderConfigAWS {
  String accessKeyID;
  String secretKey;
  String region;
  String sessionToken;

  ProviderConfigAWS({
    required this.accessKeyID,
    required this.secretKey,
    required this.region,
    required this.sessionToken,
  });

  factory ProviderConfigAWS.fromJson(Map<String, dynamic> json) =>
      ProviderConfigAWS(
        accessKeyID: json['accessKeyID'] ?? '',
        secretKey: json['secretKey'] ?? '',
        region: json['region'] ?? '',
        sessionToken: json['sessionToken'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'accessKeyID': accessKeyID,
        'secretKey': secretKey,
        'region': region,
        'sessionToken': sessionToken,
      };
}

/// A [ProviderConfigAzure] represents the provider configuration for the `azure` provider. To get the clusters from
/// Azure we need the [subscriptionID], [tenantID], [clientID], [clientSecret]. The user can also set the [isAdmin] flag
/// so that we load the cluster admin configuration instead of the "normal" one.
class ProviderConfigAzure {
  String subscriptionID;
  String tenantID;
  String clientID;
  String clientSecret;
  bool isAdmin;

  ProviderConfigAzure({
    required this.subscriptionID,
    required this.tenantID,
    required this.clientID,
    required this.clientSecret,
    required this.isAdmin,
  });

  factory ProviderConfigAzure.fromJson(Map<String, dynamic> json) =>
      ProviderConfigAzure(
        subscriptionID: json['subscriptionID'] ?? '',
        tenantID: json['tenantID'] ?? '',
        clientID: json['clientID'] ?? '',
        clientSecret: json['clientSecret'] ?? '',
        isAdmin: json['isAdmin'] ?? false,
      );

  Map<String, dynamic> toJson() => {
        'subscriptionID': subscriptionID,
        'tenantID': tenantID,
        'clientID': clientID,
        'clientSecret': clientSecret,
        'isAdmin': isAdmin,
      };
}

/// A [ProviderConfigDigitalOcean] represents the provider configuration for the `digitalocean` provider. To get the
/// clusters from DigitalOcean an API [token] is required.
class ProviderConfigDigitalOcean {
  String token;

  ProviderConfigDigitalOcean({
    required this.token,
  });

  factory ProviderConfigDigitalOcean.fromJson(Map<String, dynamic> json) =>
      ProviderConfigDigitalOcean(
        token: json['token'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'token': token,
      };
}
