//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiCoreV1LifecycleHandler {
  /// Returns a new [IoK8sApiCoreV1LifecycleHandler] instance.
  IoK8sApiCoreV1LifecycleHandler({
    this.exec,
    this.httpGet,
    this.tcpSocket,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1ExecAction? exec;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1HTTPGetAction? httpGet;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1TCPSocketAction? tcpSocket;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1LifecycleHandler &&
          other.exec == exec &&
          other.httpGet == httpGet &&
          other.tcpSocket == tcpSocket;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (exec == null ? 0 : exec!.hashCode) +
      (httpGet == null ? 0 : httpGet!.hashCode) +
      (tcpSocket == null ? 0 : tcpSocket!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1LifecycleHandler[exec=$exec, httpGet=$httpGet, tcpSocket=$tcpSocket]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (exec != null) {
      json[r'exec'] = exec;
    }
    if (httpGet != null) {
      json[r'httpGet'] = httpGet;
    }
    if (tcpSocket != null) {
      json[r'tcpSocket'] = tcpSocket;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1LifecycleHandler] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1LifecycleHandler? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1LifecycleHandler[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1LifecycleHandler[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1LifecycleHandler(
        exec: IoK8sApiCoreV1ExecAction.fromJson(json[r'exec']),
        httpGet: IoK8sApiCoreV1HTTPGetAction.fromJson(json[r'httpGet']),
        tcpSocket: IoK8sApiCoreV1TCPSocketAction.fromJson(json[r'tcpSocket']),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1LifecycleHandler>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1LifecycleHandler>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1LifecycleHandler.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1LifecycleHandler> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1LifecycleHandler>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1LifecycleHandler.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1LifecycleHandler-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1LifecycleHandler>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1LifecycleHandler>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1LifecycleHandler.listFromJson(
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
  static const requiredKeys = <String>{};
}
