//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApimachineryPkgApisMetaV1DeleteOptions {
  /// Returns a new [IoK8sApimachineryPkgApisMetaV1DeleteOptions] instance.
  IoK8sApimachineryPkgApisMetaV1DeleteOptions({
    this.apiVersion,
    this.dryRun = const [],
    this.gracePeriodSeconds,
    this.kind,
    this.orphanDependents,
    this.preconditions,
    this.propagationPolicy,
  });

  /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? apiVersion;

  /// When present, indicates that modifications should not be persisted. An invalid or unrecognized dryRun directive will result in an error response and no further processing of the request. Valid values are: - All: all dry run stages will be processed
  List<String> dryRun;

  /// The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? gracePeriodSeconds;

  /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? kind;

  /// Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7. Should the dependent objects be orphaned. If true/false, the \"orphan\" finalizer will be added to/removed from the object's finalizers list. Either this field or PropagationPolicy may be set, but not both.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? orphanDependents;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApimachineryPkgApisMetaV1Preconditions? preconditions;

  /// Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? propagationPolicy;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApimachineryPkgApisMetaV1DeleteOptions &&
          other.apiVersion == apiVersion &&
          other.dryRun == dryRun &&
          other.gracePeriodSeconds == gracePeriodSeconds &&
          other.kind == kind &&
          other.orphanDependents == orphanDependents &&
          other.preconditions == preconditions &&
          other.propagationPolicy == propagationPolicy;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (apiVersion == null ? 0 : apiVersion!.hashCode) +
      (dryRun.hashCode) +
      (gracePeriodSeconds == null ? 0 : gracePeriodSeconds!.hashCode) +
      (kind == null ? 0 : kind!.hashCode) +
      (orphanDependents == null ? 0 : orphanDependents!.hashCode) +
      (preconditions == null ? 0 : preconditions!.hashCode) +
      (propagationPolicy == null ? 0 : propagationPolicy!.hashCode);

  @override
  String toString() =>
      'IoK8sApimachineryPkgApisMetaV1DeleteOptions[apiVersion=$apiVersion, dryRun=$dryRun, gracePeriodSeconds=$gracePeriodSeconds, kind=$kind, orphanDependents=$orphanDependents, preconditions=$preconditions, propagationPolicy=$propagationPolicy]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (apiVersion != null) {
      json[r'apiVersion'] = apiVersion;
    }
    json[r'dryRun'] = dryRun;
    if (gracePeriodSeconds != null) {
      json[r'gracePeriodSeconds'] = gracePeriodSeconds;
    }
    if (kind != null) {
      json[r'kind'] = kind;
    }
    if (orphanDependents != null) {
      json[r'orphanDependents'] = orphanDependents;
    }
    if (preconditions != null) {
      json[r'preconditions'] = preconditions;
    }
    if (propagationPolicy != null) {
      json[r'propagationPolicy'] = propagationPolicy;
    }
    return json;
  }

  /// Returns a new [IoK8sApimachineryPkgApisMetaV1DeleteOptions] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApimachineryPkgApisMetaV1DeleteOptions? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApimachineryPkgApisMetaV1DeleteOptions[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApimachineryPkgApisMetaV1DeleteOptions[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApimachineryPkgApisMetaV1DeleteOptions(
        apiVersion: mapValueOfType<String>(json, r'apiVersion'),
        dryRun: json[r'dryRun'] is List
            ? (json[r'dryRun'] as List).cast<String>()
            : const [],
        gracePeriodSeconds: mapValueOfType<int>(json, r'gracePeriodSeconds'),
        kind: mapValueOfType<String>(json, r'kind'),
        orphanDependents: mapValueOfType<bool>(json, r'orphanDependents'),
        preconditions: IoK8sApimachineryPkgApisMetaV1Preconditions.fromJson(
            json[r'preconditions']),
        propagationPolicy: mapValueOfType<String>(json, r'propagationPolicy'),
      );
    }
    return null;
  }

  static List<IoK8sApimachineryPkgApisMetaV1DeleteOptions>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApimachineryPkgApisMetaV1DeleteOptions>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApimachineryPkgApisMetaV1DeleteOptions.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApimachineryPkgApisMetaV1DeleteOptions> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApimachineryPkgApisMetaV1DeleteOptions>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApimachineryPkgApisMetaV1DeleteOptions.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApimachineryPkgApisMetaV1DeleteOptions-objects as value to a dart map
  static Map<String, List<IoK8sApimachineryPkgApisMetaV1DeleteOptions>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApimachineryPkgApisMetaV1DeleteOptions>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApimachineryPkgApisMetaV1DeleteOptions.listFromJson(
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
