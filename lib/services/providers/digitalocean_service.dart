import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:kubenav/models/kubernetes_extensions/kubeconfig.dart';
import 'package:kubenav/utils/logger.dart';

/// [DigitalOceanCluster] is the format of a single cluster in the list of
/// DigitalOcean clusters. Each cluster contains a [id], [name] and the
/// [region].
class DigitalOceanCluster {
  String? id;
  String? name;
  String? region;
  Kubeconfig? kubeconfig;

  DigitalOceanCluster({
    required this.id,
    required this.name,
    required this.region,
    required this.kubeconfig,
  });

  factory DigitalOceanCluster.fromJson(Map<String, dynamic> data) {
    return DigitalOceanCluster(
      id: data.containsKey('id') ? data['id'] : null,
      name: data.containsKey('name') ? data['name'] : null,
      region: data.containsKey('region') ? data['region'] : null,
      kubeconfig: data.containsKey('kubeconfig') && data['kubeconfig'] != null
          ? Kubeconfig.fromJson(data['kubeconfig'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'region': region,
      'kubeconfig': kubeconfig?.toJson(),
    };
  }
}

/// [DigitalOceanService] implements a service to interactiv with the
/// DigitalOcean API.
class DigitalOceanService {
  /// [getClusters] can be used to get all DigitalOcean clusters which can be
  /// accessed using the provided API [token].
  Future<List<DigitalOceanCluster>> getClusters(String token) async {
    try {
      final response = await http.get(
        Uri.parse('https://api.digitalocean.com/v2/kubernetes/clusters'),
        headers: {'Authorization': 'Bearer $token'},
      );

      Logger.log(
        'DigitalOceanService getClusters',
        'Response Status: ${response.statusCode}',
        response.body,
      );

      Map<String, dynamic>? jsonData = json.decode(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        if (jsonData == null ||
            !jsonData.containsKey('kubernetes_clusters') ||
            jsonData['kubernetes_clusters'] == null) {
          return [];
        }

        final List<DigitalOceanCluster> clusters = [];
        for (var cluster in jsonData['kubernetes_clusters']) {
          clusters.add(DigitalOceanCluster.fromJson(cluster));
        }

        return clusters;
      } else {
        Logger.log(
          'DigitalOceanService getClusters',
          'Failed to Get Clusters, Requests Returned Status Code ${response.statusCode}',
          jsonData,
        );
        throw Exception(jsonData ?? 'An unknown error occured');
      }
    } catch (err) {
      Logger.log(
        'DigitalOceanService getClusters',
        'Failed to get Clusters',
        err,
      );
      rethrow;
    }
  }

  /// [getKubeconfig] can be used to get the kubeconfig for a DigitalOcean
  /// cluster.
  Future<String> getKubeconfig(String id, String token) async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://api.digitalocean.com/v2/kubernetes/clusters/$id/kubeconfig',
        ),
        headers: {'Authorization': 'Bearer $token'},
      );

      Logger.log(
        'DigitalOceanService getKubeconfig',
        'Response Status: ${response.statusCode}',
        response.body,
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return response.body;
      } else {
        Map<String, dynamic> jsonData = json.decode(response.body);

        Logger.log(
          'DigitalOceanService getKubeconfig',
          'Failed to Get Kubeconfig, Requests Returned Status Code ${response.statusCode}',
          jsonData,
        );
        throw Exception(jsonData);
      }
    } catch (err) {
      Logger.log(
        'DigitalOceanService getKubeconfig',
        'Failed to get Kubeconfig',
        err,
      );
      rethrow;
    }
  }
}
