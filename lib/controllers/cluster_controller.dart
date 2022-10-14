import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:kubenav/models/cluster_model.dart';
import 'package:kubenav/utils/ffi.dart';

/// The [ClusterController] is responsible for managing all the clusters of a user. For that it holds a list of
/// [clusters] and allows users to add / remove clusters to that list. Everytime the list of [clusters] is changed it
/// will save the changes back to the storage.
///
/// To indicate the currently active cluster it also holds the [activeClusterIndex]. When the user selects a cluster in
/// a screen the [activeClusterIndex] will be set to the index of the selected cluster in the list of [clusters].
class ClusterController extends GetxController {
  RxList<Rx<Cluster>> clusters = <Rx<Cluster>>[].obs;
  RxInt activeClusterIndex = (-1).obs;

  /// [onInit] is used to initialize the [clusters] and the [activeClusterIndex]. For that we are looking if these
  /// values are already saved in the storage. If this is the case we are reusing the saved values. If we could not
  /// found saved clusters or the saved active cluster index we are using the default values (empty list and -1).
  ///
  /// Besides that we are also using the [ever] function so that all changes to the list of clusters or the active
  /// cluster index are saved back to the storage.
  @override
  void onInit() {
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      var index = 0;
      Map<String, dynamic> storedClusters = KubenavFFI().kubernetesClusters();
      for (var storedCluster in storedClusters['clusters'].entries) {
        clusters.add(
          Cluster(
            name: storedCluster.key,
            provider: '',
            providerConfig: '',
            clusterServer: '',
            namespace: storedCluster.value,
          ).obs,
        );

        if (storedClusters['activeCluster'] == storedCluster.key) {
          activeClusterIndex.value = index;
        }
        index++;
      }

      if (activeClusterIndex.value == -1 &&
          storedClusters['clusters'].entries.length > 0) {
        activeClusterIndex.value = 0;
      }
    } else {
      List? storedClusters = GetStorage().read<List>('clusters');
      int? storedActiveClusterIndex =
          GetStorage().read<int>('activeClusterIndex');

      if (storedClusters != null && storedClusters.isNotEmpty) {
        clusters =
            storedClusters.map((e) => Cluster.fromJson(e).obs).toList().obs;

        if (storedActiveClusterIndex != null) {
          activeClusterIndex.value = storedActiveClusterIndex;
        } else {
          activeClusterIndex.value = 0;
        }
      }

      ever(clusters, (_) {
        GetStorage().write('clusters', clusters.toList());
      });

      ever(activeClusterIndex, (_) {
        GetStorage().write('activeClusterIndex', activeClusterIndex.value);
      });
    }

