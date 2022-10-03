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
import 'package:kubenav/models/kubernetes/io_k8s_api_admissionregistration_v1_rule_with_operations.dart';
import 'package:kubenav/models/kubernetes/io_k8s_api_admissionregistration_v1_webhook_client_config.dart';
import 'package:kubenav/models/kubernetes/io_k8s_apimachinery_pkg_apis_meta_v1_label_selector.dart';

class IoK8sApiAdmissionregistrationV1MutatingWebhook {
  /// Returns a new [IoK8sApiAdmissionregistrationV1MutatingWebhook] instance.
  IoK8sApiAdmissionregistrationV1MutatingWebhook({
    this.admissionReviewVersions = const [],
    required this.clientConfig,
    this.failurePolicy,
    this.matchPolicy,
    required this.name,
    this.namespaceSelector,
    this.objectSelector,
    this.reinvocationPolicy,
    this.rules = const [],
    required this.sideEffects,
    this.timeoutSeconds,
  });

  /// AdmissionReviewVersions is an ordered list of preferred `AdmissionReview` versions the Webhook expects. API server will try to use first version in the list which it supports. If none of the versions specified in this list supported by API server, validation will fail for this object. If a persisted webhook configuration specifies allowed versions and does not include any versions known to the API Server, calls to the webhook will fail and be subject to the failure policy.
  List<String> admissionReviewVersions;

  IoK8sApiAdmissionregistrationV1WebhookClientConfig clientConfig;

  /// FailurePolicy defines how unrecognized errors from the admission endpoint are handled - allowed values are Ignore or Fail. Defaults to Fail.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? failurePolicy;

  /// matchPolicy defines how the \"rules\" list is used to match incoming requests. Allowed values are \"Exact\" or \"Equivalent\".  - Exact: match a request only if it exactly matches a specified rule. For example, if deployments can be modified via apps/v1, apps/v1beta1, and extensions/v1beta1, but \"rules\" only included `apiGroups:[\"apps\"], apiVersions:[\"v1\"], resources: [\"deployments\"]`, a request to apps/v1beta1 or extensions/v1beta1 would not be sent to the webhook.  - Equivalent: match a request if modifies a resource listed in rules, even via another API group or version. For example, if deployments can be modified via apps/v1, apps/v1beta1, and extensions/v1beta1, and \"rules\" only included `apiGroups:[\"apps\"], apiVersions:[\"v1\"], resources: [\"deployments\"]`, a request to apps/v1beta1 or extensions/v1beta1 would be converted to apps/v1 and sent to the webhook.  Defaults to \"Equivalent\"
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? matchPolicy;

  /// The name of the admission webhook. Name should be fully qualified, e.g., imagepolicy.kubernetes.io, where \"imagepolicy\" is the name of the webhook, and kubernetes.io is the name of the organization. Required.
  String name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApimachineryPkgApisMetaV1LabelSelector? namespaceSelector;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApimachineryPkgApisMetaV1LabelSelector? objectSelector;

  /// reinvocationPolicy indicates whether this webhook should be called multiple times as part of a single admission evaluation. Allowed values are \"Never\" and \"IfNeeded\".  Never: the webhook will not be called more than once in a single admission evaluation.  IfNeeded: the webhook will be called at least one additional time as part of the admission evaluation if the object being admitted is modified by other admission plugins after the initial webhook call. Webhooks that specify this option *must* be idempotent, able to process objects they previously admitted. Note: * the number of additional invocations is not guaranteed to be exactly one. * if additional invocations result in further modifications to the object, webhooks are not guaranteed to be invoked again. * webhooks that use this option may be reordered to minimize the number of additional invocations. * to validate an object after all mutations are guaranteed complete, use a validating admission webhook instead.  Defaults to \"Never\".
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? reinvocationPolicy;

  /// Rules describes what operations on what resources/subresources the webhook cares about. The webhook cares about an operation if it matches _any_ Rule. However, in order to prevent ValidatingAdmissionWebhooks and MutatingAdmissionWebhooks from putting the cluster in a state which cannot be recovered from without completely disabling the plugin, ValidatingAdmissionWebhooks and MutatingAdmissionWebhooks are never called on admission requests for ValidatingWebhookConfiguration and MutatingWebhookConfiguration objects.
  List<IoK8sApiAdmissionregistrationV1RuleWithOperations> rules;

  /// SideEffects states whether this webhook has side effects. Acceptable values are: None, NoneOnDryRun (webhooks created via v1beta1 may also specify Some or Unknown). Webhooks with side effects MUST implement a reconciliation system, since a request may be rejected by a future step in the admission chain and the side effects therefore need to be undone. Requests with the dryRun attribute will be auto-rejected if they match a webhook with sideEffects == Unknown or Some.
  String sideEffects;

