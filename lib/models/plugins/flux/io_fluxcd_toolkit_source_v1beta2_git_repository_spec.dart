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
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1_git_repository_spec_include_inner.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1_git_repository_spec_ref.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1_git_repository_spec_secret_ref.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1_helm_repository_spec_access_from.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1beta2_git_repository_spec_verify.dart';

class IoFluxcdToolkitSourceV1beta2GitRepositorySpec {
  /// Returns a new [IoFluxcdToolkitSourceV1beta2GitRepositorySpec] instance.
  IoFluxcdToolkitSourceV1beta2GitRepositorySpec({
    this.accessFrom,
    this.gitImplementation,
    this.ignore,
    this.include = const [],
    required this.interval,
    this.recurseSubmodules,
    this.ref,
    this.secretRef,
    this.suspend,
    this.timeout,
    required this.url,
    this.verify,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitSourceV1HelmRepositorySpecAccessFrom? accessFrom;

  /// GitImplementation specifies which Git client library implementation to use. Defaults to 'go-git', valid values are ('go-git', 'libgit2'). Deprecated: gitImplementation is deprecated now that 'go-git' is the only supported implementation.
  IoFluxcdToolkitSourceV1beta2GitRepositorySpecGitImplementationEnum?
      gitImplementation;

  /// Ignore overrides the set of excluded patterns in the .sourceignore format (which is the same as .gitignore). If not provided, a default will be used, consult the documentation for your version to find out what those are.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? ignore;

  /// Include specifies a list of GitRepository resources which Artifacts should be included in the Artifact produced for this GitRepository.
  List<IoFluxcdToolkitSourceV1GitRepositorySpecIncludeInner> include;

  /// Interval at which to check the GitRepository for updates.
  String interval;

  /// RecurseSubmodules enables the initialization of all submodules within the GitRepository as cloned from the URL, using their default settings.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? recurseSubmodules;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitSourceV1GitRepositorySpecRef? ref;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitSourceV1GitRepositorySpecSecretRef? secretRef;

  /// Suspend tells the controller to suspend the reconciliation of this GitRepository.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? suspend;

  /// Timeout for Git operations like cloning, defaults to 60s.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? timeout;

  /// URL specifies the Git repository URL, it can be an HTTP/S or SSH address.
  String url;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitSourceV1beta2GitRepositorySpecVerify? verify;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitSourceV1beta2GitRepositorySpec &&
          other.accessFrom == accessFrom &&
          other.gitImplementation == gitImplementation &&
          other.ignore == ignore &&
          deepEquality.equals(other.include, include) &&
          other.interval == interval &&
          other.recurseSubmodules == recurseSubmodules &&
          other.ref == ref &&
          other.secretRef == secretRef &&
          other.suspend == suspend &&
          other.timeout == timeout &&
          other.url == url &&
          other.verify == verify;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (accessFrom == null ? 0 : accessFrom!.hashCode) +
      (gitImplementation == null ? 0 : gitImplementation!.hashCode) +
      (ignore == null ? 0 : ignore!.hashCode) +
      (include.hashCode) +
      (interval.hashCode) +
      (recurseSubmodules == null ? 0 : recurseSubmodules!.hashCode) +
      (ref == null ? 0 : ref!.hashCode) +
      (secretRef == null ? 0 : secretRef!.hashCode) +
      (suspend == null ? 0 : suspend!.hashCode) +
      (timeout == null ? 0 : timeout!.hashCode) +
      (url.hashCode) +
      (verify == null ? 0 : verify!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitSourceV1beta2GitRepositorySpec[accessFrom=$accessFrom, gitImplementation=$gitImplementation, ignore=$ignore, include=$include, interval=$interval, recurseSubmodules=$recurseSubmodules, ref=$ref, secretRef=$secretRef, suspend=$suspend, timeout=$timeout, url=$url, verify=$verify]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.accessFrom != null) {
      json[r'accessFrom'] = this.accessFrom;
    } else {
      json[r'accessFrom'] = null;
    }
    if (this.gitImplementation != null) {
      json[r'gitImplementation'] = this.gitImplementation;
    } else {
      json[r'gitImplementation'] = null;
    }
    if (this.ignore != null) {
      json[r'ignore'] = this.ignore;
    } else {
      json[r'ignore'] = null;
    }
    json[r'include'] = this.include;
    json[r'interval'] = this.interval;
    if (this.recurseSubmodules != null) {
      json[r'recurseSubmodules'] = this.recurseSubmodules;
    } else {
      json[r'recurseSubmodules'] = null;
    }
    if (this.ref != null) {
      json[r'ref'] = this.ref;
    } else {
      json[r'ref'] = null;
    }
    if (this.secretRef != null) {
      json[r'secretRef'] = this.secretRef;
    } else {
      json[r'secretRef'] = null;
    }
    if (this.suspend != null) {
      json[r'suspend'] = this.suspend;
    } else {
      json[r'suspend'] = null;
    }
    if (this.timeout != null) {
      json[r'timeout'] = this.timeout;
    } else {
      json[r'timeout'] = null;
    }
    json[r'url'] = this.url;
    if (this.verify != null) {
      json[r'verify'] = this.verify;
    } else {
      json[r'verify'] = null;
    }
    return json;
  }

  /// Returns a new [IoFluxcdToolkitSourceV1beta2GitRepositorySpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitSourceV1beta2GitRepositorySpec? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitSourceV1beta2GitRepositorySpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitSourceV1beta2GitRepositorySpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitSourceV1beta2GitRepositorySpec(
        accessFrom:
            IoFluxcdToolkitSourceV1HelmRepositorySpecAccessFrom.fromJson(
                json[r'accessFrom']),
        gitImplementation:
            IoFluxcdToolkitSourceV1beta2GitRepositorySpecGitImplementationEnum
                .fromJson(json[r'gitImplementation']),
        ignore: mapValueOfType<String>(json, r'ignore'),
        include:
            IoFluxcdToolkitSourceV1GitRepositorySpecIncludeInner.listFromJson(
                json[r'include']),
        interval: mapValueOfType<String>(json, r'interval')!,
        recurseSubmodules: mapValueOfType<bool>(json, r'recurseSubmodules'),
        ref: IoFluxcdToolkitSourceV1GitRepositorySpecRef.fromJson(json[r'ref']),
        secretRef: IoFluxcdToolkitSourceV1GitRepositorySpecSecretRef.fromJson(
            json[r'secretRef']),
        suspend: mapValueOfType<bool>(json, r'suspend'),
        timeout: mapValueOfType<String>(json, r'timeout'),
        url: mapValueOfType<String>(json, r'url')!,
        verify: IoFluxcdToolkitSourceV1beta2GitRepositorySpecVerify.fromJson(
            json[r'verify']),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitSourceV1beta2GitRepositorySpec> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitSourceV1beta2GitRepositorySpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitSourceV1beta2GitRepositorySpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitSourceV1beta2GitRepositorySpec> mapFromJson(
      dynamic json) {
    final map = <String, IoFluxcdToolkitSourceV1beta2GitRepositorySpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitSourceV1beta2GitRepositorySpec.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitSourceV1beta2GitRepositorySpec-objects as value to a dart map
  static Map<String, List<IoFluxcdToolkitSourceV1beta2GitRepositorySpec>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoFluxcdToolkitSourceV1beta2GitRepositorySpec>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitSourceV1beta2GitRepositorySpec.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'interval',
    'url',
  };
}

/// GitImplementation specifies which Git client library implementation to use. Defaults to 'go-git', valid values are ('go-git', 'libgit2'). Deprecated: gitImplementation is deprecated now that 'go-git' is the only supported implementation.
class IoFluxcdToolkitSourceV1beta2GitRepositorySpecGitImplementationEnum {
  /// Instantiate a new enum with the provided [value].
  const IoFluxcdToolkitSourceV1beta2GitRepositorySpecGitImplementationEnum._(
      this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const goGit =
      IoFluxcdToolkitSourceV1beta2GitRepositorySpecGitImplementationEnum._(
          r'go-git');
  static const libgit2 =
      IoFluxcdToolkitSourceV1beta2GitRepositorySpecGitImplementationEnum._(
          r'libgit2');

  /// List of all possible values in this [enum][IoFluxcdToolkitSourceV1beta2GitRepositorySpecGitImplementationEnum].
  static const values =
      <IoFluxcdToolkitSourceV1beta2GitRepositorySpecGitImplementationEnum>[
    goGit,
    libgit2,
  ];

  static IoFluxcdToolkitSourceV1beta2GitRepositorySpecGitImplementationEnum?
      fromJson(dynamic value) =>
          IoFluxcdToolkitSourceV1beta2GitRepositorySpecGitImplementationEnumTypeTransformer()
              .decode(value);

  static List<
          IoFluxcdToolkitSourceV1beta2GitRepositorySpecGitImplementationEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitSourceV1beta2GitRepositorySpecGitImplementationEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitSourceV1beta2GitRepositorySpecGitImplementationEnum
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoFluxcdToolkitSourceV1beta2GitRepositorySpecGitImplementationEnum] to String,
/// and [decode] dynamic data back to [IoFluxcdToolkitSourceV1beta2GitRepositorySpecGitImplementationEnum].
class IoFluxcdToolkitSourceV1beta2GitRepositorySpecGitImplementationEnumTypeTransformer {
  factory IoFluxcdToolkitSourceV1beta2GitRepositorySpecGitImplementationEnumTypeTransformer() =>
      _instance ??=
          const IoFluxcdToolkitSourceV1beta2GitRepositorySpecGitImplementationEnumTypeTransformer
              ._();

  const IoFluxcdToolkitSourceV1beta2GitRepositorySpecGitImplementationEnumTypeTransformer._();

  String encode(
          IoFluxcdToolkitSourceV1beta2GitRepositorySpecGitImplementationEnum
              data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoFluxcdToolkitSourceV1beta2GitRepositorySpecGitImplementationEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoFluxcdToolkitSourceV1beta2GitRepositorySpecGitImplementationEnum? decode(
      dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'go-git':
          return IoFluxcdToolkitSourceV1beta2GitRepositorySpecGitImplementationEnum
              .goGit;
        case r'libgit2':
          return IoFluxcdToolkitSourceV1beta2GitRepositorySpecGitImplementationEnum
              .libgit2;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoFluxcdToolkitSourceV1beta2GitRepositorySpecGitImplementationEnumTypeTransformer] instance.
  static IoFluxcdToolkitSourceV1beta2GitRepositorySpecGitImplementationEnumTypeTransformer?
      _instance;
}
