//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: require_trailing_commas
// ignore_for_file: unused_element
// ignore_for_file: unnecessary_this
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_networking_v1_ingress_backend.dart';

class IoK8sApiNetworkingV1HTTPIngressPath {
  /// Returns a new [IoK8sApiNetworkingV1HTTPIngressPath] instance.
  IoK8sApiNetworkingV1HTTPIngressPath({
    required this.backend,
    this.path,
    required this.pathType,
  });

  IoK8sApiNetworkingV1IngressBackend backend;

  /// Path is matched against the path of an incoming request. Currently it can contain characters disallowed from the conventional \"path\" part of a URL as defined by RFC 3986. Paths must begin with a '/' and must be present when using PathType with value \"Exact\" or \"Prefix\".
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? path;

  /// PathType determines the interpretation of the Path matching. PathType can be one of the following values: * Exact: Matches the URL path exactly. * Prefix: Matches based on a URL path prefix split by '/'. Matching is   done on a path element by element basis. A path element refers is the   list of labels in the path split by the '/' separator. A request is a   match for path p if every p is an element-wise prefix of p of the   request path. Note that if the last element of the path is a substring   of the last element in request path, it is not a match (e.g. /foo/bar   matches /foo/bar/baz, but does not match /foo/barbaz). * ImplementationSpecific: Interpretation of the Path matching is up to   the IngressClass. Implementations can treat this as a separate PathType   or treat it identically to Prefix or Exact path types. Implementations are required to support all path types.
  String pathType;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiNetworkingV1HTTPIngressPath &&
          other.backend == backend &&
          other.path == path &&
          other.pathType == pathType;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (backend.hashCode) +
      (path == null ? 0 : path!.hashCode) +
      (pathType.hashCode);

  @override
  String toString() =>
      'IoK8sApiNetworkingV1HTTPIngressPath[backend=$backend, path=$path, pathType=$pathType]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'backend'] = this.backend;
    if (this.path != null) {
      json[r'path'] = this.path;
    } else {
      json[r'path'] = null;
    }
    json[r'pathType'] = this.pathType;
    return json;
  }

  /// Returns a new [IoK8sApiNetworkingV1HTTPIngressPath] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiNetworkingV1HTTPIngressPath? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiNetworkingV1HTTPIngressPath[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiNetworkingV1HTTPIngressPath[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiNetworkingV1HTTPIngressPath(
        backend: IoK8sApiNetworkingV1IngressBackend.fromJson(json[r'backend'])!,
        path: mapValueOfType<String>(json, r'path'),
        pathType: mapValueOfType<String>(json, r'pathType')!,
      );
    }
    return null;
  }

  static List<IoK8sApiNetworkingV1HTTPIngressPath>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiNetworkingV1HTTPIngressPath>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiNetworkingV1HTTPIngressPath.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiNetworkingV1HTTPIngressPath> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiNetworkingV1HTTPIngressPath>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiNetworkingV1HTTPIngressPath.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiNetworkingV1HTTPIngressPath-objects as value to a dart map
  static Map<String, List<IoK8sApiNetworkingV1HTTPIngressPath>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiNetworkingV1HTTPIngressPath>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiNetworkingV1HTTPIngressPath.listFromJson(
          entry.value,
          growable: growable,
        );
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'backend',
    'pathType',
  };
}
