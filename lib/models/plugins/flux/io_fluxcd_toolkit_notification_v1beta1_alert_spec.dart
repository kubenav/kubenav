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
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_notification_v1beta1_alert_spec_event_sources_inner.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_notification_v1beta1_alert_spec_provider_ref.dart';

class IoFluxcdToolkitNotificationV1beta1AlertSpec {
  /// Returns a new [IoFluxcdToolkitNotificationV1beta1AlertSpec] instance.
  IoFluxcdToolkitNotificationV1beta1AlertSpec({
    this.eventSeverity,
    this.eventSources = const [],
    this.exclusionList = const [],
    required this.providerRef,
    this.summary,
    this.suspend,
  });

  /// Filter events based on severity, defaults to ('info'). If set to 'info' no events will be filtered.
  IoFluxcdToolkitNotificationV1beta1AlertSpecEventSeverityEnum? eventSeverity;

  /// Filter events based on the involved objects.
  List<IoFluxcdToolkitNotificationV1beta1AlertSpecEventSourcesInner>
      eventSources;

  /// A list of Golang regular expressions to be used for excluding messages.
  List<String> exclusionList;

  IoFluxcdToolkitNotificationV1beta1AlertSpecProviderRef providerRef;

  /// Short description of the impact and affected cluster.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? summary;

  /// This flag tells the controller to suspend subsequent events dispatching. Defaults to false.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? suspend;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitNotificationV1beta1AlertSpec &&
          other.eventSeverity == eventSeverity &&
          deepEquality.equals(other.eventSources, eventSources) &&
          deepEquality.equals(other.exclusionList, exclusionList) &&
          other.providerRef == providerRef &&
          other.summary == summary &&
          other.suspend == suspend;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (eventSeverity == null ? 0 : eventSeverity!.hashCode) +
      (eventSources.hashCode) +
      (exclusionList.hashCode) +
      (providerRef.hashCode) +
      (summary == null ? 0 : summary!.hashCode) +
      (suspend == null ? 0 : suspend!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitNotificationV1beta1AlertSpec[eventSeverity=$eventSeverity, eventSources=$eventSources, exclusionList=$exclusionList, providerRef=$providerRef, summary=$summary, suspend=$suspend]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.eventSeverity != null) {
      json[r'eventSeverity'] = this.eventSeverity;
    } else {
      json[r'eventSeverity'] = null;
    }
    json[r'eventSources'] = this.eventSources;
    json[r'exclusionList'] = this.exclusionList;
    json[r'providerRef'] = this.providerRef;
    if (this.summary != null) {
      json[r'summary'] = this.summary;
    } else {
      json[r'summary'] = null;
    }
    if (this.suspend != null) {
      json[r'suspend'] = this.suspend;
    } else {
      json[r'suspend'] = null;
    }
    return json;
  }

  /// Returns a new [IoFluxcdToolkitNotificationV1beta1AlertSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitNotificationV1beta1AlertSpec? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitNotificationV1beta1AlertSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitNotificationV1beta1AlertSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitNotificationV1beta1AlertSpec(
        eventSeverity:
            IoFluxcdToolkitNotificationV1beta1AlertSpecEventSeverityEnum
                .fromJson(json[r'eventSeverity']),
        eventSources:
            IoFluxcdToolkitNotificationV1beta1AlertSpecEventSourcesInner
                .listFromJson(json[r'eventSources']),
        exclusionList: json[r'exclusionList'] is Iterable
            ? (json[r'exclusionList'] as Iterable)
                .cast<String>()
                .toList(growable: false)
            : const [],
        providerRef:
            IoFluxcdToolkitNotificationV1beta1AlertSpecProviderRef.fromJson(
                json[r'providerRef'])!,
        summary: mapValueOfType<String>(json, r'summary'),
        suspend: mapValueOfType<bool>(json, r'suspend'),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitNotificationV1beta1AlertSpec> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitNotificationV1beta1AlertSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoFluxcdToolkitNotificationV1beta1AlertSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitNotificationV1beta1AlertSpec> mapFromJson(
      dynamic json) {
    final map = <String, IoFluxcdToolkitNotificationV1beta1AlertSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitNotificationV1beta1AlertSpec.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitNotificationV1beta1AlertSpec-objects as value to a dart map
  static Map<String, List<IoFluxcdToolkitNotificationV1beta1AlertSpec>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoFluxcdToolkitNotificationV1beta1AlertSpec>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitNotificationV1beta1AlertSpec.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'eventSources',
    'providerRef',
  };
}

/// Filter events based on severity, defaults to ('info'). If set to 'info' no events will be filtered.
class IoFluxcdToolkitNotificationV1beta1AlertSpecEventSeverityEnum {
  /// Instantiate a new enum with the provided [value].
  const IoFluxcdToolkitNotificationV1beta1AlertSpecEventSeverityEnum._(
      this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const info =
      IoFluxcdToolkitNotificationV1beta1AlertSpecEventSeverityEnum._(r'info');
  static const error =
      IoFluxcdToolkitNotificationV1beta1AlertSpecEventSeverityEnum._(r'error');

  /// List of all possible values in this [enum][IoFluxcdToolkitNotificationV1beta1AlertSpecEventSeverityEnum].
  static const values =
      <IoFluxcdToolkitNotificationV1beta1AlertSpecEventSeverityEnum>[
    info,
    error,
  ];

  static IoFluxcdToolkitNotificationV1beta1AlertSpecEventSeverityEnum? fromJson(
          dynamic value) =>
      IoFluxcdToolkitNotificationV1beta1AlertSpecEventSeverityEnumTypeTransformer()
          .decode(value);

  static List<IoFluxcdToolkitNotificationV1beta1AlertSpecEventSeverityEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitNotificationV1beta1AlertSpecEventSeverityEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitNotificationV1beta1AlertSpecEventSeverityEnum
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoFluxcdToolkitNotificationV1beta1AlertSpecEventSeverityEnum] to String,
/// and [decode] dynamic data back to [IoFluxcdToolkitNotificationV1beta1AlertSpecEventSeverityEnum].
class IoFluxcdToolkitNotificationV1beta1AlertSpecEventSeverityEnumTypeTransformer {
  factory IoFluxcdToolkitNotificationV1beta1AlertSpecEventSeverityEnumTypeTransformer() =>
      _instance ??=
          const IoFluxcdToolkitNotificationV1beta1AlertSpecEventSeverityEnumTypeTransformer
              ._();

  const IoFluxcdToolkitNotificationV1beta1AlertSpecEventSeverityEnumTypeTransformer._();

  String encode(
          IoFluxcdToolkitNotificationV1beta1AlertSpecEventSeverityEnum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoFluxcdToolkitNotificationV1beta1AlertSpecEventSeverityEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoFluxcdToolkitNotificationV1beta1AlertSpecEventSeverityEnum? decode(
      dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'info':
          return IoFluxcdToolkitNotificationV1beta1AlertSpecEventSeverityEnum
              .info;
        case r'error':
          return IoFluxcdToolkitNotificationV1beta1AlertSpecEventSeverityEnum
              .error;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoFluxcdToolkitNotificationV1beta1AlertSpecEventSeverityEnumTypeTransformer] instance.
  static IoFluxcdToolkitNotificationV1beta1AlertSpecEventSeverityEnumTypeTransformer?
      _instance;
}
