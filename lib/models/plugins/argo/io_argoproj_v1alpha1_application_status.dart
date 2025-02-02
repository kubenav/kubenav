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
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_status_conditions_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_status_health.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_status_history_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_status_operation_state.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_status_resources_inner.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_status_summary.dart';
import 'package:kubenav/models/plugins/argo/io_argoproj_v1alpha1_application_status_sync.dart';

class IoArgoprojV1alpha1ApplicationStatus {
  /// Returns a new [IoArgoprojV1alpha1ApplicationStatus] instance.
  IoArgoprojV1alpha1ApplicationStatus({
    this.conditions = const [],
    this.controllerNamespace,
    this.health,
    this.history = const [],
    this.observedAt,
    this.operationState,
    this.reconciledAt,
    this.resourceHealthSource,
    this.resources = const [],
    this.sourceType,
    this.sourceTypes = const [],
    this.summary,
    this.sync_,
  });

  /// Conditions is a list of currently observed application conditions
  List<IoArgoprojV1alpha1ApplicationStatusConditionsInner> conditions;

  /// ControllerNamespace indicates the namespace in which the application controller is located
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? controllerNamespace;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1ApplicationStatusHealth? health;

  /// History contains information about the application's sync history
  List<IoArgoprojV1alpha1ApplicationStatusHistoryInner> history;

  /// ObservedAt indicates when the application state was updated without querying latest git state Deprecated: controller no longer updates ObservedAt field
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? observedAt;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1ApplicationStatusOperationState? operationState;

  /// ReconciledAt indicates when the application state was reconciled using the latest git version
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? reconciledAt;

  /// ResourceHealthSource indicates where the resource health status is stored: inline if not set or appTree
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? resourceHealthSource;

  /// Resources is a list of Kubernetes resources managed by this application
  List<IoArgoprojV1alpha1ApplicationStatusResourcesInner> resources;

  /// SourceType specifies the type of this application
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? sourceType;

  /// SourceTypes specifies the type of the sources included in the application
  List<String> sourceTypes;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1ApplicationStatusSummary? summary;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoArgoprojV1alpha1ApplicationStatusSync? sync_;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1ApplicationStatus &&
          deepEquality.equals(other.conditions, conditions) &&
          other.controllerNamespace == controllerNamespace &&
          other.health == health &&
          deepEquality.equals(other.history, history) &&
          other.observedAt == observedAt &&
          other.operationState == operationState &&
          other.reconciledAt == reconciledAt &&
          other.resourceHealthSource == resourceHealthSource &&
          deepEquality.equals(other.resources, resources) &&
          other.sourceType == sourceType &&
          deepEquality.equals(other.sourceTypes, sourceTypes) &&
          other.summary == summary &&
          other.sync_ == sync_;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (conditions.hashCode) +
      (controllerNamespace == null ? 0 : controllerNamespace!.hashCode) +
      (health == null ? 0 : health!.hashCode) +
      (history.hashCode) +
      (observedAt == null ? 0 : observedAt!.hashCode) +
      (operationState == null ? 0 : operationState!.hashCode) +
      (reconciledAt == null ? 0 : reconciledAt!.hashCode) +
      (resourceHealthSource == null ? 0 : resourceHealthSource!.hashCode) +
      (resources.hashCode) +
      (sourceType == null ? 0 : sourceType!.hashCode) +
      (sourceTypes.hashCode) +
      (summary == null ? 0 : summary!.hashCode) +
      (sync_ == null ? 0 : sync_!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1ApplicationStatus[conditions=$conditions, controllerNamespace=$controllerNamespace, health=$health, history=$history, observedAt=$observedAt, operationState=$operationState, reconciledAt=$reconciledAt, resourceHealthSource=$resourceHealthSource, resources=$resources, sourceType=$sourceType, sourceTypes=$sourceTypes, summary=$summary, sync_=$sync_]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'conditions'] = this.conditions;
    if (this.controllerNamespace != null) {
      json[r'controllerNamespace'] = this.controllerNamespace;
    } else {
      json[r'controllerNamespace'] = null;
    }
    if (this.health != null) {
      json[r'health'] = this.health;
    } else {
      json[r'health'] = null;
    }
    json[r'history'] = this.history;
    if (this.observedAt != null) {
      json[r'observedAt'] = this.observedAt!.toUtc().toIso8601String();
    } else {
      json[r'observedAt'] = null;
    }
    if (this.operationState != null) {
      json[r'operationState'] = this.operationState;
    } else {
      json[r'operationState'] = null;
    }
    if (this.reconciledAt != null) {
      json[r'reconciledAt'] = this.reconciledAt!.toUtc().toIso8601String();
    } else {
      json[r'reconciledAt'] = null;
    }
    if (this.resourceHealthSource != null) {
      json[r'resourceHealthSource'] = this.resourceHealthSource;
    } else {
      json[r'resourceHealthSource'] = null;
    }
    json[r'resources'] = this.resources;
    if (this.sourceType != null) {
      json[r'sourceType'] = this.sourceType;
    } else {
      json[r'sourceType'] = null;
    }
    json[r'sourceTypes'] = this.sourceTypes;
    if (this.summary != null) {
      json[r'summary'] = this.summary;
    } else {
      json[r'summary'] = null;
    }
    if (this.sync_ != null) {
      json[r'sync'] = this.sync_;
    } else {
      json[r'sync'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1ApplicationStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1ApplicationStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1ApplicationStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1ApplicationStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1ApplicationStatus(
        conditions:
            IoArgoprojV1alpha1ApplicationStatusConditionsInner.listFromJson(
                json[r'conditions']),
        controllerNamespace:
            mapValueOfType<String>(json, r'controllerNamespace'),
        health:
            IoArgoprojV1alpha1ApplicationStatusHealth.fromJson(json[r'health']),
        history: IoArgoprojV1alpha1ApplicationStatusHistoryInner.listFromJson(
            json[r'history']),
        observedAt: mapDateTime(json, r'observedAt', r''),
        operationState:
            IoArgoprojV1alpha1ApplicationStatusOperationState.fromJson(
                json[r'operationState']),
        reconciledAt: mapDateTime(json, r'reconciledAt', r''),
        resourceHealthSource:
            mapValueOfType<String>(json, r'resourceHealthSource'),
        resources:
            IoArgoprojV1alpha1ApplicationStatusResourcesInner.listFromJson(
                json[r'resources']),
        sourceType: mapValueOfType<String>(json, r'sourceType'),
        sourceTypes: json[r'sourceTypes'] is Iterable
            ? (json[r'sourceTypes'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        summary: IoArgoprojV1alpha1ApplicationStatusSummary.fromJson(
            json[r'summary']),
        sync_: IoArgoprojV1alpha1ApplicationStatusSync.fromJson(json[r'sync']),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1ApplicationStatus> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1ApplicationStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoArgoprojV1alpha1ApplicationStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1ApplicationStatus> mapFromJson(
      dynamic json) {
    final map = <String, IoArgoprojV1alpha1ApplicationStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoArgoprojV1alpha1ApplicationStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1ApplicationStatus-objects as value to a dart map
  static Map<String, List<IoArgoprojV1alpha1ApplicationStatus>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoArgoprojV1alpha1ApplicationStatus>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoArgoprojV1alpha1ApplicationStatus.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{};
}
