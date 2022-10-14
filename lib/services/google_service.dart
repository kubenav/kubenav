import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/logger.dart';

/// [GoogleTokens] is the format of the returned JSON from the `getTokens` call against the Google API.
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

  GoogleTokens.fromJson(
    Map<String, dynamic> json,
  ) {
    accessToken = json['access_token'];
    error = json['error'];
    errorDescription = json['error_description'];
    expiresIn = json['expires_in'];
    idToken = json['id_token'];
    refreshToken = json['refresh_token'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['error'] = error;
    data['error_description'] = errorDescription;
    data['expires_in'] = expiresIn;
    data['id_token'] = idToken;
    data['refresh_token'] = refreshToken;
    data['token_type'] = tokenType;
    return data;
  }
}

/// [GoogleProject] is the format of the returned JSON data of a Google project.
class GoogleProject {
  String? projectId;

  GoogleProject({
    required this.projectId,
  });

  GoogleProject.fromJson(
    Map<String, dynamic> json,
  ) {
    projectId = json['projectId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['projectId'] = projectId;
    return data;
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
  });

  GoogleCluster.fromJson(
    Map<String, dynamic> json,
  ) {
    name = json['name'];
    endpoint = json['endpoint'];
    location = json['location'];
    masterAuth = json['masterAuth'] != null
        ? GoogleClusterMasterAuth.fromJson(json['masterAuth'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['endpoint'] = endpoint;
    data['location'] = location;
    if (masterAuth != null) {
      data['masterAuth'] = masterAuth!.toJson();
    }
    return data;
  }
}

/// [GoogleClusterMasterAuth] is the format of the returned JSON data of auth information for a GKE cluster.
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

  GoogleClusterMasterAuth.fromJson(
    Map<String, dynamic> json,
  ) {
    username = json['username'];
    password = json['password'];
    clusterCaCertificate = json['clusterCaCertificate'];
    clientCertificate = json['clientCertificate'];
    clientKey = json['clientKey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    data['clusterCaCertificate'] = clusterCaCertificate;
    data['clientCertificate'] = clientCertificate;
    data['clientKey'] = clientKey;
    return data;
  }
}

/// [GoogleService] implements a service to interact with the Google API. This is required to get a valid access token
/// and to get the Google Projects and GKE clusters.
class GoogleService {
  GoogleService();

  /// [getTokensFromCode] can be used to exchange the returned [code] for an access and refresh via the Google API.
  Future<GoogleTokens> getTokensFromCode(
    String clientID,
    String clientSecret,
    String code,
  ) async {
    try {
      final response = await http.post(
        Uri.parse(
            'https://oauth2.googleapis.com/token?code=$code&client_id=$clientID&client_secret=$clientSecret&redirect_uri=${Constants.googleRedirectURI}&grant_type=authorization_code'),
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
            'Could not get access token ${googleTokens.error}',
            jsonData,
          );
          return Future.error(jsonData);
        }

        Logger.log(
          'GoogleService getTokensFromCode',
          'Could not get access token, requests returned status code ${response.statusCode}',
          jsonData,
        );
        return Future.error(jsonData);
      }
    } catch (err) {
      Logger.log(
        'GoogleService getTokensFromCode',
        'Could not get access token',
        err,
      );
      return Future.error(err);
    }
  }

  /// [getTokensFromRefreshToken] can be used to get a new access token via the provided [refreshToken] from the Google
  /// API.
  Future<GoogleTokens> getTokensFromRefreshToken(
    String clientID,
    String clientSecret,
    String refreshToken,
  ) async {
    try {
      final response = await http.post(
        Uri.parse(
            'https://oauth2.googleapis.com/token?refresh_token=$refreshToken&client_id=$clientID&client_secret=$clientSecret&grant_type=refresh_token'),
      );

      Logger.log(
        'GoogleService getTokensFromRefreshToken',
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
            'GoogleService getTokensFromRefreshToken',
            'Could not get access token ${googleTokens.error}',
            jsonData,
          );
          return Future.error(jsonData);
        }

        Logger.log(
          'GoogleService getTokensFromRefreshToken',
          'Could not get access token, requests returned status code ${response.statusCode}',
          jsonData,
        );
        return Future.error(jsonData);
      }
    } catch (err) {
      Logger.log(
        'GoogleService getTokensFromRefreshToken',
        'Could not get access token',
        err,
      );
      return Future.error(err);
    }
  }

  /// [isGoogleAPIEnabled] returns `true` when he provided [api] is enabled for the provided [project] and `false` when
  /// the API is not enabled.
  Future<bool> isGoogleAPIEnabled(
    String project,
    String api,
    String accessToken,
  ) async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://serviceusage.googleapis.com/v1/projects/$project/services/$api'),
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      );

      Logger.log(
        'GoogleService isGoogleAPIEnabled',
        'Response status: ${response.statusCode}',
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
          'Could not check if API is enabled, requests returned status code ${response.statusCode}',
          jsonData,
        );
        return false;
      }
    } catch (err) {
      Logger.log(
        'GoogleService isGoogleAPIEnabled',
        'Could not check if API is enabled',
        err,
      );
      return false;
    }
  }

  /// [getProjects] returns all the projects a user has access to.
  Future<List<GoogleProject>> getProjects(
    String accessToken,
  ) async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://cloudresourcemanager.googleapis.com/v1/projects?filter=lifecycleState%3AACTIVE'),
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      );

      Logger.log(
        'GoogleService getProjects',
        'Response status: ${response.statusCode}',
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
          'Could not get projects, requests returned status code ${response.statusCode}',
          jsonData,
        );
        return Future.error(jsonData ?? 'An unknown error occured');
      }
    } catch (err) {
      Logger.log(
        'GoogleService getProjects',
        'Could not get projects',
        err,
      );
      return Future.error(err);
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
            'https://container.googleapis.com/v1/projects/$project/locations/-/clusters'),
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      );

      Logger.log(
        'GoogleService getClusters',
        'Response status: ${response.statusCode}',
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
          'Could not get clusters, requests returned status code ${response.statusCode}',
          jsonData,
        );
        return Future.error(jsonData ?? 'An unknown error occured');
      }
    } catch (err) {
      Logger.log(
        'GoogleService getClusters',
        'Could not get clusters',
        err,
      );
      return Future.error(err);
    }
  }
}
