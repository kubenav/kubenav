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

class IoFluxcdToolkitSourceV1beta1GitRepositoryStatusIncludedArtifactsInner {
  /// Returns a new [IoFluxcdToolkitSourceV1beta1GitRepositoryStatusIncludedArtifactsInner] instance.
  IoFluxcdToolkitSourceV1beta1GitRepositoryStatusIncludedArtifactsInner({
    this.checksum,
    this.lastUpdateTime,
    required this.path,
    this.revision,
    required this.url,
  });

  /// Checksum is the SHA256 checksum of the artifact.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? checksum;

  /// LastUpdateTime is the timestamp corresponding to the last update of this artifact.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? lastUpdateTime;

  /// Path is the relative file path of this artifact.
  String path;

  /// Revision is a human readable identifier traceable in the origin source system. It can be a Git commit SHA, Git tag, a Helm index timestamp, a Helm chart version, etc.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? revision;

  /// URL is the HTTP address of this artifact.
  String url;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitSourceV1beta1GitRepositoryStatusIncludedArtifactsInner &&
          other.checksum == checksum &&
          other.lastUpdateTime == lastUpdateTime &&
          other.path == path &&
          other.revision == revision &&
          other.url == url;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (checksum == null ? 0 : checksum!.hashCode) +
      (lastUpdateTime == null ? 0 : lastUpdateTime!.hashCode) +
      (path.hashCode) +
      (revision == null ? 0 : revision!.hashCode) +
      (url.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitSourceV1beta1GitRepositoryStatusIncludedArtifactsInner[checksum=$checksum, lastUpdateTime=$lastUpdateTime, path=$path, revision=$revision, url=$url]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.checksum != null) {
      json[r'checksum'] = this.checksum;
    } else {
      json[r'checksum'] = null;
    }
    if (this.lastUpdateTime != null) {
      json[r'lastUpdateTime'] = this.lastUpdateTime!.toUtc().toIso8601String();
    } else {
      json[r'lastUpdateTime'] = null;
    }
    json[r'path'] = this.path;
    if (this.revision != null) {
      json[r'revision'] = this.revision;
    } else {
      json[r'revision'] = null;
    }
    json[r'url'] = this.url;
    return json;
  }

  /// Returns a new [IoFluxcdToolkitSourceV1beta1GitRepositoryStatusIncludedArtifactsInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitSourceV1beta1GitRepositoryStatusIncludedArtifactsInner?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitSourceV1beta1GitRepositoryStatusIncludedArtifactsInner[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitSourceV1beta1GitRepositoryStatusIncludedArtifactsInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitSourceV1beta1GitRepositoryStatusIncludedArtifactsInner(
        checksum: mapValueOfType<String>(json, r'checksum'),
        lastUpdateTime: mapDateTime(json, r'lastUpdateTime', r''),
        path: mapValueOfType<String>(json, r'path')!,
        revision: mapValueOfType<String>(json, r'revision'),
        url: mapValueOfType<String>(json, r'url')!,
      );
    }
    return null;
  }

  static List<
          IoFluxcdToolkitSourceV1beta1GitRepositoryStatusIncludedArtifactsInner>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitSourceV1beta1GitRepositoryStatusIncludedArtifactsInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitSourceV1beta1GitRepositoryStatusIncludedArtifactsInner
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoFluxcdToolkitSourceV1beta1GitRepositoryStatusIncludedArtifactsInner>
      mapFromJson(dynamic json) {
    final map = <String,
        IoFluxcdToolkitSourceV1beta1GitRepositoryStatusIncludedArtifactsInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitSourceV1beta1GitRepositoryStatusIncludedArtifactsInner
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitSourceV1beta1GitRepositoryStatusIncludedArtifactsInner-objects as value to a dart map
  static Map<
          String,
          List<
              IoFluxcdToolkitSourceV1beta1GitRepositoryStatusIncludedArtifactsInner>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<
            IoFluxcdToolkitSourceV1beta1GitRepositoryStatusIncludedArtifactsInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitSourceV1beta1GitRepositoryStatusIncludedArtifactsInner
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
    'path',
    'url',
  };
}
