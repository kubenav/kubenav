import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:jwt_decode/jwt_decode.dart';

import 'package:kubenav/models/cluster.dart';
import 'package:kubenav/models/cluster_provider.dart';
import 'package:kubenav/services/providers/aws_service.dart';
import 'package:kubenav/services/providers/google_service.dart';
import 'package:kubenav/services/providers/oidc_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/storage.dart';

/// The [ClustersRepository] contains all the users configured [clusters],
/// [providers] and the users [activeClusterId]. The repository is initialized
/// when the app is started via the [init] method, so that we always have access
/// to it. Each time a user modifys an entry in the repository all subscribed
/// widgets are notified and we [_save] the changes back to our storage backend.
class ClustersRepository with ChangeNotifier {
  List<Cluster> _clusters = [];
  List<ClusterProvider> _providers = [];
  String _activeClusterId = '';

  List<Cluster> get clusters => _clusters;
  List<ClusterProvider> get providers => _providers;
  String get activeClusterId => _activeClusterId;

  /// The [_save] method can be used to write all modifications to the
  /// [clusters], [providers] and the [activeClusterId] via the Flutter Secure
  /// Storage package.
  Future<void> _save() async {
    try {
      Logger.log(
        'ClustersRepository _save',
        'Save',
      );
      await Storage().write(
        'kubenavClustersRepository',
        json.encode(
          ClustersRepositoryStorage(
            clusters: _clusters,
            providers: _providers,
            activeClusterId: _activeClusterId,
          ).toJson(),
        ),
      );
    } catch (err) {
      Logger.log(
        'ClustersRepository _save',
        'Failed to Save Clusters',
        err,
      );
    }
  }

  /// [init] is used to initialize the [_clusters], [_activeClusterId] and
  /// [_providers]. For that we are looking for the clusters and provider
  /// configs in the secure storage. If we found saved clusters we also set the
  /// active cluster to the one which was saved in an older session.
  Future<void> init() async {
    try {
      final storedData = await Storage().read('kubenavClustersRepository');
      if (storedData != null) {
        final parsedStoredData =
            ClustersRepositoryStorage.fromJson(json.decode(storedData));
        _clusters = parsedStoredData.clusters;
        _providers = parsedStoredData.providers;
        _activeClusterId = parsedStoredData.activeClusterId;
      }
      notifyListeners();
    } catch (err) {
      Logger.log(
        'ClustersRepository init',
        'Failed to Load Clusters',
        err,
      );
    }
  }

  /// [addCluster] adds a new cluster to our list of [_clusters]. If the user
  /// hasn't selected an active cluster yet, the added cluster will be used as
  /// the active cluster.
  Future<void> addCluster(Cluster cluster) async {
    _clusters.add(cluster);

    if (_activeClusterId == '') {
      _activeClusterId = cluster.id;
    }

    await _save();
    notifyListeners();
  }

  /// [editCluster] replaces the cluster saved in our [_clusters] list with the
  /// provided [cluster] when the ids are the same. If we couldn't find a
  /// cluster with the same id as the id of the provided cluster we will do
  /// nothing, because this can not happen for normal use cases.
  Future<void> editCluster(Cluster cluster) async {
    for (var i = 0; i < _clusters.length; i++) {
      if (_clusters[i].id == cluster.id) {
        _clusters[i] = cluster;
      }
    }

    await _save();
    notifyListeners();
  }

  /// [editClusterWithoutNotify] replaces the cluster saved in our [_clusters]
  /// list with the provided [cluster] when the ids are the same. If we couldn't
  /// find a cluster with the same id as the id of the provided cluster we will
  /// do nothing, because this can not happen for normal use cases.
  ///
  /// In difference to the [editCluster] function this doesn't trigger the
  /// [notifyListeners] function.
  Future<void> editClusterWithoutNotify(Cluster cluster) async {
    for (var i = 0; i < _clusters.length; i++) {
      if (_clusters[i].id == cluster.id) {
        _clusters[i] = cluster;
      }
    }

    await _save();
  }

  /// [deleteCluster] deletes the cluster with the provided [clusterId] from our
  /// list of [_clusters]. If the provided cluster id is also the one used by
  /// [_activeClusterId] variable, we delete the active cluster id value or if
  /// there are still other clusters, we use the first cluster of the list as
  /// the new active cluster.
  Future<void> deleteCluster(String clusterId) async {
    _clusters = _clusters.where((cluster) => cluster.id != clusterId).toList();

    if (_activeClusterId == clusterId) {
      if (_clusters.isEmpty) {
        _activeClusterId = '';
      } else {
        _activeClusterId = _clusters[0].id;
      }
    }

    await _save();
    notifyListeners();
  }

