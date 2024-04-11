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
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_exec_action.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_grpc_action.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_http_get_action.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_tcp_socket_action.dart';

class IoK8sApiCoreV1Probe {
  /// Returns a new [IoK8sApiCoreV1Probe] instance.
  IoK8sApiCoreV1Probe({
    this.exec,
    this.failureThreshold,
    this.grpc,
    this.httpGet,
    this.initialDelaySeconds,
    this.periodSeconds,
    this.successThreshold,
    this.tcpSocket,
    this.terminationGracePeriodSeconds,
    this.timeoutSeconds,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1ExecAction? exec;

  /// Minimum consecutive failures for the probe to be considered failed after having succeeded. Defaults to 3. Minimum value is 1.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? failureThreshold;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1GRPCAction? grpc;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1HTTPGetAction? httpGet;

  /// Number of seconds after the container has started before liveness probes are initiated. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? initialDelaySeconds;

  /// How often (in seconds) to perform the probe. Default to 10 seconds. Minimum value is 1.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? periodSeconds;

  /// Minimum consecutive successes for the probe to be considered successful after having failed. Defaults to 1. Must be 1 for liveness and startup. Minimum value is 1.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? successThreshold;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1TCPSocketAction? tcpSocket;

  /// Optional duration in seconds the pod needs to terminate gracefully upon probe failure. The grace period is the duration in seconds after the processes running in the pod are sent a termination signal and the time when the processes are forcibly halted with a kill signal. Set this value longer than the expected cleanup time for your process. If this value is nil, the pod's terminationGracePeriodSeconds will be used. Otherwise, this value overrides the value provided by the pod spec. Value must be non-negative integer. The value zero indicates stop immediately via the kill signal (no opportunity to shut down). This is a beta field and requires enabling ProbeTerminationGracePeriod feature gate. Minimum value is 1. spec.terminationGracePeriodSeconds is used if unset.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? terminationGracePeriodSeconds;

  /// Number of seconds after which the probe times out. Defaults to 1 second. Minimum value is 1. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? timeoutSeconds;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1Probe &&
          other.exec == exec &&
          other.failureThreshold == failureThreshold &&
          other.grpc == grpc &&
          other.httpGet == httpGet &&
          other.initialDelaySeconds == initialDelaySeconds &&
          other.periodSeconds == periodSeconds &&
          other.successThreshold == successThreshold &&
          other.tcpSocket == tcpSocket &&
          other.terminationGracePeriodSeconds ==
              terminationGracePeriodSeconds &&
          other.timeoutSeconds == timeoutSeconds;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (exec == null ? 0 : exec!.hashCode) +
      (failureThreshold == null ? 0 : failureThreshold!.hashCode) +
      (grpc == null ? 0 : grpc!.hashCode) +
      (httpGet == null ? 0 : httpGet!.hashCode) +
      (initialDelaySeconds == null ? 0 : initialDelaySeconds!.hashCode) +
      (periodSeconds == null ? 0 : periodSeconds!.hashCode) +
      (successThreshold == null ? 0 : successThreshold!.hashCode) +
      (tcpSocket == null ? 0 : tcpSocket!.hashCode) +
      (terminationGracePeriodSeconds == null
          ? 0
          : terminationGracePeriodSeconds!.hashCode) +
      (timeoutSeconds == null ? 0 : timeoutSeconds!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1Probe[exec=$exec, failureThreshold=$failureThreshold, grpc=$grpc, httpGet=$httpGet, initialDelaySeconds=$initialDelaySeconds, periodSeconds=$periodSeconds, successThreshold=$successThreshold, tcpSocket=$tcpSocket, terminationGracePeriodSeconds=$terminationGracePeriodSeconds, timeoutSeconds=$timeoutSeconds]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.exec != null) {
      json[r'exec'] = this.exec;
    } else {
      json[r'exec'] = null;
    }
    if (this.failureThreshold != null) {
      json[r'failureThreshold'] = this.failureThreshold;
    } else {
      json[r'failureThreshold'] = null;
    }
    if (this.grpc != null) {
      json[r'grpc'] = this.grpc;
    } else {
      json[r'grpc'] = null;
    }
    if (this.httpGet != null) {
      json[r'httpGet'] = this.httpGet;
    } else {
      json[r'httpGet'] = null;
    }
    if (this.initialDelaySeconds != null) {
      json[r'initialDelaySeconds'] = this.initialDelaySeconds;
    } else {
      json[r'initialDelaySeconds'] = null;
    }
    if (this.periodSeconds != null) {
      json[r'periodSeconds'] = this.periodSeconds;
    } else {
      json[r'periodSeconds'] = null;
    }
    if (this.successThreshold != null) {
      json[r'successThreshold'] = this.successThreshold;
    } else {
      json[r'successThreshold'] = null;
    }
    if (this.tcpSocket != null) {
      json[r'tcpSocket'] = this.tcpSocket;
    } else {
      json[r'tcpSocket'] = null;
    }
    if (this.terminationGracePeriodSeconds != null) {
      json[r'terminationGracePeriodSeconds'] =
          this.terminationGracePeriodSeconds;
    } else {
      json[r'terminationGracePeriodSeconds'] = null;
    }
    if (this.timeoutSeconds != null) {
      json[r'timeoutSeconds'] = this.timeoutSeconds;
    } else {
      json[r'timeoutSeconds'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1Probe] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1Probe? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1Probe[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1Probe[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1Probe(
        exec: IoK8sApiCoreV1ExecAction.fromJson(json[r'exec']),
        failureThreshold: mapValueOfType<int>(json, r'failureThreshold'),
        grpc: IoK8sApiCoreV1GRPCAction.fromJson(json[r'grpc']),
        httpGet: IoK8sApiCoreV1HTTPGetAction.fromJson(json[r'httpGet']),
        initialDelaySeconds: mapValueOfType<int>(json, r'initialDelaySeconds'),
        periodSeconds: mapValueOfType<int>(json, r'periodSeconds'),
        successThreshold: mapValueOfType<int>(json, r'successThreshold'),
        tcpSocket: IoK8sApiCoreV1TCPSocketAction.fromJson(json[r'tcpSocket']),
        terminationGracePeriodSeconds:
            mapValueOfType<int>(json, r'terminationGracePeriodSeconds'),
        timeoutSeconds: mapValueOfType<int>(json, r'timeoutSeconds'),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1Probe>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1Probe>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1Probe.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1Probe> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1Probe>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1Probe.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1Probe-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1Probe>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1Probe>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1Probe.listFromJson(
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
