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

class IoK8sApimachineryPkgApisMetaV1ListMeta {
  /// Returns a new [IoK8sApimachineryPkgApisMetaV1ListMeta] instance.
  IoK8sApimachineryPkgApisMetaV1ListMeta({
    this.continue_,
    this.remainingItemCount,
    this.resourceVersion,
    this.selfLink,
  });

  /// continue may be set if the user set a limit on the number of items returned, and indicates that the server has more data available. The value is opaque and may be used to issue another request to the endpoint that served this list to retrieve the next set of available objects. Continuing a consistent list may not be possible if the server configuration has changed or more than a few minutes have passed. The resourceVersion field returned when using this continue value will be identical to the value in the first response, unless you have received this token from an error message.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? continue_;

  /// remainingItemCount is the number of subsequent items in the list which are not included in this list response. If the list request contained label or field selectors, then the number of remaining items is unknown and the field will be left unset and omitted during serialization. If the list is complete (either because it is not chunking or because this is the last chunk), then there are no more remaining items and this field will be left unset and omitted during serialization. Servers older than v1.15 do not set this field. The intended use of the remainingItemCount is *estimating* the size of a collection. Clients should not rely on the remainingItemCount to be set or to be exact.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? remainingItemCount;

  /// String that identifies the server's internal version of this object that can be used by clients to determine when objects have changed. Value must be treated as opaque by clients and passed unmodified back to the server. Populated by the system. Read-only. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? resourceVersion;

  /// Deprecated: selfLink is a legacy read-only field that is no longer populated by the system.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? selfLink;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApimachineryPkgApisMetaV1ListMeta &&
          other.continue_ == continue_ &&
          other.remainingItemCount == remainingItemCount &&
          other.resourceVersion == resourceVersion &&
          other.selfLink == selfLink;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (continue_ == null ? 0 : continue_!.hashCode) +
      (remainingItemCount == null ? 0 : remainingItemCount!.hashCode) +
      (resourceVersion == null ? 0 : resourceVersion!.hashCode) +
      (selfLink == null ? 0 : selfLink!.hashCode);

  @override
  String toString() =>
      'IoK8sApimachineryPkgApisMetaV1ListMeta[continue_=$continue_, remainingItemCount=$remainingItemCount, resourceVersion=$resourceVersion, selfLink=$selfLink]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.continue_ != null) {
      json[r'continue'] = this.continue_;
    } else {
      json[r'continue'] = null;
    }
    if (this.remainingItemCount != null) {
      json[r'remainingItemCount'] = this.remainingItemCount;
    } else {
      json[r'remainingItemCount'] = null;
    }
    if (this.resourceVersion != null) {
      json[r'resourceVersion'] = this.resourceVersion;
    } else {
      json[r'resourceVersion'] = null;
    }
    if (this.selfLink != null) {
      json[r'selfLink'] = this.selfLink;
    } else {
      json[r'selfLink'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApimachineryPkgApisMetaV1ListMeta] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApimachineryPkgApisMetaV1ListMeta? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApimachineryPkgApisMetaV1ListMeta[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApimachineryPkgApisMetaV1ListMeta[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApimachineryPkgApisMetaV1ListMeta(
        continue_: mapValueOfType<String>(json, r'continue'),
        remainingItemCount: mapValueOfType<int>(json, r'remainingItemCount'),
        resourceVersion: mapValueOfType<String>(json, r'resourceVersion'),
        selfLink: mapValueOfType<String>(json, r'selfLink'),
      );
    }
    return null;
  }

  static List<IoK8sApimachineryPkgApisMetaV1ListMeta>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApimachineryPkgApisMetaV1ListMeta>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApimachineryPkgApisMetaV1ListMeta.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApimachineryPkgApisMetaV1ListMeta> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApimachineryPkgApisMetaV1ListMeta>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApimachineryPkgApisMetaV1ListMeta.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApimachineryPkgApisMetaV1ListMeta-objects as value to a dart map
  static Map<String, List<IoK8sApimachineryPkgApisMetaV1ListMeta>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApimachineryPkgApisMetaV1ListMeta>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApimachineryPkgApisMetaV1ListMeta.listFromJson(
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