  /// [setActiveCluster] changes the value of the [_activeClusterId] to the one
  /// provided via the [clusterId] argument. We do not check if the provided
  /// cluster id has a valid value, because we only call this function when we
  /// render the list of clusters via the [clusters] getter, so that the id
  /// should always be valid.
  Future<void> setActiveCluster(String clusterId) async {
    _activeClusterId = clusterId;
    await _save();
    notifyListeners();
  }

  /// [setNamespace] sets the namespace for the cluster provided via it's
  /// [clusterId] to the provided [namespace]. If we are not able to find the
  /// cluster with the provided id, we will do nothing.
  Future<void> setNamespace(String clusterId, String? namespace) async {
    if (namespace == null) {
      return;
    }

    for (var i = 0; i < _clusters.length; i++) {
      if (_clusters[i].id == clusterId) {
        _clusters[i].namespace = namespace;
      }
    }

    await _save();
    notifyListeners();
  }

  /// [getCluster] returns the `Cluster` with the provided [clusterId]. If none
  /// of our clusters matched the provided it we return `null`.
  Cluster? getCluster(String clusterId) {
    for (var i = 0; i < _clusters.length; i++) {
      if (_clusters[i].id == clusterId) {
        return _clusters[i];
      }
    }

    return null;
  }

  /// [getClusterWithCredentials] returns the cluster with the provided
  /// [clusterId], but before the cluster is returned we check that the clusters
  /// userToken is not expired and still valid. If the token is expired we
  /// refresh the token and save the refreshed provider and cluster.
  Future<Cluster?> getClusterWithCredentials(String clusterId) async {
    try {
      if (_clusters.isEmpty) {
        throw 'No Clusters Found';
      }

      final cluster = _clusters
          .where(
            (cluster) => cluster.id == clusterId,
          )
          .toList()[0];

      if (cluster.clusterProviderType == ClusterProviderType.aws) {
        /// When the cluster provider is AWS we get the expiration time saved in
        /// the `userTokenExpireTimestamp` filed of the cluster. If this time is
        /// before the the current time, we use the corresponding cluster
        /// provider to generate a new token, which is then saved within the
        /// cluster.
        ///
        /// When we are not able to find a cluster provider or when the provider
        /// doesn't have the aws credentials we throw an exception.
        ///
        /// If the token is still valid we use the existing token from the
        /// cluster.
        final tokenExpireTimestamp = DateTime.fromMicrosecondsSinceEpoch(
          cluster.userTokenExpireTimestamp,
        );
        if (tokenExpireTimestamp.isBefore(DateTime.now()) ||
            cluster.userToken == '') {
          final provider = getProvider(cluster.clusterProviderId);
          if (provider != null && provider.aws != null) {
            final token = await AWSService().getToken(
              provider.aws?.accessKeyID ?? '',
              provider.aws?.secretKey ?? '',
              provider.aws?.region ?? '',
              provider.aws?.sessionToken ?? '',
              provider.aws?.roleArn ?? '',
              cluster.clusterProviderInternal,
            );
            cluster.userToken = token;
            cluster.userTokenExpireTimestamp = DateTime.now()
                .add(const Duration(minutes: 10))
                .microsecondsSinceEpoch;
            await editClusterWithoutNotify(cluster);
            return cluster;
          } else {
            throw Exception('Failed to Get Access Token');
          }
        }
      } else if (cluster.clusterProviderType == ClusterProviderType.awssso) {
        /// If the cluster provider is AWS SSO we get the expiration time of the
        /// saved token. If the token is expired we try to get a new token using
        /// the saved provider.
        ///
        /// When we are able to get a new set of credentials we save the
        /// credentials within the provider. Then we replace the token in the
        /// cluster configuration and return the cluster with the newly created
        /// token.
        final tokenExpireTimestamp = DateTime.fromMicrosecondsSinceEpoch(
          cluster.userTokenExpireTimestamp,
        );
        if (tokenExpireTimestamp.isBefore(DateTime.now()) ||
            cluster.userToken == '') {
          final provider = getProvider(cluster.clusterProviderId);
          if (provider != null && provider.awssso != null) {
            if (provider.awssso!.ssoConfig!.client!.clientSecretExpiresAt! *
                    1000 <
                DateTime.now().millisecondsSinceEpoch) {
              throw Exception(
                'Client secret is expired, you have to re-start the sso flow',
              );
            }

            final credentials = await AWSService().getSSOToken(
              provider.awssso?.accountID ?? '',
              provider.awssso?.roleName ?? '',
              provider.awssso?.ssoRegion ?? '',
              provider.awssso?.ssoConfig?.client?.clientId ?? '',
              provider.awssso?.ssoConfig?.client?.clientSecret ?? '',
              provider.awssso?.ssoConfig?.device?.deviceCode ?? '',
              provider.awssso?.ssoCredentials?.accessToken ?? '',
              provider.awssso?.ssoCredentials?.accessTokenExpire ?? 0,
            );

            provider.awssso!.ssoCredentials = credentials;
            await editProviderWithoutNotify(provider);

            final token = await AWSService().getToken(
              credentials.accessKeyId ?? '',
              credentials.secretAccessKey ?? '',
              provider.awssso?.region ?? '',
              credentials.sessionToken ?? '',
              '',
              cluster.clusterProviderInternal,
            );

            cluster.userToken = token;
            cluster.userTokenExpireTimestamp = DateTime.now()
                .add(const Duration(minutes: 10))
                .microsecondsSinceEpoch;
            await editClusterWithoutNotify(cluster);
            return cluster;
          } else {
            throw Exception('Failed to Get Access Token');
          }
        }
      } else if (cluster.clusterProviderType == ClusterProviderType.google) {
        /// If the cluster provider is Google, we have to check if the token
        /// saved in the provider configuration is expired. If this is the case
        /// we generate a new token for the provider. Then we save the new
        /// token in the provider configuration and cluster configuration.
        ///
        /// If the token is not expired we check the cluster already uses the
        /// coorect token. If this is not the case we replace the token before
        /// we return the cluster. This can happen if the user has multiple
        /// Google clusters and the token was generated for another cluster then
        /// the one which is currently used.
        final provider = getProvider(cluster.clusterProviderId);

        if (DateTime.fromMillisecondsSinceEpoch(
          provider?.google?.accessTokenExpires ?? 0,
        ).isBefore(DateTime.now())) {
          final googleTokens = await GoogleService().getTokensFromRefreshToken(
            provider?.google?.clientID ?? '',
            provider?.google?.clientSecret ?? '',
            provider?.google?.refreshToken ?? '',
          );

          final expires = DateTime.now().millisecondsSinceEpoch +
              googleTokens.expiresIn! * 1000;
          provider?.google?.accessToken = googleTokens.accessToken!;
          provider?.google?.accessTokenExpires = expires;

          cluster.userToken = provider?.google?.accessToken ?? '';

          await editProviderWithoutNotify(provider!);
          await editClusterWithoutNotify(cluster);
          return cluster;
        } else {
          if (cluster.userToken != provider?.google?.accessToken) {
            cluster.userToken = provider?.google?.accessToken ?? '';
            await editClusterWithoutNotify(cluster);
          }
          return cluster;
        }
      } else if (cluster.clusterProviderType == ClusterProviderType.oidc) {
        /// If the cluster provider type is OIDC, we have to check that the id
        /// token is not expired. If the id token is expired, we try to get a
        /// new one using. If we are able to get a new id token, we save it in
        /// the provider and cluster configuration before we return the cluster.
        ///
        /// If the id token is not expired but different from the current id
        /// token saved within the cluster configuration, we change the token in
        /// the cluster configuration before we return the cluster.
        final provider = getProvider(cluster.clusterProviderId);

        DateTime? expiryDate = Jwt.getExpiryDate(provider?.oidc?.idToken ?? '');

        if (expiryDate != null && expiryDate.isBefore(DateTime.now())) {
          final oidcResponse = await OIDCService().getAccessToken(
            provider?.oidc?.discoveryURL ?? '',
            provider?.oidc?.clientID ?? '',
            provider?.oidc?.clientSecret ?? '',
            provider?.oidc?.certificateAuthority ?? '',
            provider?.oidc?.scopes ?? '',
            Constants.oidcRedirectURI,
            provider?.oidc?.refreshToken ?? '',
            provider?.oidc?.useAccessToken ?? false,
          );

          if (oidcResponse.idToken != null) {
            provider?.oidc?.idToken = oidcResponse.idToken!;
          }

          if (oidcResponse.refreshToken != null &&
              oidcResponse.refreshToken != '') {
            provider?.oidc?.refreshToken = oidcResponse.refreshToken!;
          }

          cluster.userToken = oidcResponse.idToken!;
          await editProviderWithoutNotify(provider!);
          await editClusterWithoutNotify(cluster);

          return cluster;
        } else {
          if (cluster.userToken != provider?.oidc?.idToken) {
            cluster.userToken = provider?.oidc?.idToken ?? '';
            editClusterWithoutNotify(cluster);
          }
          return cluster;
        }
      }

      /// If the cluster provider type doesn't match one of the types from above
      /// we can directly return the cluster without other steps, like
      /// refreshing the token.
      return cluster;
    } catch (err) {
      rethrow;
    }
  }

