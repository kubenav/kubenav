class Cluster {
  String name;
  String provider;
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
        name: json['name'],
        provider: json['provider'],
        clusterServer: json['clusterServer'],
        clusterCertificateAuthorityData:
            json['clusterCertificateAuthorityData'],
        clusterInsecureSkipTLSVerify: json['clusterInsecureSkipTLSVerify'],
        userClientCertificateData: json['userClientCertificateData'],
        userClientKeyData: json['userClientKeyData'],
        userToken: json['userToken'],
        userUsername: json['userUsername'],
        userPassword: json['userPassword'],
        namespace: json['namespace'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'provider': provider,
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
