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

class IoFluxcdToolkitSourceV1beta2HelmRepositoryStatusArtifact {
  /// Returns a new [IoFluxcdToolkitSourceV1beta2HelmRepositoryStatusArtifact] instance.
  IoFluxcdToolkitSourceV1beta2HelmRepositoryStatusArtifact({
    this.digest,
    required this.lastUpdateTime,
    this.metadata = const {},
    required this.path,
    required this.revision,
    this.size,
    required this.url,
  });

  /// Digest is the digest of the file in the form of '<algorithm>:<checksum>'.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? digest;

  /// LastUpdateTime is the timestamp corresponding to the last update of the Artifact.
  DateTime lastUpdateTime;

  /// Metadata holds upstream information such as OCI annotations.
  Map<String, String> metadata;

  /// Path is the relative file path of the Artifact. It can be used to locate the file in the root of the Artifact storage on the local file system of the controller managing the Source.
  String path;

  /// Revision is a human-readable identifier traceable in the origin source system. It can be a Git commit SHA, Git tag, a Helm chart version, etc.
  String revision;

  /// Size is the number of bytes in the file.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? size;

  /// URL is the HTTP address of the Artifact as exposed by the controller managing the Source. It can be used to retrieve the Artifact for consumption, e.g. by another controller applying the Artifact contents.
  String url;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitSourceV1beta2HelmRepositoryStatusArtifact &&
          other.digest == digest &&
          other.lastUpdateTime == lastUpdateTime &&
          deepEquality.equals(other.metadata, metadata) &&
          other.path == path &&
          other.revision == revision &&
          other.size == size &&
          other.url == url;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (digest == null ? 0 : digest!.hashCode) +
      (lastUpdateTime.hashCode) +
      (metadata.hashCode) +
      (path.hashCode) +
      (revision.hashCode) +
      (size == null ? 0 : size!.hashCode) +
      (url.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitSourceV1beta2HelmRepositoryStatusArtifact[digest=$digest, lastUpdateTime=$lastUpdateTime, metadata=$metadata, path=$path, revision=$revision, size=$size, url=$url]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.digest != null) {
      json[r'digest'] = this.digest;
    } else {
      json[r'digest'] = null;
    }
    json[r'lastUpdateTime'] = this.lastUpdateTime.toUtc().toIso8601String();
    json[r'metadata'] = this.metadata;
    json[r'path'] = this.path;
    json[r'revision'] = this.revision;
    if (this.size != null) {
      json[r'size'] = this.size;
    } else {
      json[r'size'] = null;
    }
    json[r'url'] = this.url;
    return json;
  }

  /// Returns a new [IoFluxcdToolkitSourceV1beta2HelmRepositoryStatusArtifact] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitSourceV1beta2HelmRepositoryStatusArtifact? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitSourceV1beta2HelmRepositoryStatusArtifact[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitSourceV1beta2HelmRepositoryStatusArtifact[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitSourceV1beta2HelmRepositoryStatusArtifact(
        digest: mapValueOfType<String>(json, r'digest'),
        lastUpdateTime: mapDateTime(json, r'lastUpdateTime', r'')!,
        metadata: mapCastOfType<String, String>(json, r'metadata') ?? const {},
        path: mapValueOfType<String>(json, r'path')!,
        revision: mapValueOfType<String>(json, r'revision')!,
        size: mapValueOfType<int>(json, r'size'),
        url: mapValueOfType<String>(json, r'url')!,
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitSourceV1beta2HelmRepositoryStatusArtifact>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitSourceV1beta2HelmRepositoryStatusArtifact>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitSourceV1beta2HelmRepositoryStatusArtifact.fromJson(
                row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitSourceV1beta2HelmRepositoryStatusArtifact>
      mapFromJson(dynamic json) {
    final map =
        <String, IoFluxcdToolkitSourceV1beta2HelmRepositoryStatusArtifact>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitSourceV1beta2HelmRepositoryStatusArtifact.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitSourceV1beta2HelmRepositoryStatusArtifact-objects as value to a dart map
  static Map<String,
          List<IoFluxcdToolkitSourceV1beta2HelmRepositoryStatusArtifact>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoFluxcdToolkitSourceV1beta2HelmRepositoryStatusArtifact>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitSourceV1beta2HelmRepositoryStatusArtifact
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
    'lastUpdateTime',
    'path',
    'revision',
    'url',
  };
}
