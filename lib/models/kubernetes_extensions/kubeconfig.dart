import 'package:uuid/uuid.dart';

import 'package:kubenav/models/cluster.dart';
import 'package:kubenav/models/cluster_provider.dart';
import 'package:kubenav/utils/logger.dart';

class Kubeconfig {
  List<KubeconfigCluster>? clusters;
  List<KubeconfigContext>? contexts;
  List<KubeconfigUser>? users;

  Kubeconfig({
    required this.clusters,
    required this.contexts,
    required this.users,
  });

  factory Kubeconfig.fromJson(
    Map<String, dynamic> data,
  ) {
    return Kubeconfig(
      clusters: data.containsKey('clusters')
          ? List<KubeconfigCluster>.from(
              data['clusters'].map((v) => KubeconfigCluster.fromJson(v)),
            )
          : null,
      contexts: data.containsKey('contexts')
          ? List<KubeconfigContext>.from(
              data['contexts'].map((v) => KubeconfigContext.fromJson(v)),
            )
          : null,
      users: data.containsKey('users')
          ? List<KubeconfigUser>.from(
              data['users'].map((v) => KubeconfigUser.fromJson(v)),
            )
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'clusters': clusters?.map((c) => c.toJson()).toList(),
      'contexts': contexts?.map((c) => c.toJson()).toList(),
      'users': users?.map((u) => u.toJson()).toList(),
    };
  }

  Future<List<Cluster>> getClusters(
    ClusterProviderType clusterProviderType,
    String clusterProviderId,
  ) async {
    final List<Cluster> parsedClusters = [];

    if (contexts == null || contexts!.isEmpty) {
      Logger.log(
        'Kubeconfig getClusters',
        'Contexts are missing',
      );
      throw Exception(
        'Could not parse kubeconfig: Contexts are missing',
      );
    } else if (clusters == null || clusters!.isEmpty) {
      Logger.log(
        'Kubeconfig getClusters',
        'Clusters are missing',
      );
      throw Exception(
        'Could not parse kubeconfig: Clusters are missing',
      );
    } else if (users == null || users!.isEmpty) {
      Logger.log(
        'Kubeconfig getClusters',
        'Users are missing',
      );
      throw Exception(
        'Could not parse kubeconfig: Users are missing',
      );
    } else {
      for (var context in contexts!) {
        if (context.name == null) {
          Logger.log(
            'Kubeconfig getClusters',
            'Context does not contain a name field',
          );
          throw Exception(
            'Could not parse kubeconfig: Context does not contain a name field',
          );
        } else if (context.context == null) {
          Logger.log(
            'Kubeconfig getClusters',
            'Context ${context.name} does not contain a context field',
          );
          throw Exception(
            'Could not parse kubeconfig: Context ${context.name} does not contain a context field',
          );
        } else {
          final cluster = clusters!
              .where((element) => element.name == context.context!.cluster)
              .toList();
          if (cluster.length != 1) {
            Logger.log(
              'Kubeconfig getClusters',
              'Cluster for context ${context.name} was not found',
            );
            throw Exception(
              'Could not parse kubeconfig: Cluster for context ${context.name} was not found',
            );
          } else if (cluster[0].cluster == null) {
            Logger.log(
              'Kubeconfig getClusters',
              'Cluster for context ${context.name} does not contain a cluster field',
            );
            throw Exception(
              'Could not parse kubeconfig: Cluster for context ${context.name} does not contain a cluster field',
            );
          } else {
            final user = users!
                .where((element) => element.name == context.context!.user)
                .toList();
            if (user.length != 1) {
              Logger.log(
                'Kubeconfig getClusters',
                'User for context ${context.name} was not found',
              );
              throw Exception(
                'Could not parse kubeconfig: User for context ${context.name} was not found',
              );
            } else if (user[0].user == null) {
              Logger.log(
                'Kubeconfig getClusters',
                'User for context ${context.name} does not contain a user field',
              );
              throw Exception(
                'Could not parse kubeconfig: User for context ${context.name} does not contain a user field',
              );
            } else {
              if (cluster[0].cluster!.server == null) {
                Logger.log(
                  'Kubeconfig getClusters',
                  'Cluster ${clusters![0].name} does not contain a server field',
                );
                throw Exception(
                  'Could not parse kubeconfig: Cluster ${clusters![0].name} does not contain a server field',
                );
              } else {
                parsedClusters.add(
                  Cluster(
                    id: const Uuid().v4(),
                    name: context.name!,
                    clusterProviderType: clusterProviderType,
                    clusterProviderId: clusterProviderId,
                    clusterServer: cluster[0].cluster!.server!,
                    clusterCertificateAuthorityData:
                        cluster[0].cluster!.certificateAuthorityData ?? '',
                    clusterInsecureSkipTLSVerify:
                        cluster[0].cluster!.insecureSkipTlsVerify ?? false,
                    userClientCertificateData:
                        user[0].user!.clientCertificateData ?? '',
                    userClientKeyData: user[0].user!.clientKeyData ?? '',
                    userToken: user[0].user!.token ?? '',
                    userUsername: user[0].user!.username ?? '',
                    userPassword: user[0].user!.password ?? '',
                    namespace: context.context!.namespace ?? 'default',
                  ),
                );
              }
            }
          }
        }
      }
    }

    return parsedClusters;
  }
}

