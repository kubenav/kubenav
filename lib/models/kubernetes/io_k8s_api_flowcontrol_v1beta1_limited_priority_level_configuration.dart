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
import 'package:kubenav/models/kubernetes/io_k8s_api_flowcontrol_v1beta1_limit_response.dart';

class IoK8sApiFlowcontrolV1beta1LimitedPriorityLevelConfiguration {
  /// Returns a new [IoK8sApiFlowcontrolV1beta1LimitedPriorityLevelConfiguration] instance.
  IoK8sApiFlowcontrolV1beta1LimitedPriorityLevelConfiguration({
    this.assuredConcurrencyShares,
    this.limitResponse,
  });

  /// `assuredConcurrencyShares` (ACS) configures the execution limit, which is a limit on the number of requests of this priority level that may be exeucting at a given time.  ACS must be a positive number. The server's concurrency limit (SCL) is divided among the concurrency-controlled priority levels in proportion to their assured concurrency shares. This produces the assured concurrency value (ACV) --- the number of requests that may be executing at a time --- for each such priority level:              ACV(l) = ceil( SCL * ACS(l) / ( sum[priority levels k] ACS(k) ) )  bigger numbers of ACS mean more reserved concurrent requests (at the expense of every other PL). This field has a default value of 30.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? assuredConcurrencyShares;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiFlowcontrolV1beta1LimitResponse? limitResponse;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiFlowcontrolV1beta1LimitedPriorityLevelConfiguration &&
          other.assuredConcurrencyShares == assuredConcurrencyShares &&
          other.limitResponse == limitResponse;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (assuredConcurrencyShares == null
          ? 0
          : assuredConcurrencyShares!.hashCode) +
      (limitResponse == null ? 0 : limitResponse!.hashCode);

  @override
  String toString() =>
      'IoK8sApiFlowcontrolV1beta1LimitedPriorityLevelConfiguration[assuredConcurrencyShares=$assuredConcurrencyShares, limitResponse=$limitResponse]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.assuredConcurrencyShares != null) {
      json[r'assuredConcurrencyShares'] = this.assuredConcurrencyShares;
    } else {
      json[r'assuredConcurrencyShares'] = null;
    }
    if (this.limitResponse != null) {
      json[r'limitResponse'] = this.limitResponse;
    } else {
      json[r'limitResponse'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiFlowcontrolV1beta1LimitedPriorityLevelConfiguration] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiFlowcontrolV1beta1LimitedPriorityLevelConfiguration? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiFlowcontrolV1beta1LimitedPriorityLevelConfiguration[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiFlowcontrolV1beta1LimitedPriorityLevelConfiguration[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiFlowcontrolV1beta1LimitedPriorityLevelConfiguration(
        assuredConcurrencyShares:
            mapValueOfType<int>(json, r'assuredConcurrencyShares'),
        limitResponse: IoK8sApiFlowcontrolV1beta1LimitResponse.fromJson(
            json[r'limitResponse']),
      );
    }
    return null;
  }

  static List<IoK8sApiFlowcontrolV1beta1LimitedPriorityLevelConfiguration>?
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoK8sApiFlowcontrolV1beta1LimitedPriorityLevelConfiguration>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiFlowcontrolV1beta1LimitedPriorityLevelConfiguration
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoK8sApiFlowcontrolV1beta1LimitedPriorityLevelConfiguration>
      mapFromJson(dynamic json) {
    final map =
        <String, IoK8sApiFlowcontrolV1beta1LimitedPriorityLevelConfiguration>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiFlowcontrolV1beta1LimitedPriorityLevelConfiguration
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiFlowcontrolV1beta1LimitedPriorityLevelConfiguration-objects as value to a dart map
  static Map<String,
          List<IoK8sApiFlowcontrolV1beta1LimitedPriorityLevelConfiguration>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoK8sApiFlowcontrolV1beta1LimitedPriorityLevelConfiguration>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiFlowcontrolV1beta1LimitedPriorityLevelConfiguration
                .listFromJson(
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
