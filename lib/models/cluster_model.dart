/// A [Cluster] represents a single Kubernetes cluster, which can be used within kubenav. Each cluster contains all the
/// values which are required to interact with the Kubernetes API server of the cluster and for some providers also the
/// credentials to refresh the access credentials for the Kubernetes cluster.
class Cluster {
  String name;
  String provider;
  String providerConfig;
  String providerConfigInternal;
  String clusterServer;
  String clusterCertificateAuthorityData;
  bool clusterInsecureSkipTLSVerify;
  String userClientCertificateData;
  String userClientKeyData;
  String userToken;
  int userTokenExpireTimestamp;
  String userUsername;
  String userPassword;
  String namespace;

  Cluster({
    required this.name,
    required this.provider,
    required this.providerConfig,
    this.providerConfigInternal = '',
    required this.clusterServer,
    this.clusterCertificateAuthorityData = '',
    this.clusterInsecureSkipTLSVerify = false,
    this.userClientCertificateData = '',
    this.userClientKeyData = '',
    this.userToken = '',
    this.userTokenExpireTimestamp = 0,
    this.userUsername = '',
    this.userPassword = '',
    this.namespace = '',
  });

  factory Cluster.fromJson(Map<String, dynamic> json) => Cluster(
        name: json['name'] ?? '',
        provider: json['provider'] ?? '',
        providerConfig: json['providerConfig'] ?? '',
        providerConfigInternal: json['providerConfigInternal'] ?? '',
        clusterServer: json['clusterServer'] ?? '',
        clusterCertificateAuthorityData:
            json['clusterCertificateAuthorityData'] ?? '',
        clusterInsecureSkipTLSVerify:
            json['clusterInsecureSkipTLSVerify'] ?? false,
        userClientCertificateData: json['userClientCertificateData'] ?? '',
        userClientKeyData: json['userClientKeyData'] ?? '',
        userToken: json['userToken'] ?? '',
        userTokenExpireTimestamp: json['userTokenExpireTimestamp'] ?? 0,
        userUsername: json['userUsername'] ?? '',
        userPassword: json['userPassword'] ?? '',
        namespace: json['namespace'] ?? 'default',
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'provider': provider,
        'providerConfig': providerConfig,
        'providerConfigInternal': providerConfigInternal,
        'clusterServer': clusterServer,
        'clusterCertificateAuthorityData': clusterCertificateAuthorityData,
        'clusterInsecureSkipTLSVerify': clusterInsecureSkipTLSVerify,
        'userClientCertificateData': userClientCertificateData,
        'userClientKeyData': userClientKeyData,
        'userToken': userToken,
        'userTokenExpireTimestamp': userTokenExpireTimestamp,
        'userUsername': userUsername,
        'userPassword': userPassword,
        'namespace': namespace,
      };
}
