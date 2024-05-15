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
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_acme_v1_challenge_spec_solver_http01_ingress_ingress_template.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_acme_v1_challenge_spec_solver_http01_ingress_pod_template.dart';

class IoCertManagerAcmeV1ChallengeSpecSolverHttp01Ingress {
  /// Returns a new [IoCertManagerAcmeV1ChallengeSpecSolverHttp01Ingress] instance.
  IoCertManagerAcmeV1ChallengeSpecSolverHttp01Ingress({
    this.class_,
    this.ingressClassName,
    this.ingressTemplate,
    this.name,
    this.podTemplate,
    this.serviceType,
  });

  /// This field configures the annotation `kubernetes.io/ingress.class` when creating Ingress resources to solve ACME challenges that use this challenge solver. Only one of `class`, `name` or `ingressClassName` may be specified.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? class_;

  /// This field configures the field `ingressClassName` on the created Ingress resources used to solve ACME challenges that use this challenge solver. This is the recommended way of configuring the ingress class. Only one of `class`, `name` or `ingressClassName` may be specified.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? ingressClassName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressIngressTemplate?
      ingressTemplate;

  /// The name of the ingress resource that should have ACME challenge solving routes inserted into it in order to solve HTTP01 challenges. This is typically used in conjunction with ingress controllers like ingress-gce, which maintains a 1:1 mapping between external IPs and ingress resources. Only one of `class`, `name` or `ingressClassName` may be specified.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplate? podTemplate;

  /// Optional service type for Kubernetes solver service. Supported values are NodePort or ClusterIP. If unset, defaults to NodePort.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? serviceType;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerAcmeV1ChallengeSpecSolverHttp01Ingress &&
          other.class_ == class_ &&
          other.ingressClassName == ingressClassName &&
          other.ingressTemplate == ingressTemplate &&
          other.name == name &&
          other.podTemplate == podTemplate &&
          other.serviceType == serviceType;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (class_ == null ? 0 : class_!.hashCode) +
      (ingressClassName == null ? 0 : ingressClassName!.hashCode) +
      (ingressTemplate == null ? 0 : ingressTemplate!.hashCode) +
      (name == null ? 0 : name!.hashCode) +
      (podTemplate == null ? 0 : podTemplate!.hashCode) +
      (serviceType == null ? 0 : serviceType!.hashCode);

  @override
  String toString() =>
      'IoCertManagerAcmeV1ChallengeSpecSolverHttp01Ingress[class_=$class_, ingressClassName=$ingressClassName, ingressTemplate=$ingressTemplate, name=$name, podTemplate=$podTemplate, serviceType=$serviceType]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.class_ != null) {
      json[r'class'] = this.class_;
    } else {
      json[r'class'] = null;
    }
    if (this.ingressClassName != null) {
      json[r'ingressClassName'] = this.ingressClassName;
    } else {
      json[r'ingressClassName'] = null;
    }
    if (this.ingressTemplate != null) {
      json[r'ingressTemplate'] = this.ingressTemplate;
    } else {
      json[r'ingressTemplate'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.podTemplate != null) {
      json[r'podTemplate'] = this.podTemplate;
    } else {
      json[r'podTemplate'] = null;
    }
    if (this.serviceType != null) {
      json[r'serviceType'] = this.serviceType;
    } else {
      json[r'serviceType'] = null;
    }
    return json;
  }

  /// Returns a new [IoCertManagerAcmeV1ChallengeSpecSolverHttp01Ingress] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerAcmeV1ChallengeSpecSolverHttp01Ingress? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerAcmeV1ChallengeSpecSolverHttp01Ingress[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerAcmeV1ChallengeSpecSolverHttp01Ingress[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerAcmeV1ChallengeSpecSolverHttp01Ingress(
        class_: mapValueOfType<String>(json, r'class'),
        ingressClassName: mapValueOfType<String>(json, r'ingressClassName'),
        ingressTemplate:
            IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressIngressTemplate
                .fromJson(json[r'ingressTemplate']),
        name: mapValueOfType<String>(json, r'name'),
        podTemplate:
            IoCertManagerAcmeV1ChallengeSpecSolverHttp01IngressPodTemplate
                .fromJson(json[r'podTemplate']),
        serviceType: mapValueOfType<String>(json, r'serviceType'),
      );
    }
    return null;
  }

  static List<IoCertManagerAcmeV1ChallengeSpecSolverHttp01Ingress> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoCertManagerAcmeV1ChallengeSpecSolverHttp01Ingress>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoCertManagerAcmeV1ChallengeSpecSolverHttp01Ingress.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoCertManagerAcmeV1ChallengeSpecSolverHttp01Ingress>
      mapFromJson(dynamic json) {
    final map = <String, IoCertManagerAcmeV1ChallengeSpecSolverHttp01Ingress>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoCertManagerAcmeV1ChallengeSpecSolverHttp01Ingress.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerAcmeV1ChallengeSpecSolverHttp01Ingress-objects as value to a dart map
  static Map<String, List<IoCertManagerAcmeV1ChallengeSpecSolverHttp01Ingress>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoCertManagerAcmeV1ChallengeSpecSolverHttp01Ingress>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoCertManagerAcmeV1ChallengeSpecSolverHttp01Ingress.listFromJson(
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
