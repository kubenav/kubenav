/// A [Cluster] represents a single Kubernetes cluster, which can be used within kubenav. Each cluster contains all the
/// values which are required to interact with the Kubernetes API server of the cluster and for some providers also the
/// credentials to refresh the access credentials for the Kubernetes cluster.
class Cluster {
  String name;
  String provider;
  String providerConfig;
  String clusterServer;
  String clusterCertificateAuthorityData;
  bool clusterInsecureSkipTLSVerify;
  String userClientCertificateData;
  String userClientKeyData;
  String userToken;
  String userUsername;
  String userPassword;
  String namespace;

  Cluster({
    required this.name,
    required this.provider,
    required this.providerConfig,
    required this.clusterServer,
    this.clusterCertificateAuthorityData = '',
    this.clusterInsecureSkipTLSVerify = false,
    this.userClientCertificateData = '',
    this.userClientKeyData = '',
    this.userToken = '',
    this.userUsername = '',
    this.userPassword = '',
    this.namespace = '',
  });

  factory Cluster.fromJson(Map<String, dynamic> json) => Cluster(
        name: json['name'] ?? '',
        provider: json['provider'] ?? '',
        providerConfig: json['providerConfig'] ?? '',
        clusterServer: json['clusterServer'] ?? '',
        clusterCertificateAuthorityData:
            json['clusterCertificateAuthorityData'] ?? '',
        clusterInsecureSkipTLSVerify:
            json['clusterInsecureSkipTLSVerify'] ?? false,
        userClientCertificateData: json['userClientCertificateData'] ?? '',
        userClientKeyData: json['userClientKeyData'] ?? '',
        userToken: json['userToken'] ?? '',
        userUsername: json['userUsername'] ?? '',
        userPassword: json['userPassword'] ?? '',
        namespace: json['namespace'] ?? 'default',
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'provider': provider,
        'providerConfig': providerConfig,
        'clusterServer': clusterServer,
        'clusterCertificateAuthorityData': clusterCertificateAuthorityData,
        'clusterInsecureSkipTLSVerify': clusterInsecureSkipTLSVerify,
        'userClientCertificateData': userClientCertificateData,
        'userClientKeyData': userClientKeyData,
        'userToken': userToken,
        'userUsername': userUsername,
        'userPassword': userPassword,
        'namespace': namespace,
      };
}
