//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import, unnecessary_this
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:kubenav/models/kubernetes/helpers.dart';

class IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResultResourcesInner {
  /// Returns a new [IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResultResourcesInner] instance.
  IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResultResourcesInner({
    required this.group,
    this.hookPhase,
    this.hookType,
    required this.kind,
    this.message,
    required this.name,
    required this.namespace,
    this.status,
    this.syncPhase,
    required this.version,
  });

  /// Group specifies the API group of the resource
  String group;

  /// HookPhase contains the state of any operation associated with this resource OR hook This can also contain values for non-hook resources.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? hookPhase;

  /// HookType specifies the type of the hook. Empty for non-hook resources
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? hookType;

  /// Kind specifies the API kind of the resource
  String kind;

  /// Message contains an informational or error message for the last sync OR operation
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? message;

  /// Name specifies the name of the resource
  String name;

  /// Namespace specifies the target namespace of the resource
  String namespace;

  /// Status holds the final result of the sync. Will be empty if the resources is yet to be applied/pruned and is always zero-value for hooks
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? status;

  /// SyncPhase indicates the particular phase of the sync that this result was acquired in
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? syncPhase;

  /// Version specifies the API version of the resource
  String version;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResultResourcesInner &&
          other.group == group &&
          other.hookPhase == hookPhase &&
          other.hookType == hookType &&
          other.kind == kind &&
          other.message == message &&
          other.name == name &&
          other.namespace == namespace &&
          other.status == status &&
          other.syncPhase == syncPhase &&
          other.version == version;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (group.hashCode) +
      (hookPhase == null ? 0 : hookPhase!.hashCode) +
      (hookType == null ? 0 : hookType!.hashCode) +
      (kind.hashCode) +
      (message == null ? 0 : message!.hashCode) +
      (name.hashCode) +
      (namespace.hashCode) +
      (status == null ? 0 : status!.hashCode) +
      (syncPhase == null ? 0 : syncPhase!.hashCode) +
      (version.hashCode);

  @override
  String toString() =>
      'IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResultResourcesInner[group=$group, hookPhase=$hookPhase, hookType=$hookType, kind=$kind, message=$message, name=$name, namespace=$namespace, status=$status, syncPhase=$syncPhase, version=$version]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'group'] = this.group;
    if (this.hookPhase != null) {
      json[r'hookPhase'] = this.hookPhase;
    } else {
      json[r'hookPhase'] = null;
    }
    if (this.hookType != null) {
      json[r'hookType'] = this.hookType;
    } else {
      json[r'hookType'] = null;
    }
    json[r'kind'] = this.kind;
    if (this.message != null) {
      json[r'message'] = this.message;
    } else {
      json[r'message'] = null;
    }
    json[r'name'] = this.name;
    json[r'namespace'] = this.namespace;
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
    if (this.syncPhase != null) {
      json[r'syncPhase'] = this.syncPhase;
    } else {
      json[r'syncPhase'] = null;
    }
    json[r'version'] = this.version;
    return json;
  }

  /// Returns a new [IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResultResourcesInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResultResourcesInner?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        for (var key in requiredKeys) {
          assert(
            json.containsKey(key),
            'Required key "IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResultResourcesInner[$key]" is missing from JSON.',
          );
          assert(
            json[key] != null,
            'Required key "IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResultResourcesInner[$key]" has a null value in JSON.',
          );
        }
        return true;
      }());

      return IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResultResourcesInner(
        group: mapValueOfType<String>(json, r'group')!,
        hookPhase: mapValueOfType<String>(json, r'hookPhase'),
        hookType: mapValueOfType<String>(json, r'hookType'),
        kind: mapValueOfType<String>(json, r'kind')!,
        message: mapValueOfType<String>(json, r'message'),
        name: mapValueOfType<String>(json, r'name')!,
        namespace: mapValueOfType<String>(json, r'namespace')!,
        status: mapValueOfType<String>(json, r'status'),
        syncPhase: mapValueOfType<String>(json, r'syncPhase'),
        version: mapValueOfType<String>(json, r'version')!,
      );
    }
    return null;
  }

  static List<
          IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResultResourcesInner>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResultResourcesInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResultResourcesInner
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResultResourcesInner>
      mapFromJson(dynamic json) {
    final map = <String,
        IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResultResourcesInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResultResourcesInner
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResultResourcesInner-objects as value to a dart map
  static Map<
          String,
          List<
              IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResultResourcesInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<
            IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResultResourcesInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoArgoprojV1alpha1ApplicationStatusOperationStateSyncResultResourcesInner
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
    'group',
    'kind',
    'name',
    'namespace',
    'version',
  };
}