    super.onInit();
  }

  /// [addCluster] adds a new cluster to our list of [clusters]. We are only checking if the provided cluster name is
  /// already used and return an error string in that case. Besides that all validation of the provided cluster values
  /// should happen outside of this controller.
  /// When the cluster was succesfully added, we are also setting it as active cluster (via the [activeClusterIndex]),
  /// when it was the first cluster, which was added by a user.
  String? addCluster(Cluster cluster) {
    for (var i = 0; i < clusters.length; i++) {
      if (clusters[i].value.name == cluster.name) {
        return 'A cluster with the same name already exists';
      }
    }

    clusters.add(cluster.obs);

    if (activeClusterIndex.value == -1) {
      activeClusterIndex.value = 0;
    }

    return null;
  }

  /// [editCluster] modifies the properties of the cluster with the given index. Before we modify the cluster properties
  /// we have to check if another cluster has the provided [name]. If this is the case we abort this operation and
  /// return an error string. If the no other cluster has the same [name] or the name wasn't changed we set all the new
  /// cluster properties. Finally we have to trigger a manual write to the storage for the list of clusters.
  String? editCluster(
    int clusterIndex,
    String name,
    String clusterServer,
    String clusterCertificateAuthorityData,
    bool clusterInsecureSkipTLSVerify,
    String userClientCertificateData,
    String userClientKeyData,
    String userToken,
    String userUsername,
    String userPassword,
    String namespace,
  ) {
    for (var i = 0; i < clusters.length; i++) {
      if (clusters[i].value.name == name && clusterIndex != i) {
        return 'A cluster with the same name already exists';
      }
    }

    clusters[clusterIndex].value.name = name;
    clusters[clusterIndex].value.clusterServer = clusterServer;
    clusters[clusterIndex].value.clusterCertificateAuthorityData =
        clusterCertificateAuthorityData;
    clusters[clusterIndex].value.clusterInsecureSkipTLSVerify =
        clusterInsecureSkipTLSVerify;
    clusters[clusterIndex].value.userClientCertificateData =
        userClientCertificateData;
    clusters[clusterIndex].value.userClientKeyData = userClientKeyData;
    clusters[clusterIndex].value.userToken = userToken;
    clusters[clusterIndex].value.userUsername = userUsername;
    clusters[clusterIndex].value.userPassword = userPassword;
    clusters[clusterIndex].value.namespace = namespace;

    GetStorage().write('clusters', clusters.toList());
    return null;
  }

  /// [deleteCluster] deletes the cluster with the given index from our [clusters] list. Besides that we also check if
  /// the list is empty to reset the [activeClusterIndex]. If the active cluster index is equal to the index of the
  /// cluster which should be removed we set the first cluster in the list as active cluster.
  void deleteCluster(int index) {
    clusters.removeAt(index);

    if (clusters.isEmpty) {
      activeClusterIndex.value = -1;
    } else if (activeClusterIndex.value >= index) {
      activeClusterIndex.value = 0;
    }
  }

  /// [setActiveCluster] is used to set the active cluster index to the provided value.
  void setActiveCluster(int index) {
    activeClusterIndex.value = index;
  }

  /// [setActiveClusterAndNamespace] changes the active cluster to the given [name] and set the namespace of the cluster
  /// to the given [namespace]. If the active cluster was changed, the function returns `true`, if it wasn't changed the
  /// function returns `false`.
  bool setActiveClusterAndNamespace(String name, String namespace) {
    var tmpActiveClusterIndex = -1;

    for (var i = 0; i < clusters.length; i++) {
      if (clusters[i].value.name == name) {
        tmpActiveClusterIndex = i;
        break;
      }
    }

    if (tmpActiveClusterIndex == -1) {
      return false;
    }

    setActiveCluster(tmpActiveClusterIndex);
    setNamespace(namespace);
    return true;
  }

  /// [reorder] can be used to change the order of the clusters (e.g. via ReorderableListView). The order of the
  /// clusters, matters, because in some parts of the ui we are only displaying the top X clusters instead of all
  /// clusters.
  ///
  /// We have to check if the user drags a cluster from top to bottom ([start] is lower then [current]) or from the
  /// bottom to the top ([start] is greater then [current]), to apply a different logic for the reordering.
  ///
  /// Before we apply the new order we are also saving the cluster name in a temporary variables, so that we can set the
  /// [activeClusterIndex] to the new index value of the cluster, which was marked as active cluster before the
  /// reordering.
  void reorder(int start, int current) {
    final clusterName = clusters[activeClusterIndex.value].value.name;

    if (start < current) {
      int end = current - 1;
      Rx<Cluster> startItem = clusters[start];
      int i = 0;
      int local = start;
      do {
        clusters[local] = clusters[++local];
        i++;
      } while (i < end - start);
      clusters[end] = startItem;
    } else if (start > current) {
      Rx<Cluster> startItem = clusters[start];
      for (int i = start; i > current; i--) {
        clusters[i] = clusters[i - 1];
      }
      clusters[current] = startItem;
    }

    for (var i = 0; i < clusters.length; i++) {
      if (clusters[i].value.name == clusterName) {
        activeClusterIndex.value = i;
      }
    }
  }

  /// [setNamespace] changes the namespace for the active cluster to the value of the [namespace] argument. When the
  /// namespace of the cluster was changed to the new value, we have to call the [refresh] method to reflect the
  /// changed cluster in the UI and we have to write the list of clusters to the storage, because changes of a single
  /// cluster are not covered by the [ever] worker in the [onInit] function.
  void setNamespace(String namespace) {
    clusters[activeClusterIndex.value].value.namespace = namespace;
    clusters[activeClusterIndex.value].refresh();
    GetStorage().write('clusters', clusters.toList());
  }

  /// [getActiveClusterName] returns the name of the active cluster. If there is no active cluster it returns a the
  /// message `No active cluster`.
  String getActiveClusterName() {
    if (clusters.isEmpty || activeClusterIndex.value == -1) {
      return 'No active cluster';
    }

    return clusters[activeClusterIndex.value].value.name;
  }

  /// [getActiveClusterNamespace] returns the name of the current namespace of the active cluster. If there is no active
  /// cluster it returns an empty string.
  String getActiveClusterNamespace() {
    if (clusters.isEmpty || activeClusterIndex.value == -1) {
      return '';
    }

    return clusters[activeClusterIndex.value].value.namespace;
  }

  /// [getActiveCluster] returns the active cluster or `null` when there is no active cluster.
  Cluster? getActiveCluster() {
    if (clusters.isEmpty || activeClusterIndex.value == -1) {
      return null;
    }

    return clusters[activeClusterIndex.value].value;
  }

  /// [setNewToken] sets a new access token for the cluster with the given name. After the token was set for the given
  /// cluster, we save the list of clusters to the storage.
  void setNewToken(String name, String token, int tokenExpireTimestamp) {
    for (var cluster in clusters) {
      if (cluster.value.name == name) {
        cluster.value.userToken = token;
        cluster.value.userTokenExpireTimestamp = tokenExpireTimestamp;
        GetStorage().write('clusters', clusters.toList());
        return;
      }
    }
  }
}