  /// [reorderClusters] can be used to change the order of the clusters
  /// (e.g. via ReorderableListView). The order of the clusters, matters,
  /// because in some parts of the ui we are only displaying the top X clusters
  /// instead of all clusters.
  ///
  /// We have to check if the user drags a cluster from top to bottom ([start]
  /// is lower then [current]) or from the bottom to the top ([start] is greater
  /// then [current]), to apply a different logic for the reordering.
  Future<void> reorderClusters(int start, int current) async {
    if (start < current) {
      int end = current - 1;
      Cluster startItem = _clusters[start];
      int i = 0;
      int local = start;
      do {
        _clusters[local] = _clusters[++local];
        i++;
      } while (i < end - start);
      _clusters[end] = startItem;
    } else if (start > current) {
      Cluster startItem = _clusters[start];
      for (int i = start; i > current; i--) {
        _clusters[i] = _clusters[i - 1];
      }
      _clusters[current] = startItem;
    }

    await _save();
    notifyListeners();
  }

  /// [addProvider] can be used to add a new [provider] to our list of
  /// [_providers].
  Future<void> addProvider(ClusterProvider provider) async {
    _providers.add(provider);
    await _save();
    notifyListeners();
  }

  /// [editProvider] replaces a provider in our list of [_providers] with the
  /// given [provider] when the id of the given provider is the same as the id
  /// in our list of providers. When the id of the given provider doesn't match
  /// an id in our list of providers we do nothing, because this can normally
  /// not happen.
  Future<void> editProvider(ClusterProvider provider) async {
    for (var i = 0; i < providers.length; i++) {
      if (_providers[i].id == provider.id) {
        _providers[i] = provider;
      }
    }

    await _save();
    notifyListeners();
  }

