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

class IoArgoprojV1alpha1ApplicationSetSpecSyncPolicy {
  /// Returns a new [IoArgoprojV1alpha1ApplicationSetSpecSyncPolicy] instance.
  IoArgoprojV1alpha1ApplicationSetSpecSyncPolicy({
    this.applicationsSync,
    this.preserveResourcesOnDeletion,
  });

  IoArgoprojV1alpha1ApplicationSetSpecSyncPolicyApplicationsSyncEnum?
      applicationsSync;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? preserveResourcesOnDeletion;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1ApplicationSetSpecSyncPolicy &&
          other.applicationsSync == applicationsSync &&
          other.preserveResourcesOnDeletion == preserveResourcesOnDeletion;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (applicationsSync == null ? 0 : applicationsSync!.hashCode) +
      (preserveResourcesOnDeletion == null
          ? 0
          : preserveResourcesOnDeletion!.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1ApplicationSetSpecSyncPolicy[applicationsSync=$applicationsSync, preserveResourcesOnDeletion=$preserveResourcesOnDeletion]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.applicationsSync != null) {
      json[r'applicationsSync'] = this.applicationsSync;
    } else {
      json[r'applicationsSync'] = null;
    }
    if (this.preserveResourcesOnDeletion != null) {
      json[r'preserveResourcesOnDeletion'] = this.preserveResourcesOnDeletion;
    } else {
      json[r'preserveResourcesOnDeletion'] = null;
    }
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1ApplicationSetSpecSyncPolicy] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1ApplicationSetSpecSyncPolicy? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoArgoprojV1alpha1ApplicationSetSpecSyncPolicy[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoArgoprojV1alpha1ApplicationSetSpecSyncPolicy[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoArgoprojV1alpha1ApplicationSetSpecSyncPolicy(
        applicationsSync:
            IoArgoprojV1alpha1ApplicationSetSpecSyncPolicyApplicationsSyncEnum
                .fromJson(json[r'applicationsSync']),
        preserveResourcesOnDeletion:
            mapValueOfType<bool>(json, r'preserveResourcesOnDeletion'),
      );
    }
    return null;
  }

  static List<IoArgoprojV1alpha1ApplicationSetSpecSyncPolicy> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoArgoprojV1alpha1ApplicationSetSpecSyncPolicy>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1ApplicationSetSpecSyncPolicy.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoArgoprojV1alpha1ApplicationSetSpecSyncPolicy>
      mapFromJson(dynamic json) {
    final map = <String, IoArgoprojV1alpha1ApplicationSetSpecSyncPolicy>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoArgoprojV1alpha1ApplicationSetSpecSyncPolicy.fromJson(
            entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1ApplicationSetSpecSyncPolicy-objects as value to a dart map
  static Map<String, List<IoArgoprojV1alpha1ApplicationSetSpecSyncPolicy>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoArgoprojV1alpha1ApplicationSetSpecSyncPolicy>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1ApplicationSetSpecSyncPolicy.listFromJson(
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

class IoArgoprojV1alpha1ApplicationSetSpecSyncPolicyApplicationsSyncEnum {
  /// Instantiate a new enum with the provided [value].
  const IoArgoprojV1alpha1ApplicationSetSpecSyncPolicyApplicationsSyncEnum._(
      this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const createOnly =
      IoArgoprojV1alpha1ApplicationSetSpecSyncPolicyApplicationsSyncEnum._(
          r'create-only');
  static const createUpdate =
      IoArgoprojV1alpha1ApplicationSetSpecSyncPolicyApplicationsSyncEnum._(
          r'create-update');
  static const createDelete =
      IoArgoprojV1alpha1ApplicationSetSpecSyncPolicyApplicationsSyncEnum._(
          r'create-delete');
  static const sync_ =
      IoArgoprojV1alpha1ApplicationSetSpecSyncPolicyApplicationsSyncEnum._(
          r'sync');

  /// List of all possible values in this [enum][IoArgoprojV1alpha1ApplicationSetSpecSyncPolicyApplicationsSyncEnum].
  static const values =
      <IoArgoprojV1alpha1ApplicationSetSpecSyncPolicyApplicationsSyncEnum>[
    createOnly,
    createUpdate,
    createDelete,
    sync_,
  ];

  static IoArgoprojV1alpha1ApplicationSetSpecSyncPolicyApplicationsSyncEnum?
      fromJson(dynamic value) =>
          IoArgoprojV1alpha1ApplicationSetSpecSyncPolicyApplicationsSyncEnumTypeTransformer()
              .decode(value);

  static List<
          IoArgoprojV1alpha1ApplicationSetSpecSyncPolicyApplicationsSyncEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoArgoprojV1alpha1ApplicationSetSpecSyncPolicyApplicationsSyncEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1ApplicationSetSpecSyncPolicyApplicationsSyncEnum
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoArgoprojV1alpha1ApplicationSetSpecSyncPolicyApplicationsSyncEnum] to String,
/// and [decode] dynamic data back to [IoArgoprojV1alpha1ApplicationSetSpecSyncPolicyApplicationsSyncEnum].
class IoArgoprojV1alpha1ApplicationSetSpecSyncPolicyApplicationsSyncEnumTypeTransformer {
  factory IoArgoprojV1alpha1ApplicationSetSpecSyncPolicyApplicationsSyncEnumTypeTransformer() =>
      _instance ??=
          const IoArgoprojV1alpha1ApplicationSetSpecSyncPolicyApplicationsSyncEnumTypeTransformer
              ._();

  const IoArgoprojV1alpha1ApplicationSetSpecSyncPolicyApplicationsSyncEnumTypeTransformer._();

  String encode(
          IoArgoprojV1alpha1ApplicationSetSpecSyncPolicyApplicationsSyncEnum
              data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoArgoprojV1alpha1ApplicationSetSpecSyncPolicyApplicationsSyncEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoArgoprojV1alpha1ApplicationSetSpecSyncPolicyApplicationsSyncEnum? decode(
      dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'create-only':
          return IoArgoprojV1alpha1ApplicationSetSpecSyncPolicyApplicationsSyncEnum
              .createOnly;
        case r'create-update':
          return IoArgoprojV1alpha1ApplicationSetSpecSyncPolicyApplicationsSyncEnum
              .createUpdate;
        case r'create-delete':
          return IoArgoprojV1alpha1ApplicationSetSpecSyncPolicyApplicationsSyncEnum
              .createDelete;
        case r'sync':
          return IoArgoprojV1alpha1ApplicationSetSpecSyncPolicyApplicationsSyncEnum
              .sync_;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoArgoprojV1alpha1ApplicationSetSpecSyncPolicyApplicationsSyncEnumTypeTransformer] instance.
  static IoArgoprojV1alpha1ApplicationSetSpecSyncPolicyApplicationsSyncEnumTypeTransformer?
      _instance;
}
