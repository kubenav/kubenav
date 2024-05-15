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

class IoCertManagerV1CertificateStatusConditionsInner {
  /// Returns a new [IoCertManagerV1CertificateStatusConditionsInner] instance.
  IoCertManagerV1CertificateStatusConditionsInner({
    this.lastTransitionTime,
    this.message,
    this.observedGeneration,
    this.reason,
    required this.status,
    required this.type,
  });

  /// LastTransitionTime is the timestamp corresponding to the last status change of this condition.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? lastTransitionTime;

  /// Message is a human readable description of the details of the last transition, complementing reason.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? message;

  /// If set, this represents the .metadata.generation that the condition was set based upon. For instance, if .metadata.generation is currently 12, but the .status.condition[x].observedGeneration is 9, the condition is out of date with respect to the current state of the Certificate.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? observedGeneration;

  /// Reason is a brief machine readable explanation for the condition's last transition.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? reason;

  /// Status of the condition, one of (`True`, `False`, `Unknown`).
  IoCertManagerV1CertificateStatusConditionsInnerStatusEnum status;

  /// Type of the condition, known values are (`Ready`, `Issuing`).
  String type;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerV1CertificateStatusConditionsInner &&
          other.lastTransitionTime == lastTransitionTime &&
          other.message == message &&
          other.observedGeneration == observedGeneration &&
          other.reason == reason &&
          other.status == status &&
          other.type == type;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (lastTransitionTime == null ? 0 : lastTransitionTime!.hashCode) +
      (message == null ? 0 : message!.hashCode) +
      (observedGeneration == null ? 0 : observedGeneration!.hashCode) +
      (reason == null ? 0 : reason!.hashCode) +
      (status.hashCode) +
      (type.hashCode);

  @override
  String toString() =>
      'IoCertManagerV1CertificateStatusConditionsInner[lastTransitionTime=$lastTransitionTime, message=$message, observedGeneration=$observedGeneration, reason=$reason, status=$status, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.lastTransitionTime != null) {
      json[r'lastTransitionTime'] =
          this.lastTransitionTime!.toUtc().toIso8601String();
    } else {
      json[r'lastTransitionTime'] = null;
    }
    if (this.message != null) {
      json[r'message'] = this.message;
    } else {
      json[r'message'] = null;
    }
    if (this.observedGeneration != null) {
      json[r'observedGeneration'] = this.observedGeneration;
    } else {
      json[r'observedGeneration'] = null;
    }
    if (this.reason != null) {
      json[r'reason'] = this.reason;
    } else {
      json[r'reason'] = null;
    }
    json[r'status'] = this.status;
    json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [IoCertManagerV1CertificateStatusConditionsInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerV1CertificateStatusConditionsInner? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerV1CertificateStatusConditionsInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerV1CertificateStatusConditionsInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerV1CertificateStatusConditionsInner(
        lastTransitionTime: mapDateTime(json, r'lastTransitionTime', r''),
        message: mapValueOfType<String>(json, r'message'),
        observedGeneration: mapValueOfType<int>(json, r'observedGeneration'),
        reason: mapValueOfType<String>(json, r'reason'),
        status:
            IoCertManagerV1CertificateStatusConditionsInnerStatusEnum.fromJson(
                json[r'status'])!,
        type: mapValueOfType<String>(json, r'type')!,
      );
    }
    return null;
  }

  static List<IoCertManagerV1CertificateStatusConditionsInner> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoCertManagerV1CertificateStatusConditionsInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoCertManagerV1CertificateStatusConditionsInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoCertManagerV1CertificateStatusConditionsInner>
      mapFromJson(dynamic json) {
    final map = <String, IoCertManagerV1CertificateStatusConditionsInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoCertManagerV1CertificateStatusConditionsInner.fromJson(
            entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerV1CertificateStatusConditionsInner-objects as value to a dart map
  static Map<String, List<IoCertManagerV1CertificateStatusConditionsInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoCertManagerV1CertificateStatusConditionsInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoCertManagerV1CertificateStatusConditionsInner.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'status',
    'type',
  };
}

/// Status of the condition, one of (`True`, `False`, `Unknown`).
class IoCertManagerV1CertificateStatusConditionsInnerStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const IoCertManagerV1CertificateStatusConditionsInnerStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const true_ =
      IoCertManagerV1CertificateStatusConditionsInnerStatusEnum._(r'True');
  static const false_ =
      IoCertManagerV1CertificateStatusConditionsInnerStatusEnum._(r'False');
  static const unknown =
      IoCertManagerV1CertificateStatusConditionsInnerStatusEnum._(r'Unknown');

  /// List of all possible values in this [enum][IoCertManagerV1CertificateStatusConditionsInnerStatusEnum].
  static const values =
      <IoCertManagerV1CertificateStatusConditionsInnerStatusEnum>[
    true_,
    false_,
    unknown,
  ];

  static IoCertManagerV1CertificateStatusConditionsInnerStatusEnum? fromJson(
          dynamic value) =>
      IoCertManagerV1CertificateStatusConditionsInnerStatusEnumTypeTransformer()
          .decode(value);

  static List<IoCertManagerV1CertificateStatusConditionsInnerStatusEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoCertManagerV1CertificateStatusConditionsInnerStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoCertManagerV1CertificateStatusConditionsInnerStatusEnum.fromJson(
                row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoCertManagerV1CertificateStatusConditionsInnerStatusEnum] to String,
/// and [decode] dynamic data back to [IoCertManagerV1CertificateStatusConditionsInnerStatusEnum].
class IoCertManagerV1CertificateStatusConditionsInnerStatusEnumTypeTransformer {
  factory IoCertManagerV1CertificateStatusConditionsInnerStatusEnumTypeTransformer() =>
      _instance ??=
          const IoCertManagerV1CertificateStatusConditionsInnerStatusEnumTypeTransformer
              ._();

  const IoCertManagerV1CertificateStatusConditionsInnerStatusEnumTypeTransformer._();

  String encode(
          IoCertManagerV1CertificateStatusConditionsInnerStatusEnum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoCertManagerV1CertificateStatusConditionsInnerStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoCertManagerV1CertificateStatusConditionsInnerStatusEnum? decode(
      dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'True':
          return IoCertManagerV1CertificateStatusConditionsInnerStatusEnum
              .true_;
        case r'False':
          return IoCertManagerV1CertificateStatusConditionsInnerStatusEnum
              .false_;
        case r'Unknown':
          return IoCertManagerV1CertificateStatusConditionsInnerStatusEnum
              .unknown;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoCertManagerV1CertificateStatusConditionsInnerStatusEnumTypeTransformer] instance.
  static IoCertManagerV1CertificateStatusConditionsInnerStatusEnumTypeTransformer?
      _instance;
}
