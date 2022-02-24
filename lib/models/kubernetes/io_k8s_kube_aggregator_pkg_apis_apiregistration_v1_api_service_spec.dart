//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceSpec {
  /// Returns a new [IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceSpec] instance.
  IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceSpec({
    this.caBundle,
    this.group,
    required this.groupPriorityMinimum,
    this.insecureSkipTLSVerify,
    this.service,
    this.version,
    required this.versionPriority,
  });

  /// CABundle is a PEM encoded CA bundle which will be used to validate an API server's serving certificate. If unspecified, system trust roots on the apiserver are used.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? caBundle;

  /// Group is the API group name this server hosts
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? group;

  /// GroupPriorityMininum is the priority this group should have at least. Higher priority means that the group is preferred by clients over lower priority ones. Note that other versions of this group might specify even higher GroupPriorityMininum values such that the whole group gets a higher priority. The primary sort is based on GroupPriorityMinimum, ordered highest number to lowest (20 before 10). The secondary sort is based on the alphabetical comparison of the name of the object.  (v1.bar before v1.foo) We'd recommend something like: *.k8s.io (except extensions) at 18000 and PaaSes (OpenShift, Deis) are recommended to be in the 2000s
  int groupPriorityMinimum;

  /// InsecureSkipTLSVerify disables TLS certificate verification when communicating with this server. This is strongly discouraged.  You should use the CABundle instead.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? insecureSkipTLSVerify;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sKubeAggregatorPkgApisApiregistrationV1ServiceReference? service;

  /// Version is the API version this server hosts.  For example, \"v1\"
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? version;

  /// VersionPriority controls the ordering of this API version inside of its group.  Must be greater than zero. The primary sort is based on VersionPriority, ordered highest to lowest (20 before 10). Since it's inside of a group, the number can be small, probably in the 10s. In case of equal version priorities, the version string will be used to compute the order inside a group. If the version string is \"kube-like\", it will sort above non \"kube-like\" version strings, which are ordered lexicographically. \"Kube-like\" versions start with a \"v\", then are followed by a number (the major version), then optionally the string \"alpha\" or \"beta\" and another number (the minor version). These are sorted first by GA > beta > alpha (where GA is a version with no suffix such as beta or alpha), and then by comparing major version, then minor version. An example sorted list of versions: v10, v2, v1, v11beta2, v10beta3, v3beta1, v12alpha1, v11alpha2, foo1, foo10.
  int versionPriority;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceSpec &&
          other.caBundle == caBundle &&
          other.group == group &&
          other.groupPriorityMinimum == groupPriorityMinimum &&
          other.insecureSkipTLSVerify == insecureSkipTLSVerify &&
          other.service == service &&
          other.version == version &&
          other.versionPriority == versionPriority;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (caBundle == null ? 0 : caBundle!.hashCode) +
      (group == null ? 0 : group!.hashCode) +
      (groupPriorityMinimum.hashCode) +
      (insecureSkipTLSVerify == null ? 0 : insecureSkipTLSVerify!.hashCode) +
      (service == null ? 0 : service!.hashCode) +
      (version == null ? 0 : version!.hashCode) +
      (versionPriority.hashCode);

  @override
  String toString() =>
      'IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceSpec[caBundle=$caBundle, group=$group, groupPriorityMinimum=$groupPriorityMinimum, insecureSkipTLSVerify=$insecureSkipTLSVerify, service=$service, version=$version, versionPriority=$versionPriority]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (caBundle != null) {
      json[r'caBundle'] = caBundle;
    }
    if (group != null) {
      json[r'group'] = group;
    }
    json[r'groupPriorityMinimum'] = groupPriorityMinimum;
    if (insecureSkipTLSVerify != null) {
      json[r'insecureSkipTLSVerify'] = insecureSkipTLSVerify;
    }
    if (service != null) {
      json[r'service'] = service;
    }
    if (version != null) {
      json[r'version'] = version;
    }
    json[r'versionPriority'] = versionPriority;
    return json;
  }

  /// Returns a new [IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceSpec? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceSpec(
        caBundle: mapValueOfType<String>(json, r'caBundle'),
        group: mapValueOfType<String>(json, r'group'),
        groupPriorityMinimum:
            mapValueOfType<int>(json, r'groupPriorityMinimum')!,
        insecureSkipTLSVerify:
            mapValueOfType<bool>(json, r'insecureSkipTLSVerify'),
        service: IoK8sKubeAggregatorPkgApisApiregistrationV1ServiceReference
            .fromJson(json[r'service']),
        version: mapValueOfType<String>(json, r'version'),
        versionPriority: mapValueOfType<int>(json, r'versionPriority')!,
      );
    }
    return null;
  }

  static List<IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceSpec>?
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceSpec.fromJson(
                row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceSpec>
      mapFromJson(dynamic json) {
    final map =
        <String, IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceSpec.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceSpec-objects as value to a dart map
  static Map<String,
          List<IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceSpec>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String,
        List<IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceSpec>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sKubeAggregatorPkgApisApiregistrationV1APIServiceSpec
            .listFromJson(
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
  static const requiredKeys = <String>{
    'groupPriorityMinimum',
    'versionPriority',
  };
}
