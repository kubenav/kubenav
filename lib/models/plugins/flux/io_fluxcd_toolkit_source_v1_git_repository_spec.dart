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
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1_git_repository_spec_proxy_secret_ref.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1_git_repository_spec_ref.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1_git_repository_spec_secret_ref.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_source_v1_git_repository_spec_verify.dart';

class IoFluxcdToolkitSourceV1GitRepositorySpec {
  /// Returns a new [IoFluxcdToolkitSourceV1GitRepositorySpec] instance.
  IoFluxcdToolkitSourceV1GitRepositorySpec({
    this.ignore,
    this.include = const [],
    required this.interval,
    this.proxySecretRef,
    this.recurseSubmodules,
    this.ref,
    this.secretRef,
    this.suspend,
    this.timeout,
    required this.url,
    this.verify,
  });

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

  /// Interval at which the GitRepository URL is checked for updates. This interval is approximate and may be subject to jitter to ensure efficient use of resources.
  String interval;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitSourceV1GitRepositorySpecProxySecretRef? proxySecretRef;

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
  IoFluxcdToolkitSourceV1GitRepositorySpecVerify? verify;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitSourceV1GitRepositorySpec &&
          other.ignore == ignore &&
          deepEquality.equals(other.include, include) &&
          other.interval == interval &&
          other.proxySecretRef == proxySecretRef &&
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
      (ignore == null ? 0 : ignore!.hashCode) +
      (include.hashCode) +
      (interval.hashCode) +
      (proxySecretRef == null ? 0 : proxySecretRef!.hashCode) +
      (recurseSubmodules == null ? 0 : recurseSubmodules!.hashCode) +
      (ref == null ? 0 : ref!.hashCode) +
      (secretRef == null ? 0 : secretRef!.hashCode) +
      (suspend == null ? 0 : suspend!.hashCode) +
      (timeout == null ? 0 : timeout!.hashCode) +
      (url.hashCode) +
      (verify == null ? 0 : verify!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitSourceV1GitRepositorySpec[ignore=$ignore, include=$include, interval=$interval, proxySecretRef=$proxySecretRef, recurseSubmodules=$recurseSubmodules, ref=$ref, secretRef=$secretRef, suspend=$suspend, timeout=$timeout, url=$url, verify=$verify]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.ignore != null) {
      json[r'ignore'] = this.ignore;
    } else {
      json[r'ignore'] = null;
    }
    json[r'include'] = this.include;
    json[r'interval'] = this.interval;
    if (this.proxySecretRef != null) {
      json[r'proxySecretRef'] = this.proxySecretRef;
    } else {
      json[r'proxySecretRef'] = null;
    }
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

  /// Returns a new [IoFluxcdToolkitSourceV1GitRepositorySpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitSourceV1GitRepositorySpec? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitSourceV1GitRepositorySpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitSourceV1GitRepositorySpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitSourceV1GitRepositorySpec(
        ignore: mapValueOfType<String>(json, r'ignore'),
        include:
            IoFluxcdToolkitSourceV1GitRepositorySpecIncludeInner.listFromJson(
                json[r'include']),
        interval: mapValueOfType<String>(json, r'interval')!,
        proxySecretRef:
            IoFluxcdToolkitSourceV1GitRepositorySpecProxySecretRef.fromJson(
                json[r'proxySecretRef']),
        recurseSubmodules: mapValueOfType<bool>(json, r'recurseSubmodules'),
        ref: IoFluxcdToolkitSourceV1GitRepositorySpecRef.fromJson(json[r'ref']),
        secretRef: IoFluxcdToolkitSourceV1GitRepositorySpecSecretRef.fromJson(
            json[r'secretRef']),
        suspend: mapValueOfType<bool>(json, r'suspend'),
        timeout: mapValueOfType<String>(json, r'timeout'),
        url: mapValueOfType<String>(json, r'url')!,
        verify: IoFluxcdToolkitSourceV1GitRepositorySpecVerify.fromJson(
            json[r'verify']),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitSourceV1GitRepositorySpec> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitSourceV1GitRepositorySpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoFluxcdToolkitSourceV1GitRepositorySpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitSourceV1GitRepositorySpec> mapFromJson(
      dynamic json) {
    final map = <String, IoFluxcdToolkitSourceV1GitRepositorySpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitSourceV1GitRepositorySpec.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitSourceV1GitRepositorySpec-objects as value to a dart map
  static Map<String, List<IoFluxcdToolkitSourceV1GitRepositorySpec>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoFluxcdToolkitSourceV1GitRepositorySpec>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IoFluxcdToolkitSourceV1GitRepositorySpec.listFromJson(
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
