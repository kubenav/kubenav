//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiApiserverinternalV1alpha1StorageVersionStatus {
  /// Returns a new [IoK8sApiApiserverinternalV1alpha1StorageVersionStatus] instance.
  IoK8sApiApiserverinternalV1alpha1StorageVersionStatus({
    this.commonEncodingVersion,
    this.conditions = const [],
    this.storageVersions = const [],
  });

  /// If all API server instances agree on the same encoding storage version, then this field is set to that version. Otherwise this field is left empty. API servers should finish updating its storageVersionStatus entry before serving write operations, so that this field will be in sync with the reality.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? commonEncodingVersion;

  /// The latest available observations of the storageVersion's state.
  List<IoK8sApiApiserverinternalV1alpha1StorageVersionCondition> conditions;

  /// The reported versions per API server instance.
  List<IoK8sApiApiserverinternalV1alpha1ServerStorageVersion> storageVersions;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiApiserverinternalV1alpha1StorageVersionStatus &&
          other.commonEncodingVersion == commonEncodingVersion &&
          other.conditions == conditions &&
          other.storageVersions == storageVersions;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (commonEncodingVersion == null ? 0 : commonEncodingVersion!.hashCode) +
      (conditions.hashCode) +
      (storageVersions.hashCode);

  @override
  String toString() =>
      'IoK8sApiApiserverinternalV1alpha1StorageVersionStatus[commonEncodingVersion=$commonEncodingVersion, conditions=$conditions, storageVersions=$storageVersions]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (commonEncodingVersion != null) {
      json[r'commonEncodingVersion'] = commonEncodingVersion;
    }
    json[r'conditions'] = conditions;
    json[r'storageVersions'] = storageVersions;
    return json;
  }

  /// Returns a new [IoK8sApiApiserverinternalV1alpha1StorageVersionStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiApiserverinternalV1alpha1StorageVersionStatus? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiApiserverinternalV1alpha1StorageVersionStatus[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiApiserverinternalV1alpha1StorageVersionStatus[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiApiserverinternalV1alpha1StorageVersionStatus(
        commonEncodingVersion:
            mapValueOfType<String>(json, r'commonEncodingVersion'),
        conditions: IoK8sApiApiserverinternalV1alpha1StorageVersionCondition
                .listFromJson(json[r'conditions']) ??
            const [],
        storageVersions:
            IoK8sApiApiserverinternalV1alpha1ServerStorageVersion.listFromJson(
                    json[r'storageVersions']) ??
                const [],
      );
    }
    return null;
  }

  static List<IoK8sApiApiserverinternalV1alpha1StorageVersionStatus>?
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiApiserverinternalV1alpha1StorageVersionStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiApiserverinternalV1alpha1StorageVersionStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiApiserverinternalV1alpha1StorageVersionStatus>
      mapFromJson(dynamic json) {
    final map =
        <String, IoK8sApiApiserverinternalV1alpha1StorageVersionStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiApiserverinternalV1alpha1StorageVersionStatus.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiApiserverinternalV1alpha1StorageVersionStatus-objects as value to a dart map
  static Map<String,
          List<IoK8sApiApiserverinternalV1alpha1StorageVersionStatus>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoK8sApiApiserverinternalV1alpha1StorageVersionStatus>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiApiserverinternalV1alpha1StorageVersionStatus.listFromJson(
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
