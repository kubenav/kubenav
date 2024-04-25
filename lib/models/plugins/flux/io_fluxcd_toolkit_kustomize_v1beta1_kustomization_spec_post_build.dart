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
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_kustomize_v1beta1_kustomization_spec_post_build_substitute_from_inner.dart';

class IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuild {
  /// Returns a new [IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuild] instance.
  IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuild({
    this.substitute = const {},
    this.substituteFrom = const [],
  });

  /// Substitute holds a map of key/value pairs. The variables defined in your YAML manifests that match any of the keys defined in the map will be substituted with the set value. Includes support for bash string replacement functions e.g. ${var:=default}, ${var:position} and ${var/substring/replacement}.
  Map<String, String> substitute;

  /// SubstituteFrom holds references to ConfigMaps and Secrets containing the variables and their values to be substituted in the YAML manifests. The ConfigMap and the Secret data keys represent the var names and they must match the vars declared in the manifests for the substitution to happen.
  List<IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInner>
      substituteFrom;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuild &&
          deepEquality.equals(other.substitute, substitute) &&
          deepEquality.equals(other.substituteFrom, substituteFrom);

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (substitute.hashCode) + (substituteFrom.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuild[substitute=$substitute, substituteFrom=$substituteFrom]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'substitute'] = this.substitute;
    json[r'substituteFrom'] = this.substituteFrom;
    return json;
  }

  /// Returns a new [IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuild] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuild? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuild[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuild[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuild(
        substitute:
            mapCastOfType<String, String>(json, r'substitute') ?? const {},
        substituteFrom:
            IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuildSubstituteFromInner
                .listFromJson(json[r'substituteFrom']),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuild>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuild>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuild.fromJson(
                row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuild>
      mapFromJson(dynamic json) {
    final map =
        <String, IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuild>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuild.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuild-objects as value to a dart map
  static Map<String,
          List<IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuild>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuild>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitKustomizeV1beta1KustomizationSpecPostBuild
                .listFromJson(
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
