import 'package:kubenav/models/cluster_model.dart';
import 'package:kubenav/utils/helpers.dart';
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

  Kubeconfig.fromJson(
    Map<String, dynamic> json,
  ) {
    if (json['clusters'] != null) {
      clusters = <KubeconfigCluster>[];
      json['clusters'].forEach((c) {
        clusters!.add(KubeconfigCluster.fromJson(c));
      });
    }
    if (json['contexts'] != null) {
      contexts = <KubeconfigContext>[];
      json['contexts'].forEach((c) {
        contexts!.add(KubeconfigContext.fromJson(c));
      });
    }
    if (json['users'] != null) {
      users = <KubeconfigUser>[];
      json['users'].forEach((u) {
        users!.add(KubeconfigUser.fromJson(u));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (clusters != null) {
      data['clusters'] = clusters!.map((c) => c.toJson()).toList();
    }
    if (contexts != null) {
      data['contexts'] = contexts!.map((c) => c.toJson()).toList();
    }
    if (users != null) {
      data['users'] = users!.map((u) => u.toJson()).toList();
    }
    return data;
  }

  List<Cluster> getClusters(String provider, String providerConfig) {
    final List<Cluster> parsedClusters = [];

    if (contexts == null || contexts!.isEmpty) {
      Logger.log(
        'Kubeconfig getClusters',
        'Contexts are missing',
      );
      snackbar(
        'Could not parse kubeconfig',
        'Contexts are missing',
      );
    } else if (clusters == null || clusters!.isEmpty) {
      Logger.log(
        'Kubeconfig getClusters',
        'Clusters are missing',
      );
      snackbar(
        'Could not parse kubeconfig',
        'Clusters are missing',
      );
    } else if (users == null || users!.isEmpty) {
      Logger.log(
        'Kubeconfig getClusters',
        'Users are missing',
      );
      snackbar(
        'Could not parse kubeconfig',
        'Users are missing',
      );
    } else {
      for (var context in contexts!) {
        if (context.name == null) {
          Logger.log(
            'Kubeconfig getClusters',
            'Context does not contain a name field',
          );
          snackbar(
            'Could not parse kubeconfig',
            'Context does not contain a name field',
          );
        } else if (context.context == null) {
          Logger.log(
            'Kubeconfig getClusters',
            'Context ${context.name} does not contain a context field',
          );
          snackbar(
            'Could not parse kubeconfig',
            'Context ${context.name} does not contain a context field',
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
            snackbar(
              'Could not parse kubeconfig',
              'Cluster for context ${context.name} was not found',
            );
          } else if (cluster[0].cluster == null) {
            Logger.log(
              'Kubeconfig getClusters',
              'Cluster for context ${context.name} does not contain a cluster field',
            );
            snackbar(
              'Could not parse kubeconfig',
              'Cluster for context ${context.name} does not contain a cluster field',
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
              snackbar(
                'Could not parse kubeconfig',
                'User for context ${context.name} was not found',
              );
            } else if (user[0].user == null) {
              Logger.log(
                'Kubeconfig getClusters',
                'User for context ${context.name} does not contain a user field',
              );
              snackbar(
                'Could not parse kubeconfig',
                'User for context ${context.name} does not contain a user field',
              );
            } else {
              if (cluster[0].cluster!.server == null) {
                Logger.log(
                  'Kubeconfig getClusters',
                  'Cluster ${clusters![0].name} does not contain a server field',
                );
                snackbar(
                  'Could not parse kubeconfig',
                  'Cluster ${clusters![0].name} does not contain a server field',
                );
              } else {
                parsedClusters.add(Cluster(
                  name: context.name!,
                  provider: provider,
                  providerConfig: providerConfig,
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
                ));
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

  KubeconfigCluster.fromJson(
    Map<String, dynamic> json,
  ) {
    name = json['name'];
    cluster = json['cluster'] != null
        ? KubeconfigClusterCluster.fromJson(json['cluster'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (cluster != null) {
      data['cluster'] = cluster!.toJson();
    }
    return data;
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

  KubeconfigClusterCluster.fromJson(
    Map<String, dynamic> json,
  ) {
    certificateAuthorityData = json['certificate-authority-data'];
    insecureSkipTlsVerify = json['insecure-skip-tls-verify'];
    server = json['server'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['certificate-authority-data'] = certificateAuthorityData;
    data['insecure-skip-tls-verify'] = insecureSkipTlsVerify;
    data['server'] = server;
    return data;
  }
}

class KubeconfigContext {
  String? name;
  KubeconfigContextContext? context;

  KubeconfigContext({
    required this.name,
    required this.context,
  });

  KubeconfigContext.fromJson(
    Map<String, dynamic> json,
  ) {
    name = json['name'];
    context = json['context'] != null
        ? KubeconfigContextContext.fromJson(json['context'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (context != null) {
      data['context'] = context!.toJson();
    }
    return data;
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

  KubeconfigContextContext.fromJson(
    Map<String, dynamic> json,
  ) {
    cluster = json['cluster'];
    namespace = json['namespace'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cluster'] = cluster;
    data['namespace'] = namespace;
    data['user'] = user;
    return data;
  }
}

class KubeconfigUser {
  String? name;
  KubeconfigUserUser? user;

  KubeconfigUser({
    required this.name,
    required this.user,
  });

  KubeconfigUser.fromJson(
    Map<String, dynamic> json,
  ) {
    name = json['name'];
    user =
        json['user'] != null ? KubeconfigUserUser.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
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

  KubeconfigUserUser.fromJson(
    Map<String, dynamic> json,
  ) {
    authProvider = json['auth-provider'] != null
        ? KubeconfigUserUserAuthProvider.fromJson(json['auth-provider'])
        : null;
    clientCertificateData = json['client-certificate-data'];
    clientKeyData = json['client-key-data'];
    password = json['password'];
    token = json['token'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (authProvider != null) {
      data['auth-provider'] = authProvider!.toJson();
    }
    data['client-certificate-data'] = clientCertificateData;
    data['client-key-data'] = clientKeyData;
    data['password'] = password;
    data['token'] = token;
    data['username'] = username;
    return data;
  }
}

class KubeconfigUserUserAuthProvider {
  String? name;
  KubeconfigUserUserAuthProviderConfig? config;

  KubeconfigUserUserAuthProvider({
    required this.name,
    required this.config,
  });

  KubeconfigUserUserAuthProvider.fromJson(
    Map<String, dynamic> json,
  ) {
    name = json['name'];
    config = json['config'] != null
        ? KubeconfigUserUserAuthProviderConfig.fromJson(json['config'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (config != null) {
      data['config'] = config!.toJson();
    }
    return data;
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

  KubeconfigUserUserAuthProviderConfig.fromJson(
    Map<String, dynamic> json,
  ) {
    clientID = json['client-id'];
    clientSecret = json['client-secret'];
    idpCertificateAuthorityData = json['idp-certificate-authority-data'];
    idpIssuerUrl = json['idp-issuer-url'];
    idToken = json['id-token'];
    refreshToken = json['refresh-token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['client-id'] = clientID;
    data['client-secret'] = clientSecret;
    data['idp-certificate-authority-data'] = idpCertificateAuthorityData;
    data['idp-issuer-url'] = idpIssuerUrl;
    data['id-token'] = idToken;
    data['refresh-token'] = refreshToken;
    return data;
  }
}
