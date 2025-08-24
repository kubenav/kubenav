import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/logger.dart';

/// [GoogleTokens] is the format of the returned JSON from the `getTokens` call
/// against the Google API.
class GoogleTokens {
  String? accessToken;
  String? error;
  String? errorDescription;
  int? expiresIn;
  String? idToken;
  String? refreshToken;
  String? tokenType;

  GoogleTokens({
    required this.accessToken,
    required this.error,
    required this.errorDescription,
    required this.expiresIn,
    required this.idToken,
    required this.refreshToken,
    required this.tokenType,
  });

  factory GoogleTokens.fromJson(Map<String, dynamic> data) {
    return GoogleTokens(
      accessToken: data.containsKey('access_token')
          ? data['access_token']
          : null,
      error: data.containsKey('error') ? data['error'] : null,
      errorDescription: data.containsKey('error_description')
          ? data['error_description']
          : null,
      expiresIn: data.containsKey('expires_in') ? data['expires_in'] : null,
      idToken: data.containsKey('id_token') ? data['id_token'] : null,
      refreshToken: data.containsKey('refresh_token')
          ? data['refresh_token']
          : null,
      tokenType: data.containsKey('token_type') ? data['token_type'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'error': error,
      'error_description': errorDescription,
      'expires_in': expiresIn,
      'id_token': idToken,
      'refresh_token': refreshToken,
      'token_type': tokenType,
    };
  }
}

/// [GoogleProject] is the format of the returned JSON data of a Google project.
class GoogleProject {
  String? projectId;

  GoogleProject({required this.projectId});

  factory GoogleProject.fromJson(Map<String, dynamic> data) {
    return GoogleProject(
      projectId: data.containsKey('projectId') ? data['projectId'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'projectId': projectId};
  }
}

/// [GoogleCluster] is the format of the returned JSON data of a GKE cluster.
class GoogleCluster {
  String? name;
  String? endpoint;
  String? location;
  GoogleClusterMasterAuth? masterAuth;

  GoogleCluster({
    required this.name,
    required this.endpoint,
    required this.location,
    required this.masterAuth,
  });

  factory GoogleCluster.fromJson(Map<String, dynamic> data) {
    return GoogleCluster(
      name: data.containsKey('name') ? data['name'] : null,
      endpoint: data.containsKey('endpoint') ? data['endpoint'] : null,
      location: data.containsKey('location') ? data['location'] : null,
      masterAuth: data.containsKey('masterAuth') && data['masterAuth'] != null
          ? GoogleClusterMasterAuth.fromJson(data['masterAuth'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'endpoint': endpoint,
      'location': location,
      'masterAuth': masterAuth?.toJson(),
    };
  }
}

/// [GoogleClusterMasterAuth] is the format of the returned JSON data of auth
/// information for a GKE cluster.
class GoogleClusterMasterAuth {
  String? username;
  String? password;
  String? clusterCaCertificate;
  String? clientCertificate;
  String? clientKey;

  GoogleClusterMasterAuth({
    required this.username,
    required this.password,
    required this.clusterCaCertificate,
    required this.clientCertificate,
    required this.clientKey,
  });

  factory GoogleClusterMasterAuth.fromJson(Map<String, dynamic> data) {
    return GoogleClusterMasterAuth(
      username: data.containsKey('username') ? data['username'] : null,
      password: data.containsKey('password') ? data['password'] : null,
      clusterCaCertificate: data.containsKey('clusterCaCertificate')
          ? data['clusterCaCertificate']
          : null,
      clientCertificate: data.containsKey('clientCertificate')
          ? data['clientCertificate']
          : null,
      clientKey: data.containsKey('clientKey') ? data['clientKey'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'clusterCaCertificate': clusterCaCertificate,
      'clientCertificate': clientCertificate,
      'clientKey': clientKey,
    };
  }
}

/// [GoogleService] implements a service to interact with the Google API. This
/// is required to get a valid access token and to get the Google Projects and
/// GKE clusters.
class GoogleService {
  /// [getTokensFromCode] can be used to exchange the returned [code] for an
  /// access and refresh via the Google API.
  Future<GoogleTokens> getTokensFromCode(
    String clientID,
    String clientSecret,
    String code,
  ) async {
    try {
      final response = await http.post(
        Uri.parse(
          'https://oauth2.googleapis.com/token?code=$code&client_id=$clientID&client_secret=$clientSecret&redirect_uri=${Constants.googleRedirectURI}&grant_type=authorization_code',
        ),
      );

      Logger.log(
        'GoogleService getTokensFromCode',
        'Response status: ${response.statusCode}',
        response.body,
      );

      Map<String, dynamic> jsonData = json.decode(response.body);
      GoogleTokens googleTokens = GoogleTokens.fromJson(jsonData);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return googleTokens;
      } else {
        if (googleTokens.error != null && googleTokens.error != '') {
          Logger.log(
            'GoogleService getTokensFromCode',
            'Failed to get Access Token ${googleTokens.error}',
            jsonData,
          );
          throw Exception(jsonData);
        }

        Logger.log(
          'GoogleService getTokensFromCode',
          'Failed to Get Access Token, Requests Returned Status Code ${response.statusCode}',
          jsonData,
        );
        throw Exception(jsonData);
      }
    } catch (err) {
      Logger.log(
        'GoogleService getTokensFromCode',
        'Failed to Get Access Token',
        err,
      );
      rethrow;
    }
  }

  /// [getTokensFromRefreshToken] can be used to get a new access token via the
  /// provided [refreshToken] from the Google API.
  Future<GoogleTokens> getTokensFromRefreshToken(
    String clientID,
    String clientSecret,
    String refreshToken,
  ) async {
    try {
      final response = await http.post(
        Uri.parse(
          'https://oauth2.googleapis.com/token?refresh_token=$refreshToken&client_id=$clientID&client_secret=$clientSecret&grant_type=refresh_token',
        ),
      );

      Logger.log(
        'GoogleService getTokensFromRefreshToken',
        'Response Status: ${response.statusCode}',
        response.body,
      );

      Map<String, dynamic> jsonData = json.decode(response.body);
      GoogleTokens googleTokens = GoogleTokens.fromJson(jsonData);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return googleTokens;
      } else {
        if (googleTokens.error != null && googleTokens.error != '') {
          Logger.log(
            'GoogleService getTokensFromRefreshToken',
            'Failed to Get Access Token ${googleTokens.error}',
            jsonData,
          );
          throw Exception(jsonData);
        }

        Logger.log(
          'GoogleService getTokensFromRefreshToken',
          'Failed to Get Access Token, Requests Returned Status Code ${response.statusCode}',
          jsonData,
        );
        throw Exception(jsonData);
      }
    } catch (err) {
      Logger.log(
        'GoogleService getTokensFromRefreshToken',
        'Failed to Get Access Token',
        err,
      );
      rethrow;
    }
  }

  /// [isGoogleAPIEnabled] returns `true` when he provided [api] is enabled for
  /// the provided [project] and `false` when the API is not enabled.
  Future<bool> isGoogleAPIEnabled(
    String project,
    String api,
    String accessToken,
  ) async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://serviceusage.googleapis.com/v1/projects/$project/services/$api',
        ),
        headers: {'Authorization': 'Bearer $accessToken'},
      );

