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

class IoK8sApiCoreV1SeccompProfile {
  /// Returns a new [IoK8sApiCoreV1SeccompProfile] instance.
  IoK8sApiCoreV1SeccompProfile({
    this.localhostProfile,
    required this.type,
  });

  /// localhostProfile indicates a profile defined in a file on the node should be used. The profile must be preconfigured on the node to work. Must be a descending path, relative to the kubelet's configured seccomp profile location. Must only be set if type is \"Localhost\".
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? localhostProfile;

  /// type indicates which kind of seccomp profile will be applied. Valid options are:  Localhost - a profile defined in a file on the node should be used. RuntimeDefault - the container runtime default profile should be used. Unconfined - no profile should be applied.  Possible enum values:  - `\"Localhost\"` indicates a profile defined in a file on the node should be used. The file's location relative to <kubelet-root-dir>/seccomp.  - `\"RuntimeDefault\"` represents the default container runtime seccomp profile.  - `\"Unconfined\"` indicates no seccomp profile is applied (A.K.A. unconfined).
  IoK8sApiCoreV1SeccompProfileTypeEnum type;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1SeccompProfile &&
          other.localhostProfile == localhostProfile &&
          other.type == type;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (localhostProfile == null ? 0 : localhostProfile!.hashCode) +
      (type.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1SeccompProfile[localhostProfile=$localhostProfile, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (localhostProfile != null) {
      json[r'localhostProfile'] = localhostProfile;
    }
    json[r'type'] = type;
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1SeccompProfile] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1SeccompProfile? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1SeccompProfile[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1SeccompProfile[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1SeccompProfile(
        localhostProfile: mapValueOfType<String>(json, r'localhostProfile'),
        type: IoK8sApiCoreV1SeccompProfileTypeEnum.fromJson(json[r'type'])!,
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1SeccompProfile>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1SeccompProfile>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1SeccompProfile.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1SeccompProfile> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1SeccompProfile>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1SeccompProfile.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1SeccompProfile-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1SeccompProfile>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1SeccompProfile>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1SeccompProfile.listFromJson(
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
    'type',
  };
}

/// type indicates which kind of seccomp profile will be applied. Valid options are:  Localhost - a profile defined in a file on the node should be used. RuntimeDefault - the container runtime default profile should be used. Unconfined - no profile should be applied.  Possible enum values:  - `\"Localhost\"` indicates a profile defined in a file on the node should be used. The file's location relative to <kubelet-root-dir>/seccomp.  - `\"RuntimeDefault\"` represents the default container runtime seccomp profile.  - `\"Unconfined\"` indicates no seccomp profile is applied (A.K.A. unconfined).
class IoK8sApiCoreV1SeccompProfileTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const IoK8sApiCoreV1SeccompProfileTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const localhost = IoK8sApiCoreV1SeccompProfileTypeEnum._(r'Localhost');
  static const runtimeDefault =
      IoK8sApiCoreV1SeccompProfileTypeEnum._(r'RuntimeDefault');
  static const unconfined =
      IoK8sApiCoreV1SeccompProfileTypeEnum._(r'Unconfined');

  /// List of all possible values in this [enum][IoK8sApiCoreV1SeccompProfileTypeEnum].
  static const values = <IoK8sApiCoreV1SeccompProfileTypeEnum>[
    localhost,
    runtimeDefault,
    unconfined,
  ];

  static IoK8sApiCoreV1SeccompProfileTypeEnum? fromJson(dynamic value) =>
      IoK8sApiCoreV1SeccompProfileTypeEnumTypeTransformer().decode(value);

  static List<IoK8sApiCoreV1SeccompProfileTypeEnum>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1SeccompProfileTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1SeccompProfileTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoK8sApiCoreV1SeccompProfileTypeEnum] to String,
/// and [decode] dynamic data back to [IoK8sApiCoreV1SeccompProfileTypeEnum].
class IoK8sApiCoreV1SeccompProfileTypeEnumTypeTransformer {
  factory IoK8sApiCoreV1SeccompProfileTypeEnumTypeTransformer() => _instance ??=
      const IoK8sApiCoreV1SeccompProfileTypeEnumTypeTransformer._();

  const IoK8sApiCoreV1SeccompProfileTypeEnumTypeTransformer._();

  String encode(IoK8sApiCoreV1SeccompProfileTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a IoK8sApiCoreV1SeccompProfileTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoK8sApiCoreV1SeccompProfileTypeEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'Localhost':
          return IoK8sApiCoreV1SeccompProfileTypeEnum.localhost;
        case r'RuntimeDefault':
          return IoK8sApiCoreV1SeccompProfileTypeEnum.runtimeDefault;
        case r'Unconfined':
          return IoK8sApiCoreV1SeccompProfileTypeEnum.unconfined;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoK8sApiCoreV1SeccompProfileTypeEnumTypeTransformer] instance.
  static IoK8sApiCoreV1SeccompProfileTypeEnumTypeTransformer? _instance;
}
