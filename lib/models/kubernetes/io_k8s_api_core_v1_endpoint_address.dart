//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiCoreV1EndpointAddress {
  /// Returns a new [IoK8sApiCoreV1EndpointAddress] instance.
  IoK8sApiCoreV1EndpointAddress({
    this.hostname,
    required this.ip,
    this.nodeName,
    this.targetRef,
  });

  /// The Hostname of this endpoint
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? hostname;

  /// The IP of this endpoint. May not be loopback (127.0.0.0/8), link-local (169.254.0.0/16), or link-local multicast ((224.0.0.0/24). IPv6 is also accepted but not fully supported on all platforms. Also, certain kubernetes components, like kube-proxy, are not IPv6 ready.
  String ip;

  /// Optional: Node hosting this endpoint. This can be used to determine endpoints local to a node.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? nodeName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1ObjectReference? targetRef;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1EndpointAddress &&
          other.hostname == hostname &&
          other.ip == ip &&
          other.nodeName == nodeName &&
          other.targetRef == targetRef;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (hostname == null ? 0 : hostname!.hashCode) +
      (ip.hashCode) +
      (nodeName == null ? 0 : nodeName!.hashCode) +
      (targetRef == null ? 0 : targetRef!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1EndpointAddress[hostname=$hostname, ip=$ip, nodeName=$nodeName, targetRef=$targetRef]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (hostname != null) {
      json[r'hostname'] = hostname;
    }
    json[r'ip'] = ip;
    if (nodeName != null) {
      json[r'nodeName'] = nodeName;
    }
    if (targetRef != null) {
      json[r'targetRef'] = targetRef;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1EndpointAddress] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1EndpointAddress? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1EndpointAddress[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1EndpointAddress[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1EndpointAddress(
        hostname: mapValueOfType<String>(json, r'hostname'),
        ip: mapValueOfType<String>(json, r'ip')!,
        nodeName: mapValueOfType<String>(json, r'nodeName'),
        targetRef: IoK8sApiCoreV1ObjectReference.fromJson(json[r'targetRef']),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1EndpointAddress>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1EndpointAddress>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1EndpointAddress.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1EndpointAddress> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1EndpointAddress>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1EndpointAddress.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1EndpointAddress-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1EndpointAddress>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1EndpointAddress>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1EndpointAddress.listFromJson(
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
    'ip',
  };
}
