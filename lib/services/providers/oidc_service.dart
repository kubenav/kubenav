import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:kubenav/utils/logger.dart';

/// [OIDCResponse] is the format of a the different OIDC calls. Not all fields
/// are present in the different OIDC calls.
class OIDCResponse {
  String? url;
  String? idToken;
  String? refreshToken;
  String? verifier;

  OIDCResponse({
    required this.url,
    required this.idToken,
    required this.refreshToken,
    required this.verifier,
  });

  factory OIDCResponse.fromJson(
    Map<String, dynamic> data,
  ) {
    return OIDCResponse(
      url: data.containsKey('url') ? data['url'] : null,
      idToken: data.containsKey('idToken') ? data['idToken'] : null,
      refreshToken:
          data.containsKey('refreshToken') ? data['refreshToken'] : null,
      verifier: data.containsKey('verifier') ? data['verifier'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'idToken': idToken,
      'refreshToken': refreshToken,
      'verifier': verifier,
    };
  }
}

/// [OIDCService] implements a service to interact with the OIDC functions from
/// our Go code. The implementation details of each Go function can be found in
/// the `cmd/kubenav/oidc.go` file.
class OIDCService {
  static const platform = MethodChannel('kubenav.io');

  /// [getLink] can be used to generate the link for an OIDC provider, which
  /// must be called by a user to start the authentication process.
  Future<OIDCResponse> getLink(
    String discoveryURL,
    String clientID,
    String clientSecret,
    String certificateAuthority,
    String scopes,
    String redirectURL,
    String pkceMethod,
  ) async {
    try {
      final String result = await platform.invokeMethod(
        'oidcGetLink',
        <String, dynamic>{
          'discoveryURL': discoveryURL,
          'clientID': clientID,
          'clientSecret': clientSecret,
          'certificateAuthority': certificateAuthority,
          'scopes': scopes,
          'redirectURL': redirectURL,
          'pkceMethod': pkceMethod,
        },
      );

      Logger.log(
        'OIDCService getLink',
        'Link was generated',
        result,
      );

      Map<String, dynamic> jsonData = json.decode(result);
      return OIDCResponse.fromJson(jsonData);
    } catch (err) {
      Logger.log(
        'OIDCService getLink',
        'Could not get OIDC login url',
        err,
      );
      rethrow;
    }
  }

  /// [getRefreshToken] can be used to generate a OIDC refresh token in exchange
  /// for the [code] returned by the OIDC provider.
  Future<OIDCResponse> getRefreshToken(
    String discoveryURL,
    String clientID,
    String clientSecret,
    String certificateAuthority,
    String scopes,
    String redirectURL,
    String pkceMethod,
    String code,
    String verifier,
  ) async {
    try {
      final String result = await platform.invokeMethod(
        'oidcGetRefreshToken',
        <String, dynamic>{
          'discoveryURL': discoveryURL,
          'clientID': clientID,
          'clientSecret': clientSecret,
          'certificateAuthority': certificateAuthority,
          'scopes': scopes,
          'redirectURL': redirectURL,
          'pkceMethod': pkceMethod,
          'code': code,
          'verifier': verifier,
        },
      );

      Logger.log(
        'OIDCService getRefreshToken',
        'Refresh token was returned',
        result,
      );

      Map<String, dynamic> jsonData = json.decode(result);
      return OIDCResponse.fromJson(jsonData);
    } catch (err) {
      Logger.log(
        'OIDCService getRefreshToken',
        'Could not get refresh token',
        err,
      );
      rethrow;
    }
  }

  /// [getAccessToken] can be used to generate a new access token for the given
  /// [refreshToken].
  Future<OIDCResponse> getAccessToken(
    String discoveryURL,
    String clientID,
    String clientSecret,
    String certificateAuthority,
    String scopes,
    String redirectURL,
    String refreshToken,
  ) async {
    try {
      final String result = await platform.invokeMethod(
        'oidcGetAccessToken',
        <String, dynamic>{
          'discoveryURL': discoveryURL,
          'clientID': clientID,
          'clientSecret': clientSecret,
          'certificateAuthority': certificateAuthority,
          'scopes': scopes,
          'redirectURL': redirectURL,
          'refreshToken': refreshToken,
        },
      );

      Logger.log(
        'OIDCService getAccessToken',
        'Access token was returned',
        result,
      );

      Map<String, dynamic> jsonData = json.decode(result);
      return OIDCResponse.fromJson(jsonData);
    } catch (err) {
      Logger.log(
        'OIDCService getAccessToken',
        'Could not get access token',
        err,
      );
      rethrow;
    }
  }
}
