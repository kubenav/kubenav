import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:kubenav/utils/logger.dart';

/// [OIDCFlow] is a `enum` for the OIDC flow which should be used within a OIDC
/// provider.
enum OIDCFlow {
  standard,
  device,
}

extension OIDCFlowExtension on OIDCFlow {
  /// [toShortString] returns a short string of the OIDC flow, so that we
  /// can use the type within the json encode and decode functions.
  String toShortString() {
    return toString().split('.').last;
  }

  /// [pretty] returns the string for the OIDC flow which can be displayed in
  /// our UI.
  String pretty() {
    if (this == OIDCFlow.device) {
      return 'Device Flow';
    }

    return 'Standard Flow';
  }
}

/// [getOIDCFlowFromString] is a helper function to get the `OIDCFlow`
/// from it's string representation. If the provided [flow] string is
/// `device` it will be [OIDCFlow.device], for all other cases it
/// will return [OIDCFlow.standard].
OIDCFlow getOIDCFlowFromString(String? flow) {
  if (flow?.toLowerCase() == 'device') {
    return OIDCFlow.device;
  }

  return OIDCFlow.standard;
}

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

/// [OIDCDeviceAuth] is the model, which represents the device auth data. It
/// contains the [deviceCode], [userCode] and [verificationURI] to finish the
/// device flow authentication process.
class OIDCDeviceAuth {
  String? deviceCode;
  String? userCode;
  String? verificationURI;
  String? verificationURIComplete;

  OIDCDeviceAuth({
    required this.deviceCode,
    required this.userCode,
    required this.verificationURI,
    required this.verificationURIComplete,
  });

  factory OIDCDeviceAuth.fromJson(
    Map<String, dynamic> data,
  ) {
    return OIDCDeviceAuth(
      deviceCode: data.containsKey('device_code') ? data['device_code'] : null,
      userCode: data.containsKey('user_code') ? data['user_code'] : null,
      verificationURI: data.containsKey('verification_uri')
          ? data['verification_uri']
          : null,
      verificationURIComplete: data.containsKey('verification_uri_complete')
          ? data['verification_uri_complete']
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'device_code': deviceCode,
      'user_code': userCode,
      'verification_uri': verificationURI,
      'verification_uri_complete': verificationURIComplete,
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
    bool useAccessToken,
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
          'useAccessToken': useAccessToken,
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
    bool useAccessToken,
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
          'useAccessToken': useAccessToken,
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

  /// [deviceAuth] initializes the device flow, by requesting the
  /// [OIDCDeviceAuth] data from the OIDC provider. The returned data can then
  /// be used to verify the device and to get a refresh token via the
  /// [oidcDeviceAuthGetRefreshToken] function after the verification was
  /// finished.
  Future<OIDCDeviceAuth> deviceAuth(
    String discoveryURL,
    String clientID,
    String certificateAuthority,
    String scopes,
  ) async {
    try {
      final String result = await platform.invokeMethod(
        'oidcDeviceAuth',
        <String, dynamic>{
          'discoveryURL': discoveryURL,
          'clientID': clientID,
          'certificateAuthority': certificateAuthority,
          'scopes': scopes,
        },
      );

      Logger.log(
        'OIDCService deviceAuth',
        'Device auth data was returned',
        result,
      );

      Map<String, dynamic> jsonData = json.decode(result);
      return OIDCDeviceAuth.fromJson(jsonData);
    } catch (err) {
      Logger.log(
        'OIDCService deviceAuth',
        'Could not get device auth data',
        err,
      );
      rethrow;
    }
  }

  /// [deviceAuthGetRefreshToken] can be used to get a refresh token after the
  /// user has verified his device. The [OIDCResponse] also contains an ID
  /// Token, which can be refreshed via the "normal" authentication flow via the
  /// [getAccessToken] function.
  Future<OIDCResponse> deviceAuthGetRefreshToken(
    String discoveryURL,
    String clientID,
    String certificateAuthority,
    String scopes,
    String deviceCode,
    bool useAccessToken,
  ) async {
    try {
      final String result = await platform.invokeMethod(
        'oidcDeviceAuthGetRefreshToken',
        <String, dynamic>{
          'discoveryURL': discoveryURL,
          'clientID': clientID,
          'certificateAuthority': certificateAuthority,
          'scopes': scopes,
          'deviceCode': deviceCode,
          'useAccessToken': useAccessToken,
        },
      );

      Logger.log(
        'OIDCService deviceAuthGetRefreshToken',
        'Refresh token was returned',
        result,
      );

      Map<String, dynamic> jsonData = json.decode(result);
      return OIDCResponse.fromJson(jsonData);
    } catch (err) {
      Logger.log(
        'OIDCService deviceAuthGetRefreshToken',
        'Could not get refresh token',
        err,
      );
      rethrow;
    }
  }
}
