//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_event_source.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_object_reference.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_events_v1_event_series.dart';
import 'package:kubenav/models/kubernetes/io_k8s_apimachinery_pkg_apis_meta_v1_object_meta.dart';

class IoK8sApiEventsV1Event {
  /// Returns a new [IoK8sApiEventsV1Event] instance.
  IoK8sApiEventsV1Event({
    this.action,
    this.apiVersion,
    this.deprecatedCount,
    this.deprecatedFirstTimestamp,
    this.deprecatedLastTimestamp,
    this.deprecatedSource,
    required this.eventTime,
    this.kind,
    this.metadata,
    this.note,
    this.reason,
    this.regarding,
    this.related,
    this.reportingController,
    this.reportingInstance,
    this.series,
    this.type,
  });

  /// action is what action was taken/failed regarding to the regarding object. It is machine-readable. This field cannot be empty for new Events and it can have at most 128 characters.
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

  /// deprecatedCount is the deprecated field assuring backward compatibility with core.v1 Event type.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? deprecatedCount;

  /// Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? deprecatedFirstTimestamp;

  /// Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? deprecatedLastTimestamp;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1EventSource? deprecatedSource;

  /// MicroTime is version of Time with microsecond level precision.
  DateTime eventTime;

  /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? kind;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApimachineryPkgApisMetaV1ObjectMeta? metadata;

  /// note is a human-readable description of the status of this operation. Maximal length of the note is 1kB, but libraries should be prepared to handle values up to 64kB.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? note;

  /// reason is why the action was taken. It is human-readable. This field cannot be empty for new Events and it can have at most 128 characters.
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
  IoK8sApiCoreV1ObjectReference? regarding;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1ObjectReference? related;

  /// reportingController is the name of the controller that emitted this Event, e.g. `kubernetes.io/kubelet`. This field cannot be empty for new Events.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? reportingController;

  /// reportingInstance is the ID of the controller instance, e.g. `kubelet-xyzf`. This field cannot be empty for new Events and it can have at most 128 characters.
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
  IoK8sApiEventsV1EventSeries? series;

  /// type is the type of this event (Normal, Warning), new types could be added in the future. It is machine-readable. This field cannot be empty for new Events.
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
      other is IoK8sApiEventsV1Event &&
          other.action == action &&
          other.apiVersion == apiVersion &&
          other.deprecatedCount == deprecatedCount &&
          other.deprecatedFirstTimestamp == deprecatedFirstTimestamp &&
          other.deprecatedLastTimestamp == deprecatedLastTimestamp &&
          other.deprecatedSource == deprecatedSource &&
          other.eventTime == eventTime &&
          other.kind == kind &&
          other.metadata == metadata &&
          other.note == note &&
          other.reason == reason &&
          other.regarding == regarding &&
          other.related == related &&
          other.reportingController == reportingController &&
          other.reportingInstance == reportingInstance &&
          other.series == series &&
          other.type == type;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (action == null ? 0 : action!.hashCode) +
      (apiVersion == null ? 0 : apiVersion!.hashCode) +
      (deprecatedCount == null ? 0 : deprecatedCount!.hashCode) +
      (deprecatedFirstTimestamp == null
          ? 0
          : deprecatedFirstTimestamp!.hashCode) +
      (deprecatedLastTimestamp == null
          ? 0
          : deprecatedLastTimestamp!.hashCode) +
      (deprecatedSource == null ? 0 : deprecatedSource!.hashCode) +
      (eventTime.hashCode) +
      (kind == null ? 0 : kind!.hashCode) +
      (metadata == null ? 0 : metadata!.hashCode) +
      (note == null ? 0 : note!.hashCode) +
      (reason == null ? 0 : reason!.hashCode) +
      (regarding == null ? 0 : regarding!.hashCode) +
      (related == null ? 0 : related!.hashCode) +
      (reportingController == null ? 0 : reportingController!.hashCode) +
      (reportingInstance == null ? 0 : reportingInstance!.hashCode) +
      (series == null ? 0 : series!.hashCode) +
      (type == null ? 0 : type!.hashCode);

