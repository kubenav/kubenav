import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:kubenav/models/kubernetes_extensions/kubeconfig.dart';
import 'package:kubenav/utils/logger.dart';

/// [AzureCluster] is the format of a single cluster in the list of Azure
/// clusters. Each cluster contains a [name] and a [kubeconfig] file.
class AzureCluster {
  String? name;
  Kubeconfig? kubeconfig;

  AzureCluster({
    required this.name,
    required this.kubeconfig,
  });

  factory AzureCluster.fromJson(
    Map<String, dynamic> data,
  ) {
    return AzureCluster(
      name: data.containsKey('name') ? data['name'] : null,
      kubeconfig: data.containsKey('kubeconfig')
          ? Kubeconfig.fromJson(data['kubeconfig'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'kubeconfig': kubeconfig?.toJson(),
    };
  }
}

/// [AzureService] implements a service to interactiv with the Azure functions
/// from our Go code. The implementation details of each Go function can be
/// found in the `cmd/kubenav/azure.go` file.
class AzureService {
  static const platform = MethodChannel('kubenav.io');

  /// [getClusters] can be used to get all Azure clusters which can be accessed
  /// using the provided credentials.
  Future<List<AzureCluster>> getClusters(
    String subscriptionID,
    String tenantID,
    String clientID,
    String clientSecret,
    bool isAdmin,
  ) async {
    try {
      final String result = await platform.invokeMethod(
        'azureGetClusters',
        <String, dynamic>{
          'subscriptionID': subscriptionID,
          'tenantID': tenantID,
          'clientID': clientID,
          'clientSecret': clientSecret,
          'isAdmin': isAdmin,
        },
      );

      Logger.log(
        'AzureService getClusters',
        'Clusters were returned',
        result,
      );

      List<dynamic> tmpClusters = json.decode(result);
      List<AzureCluster> clusters = [];
      for (var tmpCluster in tmpClusters) {
        clusters.add(AzureCluster.fromJson(tmpCluster));
      }
      return clusters;
    } catch (err) {
      Logger.log(
        'AzureService getClusters',
        'Could not get Azure clusters',
        err,
      );
      rethrow;
    }
  }
}