  /// TimeoutSeconds specifies the timeout for this webhook. After the timeout passes, the webhook call will be ignored or the API call will fail based on the failure policy. The timeout value must be between 1 and 30 seconds. Default to 10 seconds.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? timeoutSeconds;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiAdmissionregistrationV1MutatingWebhook &&
          other.admissionReviewVersions == admissionReviewVersions &&
          other.clientConfig == clientConfig &&
          other.failurePolicy == failurePolicy &&
          other.matchPolicy == matchPolicy &&
          other.name == name &&
          other.namespaceSelector == namespaceSelector &&
          other.objectSelector == objectSelector &&
          other.reinvocationPolicy == reinvocationPolicy &&
          other.rules == rules &&
          other.sideEffects == sideEffects &&
          other.timeoutSeconds == timeoutSeconds;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (admissionReviewVersions.hashCode) +
      (clientConfig.hashCode) +
      (failurePolicy == null ? 0 : failurePolicy!.hashCode) +
      (matchPolicy == null ? 0 : matchPolicy!.hashCode) +
      (name.hashCode) +
      (namespaceSelector == null ? 0 : namespaceSelector!.hashCode) +
      (objectSelector == null ? 0 : objectSelector!.hashCode) +
      (reinvocationPolicy == null ? 0 : reinvocationPolicy!.hashCode) +
      (rules.hashCode) +
      (sideEffects.hashCode) +
      (timeoutSeconds == null ? 0 : timeoutSeconds!.hashCode);

  @override
  String toString() =>
      'IoK8sApiAdmissionregistrationV1MutatingWebhook[admissionReviewVersions=$admissionReviewVersions, clientConfig=$clientConfig, failurePolicy=$failurePolicy, matchPolicy=$matchPolicy, name=$name, namespaceSelector=$namespaceSelector, objectSelector=$objectSelector, reinvocationPolicy=$reinvocationPolicy, rules=$rules, sideEffects=$sideEffects, timeoutSeconds=$timeoutSeconds]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'admissionReviewVersions'] = this.admissionReviewVersions;
    json[r'clientConfig'] = this.clientConfig;
    if (this.failurePolicy != null) {
      json[r'failurePolicy'] = this.failurePolicy;
    } else {
      json[r'failurePolicy'] = null;
    }
    if (this.matchPolicy != null) {
      json[r'matchPolicy'] = this.matchPolicy;
    } else {
      json[r'matchPolicy'] = null;
    }
    json[r'name'] = this.name;
    if (this.namespaceSelector != null) {
      json[r'namespaceSelector'] = this.namespaceSelector;
    } else {
      json[r'namespaceSelector'] = null;
    }
    if (this.objectSelector != null) {
      json[r'objectSelector'] = this.objectSelector;
    } else {
      json[r'objectSelector'] = null;
    }
    if (this.reinvocationPolicy != null) {
      json[r'reinvocationPolicy'] = this.reinvocationPolicy;
    } else {
      json[r'reinvocationPolicy'] = null;
    }
    json[r'rules'] = this.rules;
    json[r'sideEffects'] = this.sideEffects;
    if (this.timeoutSeconds != null) {
      json[r'timeoutSeconds'] = this.timeoutSeconds;
    } else {
      json[r'timeoutSeconds'] = null;
    }
    return json;
  }

  /// Returns a new [IoK8sApiAdmissionregistrationV1MutatingWebhook] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiAdmissionregistrationV1MutatingWebhook? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiAdmissionregistrationV1MutatingWebhook[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiAdmissionregistrationV1MutatingWebhook[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiAdmissionregistrationV1MutatingWebhook(
        admissionReviewVersions: json[r'admissionReviewVersions'] is List
            ? (json[r'admissionReviewVersions'] as List).cast<String>()
            : const [],
        clientConfig:
            IoK8sApiAdmissionregistrationV1WebhookClientConfig.fromJson(
                json[r'clientConfig'])!,
        failurePolicy: mapValueOfType<String>(json, r'failurePolicy'),
        matchPolicy: mapValueOfType<String>(json, r'matchPolicy'),
        name: mapValueOfType<String>(json, r'name')!,
        namespaceSelector: IoK8sApimachineryPkgApisMetaV1LabelSelector.fromJson(
            json[r'namespaceSelector']),
        objectSelector: IoK8sApimachineryPkgApisMetaV1LabelSelector.fromJson(
            json[r'objectSelector']),
        reinvocationPolicy: mapValueOfType<String>(json, r'reinvocationPolicy'),
        rules: IoK8sApiAdmissionregistrationV1RuleWithOperations.listFromJson(
                json[r'rules']) ??
            const [],
        sideEffects: mapValueOfType<String>(json, r'sideEffects')!,
        timeoutSeconds: mapValueOfType<int>(json, r'timeoutSeconds'),
      );
    }
    return null;
  }

  static List<IoK8sApiAdmissionregistrationV1MutatingWebhook>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiAdmissionregistrationV1MutatingWebhook>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiAdmissionregistrationV1MutatingWebhook.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiAdmissionregistrationV1MutatingWebhook>
      mapFromJson(dynamic json) {
    final map = <String, IoK8sApiAdmissionregistrationV1MutatingWebhook>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiAdmissionregistrationV1MutatingWebhook.fromJson(
            entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiAdmissionregistrationV1MutatingWebhook-objects as value to a dart map
  static Map<String, List<IoK8sApiAdmissionregistrationV1MutatingWebhook>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoK8sApiAdmissionregistrationV1MutatingWebhook>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiAdmissionregistrationV1MutatingWebhook.listFromJson(
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
    'admissionReviewVersions',
    'clientConfig',
    'name',
    'sideEffects',
  };
}