      Logger.log(
        'GoogleService isGoogleAPIEnabled',
        'Response Status: ${response.statusCode}',
        response.body,
      );

      Map<String, dynamic> jsonData = json.decode(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        if (jsonData['state'] == 'ENABLED') {
          return true;
        } else {
          return false;
        }
      } else {
        Logger.log(
          'GoogleService isGoogleAPIEnabled',
          'Failed to Check if API is Enabled, Requests Returned Status Code ${response.statusCode}',
          jsonData,
        );
        return false;
      }
    } catch (err) {
      Logger.log(
        'GoogleService isGoogleAPIEnabled',
        'Failed to Check if API is Enabled',
        err,
      );
      return false;
    }
  }

  /// [getProjects] returns all the projects a user has access to.
  Future<List<GoogleProject>> getProjects(String accessToken) async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://cloudresourcemanager.googleapis.com/v1/projects?filter=lifecycleState%3AACTIVE',
        ),
        headers: {'Authorization': 'Bearer $accessToken'},
      );

      Logger.log(
        'GoogleService getProjects',
        'Response Status: ${response.statusCode}',
        response.body,
      );

      Map<String, dynamic>? jsonData = json.decode(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        if (jsonData == null ||
            !jsonData.containsKey('projects') ||
            jsonData['projects'] == null) {
          return [];
        }

        final List<GoogleProject> projects = [];
        for (var projectJson in jsonData['projects']) {
          final project = GoogleProject.fromJson(projectJson);

          final enabled = await isGoogleAPIEnabled(
            project.projectId!,
            'container.googleapis.com',
            accessToken,
          );
          if (enabled) {
            projects.add(project);
          }
        }

        return projects;
      } else {
        Logger.log(
          'GoogleService getProjects',
          'Failed to Get Projects, Requests Returned Status Code ${response.statusCode}',
          jsonData,
        );
        throw Exception(jsonData ?? 'An unknown error occured');
      }
    } catch (err) {
      Logger.log('GoogleService getProjects', 'Failed to Get Projects', err);
      rethrow;
    }
  }

  /// [getClusters] returns all clusters for a given Google project.
  Future<List<GoogleCluster>> getClusters(
    String project,
    String accessToken,
  ) async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://container.googleapis.com/v1/projects/$project/locations/-/clusters',
        ),
        headers: {'Authorization': 'Bearer $accessToken'},
      );

      Logger.log(
        'GoogleService getClusters',
        'Response Status: ${response.statusCode}',
        response.body,
      );

      Map<String, dynamic>? jsonData = json.decode(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        if (jsonData == null ||
            !jsonData.containsKey('clusters') ||
            jsonData['clusters'] == null) {
          return [];
        }

        final List<GoogleCluster> clusters = [];
        for (var clusterJson in jsonData['clusters']) {
          clusters.add(GoogleCluster.fromJson(clusterJson));
        }

        return clusters;
      } else {
        Logger.log(
          'GoogleService getClusters',
          'Failed to Get Clusters, Requests Returned Status Code ${response.statusCode}',
          jsonData,
        );
        throw Exception(jsonData ?? 'An unknown error occured');
      }
    } catch (err) {
      Logger.log('GoogleService getClusters', 'Failed to Get Clusters', err);
      rethrow;
    }
  }
}
