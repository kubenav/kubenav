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

class IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInner {
  /// Returns a new [IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInner] instance.
  IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInner({
    required this.lastTransitionTime,
    required this.message,
    this.observedGeneration,
    required this.reason,
    required this.status,
    required this.type,
  });

  /// lastTransitionTime is the last time the condition transitioned from one status to another. This should be when the underlying condition changed.  If that is not known, then using the time when the API field changed is acceptable.
  DateTime lastTransitionTime;

  /// message is a human readable message indicating details about the transition. This may be an empty string.
  String message;

  /// observedGeneration represents the .metadata.generation that the condition was set based upon. For instance, if .metadata.generation is currently 12, but the .status.conditions[x].observedGeneration is 9, the condition is out of date with respect to the current state of the instance.
  ///
  /// Minimum value: 0
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? observedGeneration;

  /// reason contains a programmatic identifier indicating the reason for the condition's last transition. Producers of specific condition types may define expected values and meanings for this field, and whether the values are considered a guaranteed API. The value should be a CamelCase string. This field may not be empty.
  String reason;

  /// status of the condition, one of True, False, Unknown.
  IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInnerStatusEnum status;

  /// type of condition in CamelCase or in foo.example.com/CamelCase. --- Many .condition.type values are consistent across resources like Available, but because arbitrary conditions can be useful (see .node.status.conditions), the ability to deconflict is important. The regex it matches is (dns1123SubdomainFmt/)?(qualifiedNameFmt)
  String type;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInner &&
          other.lastTransitionTime == lastTransitionTime &&
          other.message == message &&
          other.observedGeneration == observedGeneration &&
          other.reason == reason &&
          other.status == status &&
          other.type == type;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (lastTransitionTime.hashCode) +
      (message.hashCode) +
      (observedGeneration == null ? 0 : observedGeneration!.hashCode) +
      (reason.hashCode) +
      (status.hashCode) +
      (type.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInner[lastTransitionTime=$lastTransitionTime, message=$message, observedGeneration=$observedGeneration, reason=$reason, status=$status, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'lastTransitionTime'] =
        this.lastTransitionTime.toUtc().toIso8601String();
    json[r'message'] = this.message;
    if (this.observedGeneration != null) {
      json[r'observedGeneration'] = this.observedGeneration;
    } else {
      json[r'observedGeneration'] = null;
    }
    json[r'reason'] = this.reason;
    json[r'status'] = this.status;
    json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInner? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInner(
        lastTransitionTime: mapDateTime(json, r'lastTransitionTime', r'')!,
        message: mapValueOfType<String>(json, r'message')!,
        observedGeneration: mapValueOfType<int>(json, r'observedGeneration'),
        reason: mapValueOfType<String>(json, r'reason')!,
        status:
            IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInnerStatusEnum
                .fromJson(json[r'status'])!,
        type: mapValueOfType<String>(json, r'type')!,
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInner>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInner.fromJson(
                row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInner>
      mapFromJson(dynamic json) {
    final map =
        <String, IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInner.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInner-objects as value to a dart map
  static Map<String,
          List<IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInner
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
    'lastTransitionTime',
    'message',
    'reason',
    'status',
    'type',
  };
}

/// status of the condition, one of True, False, Unknown.
class IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInnerStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInnerStatusEnum._(
      this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const true_ =
      IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInnerStatusEnum._(
          r'True');
  static const false_ =
      IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInnerStatusEnum._(
          r'False');
  static const unknown =
      IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInnerStatusEnum._(
          r'Unknown');

  /// List of all possible values in this [enum][IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInnerStatusEnum].
  static const values =
      <IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInnerStatusEnum>[
    true_,
    false_,
    unknown,
  ];

  static IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInnerStatusEnum?
      fromJson(dynamic value) =>
          IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInnerStatusEnumTypeTransformer()
              .decode(value);

  static List<
          IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInnerStatusEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInnerStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInnerStatusEnum
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInnerStatusEnum] to String,
/// and [decode] dynamic data back to [IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInnerStatusEnum].
class IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInnerStatusEnumTypeTransformer {
  factory IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInnerStatusEnumTypeTransformer() =>
      _instance ??=
          const IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInnerStatusEnumTypeTransformer
              ._();

  const IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInnerStatusEnumTypeTransformer._();

  String encode(
          IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInnerStatusEnum
              data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInnerStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInnerStatusEnum? decode(
      dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'True':
          return IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInnerStatusEnum
              .true_;
        case r'False':
          return IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInnerStatusEnum
              .false_;
        case r'Unknown':
          return IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInnerStatusEnum
              .unknown;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInnerStatusEnumTypeTransformer] instance.
  static IoFluxcdToolkitHelmV2beta1HelmReleaseStatusConditionsInnerStatusEnumTypeTransformer?
      _instance;
}
