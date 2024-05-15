//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: require_trailing_commas
// ignore_for_file: unused_element
// ignore_for_file: unnecessary_this
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/kubernetes/helpers.dart';

class IoCertManagerAcmeV1OrderStatusAuthorizationsInnerChallengesInner {
  /// Returns a new [IoCertManagerAcmeV1OrderStatusAuthorizationsInnerChallengesInner] instance.
  IoCertManagerAcmeV1OrderStatusAuthorizationsInnerChallengesInner({
    required this.token,
    required this.type,
    required this.url,
  });

  /// Token is the token that must be presented for this challenge. This is used to compute the 'key' that must also be presented.
  String token;

  /// Type is the type of challenge being offered, e.g. 'http-01', 'dns-01', 'tls-sni-01', etc. This is the raw value retrieved from the ACME server. Only 'http-01' and 'dns-01' are supported by cert-manager, other values will be ignored.
  String type;

  /// URL is the URL of this challenge. It can be used to retrieve additional metadata about the Challenge from the ACME server.
  String url;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerAcmeV1OrderStatusAuthorizationsInnerChallengesInner &&
          other.token == token &&
          other.type == type &&
          other.url == url;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (token.hashCode) + (type.hashCode) + (url.hashCode);

  @override
  String toString() =>
      'IoCertManagerAcmeV1OrderStatusAuthorizationsInnerChallengesInner[token=$token, type=$type, url=$url]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'token'] = this.token;
    json[r'type'] = this.type;
    json[r'url'] = this.url;
    return json;
  }

  /// Returns a new [IoCertManagerAcmeV1OrderStatusAuthorizationsInnerChallengesInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerAcmeV1OrderStatusAuthorizationsInnerChallengesInner?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerAcmeV1OrderStatusAuthorizationsInnerChallengesInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerAcmeV1OrderStatusAuthorizationsInnerChallengesInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerAcmeV1OrderStatusAuthorizationsInnerChallengesInner(
        token: mapValueOfType<String>(json, r'token')!,
        type: mapValueOfType<String>(json, r'type')!,
        url: mapValueOfType<String>(json, r'url')!,
      );
    }
    return null;
  }

  static List<IoCertManagerAcmeV1OrderStatusAuthorizationsInnerChallengesInner>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoCertManagerAcmeV1OrderStatusAuthorizationsInnerChallengesInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoCertManagerAcmeV1OrderStatusAuthorizationsInnerChallengesInner
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoCertManagerAcmeV1OrderStatusAuthorizationsInnerChallengesInner>
      mapFromJson(dynamic json) {
    final map = <String,
        IoCertManagerAcmeV1OrderStatusAuthorizationsInnerChallengesInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoCertManagerAcmeV1OrderStatusAuthorizationsInnerChallengesInner
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerAcmeV1OrderStatusAuthorizationsInnerChallengesInner-objects as value to a dart map
  static Map<
          String,
          List<
              IoCertManagerAcmeV1OrderStatusAuthorizationsInnerChallengesInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<
            IoCertManagerAcmeV1OrderStatusAuthorizationsInnerChallengesInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoCertManagerAcmeV1OrderStatusAuthorizationsInnerChallengesInner
                .listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'token',
    'type',
    'url',
  };
}
