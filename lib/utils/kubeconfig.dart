import 'package:kubenav/models/cluster_model.dart';
import 'package:kubenav/models/tuple_model.dart';
import 'package:kubenav/utils/logger.dart';

/// [kubeconfigToClusters] converts a [kubeconfig] file to a list of clusters. For this we are going through each
/// context in the kubeconfig and getting the corresponding cluster and user. Then these values are used to create a
/// cluster object.
Tuple<List<Cluster>?, String> kubeconfigToClusters(dynamic kubeconfig) {
  final List<Cluster> clusters = [];

  /// The `contexts` property must exists in the kubeconfig file, because we are creating all clusters based on it. We
  /// also check that the contexts is a list.
  if (kubeconfig['contexts'] != null && kubeconfig['contexts'] is List) {
    for (var context in kubeconfig['contexts']) {
      /// Get the cluster for the current context and check if the [getCluster] function returns an error.
      final cluster = getCluster(
        context['context']['cluster'],
        kubeconfig['clusters'],
      );
      Logger.log(
        'kubeconfigToClusters',
        'Cluster property is ${cluster.item1.toString()}',
      );
      if (cluster.item2 != '') {
        return Tuple<List<Cluster>?, String>(
          item1: null,
          item2: cluster.item2,
        );
      }

      /// Get the user for the current context and check if the [getUser] function returns an error.
      final user = getUser(
        context['context']['user'],
        kubeconfig['users'],
      );
      Logger.log(
        'kubeconfigToClusters',
        'User property is ${user.item1.toString()}',
      );
      if (user.item2 != '') {
        return Tuple<List<Cluster>?, String>(
          item1: null,
          item2: user.item2,
        );
      }

      /// The context must have a [name], which we can use as cluster name. The cluster must have a [server] property.
      /// If these two conditions are met we can add the current context to our list of clusters.
      if (context['name'] == null) {
        return Tuple<List<Cluster>?, String>(
          item1: null,
          item2: 'context name is missing',
        );
      } else if (cluster.item1 == null || cluster.item1['server'] == null) {
        return Tuple<List<Cluster>?, String>(
          item1: null,
          item2: 'server is missing',
        );
      } else {
        clusters.add(Cluster(
          name: context['name'],
          provider: 'kubeconfig',
          clusterServer: cluster.item1['server'],
          clusterCertificateAuthorityData:
              cluster.item1['certificate-authority-data'] ?? '',
          clusterInsecureSkipTLSVerify:
              cluster.item1['insecure-skip-tls-verify'] ?? false,
          userClientCertificateData:
              user.item1['client-certificate-data'] ?? '',
          userClientKeyData: user.item1['client-key-data'] ?? '',
          userToken: user.item1['token'] ?? '',
          userUsername: user.item1['username'] ?? '',
          userPassword: user.item1['password'] ?? '',
          namespace: context['context']['namespace'] ?? 'default',
        ));
      }
    }
  } else {
    return Tuple<List<Cluster>?, String>(
      item1: null,
      item2: 'contexts field was not found or is invalid',
    );
  }

  return Tuple<List<Cluster>?, String>(
    item1: clusters,
    item2: '',
  );
}

/// [getCluster] returns the cluster property from a kubeconfig file for the given [clusterName].
Tuple<dynamic, String> getCluster(String clusterName, dynamic clusters) {
  if (clusters != null && clusters is List) {
    for (var cluster in clusters) {
      if (cluster['name'] == clusterName) {
        return Tuple<dynamic, String>(
          item1: cluster['cluster'],
          item2: '',
        );
      }
    }
  }

  return Tuple<Cluster?, String>(
    item1: null,
    item2: 'clusters field was not found or is invalid',
  );
}

/// [getUser] returns the user property from a kubeconfig file for a given [userName].
Tuple<dynamic, String> getUser(String userName, dynamic users) {
  if (users != null && users is List) {
    for (var user in users) {
      if (user['name'] == userName) {
        return Tuple<dynamic, String>(
          item1: user['user'],
          item2: '',
        );
      }
    }
  }

  return Tuple<dynamic, String>(
    item1: null,
    item2: 'users field was not found or is invalid',
  );
}
