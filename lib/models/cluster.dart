import 'package:kubenav/models/cluster_provider.dart';

/// A [Cluster] represents a single Kubernetes cluster, which can be used within
/// kubenav. Each cluster contains all the values which are required to interact
/// with the Kubernetes API server of the cluster and for some providers also
/// the credentials to refresh the access credentials for the Kubernetes
/// cluster.
class Cluster {
  String id;
  String name;
  ClusterProviderType clusterProviderType;
  String clusterProviderId;
  String clusterProviderInternal;
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
    required this.id,
    required this.name,
    required this.clusterProviderType,
    required this.clusterProviderId,
    this.clusterProviderInternal = '',
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

  factory Cluster.fromJson(Map<String, dynamic> data) {
    return Cluster(
      id: data.containsKey('id') ? data['id'] : '',
      name: data.containsKey('name') ? data['name'] : '',
      clusterProviderType: data.containsKey('clusterProviderType')
          ? getClusterProviderType(data['clusterProviderType'])
          : ClusterProviderType.manual,
      clusterProviderId: data.containsKey('clusterProviderId')
          ? data['clusterProviderId']
          : '',
      clusterProviderInternal: data.containsKey('clusterProviderInternal')
          ? data['clusterProviderInternal']
          : '',
      clusterServer:
          data.containsKey('clusterServer') ? data['clusterServer'] : '',
      clusterCertificateAuthorityData:
          data.containsKey('clusterCertificateAuthorityData')
              ? data['clusterCertificateAuthorityData']
              : '',
      clusterInsecureSkipTLSVerify:
          data.containsKey('clusterInsecureSkipTLSVerify')
              ? data['clusterInsecureSkipTLSVerify']
              : false,
      userClientCertificateData: data.containsKey('userClientCertificateData')
          ? data['userClientCertificateData']
          : '',
      userClientKeyData: data.containsKey('userClientKeyData')
          ? data['userClientKeyData']
          : '',
      userToken: data.containsKey('userToken') ? data['userToken'] : '',
      userTokenExpireTimestamp: data.containsKey('userTokenExpireTimestamp')
          ? data['userTokenExpireTimestamp']
          : 0,
      userUsername:
          data.containsKey('userUsername') ? data['userUsername'] : '',
      userPassword:
          data.containsKey('userPassword') ? data['userPassword'] : '',
      namespace: data.containsKey('namespace') ? data['namespace'] : 'default',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'clusterProviderType': clusterProviderType.toShortString(),
      'clusterProviderId': clusterProviderId,
      'clusterProviderInternal': clusterProviderInternal,
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
}