  @override
  String toString() =>
      'IoK8sApiEventsV1Event[action=$action, apiVersion=$apiVersion, deprecatedCount=$deprecatedCount, deprecatedFirstTimestamp=$deprecatedFirstTimestamp, deprecatedLastTimestamp=$deprecatedLastTimestamp, deprecatedSource=$deprecatedSource, eventTime=$eventTime, kind=$kind, metadata=$metadata, note=$note, reason=$reason, regarding=$regarding, related=$related, reportingController=$reportingController, reportingInstance=$reportingInstance, series=$series, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (action != null) {
      json[r'action'] = action;
    }
    if (apiVersion != null) {
      json[r'apiVersion'] = apiVersion;
    }
    if (deprecatedCount != null) {
      json[r'deprecatedCount'] = deprecatedCount;
    }
    if (deprecatedFirstTimestamp != null) {
      json[r'deprecatedFirstTimestamp'] =
          deprecatedFirstTimestamp!.toUtc().toIso8601String();
    }
    if (deprecatedLastTimestamp != null) {
      json[r'deprecatedLastTimestamp'] =
          deprecatedLastTimestamp!.toUtc().toIso8601String();
    }
    if (deprecatedSource != null) {
      json[r'deprecatedSource'] = deprecatedSource;
    }
    json[r'eventTime'] = eventTime.toUtc().toIso8601String();
    if (kind != null) {
      json[r'kind'] = kind;
    }
    if (metadata != null) {
      json[r'metadata'] = metadata;
    }
    if (note != null) {
      json[r'note'] = note;
    }
    if (reason != null) {
      json[r'reason'] = reason;
    }
    if (regarding != null) {
      json[r'regarding'] = regarding;
    }
    if (related != null) {
      json[r'related'] = related;
    }
    if (reportingController != null) {
      json[r'reportingController'] = reportingController;
    }
    if (reportingInstance != null) {
      json[r'reportingInstance'] = reportingInstance;
    }
    if (series != null) {
      json[r'series'] = series;
    }
    if (type != null) {
      json[r'type'] = type;
    }
    return json;
  }

  /// Returns a new [IoK8sApiEventsV1Event] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiEventsV1Event? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiEventsV1Event[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiEventsV1Event[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiEventsV1Event(
        action: mapValueOfType<String>(json, r'action'),
        apiVersion: mapValueOfType<String>(json, r'apiVersion'),
        deprecatedCount: mapValueOfType<int>(json, r'deprecatedCount'),
        deprecatedFirstTimestamp:
            mapDateTime(json, r'deprecatedFirstTimestamp', ''),
        deprecatedLastTimestamp:
            mapDateTime(json, r'deprecatedLastTimestamp', ''),
        deprecatedSource:
            IoK8sApiCoreV1EventSource.fromJson(json[r'deprecatedSource']),
        eventTime: mapDateTime(json, r'eventTime', '')!,
        kind: mapValueOfType<String>(json, r'kind'),
        metadata: IoK8sApimachineryPkgApisMetaV1ObjectMeta.fromJson(
            json[r'metadata']),
        note: mapValueOfType<String>(json, r'note'),
        reason: mapValueOfType<String>(json, r'reason'),
        regarding: IoK8sApiCoreV1ObjectReference.fromJson(json[r'regarding']),
        related: IoK8sApiCoreV1ObjectReference.fromJson(json[r'related']),
        reportingController:
            mapValueOfType<String>(json, r'reportingController'),
        reportingInstance: mapValueOfType<String>(json, r'reportingInstance'),
        series: IoK8sApiEventsV1EventSeries.fromJson(json[r'series']),
        type: mapValueOfType<String>(json, r'type'),
      );
    }
    return null;
  }

  static List<IoK8sApiEventsV1Event>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiEventsV1Event>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiEventsV1Event.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiEventsV1Event> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiEventsV1Event>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiEventsV1Event.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiEventsV1Event-objects as value to a dart map
  static Map<String, List<IoK8sApiEventsV1Event>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiEventsV1Event>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiEventsV1Event.listFromJson(
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
    'eventTime',
  };
}