class KubeconfigCluster {
  String? name;
  KubeconfigClusterCluster? cluster;

  KubeconfigCluster({
    required this.name,
    required this.cluster,
  });

  factory KubeconfigCluster.fromJson(
    Map<String, dynamic> data,
  ) {
    return KubeconfigCluster(
      name: data.containsKey('name') ? data['name'] : null,
      cluster: data.containsKey('cluster')
          ? KubeconfigClusterCluster.fromJson(data['cluster'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'cluster': cluster?.toJson(),
    };
  }
}

class KubeconfigClusterCluster {
  String? certificateAuthorityData;
  bool? insecureSkipTlsVerify;
  String? server;

  KubeconfigClusterCluster({
    required this.certificateAuthorityData,
    required this.insecureSkipTlsVerify,
    required this.server,
  });

  factory KubeconfigClusterCluster.fromJson(
    Map<String, dynamic> data,
  ) {
    return KubeconfigClusterCluster(
      certificateAuthorityData: data.containsKey('certificate-authority-data')
          ? data['certificate-authority-data']
          : null,
      insecureSkipTlsVerify: data.containsKey('insecure-skip-tls-verify')
          ? data['insecure-skip-tls-verify']
          : null,
      server: data.containsKey('server') ? data['server'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'certificate-authority-data': certificateAuthorityData,
      'insecure-skip-tls-verify': insecureSkipTlsVerify,
      'server': server,
    };
  }
}

class KubeconfigContext {
  String? name;
  KubeconfigContextContext? context;

  KubeconfigContext({
    required this.name,
    required this.context,
  });

  factory KubeconfigContext.fromJson(
    Map<String, dynamic> data,
  ) {
    return KubeconfigContext(
      name: data.containsKey('name') ? data['name'] : null,
      context: data.containsKey('context')
          ? KubeconfigContextContext.fromJson(data['context'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'context': context?.toJson(),
    };
  }
}

class KubeconfigContextContext {
  String? cluster;
  String? namespace;
  String? user;

  KubeconfigContextContext({
    required this.cluster,
    required this.namespace,
    required this.user,
  });

  factory KubeconfigContextContext.fromJson(
    Map<String, dynamic> data,
  ) {
    return KubeconfigContextContext(
      cluster: data.containsKey('cluster') ? data['cluster'] : null,
      namespace: data.containsKey('namespace') ? data['namespace'] : null,
      user: data.containsKey('user') ? data['user'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cluster': cluster,
      'namespace': namespace,
      'user': user,
    };
  }
}

class KubeconfigUser {
  String? name;
  KubeconfigUserUser? user;

  KubeconfigUser({
    required this.name,
    required this.user,
  });

  factory KubeconfigUser.fromJson(
    Map<String, dynamic> data,
  ) {
    return KubeconfigUser(
      name: data.containsKey('name') ? data['name'] : null,
      user: data.containsKey('user')
          ? KubeconfigUserUser.fromJson(data['user'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'user': user?.toJson(),
    };
  }
}

class KubeconfigUserUser {
  KubeconfigUserUserAuthProvider? authProvider;
  String? clientCertificateData;
  String? clientKeyData;
  String? password;
  String? token;
  String? username;

  KubeconfigUserUser({
    required this.authProvider,
    required this.clientCertificateData,
    required this.clientKeyData,
    required this.password,
    required this.token,
    required this.username,
  });

  factory KubeconfigUserUser.fromJson(
    Map<String, dynamic> data,
  ) {
    return KubeconfigUserUser(
      authProvider: data.containsKey('auth-provider')
          ? KubeconfigUserUserAuthProvider.fromJson(data['auth-provider'])
          : null,
      clientCertificateData: data.containsKey('client-certificate-data')
          ? data['client-certificate-data']
          : null,
      clientKeyData:
          data.containsKey('client-key-data') ? data['client-key-data'] : null,
      password: data.containsKey('password') ? data['password'] : null,
      token: data.containsKey('token') ? data['token'] : null,
      username: data.containsKey('username') ? data['username'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'auth-provider': authProvider?.toJson(),
      'client-certificate-data': clientCertificateData,
      'client-key-data': clientKeyData,
      'password': password,
      'token': token,
      'username': username,
    };
  }
}

class KubeconfigUserUserAuthProvider {
  String? name;
  KubeconfigUserUserAuthProviderConfig? config;

  KubeconfigUserUserAuthProvider({
    required this.name,
    required this.config,
  });

  factory KubeconfigUserUserAuthProvider.fromJson(
    Map<String, dynamic> data,
  ) {
    return KubeconfigUserUserAuthProvider(
      name: data.containsKey('name') ? data['name'] : null,
      config: data.containsKey('config')
          ? KubeconfigUserUserAuthProviderConfig.fromJson(data['config'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'config': config?.toJson(),
    };
  }
}

class KubeconfigUserUserAuthProviderConfig {
  String? clientID;
  String? clientSecret;
  String? idpCertificateAuthorityData;
  String? idpIssuerUrl;
  String? idToken;
  String? refreshToken;

  KubeconfigUserUserAuthProviderConfig({
    required this.clientID,
    required this.clientSecret,
    required this.idpCertificateAuthorityData,
    required this.idpIssuerUrl,
    required this.idToken,
    required this.refreshToken,
  });

  factory KubeconfigUserUserAuthProviderConfig.fromJson(
    Map<String, dynamic> data,
  ) {
    return KubeconfigUserUserAuthProviderConfig(
      clientID: data.containsKey('client-id') ? data['client-id'] : null,
      clientSecret:
          data.containsKey('client-secret') ? data['client-secret'] : null,
      idpCertificateAuthorityData:
          data.containsKey('idp-certificate-authority-data')
              ? data['idp-certificate-authority-data']
              : null,
      idpIssuerUrl:
          data.containsKey('idp-issuer-url') ? data['idp-issuer-url'] : null,
      idToken: data.containsKey('id-token') ? data['id-token'] : null,
      refreshToken:
          data.containsKey('refresh-token') ? data['refresh-token'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'client-id': clientID,
      'client-secret': clientSecret,
      'idp-certificate-authority-data': idpCertificateAuthorityData,
      'idp-issuer-url': idpIssuerUrl,
      'id-token': idToken,
      'refresh-token': refreshToken,
    };
  }
}
