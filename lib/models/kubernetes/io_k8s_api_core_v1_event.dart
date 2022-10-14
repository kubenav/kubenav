//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element
// ignore_for_file: unnecessary_this
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_event_series.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_event_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_object_reference.dart';
import 'package:kubenav/models/kubernetes/io_k8s_apimachinery_pkg_apis_meta_v1_object_meta.dart';

class IoK8sApiCoreV1Event {
  /// Returns a new [IoK8sApiCoreV1Event] instance.
  IoK8sApiCoreV1Event({
    this.action,
    this.apiVersion,
    this.count,
    this.eventTime,
    this.firstTimestamp,
    required this.involvedObject,
    this.kind,
    this.lastTimestamp,
    this.message,
    required this.metadata,
    this.reason,
    this.related,
    this.reportingComponent,
    this.reportingInstance,
    this.series,
    this.source_,
    this.type,
  });

  /// What action was taken/failed regarding to the Regarding object.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? action;

  /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? apiVersion;

  /// The number of times this event has occurred.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? count;

  /// MicroTime is version of Time with microsecond level precision.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? eventTime;

  /// Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? firstTimestamp;

  IoK8sApiCoreV1ObjectReference involvedObject;

  /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? kind;

  /// Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? lastTimestamp;

  /// A human-readable description of the status of this operation.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? message;

  IoK8sApimachineryPkgApisMetaV1ObjectMeta metadata;

  /// This should be a short, machine understandable string that gives the reason for the transition into the object's current status.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? reason;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1ObjectReference? related;

  /// Name of the controller that emitted this Event, e.g. `kubernetes.io/kubelet`.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? reportingComponent;

  /// ID of the controller instance, e.g. `kubelet-xyzf`.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? reportingInstance;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1EventSeries? series;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1EventSource? source_;

  /// Type of this event (Normal, Warning), new types could be added in the future
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? type;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1Event &&
          other.action == action &&
          other.apiVersion == apiVersion &&
          other.count == count &&
          other.eventTime == eventTime &&
          other.firstTimestamp == firstTimestamp &&
          other.involvedObject == involvedObject &&
          other.kind == kind &&
          other.lastTimestamp == lastTimestamp &&
          other.message == message &&
          other.metadata == metadata &&
          other.reason == reason &&
          other.related == related &&
          other.reportingComponent == reportingComponent &&
          other.reportingInstance == reportingInstance &&
          other.series == series &&
          other.source_ == source_ &&
          other.type == type;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (action == null ? 0 : action!.hashCode) +
      (apiVersion == null ? 0 : apiVersion!.hashCode) +
      (count == null ? 0 : count!.hashCode) +
      (eventTime == null ? 0 : eventTime!.hashCode) +
      (firstTimestamp == null ? 0 : firstTimestamp!.hashCode) +
      (involvedObject.hashCode) +
      (kind == null ? 0 : kind!.hashCode) +
      (lastTimestamp == null ? 0 : lastTimestamp!.hashCode) +
      (message == null ? 0 : message!.hashCode) +
      (metadata.hashCode) +
      (reason == null ? 0 : reason!.hashCode) +
      (related == null ? 0 : related!.hashCode) +
      (reportingComponent == null ? 0 : reportingComponent!.hashCode) +
      (reportingInstance == null ? 0 : reportingInstance!.hashCode) +
      (series == null ? 0 : series!.hashCode) +
      (source_ == null ? 0 : source_!.hashCode) +
      (type == null ? 0 : type!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1Event[action=$action, apiVersion=$apiVersion, count=$count, eventTime=$eventTime, firstTimestamp=$firstTimestamp, involvedObject=$involvedObject, kind=$kind, lastTimestamp=$lastTimestamp, message=$message, metadata=$metadata, reason=$reason, related=$related, reportingComponent=$reportingComponent, reportingInstance=$reportingInstance, series=$series, source_=$source_, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.action != null) {
      json[r'action'] = this.action;
    } else {
      json[r'action'] = null;
    }
    if (this.apiVersion != null) {
      json[r'apiVersion'] = this.apiVersion;
    } else {
      json[r'apiVersion'] = null;
    }
    if (this.count != null) {
      json[r'count'] = this.count;
    } else {
      json[r'count'] = null;
    }
    if (this.eventTime != null) {
      json[r'eventTime'] = this.eventTime!.toUtc().toIso8601String();
    } else {
      json[r'eventTime'] = null;
    }
    if (this.firstTimestamp != null) {
      json[r'firstTimestamp'] = this.firstTimestamp!.toUtc().toIso8601String();
    } else {
      json[r'firstTimestamp'] = null;
    }
    json[r'involvedObject'] = this.involvedObject;
    if (this.kind != null) {
      json[r'kind'] = this.kind;
    } else {
      json[r'kind'] = null;
    }
    if (this.lastTimestamp != null) {
      json[r'lastTimestamp'] = this.lastTimestamp!.toUtc().toIso8601String();
    } else {
      json[r'lastTimestamp'] = null;
    }
    if (this.message != null) {
      json[r'message'] = this.message;
    } else {
      json[r'message'] = null;
    }
    json[r'metadata'] = this.metadata;
    if (this.reason != null) {
      json[r'reason'] = this.reason;
    } else {
      json[r'reason'] = null;
    }
    if (this.related != null) {
      json[r'related'] = this.related;
    } else {
      json[r'related'] = null;
    }
    if (this.reportingComponent != null) {
      json[r'reportingComponent'] = this.reportingComponent;
    } else {
      json[r'reportingComponent'] = null;
    }
    if (this.reportingInstance != null) {
      json[r'reportingInstance'] = this.reportingInstance;
    } else {
      json[r'reportingInstance'] = null;
    }
    if (this.series != null) {
      json[r'series'] = this.series;
    } else {
      json[r'series'] = null;
    }
    if (this.source_ != null) {
      json[r'source'] = this.source_;
    } else {
      json[r'source'] = null;
    }
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1Event] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1Event? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1Event[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1Event[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1Event(
        action: mapValueOfType<String>(json, r'action'),
        apiVersion: mapValueOfType<String>(json, r'apiVersion'),
        count: mapValueOfType<int>(json, r'count'),
        eventTime: mapDateTime(json, r'eventTime', ''),
        firstTimestamp: mapDateTime(json, r'firstTimestamp', ''),
        involvedObject:
            IoK8sApiCoreV1ObjectReference.fromJson(json[r'involvedObject'])!,
        kind: mapValueOfType<String>(json, r'kind'),
        lastTimestamp: mapDateTime(json, r'lastTimestamp', ''),
        message: mapValueOfType<String>(json, r'message'),
        metadata: IoK8sApimachineryPkgApisMetaV1ObjectMeta.fromJson(
            json[r'metadata'])!,
        reason: mapValueOfType<String>(json, r'reason'),
        related: IoK8sApiCoreV1ObjectReference.fromJson(json[r'related']),
        reportingComponent: mapValueOfType<String>(json, r'reportingComponent'),
        reportingInstance: mapValueOfType<String>(json, r'reportingInstance'),
        series: IoK8sApiCoreV1EventSeries.fromJson(json[r'series']),
        source_: IoK8sApiCoreV1EventSource.fromJson(json[r'source']),
        type: mapValueOfType<String>(json, r'type'),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1Event>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1Event>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1Event.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1Event> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1Event>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1Event.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1Event-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1Event>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1Event>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1Event.listFromJson(
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
    'involvedObject',
    'metadata',
  };
}