  /// [editProviderWithoutNotify] replaces a provider in our list of
  /// [_providers] with the given [provider] when the id of the given provider
  /// is the same as the id in our list of providers. When the id of the given
  /// provider doesn't match an id in our list of providers we do nothing,
  /// because this can normally not happen.
  ///
  /// In difference to the [editProvider] function this doesn't trigger the
  /// [notifyListeners] function.
  Future<void> editProviderWithoutNotify(ClusterProvider provider) async {
    for (var i = 0; i < providers.length; i++) {
      if (_providers[i].id == provider.id) {
        _providers[i] = provider;
      }
    }

    await _save();
  }

  /// [deleteProvider] deletes the provider with the given [providerId] from our
  /// [_providers] list. Before we can delete the provider we have to check that
  /// the [providerId] is not used by a cluster in our [_clusters] list. If the
  /// id is still used we throw an error, because we need the provider so that
  /// the cluster is working correctly.
  Future<void> deleteProvider(String providerId) async {
    for (var i = 0; i < _clusters.length; i++) {
      if (_clusters[i].clusterProviderId == providerId) {
        throw Exception(
          'Provider can not be deleted, because it is used by the cluster ${_clusters[i].name}',
        );
      }
    }

    _providers = _providers.where((c) => c.id != providerId).toList();
    await _save();
    notifyListeners();
  }

  /// [getProvider] returns a `ClusterProvider` with the given [providerId]. If
  /// we can not find a provider with the id in our [_providers] list we return
  /// `null`.
  ClusterProvider? getProvider(String providerId) {
    for (var i = 0; i < _providers.length; i++) {
      if (_providers[i].id == providerId) {
        return _providers[i];
      }
    }

    return null;
  }
}

/// The [ClustersRepositoryStorage] model is used to store the state of a
/// [ClustersRepository]. This means the model can be used to store the
/// configured [clusters], [providers] and the [activeClusterId] via the Flutter
/// Secure Storage package.
class ClustersRepositoryStorage {
  List<Cluster> clusters;
  List<ClusterProvider> providers;
  String activeClusterId;

  ClustersRepositoryStorage({
    required this.clusters,
    required this.providers,
    required this.activeClusterId,
  });

  factory ClustersRepositoryStorage.fromJson(Map<String, dynamic> data) {
    return ClustersRepositoryStorage(
      clusters: data.containsKey('clusters') && data['clusters'] != null
          ? List<Cluster>.from(data['clusters'].map((v) => Cluster.fromJson(v)))
          : [],
      providers: data.containsKey('providers') && data['providers'] != null
          ? List<ClusterProvider>.from(
              data['providers'].map((v) => ClusterProvider.fromJson(v)),
            )
          : [],
      activeClusterId:
          data.containsKey('activeClusterId') && data['activeClusterId'] != null
              ? data['activeClusterId']
              : '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'clusters': clusters.map((e) => e.toJson()).toList(),
      'providers': providers.map((e) => e.toJson()).toList(),
      'activeClusterId': activeClusterId,
    };
  }
}
