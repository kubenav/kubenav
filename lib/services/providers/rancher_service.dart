import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:kubenav/models/kubernetes_extensions/kubeconfig.dart';
import 'package:kubenav/utils/logger.dart';

/// [RancherToken] is the format of the returned JSON from the `login` call
/// against the Rancher API.
class RancherToken {
  String? id;
  String? token;

  RancherToken({
    required this.id,
    required this.token,
  });

  factory RancherToken.fromJson(
    Map<String, dynamic> data,
  ) {
    return RancherToken(
      id: data.containsKey('id') ? data['id'] : null,
      token: data.containsKey('token') ? data['token'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'token': token,
    };
  }
}

/// [RancherCluster] is the format of the returned JSON from the `getClusters`
/// call against the Rancher API.
class RancherCluster {
  String? id;
  String? name;
  Kubeconfig? kubeconfig;

  RancherCluster({
    required this.id,
    required this.name,
    required this.kubeconfig,
  });

  factory RancherCluster.fromJson(
    Map<String, dynamic> data,
  ) {
    return RancherCluster(
      id: data.containsKey('id') ? data['id'] : null,
      name: data.containsKey('name') ? data['name'] : null,
      kubeconfig: data.containsKey('kubeconfig')
          ? Kubeconfig.fromJson(data['kubeconfig'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'kubeconfig': kubeconfig?.toJson(),
    };
  }
}

/// [RancherKubeconfig] is the format of the returned JSON from the
/// `getKubeconfig` call against the Rancher API.
class RancherKubeconfig {
  String? baseType;
  String? config;
  String? type;

  RancherKubeconfig({
    required this.baseType,
    required this.config,
    required this.type,
  });

  factory RancherKubeconfig.fromJson(
    Map<String, dynamic> data,
  ) {
    return RancherKubeconfig(
      baseType: data.containsKey('baseType') ? data['baseType'] : null,
      config: data.containsKey('config') ? data['config'] : null,
      type: data.containsKey('type') ? data['type'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'baseType': baseType,
      'config': config,
      'type': type,
    };
  }
}

class RancherService {
  Future<RancherToken> signIn(
    String serverAddress,
    bool allowInsecureConnections,
    String username,
    String password,
  ) async {
    try {
      HttpClient client = HttpClient();
      if (allowInsecureConnections) {
        client.badCertificateCallback =
            ((X509Certificate cert, String host, int port) => true);
      }
      HttpClientRequest request = await client.postUrl(
        Uri.parse(
          '$serverAddress/v3-public/localProviders/local?action=login',
        ),
      );
      request.headers.set('content-type', 'application/json');
      request.add(
        utf8.encode(
          json.encode(
            {
              'description': 'kubenav session',
              'username': username,
              'password': password,
              'ttl': 57600000,
            },
          ),
        ),
      );

      HttpClientResponse response = await request.close();
      String responseData = await response.transform(utf8.decoder).join();

      Logger.log(
        'RancherService signin',
        'Response status: ${response.statusCode}',
        responseData,
      );

      Map<String, dynamic> jsonData = json.decode(responseData);
      RancherToken rancherTokens = RancherToken.fromJson(jsonData);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return rancherTokens;
      } else {
        Logger.log(
          'RancherService signin',
          'Failed to Get Token, Requests Returned Status Code ${response.statusCode}',
          jsonData,
        );
        throw Exception(jsonData);
      }
    } catch (err) {
      Logger.log(
        'RancherService signin',
        'Failed to Get Token',
        err,
      );
      rethrow;
    }
  }

  Future<List<RancherCluster>> getClusters(
    String serverAddress,
    bool allowInsecureConnections,
    String token,
  ) async {
    try {
      HttpClient client = HttpClient();
      if (allowInsecureConnections) {
        client.badCertificateCallback =
            ((X509Certificate cert, String host, int port) => true);
      }
      HttpClientRequest request =
          await client.getUrl(Uri.parse('$serverAddress/v3/clusters'));
      request.headers.set('Authorization', 'Bearer $token');

      HttpClientResponse response = await request.close();
      String responseData = await response.transform(utf8.decoder).join();

      Logger.log(
        'RancherService getClusters',
        'Response Status: ${response.statusCode}',
        responseData,
      );

      Map<String, dynamic> jsonData = json.decode(responseData);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        List<RancherCluster> clusters = [];
        for (final cluster in jsonData['data']) {
          clusters.add(RancherCluster.fromJson(cluster));
        }
        return clusters;
      } else {
        Logger.log(
          'RancherService getClusters',
          'Failed to Get Clusters, Requests Returned Status Code ${response.statusCode}',
          jsonData,
        );
        throw Exception(jsonData);
      }
    } catch (err) {
      Logger.log(
        'RancherService getClusters',
        'Failed to Get Clusters',
        err,
      );
      rethrow;
    }
  }

  Future<RancherKubeconfig> getKubeconfig(
    String serverAddress,
    bool allowInsecureConnections,
    String token,
    String clusterId,
  ) async {
    try {
      HttpClient client = HttpClient();
      if (allowInsecureConnections) {
        client.badCertificateCallback =
            ((X509Certificate cert, String host, int port) => true);
      }
      HttpClientRequest request = await client.postUrl(
        Uri.parse(
          '$serverAddress/v3/clusters/$clusterId?action=generateKubeconfig',
        ),
      );
      request.headers.set('Authorization', 'Bearer $token');

      HttpClientResponse response = await request.close();
      String responseData = await response.transform(utf8.decoder).join();

      Logger.log(
        'RancherService getKubeconfig',
        'Response Status: ${response.statusCode}',
        responseData,
      );

      Map<String, dynamic> jsonData = json.decode(responseData);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return RancherKubeconfig.fromJson(jsonData);
      } else {
        Logger.log(
          'RancherService getKubeconfig',
          'Failed to Get Kubeconfig for $clusterId, Requests Returned Status Code ${response.statusCode}',
          jsonData,
        );
        throw Exception(jsonData);
      }
    } catch (err) {
      Logger.log(
        'RancherService getKubeconfig',
        'Failed to Get Kubeconfig for $clusterId',
        err,
      );
      rethrow;
    }
  }
}
