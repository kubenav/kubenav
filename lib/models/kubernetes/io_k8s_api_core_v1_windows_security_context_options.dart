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

class IoK8sApiCoreV1WindowsSecurityContextOptions {
  /// Returns a new [IoK8sApiCoreV1WindowsSecurityContextOptions] instance.
  IoK8sApiCoreV1WindowsSecurityContextOptions({
    this.gmsaCredentialSpec,
    this.gmsaCredentialSpecName,
    this.hostProcess,
    this.runAsUserName,
  });

  /// GMSACredentialSpec is where the GMSA admission webhook (https://github.com/kubernetes-sigs/windows-gmsa) inlines the contents of the GMSA credential spec named by the GMSACredentialSpecName field.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? gmsaCredentialSpec;

  /// GMSACredentialSpecName is the name of the GMSA credential spec to use.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? gmsaCredentialSpecName;

  /// HostProcess determines if a container should be run as a 'Host Process' container. This field is alpha-level and will only be honored by components that enable the WindowsHostProcessContainers feature flag. Setting this field without the feature flag will result in errors when validating the Pod. All of a Pod's containers must have the same effective HostProcess value (it is not allowed to have a mix of HostProcess containers and non-HostProcess containers).  In addition, if HostProcess is true then HostNetwork must also be set to true.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? hostProcess;

  /// The UserName in Windows to run the entrypoint of the container process. Defaults to the user specified in image metadata if unspecified. May also be set in PodSecurityContext. If set in both SecurityContext and PodSecurityContext, the value specified in SecurityContext takes precedence.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? runAsUserName;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1WindowsSecurityContextOptions &&
          other.gmsaCredentialSpec == gmsaCredentialSpec &&
          other.gmsaCredentialSpecName == gmsaCredentialSpecName &&
          other.hostProcess == hostProcess &&
          other.runAsUserName == runAsUserName;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (gmsaCredentialSpec == null ? 0 : gmsaCredentialSpec!.hashCode) +
      (gmsaCredentialSpecName == null ? 0 : gmsaCredentialSpecName!.hashCode) +
      (hostProcess == null ? 0 : hostProcess!.hashCode) +
      (runAsUserName == null ? 0 : runAsUserName!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1WindowsSecurityContextOptions[gmsaCredentialSpec=$gmsaCredentialSpec, gmsaCredentialSpecName=$gmsaCredentialSpecName, hostProcess=$hostProcess, runAsUserName=$runAsUserName]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.gmsaCredentialSpec != null) {
      json[r'gmsaCredentialSpec'] = this.gmsaCredentialSpec;
    } else {
      json[r'gmsaCredentialSpec'] = null;
    }
    if (this.gmsaCredentialSpecName != null) {
      json[r'gmsaCredentialSpecName'] = this.gmsaCredentialSpecName;
    } else {
      json[r'gmsaCredentialSpecName'] = null;
    }
    if (this.hostProcess != null) {
      json[r'hostProcess'] = this.hostProcess;
    } else {
      json[r'hostProcess'] = null;
    }
    if (this.runAsUserName != null) {
      json[r'runAsUserName'] = this.runAsUserName;
    } else {
      json[r'runAsUserName'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1WindowsSecurityContextOptions] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1WindowsSecurityContextOptions? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1WindowsSecurityContextOptions[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1WindowsSecurityContextOptions[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1WindowsSecurityContextOptions(
        gmsaCredentialSpec: mapValueOfType<String>(json, r'gmsaCredentialSpec'),
        gmsaCredentialSpecName:
            mapValueOfType<String>(json, r'gmsaCredentialSpecName'),
        hostProcess: mapValueOfType<bool>(json, r'hostProcess'),
        runAsUserName: mapValueOfType<String>(json, r'runAsUserName'),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1WindowsSecurityContextOptions>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1WindowsSecurityContextOptions>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1WindowsSecurityContextOptions.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1WindowsSecurityContextOptions> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiCoreV1WindowsSecurityContextOptions>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiCoreV1WindowsSecurityContextOptions.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1WindowsSecurityContextOptions-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1WindowsSecurityContextOptions>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1WindowsSecurityContextOptions>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1WindowsSecurityContextOptions.listFromJson(
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
