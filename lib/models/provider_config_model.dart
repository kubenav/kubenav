/// A [ProviderConfig] represents a single provider configuration. It contains all the credentials to get the clusters
/// from a cloud provider and for some providers also the information to get a token for the cluster.
class ProviderConfig {
  String name;
  String provider;
  ProviderConfigAzure? azure;

  ProviderConfig({
    required this.name,
    required this.provider,
    this.azure,
  });

  factory ProviderConfig.fromJson(Map<String, dynamic> json) => ProviderConfig(
        name: json['name'] ?? '',
        provider: json['provider'] ?? '',
        azure: json['azure'] != null
            ? ProviderConfigAzure.fromJson(json['azure'])
            : null,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['provider'] = provider;
    if (azure != null) {
      data['azure'] = azure!.toJson();
    }
    return data;
  }
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
