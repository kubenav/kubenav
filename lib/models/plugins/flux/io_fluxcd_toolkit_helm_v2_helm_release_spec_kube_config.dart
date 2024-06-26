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

import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_helm_v2_helm_release_spec_kube_config_secret_ref.dart';

class IoFluxcdToolkitHelmV2HelmReleaseSpecKubeConfig {
  /// Returns a new [IoFluxcdToolkitHelmV2HelmReleaseSpecKubeConfig] instance.
  IoFluxcdToolkitHelmV2HelmReleaseSpecKubeConfig({
    required this.secretRef,
  });

  IoFluxcdToolkitHelmV2HelmReleaseSpecKubeConfigSecretRef secretRef;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitHelmV2HelmReleaseSpecKubeConfig &&
          other.secretRef == secretRef;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (secretRef.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitHelmV2HelmReleaseSpecKubeConfig[secretRef=$secretRef]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'secretRef'] = this.secretRef;
    return json;
  }

  /// Returns a new [IoFluxcdToolkitHelmV2HelmReleaseSpecKubeConfig] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitHelmV2HelmReleaseSpecKubeConfig? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitHelmV2HelmReleaseSpecKubeConfig[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitHelmV2HelmReleaseSpecKubeConfig[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitHelmV2HelmReleaseSpecKubeConfig(
        secretRef:
            IoFluxcdToolkitHelmV2HelmReleaseSpecKubeConfigSecretRef.fromJson(
                json[r'secretRef'])!,
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitHelmV2HelmReleaseSpecKubeConfig> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitHelmV2HelmReleaseSpecKubeConfig>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitHelmV2HelmReleaseSpecKubeConfig.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitHelmV2HelmReleaseSpecKubeConfig>
      mapFromJson(dynamic json) {
    final map = <String, IoFluxcdToolkitHelmV2HelmReleaseSpecKubeConfig>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoFluxcdToolkitHelmV2HelmReleaseSpecKubeConfig.fromJson(
            entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitHelmV2HelmReleaseSpecKubeConfig-objects as value to a dart map
  static Map<String, List<IoFluxcdToolkitHelmV2HelmReleaseSpecKubeConfig>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoFluxcdToolkitHelmV2HelmReleaseSpecKubeConfig>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitHelmV2HelmReleaseSpecKubeConfig.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'secretRef',
  };
}
