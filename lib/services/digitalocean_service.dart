import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:kubenav/models/kubeconfig_model.dart';
import 'package:kubenav/utils/logger.dart';

/// [DigitalOceanCluster] is the format of a single cluster in the list of Digital Ocean clusters. Each cluster contains
/// a [id], [name] and the [region].
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

  DigitalOceanCluster.fromJson(
    Map<String, dynamic> json,
  ) {
    id = json['id'];
    name = json['name'];
    region = json['region'];
    kubeconfig = json['kubeconfig'] != null
        ? Kubeconfig.fromJson(json['kubeconfig'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['region'] = region;
    if (kubeconfig != null) {
      data['kubeconfig'] = kubeconfig!.toJson();
    }
    return data;
  }
}

/// [DigitalOceanService] implements a service to interactiv with the Digital Ocean API.
class DigitalOceanService {
  DigitalOceanService();

  /// [getClusters] can be used to get all Digital Ocean clusters which can be accessed using the provided API [token].
  Future<List<DigitalOceanCluster>> getClusters(
    String token,
  ) async {
    try {
      final response = await http.get(
        Uri.parse('https://api.digitalocean.com/v2/kubernetes/clusters'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      Logger.log(
        'DigitalOceanService getClusters',
        'Response status: ${response.statusCode}',
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
          'Could not get clusters with status code ${response.statusCode}',
          jsonData,
        );
        return Future.error(jsonData ?? 'An unknown error occured');
      }
    } catch (err) {
      Logger.log(
        'DigitalOceanService getClusters',
        'Could not get Digital Ocean clusters',
        err,
      );
      return Future.error(err);
    }
  }

  /// [getKubeconfig] can be used to get the kubeconfig for a Digital Ocean cluster.
  Future<String> getKubeconfig(
    String id,
    String token,
  ) async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://api.digitalocean.com/v2/kubernetes/clusters/$id/kubeconfig'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      Logger.log(
        'DigitalOceanService getKubeconfig',
        'Response status: ${response.statusCode}',
        response.body,
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return response.body;
      } else {
        Map<String, dynamic> jsonData = json.decode(response.body);

        Logger.log(
          'DigitalOceanService getKubeconfig',
          'Could not get clusters with status code ${response.statusCode}',
          jsonData,
        );
        return Future.error(jsonData);
      }
    } catch (err) {
      Logger.log(
        'DigitalOceanService getKubeconfig',
        'Could not get Digital Ocean clusters',
        err,
      );
      return Future.error(err);
    }
  }
}
