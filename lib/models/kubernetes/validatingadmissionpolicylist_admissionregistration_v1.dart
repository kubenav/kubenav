import 'package:json_annotation/json_annotation.dart';

part 'validatingadmissionpolicylist_admissionregistration_v1.g.dart';

///ValidatingAdmissionPolicyList is a list of ValidatingAdmissionPolicy.
@JsonSerializable()
class ValidatingadmissionpolicylistAdmissionregistrationV1 {
  ///APIVersion defines the versioned schema of this representation of an object. Servers
  ///should convert recognized schemas to the latest internal value, and may reject
  ///unrecognized values. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
  @JsonKey(name: 'apiVersion')
  ApiVersion? apiVersion;

  ///List of ValidatingAdmissionPolicy.
  @JsonKey(name: 'items')
  List<Item?> items;

  ///Kind is a string value representing the REST resource this object represents. Servers may
  ///infer this from the endpoint the client submits requests to. Cannot be updated. In
  ///CamelCase. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  @JsonKey(name: 'kind')
  ValidatingadmissionpolicylistAdmissionregistrationV1Kind? kind;

  ///ListMeta describes metadata that synthetic resources must have, including lists and
  ///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
  @JsonKey(name: 'metadata')
  ValidatingadmissionpolicylistAdmissionregistrationV1Metadata? metadata;

  ValidatingadmissionpolicylistAdmissionregistrationV1({
    this.apiVersion,
    required this.items,
    this.kind,
    this.metadata,
  });

  factory ValidatingadmissionpolicylistAdmissionregistrationV1.fromJson(
    Map<String, dynamic> json,
  ) => _$ValidatingadmissionpolicylistAdmissionregistrationV1FromJson(json);

  Map<String, dynamic> toJson() =>
      _$ValidatingadmissionpolicylistAdmissionregistrationV1ToJson(this);
}

///APIVersion defines the versioned schema of this representation of an object. Servers
///should convert recognized schemas to the latest internal value, and may reject
///unrecognized values. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
enum ApiVersion {
  @JsonValue('admissionregistration.k8s.io/v1')
  ADMISSIONREGISTRATION_K8_S_IO_V1,
}

final apiVersionValues = EnumValues({
  'admissionregistration.k8s.io/v1':
      ApiVersion.ADMISSIONREGISTRATION_K8_S_IO_V1,
});

@JsonSerializable()
class Item {
  ///APIVersion defines the versioned schema of this representation of an object. Servers
  ///should convert recognized schemas to the latest internal value, and may reject
  ///unrecognized values. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
  @JsonKey(name: 'apiVersion')
  ApiVersion? apiVersion;

  ///Kind is a string value representing the REST resource this object represents. Servers may
  ///infer this from the endpoint the client submits requests to. Cannot be updated. In
  ///CamelCase. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  @JsonKey(name: 'kind')
  ItemKind? kind;

  ///ObjectMeta is metadata that all persisted resources must have, which includes all objects
  ///users must create.
  @JsonKey(name: 'metadata')
  ItemMetadata? metadata;

  ///ValidatingAdmissionPolicySpec is the specification of the desired behavior of the
  ///AdmissionPolicy.
  @JsonKey(name: 'spec')
  Spec? spec;

  ///ValidatingAdmissionPolicyStatus represents the status of an admission validation policy.
  @JsonKey(name: 'status')
  Status? status;

  Item({this.apiVersion, this.kind, this.metadata, this.spec, this.status});

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

///Kind is a string value representing the REST resource this object represents. Servers may
///infer this from the endpoint the client submits requests to. Cannot be updated. In
///CamelCase. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
enum ItemKind {
  @JsonValue('ValidatingAdmissionPolicy')
  VALIDATING_ADMISSION_POLICY,
}

final itemKindValues = EnumValues({
  'ValidatingAdmissionPolicy': ItemKind.VALIDATING_ADMISSION_POLICY,
});

@JsonSerializable()
class ItemMetadata {
  ///Annotations is an unstructured key value map stored with a resource that may be set by
  ///external tools to store and retrieve arbitrary metadata. They are not queryable and
  ///should be preserved when modifying objects. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;

  ///Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.
  ///Wrappers are provided for many of the factory methods that the time package offers.
  @JsonKey(name: 'creationTimestamp')
  DateTime? creationTimestamp;

  ///Number of seconds allowed for this object to gracefully terminate before it will be
  ///removed from the system. Only set when deletionTimestamp is also set. May only be
  ///shortened. Read-only.
  @JsonKey(name: 'deletionGracePeriodSeconds')
  int? deletionGracePeriodSeconds;

  ///Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.
  ///Wrappers are provided for many of the factory methods that the time package offers.
  @JsonKey(name: 'deletionTimestamp')
  DateTime? deletionTimestamp;

  ///Must be empty before the object is deleted from the registry. Each entry is an identifier
  ///for the responsible component that will remove the entry from the list. If the
  ///deletionTimestamp of the object is non-nil, entries in this list can only be removed.
  ///Finalizers may be processed and removed in any order.  Order is NOT enforced because it
  ///introduces significant risk of stuck finalizers. finalizers is a shared field, any actor
  ///with permission can reorder it. If the finalizer list is processed in order, then this
  ///can lead to a situation in which the component responsible for the first finalizer in the
  ///list is waiting for a signal (field value, external system, or other) produced by a
  ///component responsible for a finalizer later in the list, resulting in a deadlock. Without
  ///enforced ordering finalizers are free to order amongst themselves and are not vulnerable
  ///to ordering changes in the list.
  @JsonKey(name: 'finalizers')
  List<String?>? finalizers;

  ///GenerateName is an optional prefix, used by the server, to generate a unique name ONLY IF
  ///the Name field has not been provided. If this field is used, the name returned to the
  ///client will be different than the name passed. This value will also be combined with a
  ///unique suffix. The provided value has the same validation rules as the Name field, and
  ///may be truncated by the length of the suffix required to make the value unique on the
  ///server.
  ///
  ///If this field is specified and the generated name exists, the server will return a 409.
  ///
  ///Applied only if Name is not specified. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#idempotency
  @JsonKey(name: 'generateName')
  String? generateName;

  ///A sequence number representing a specific generation of the desired state. Populated by
  ///the system. Read-only.
  @JsonKey(name: 'generation')
  int? generation;

  ///Map of string keys and values that can be used to organize and categorize (scope and
  ///select) objects. May match selectors of replication controllers and services. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/labels
  @JsonKey(name: 'labels')
  Map<String, String?>? labels;

  ///ManagedFields maps workflow-id and version to the set of fields that are managed by that
  ///workflow. This is mostly for internal housekeeping, and users typically shouldn't need to
  ///set or understand this field. A workflow can be the user's name, a controller's name, or
  ///the name of a specific apply path like "ci-cd". The set of fields is always in the
  ///version that the workflow used when modifying the object.
  @JsonKey(name: 'managedFields')
  List<ManagedField?>? managedFields;

  ///Name must be unique within a namespace. Is required when creating resources, although
  ///some resources may allow a client to request the generation of an appropriate name
  ///automatically. Name is primarily intended for creation idempotence and configuration
  ///definition. Cannot be updated. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/names#names
  @JsonKey(name: 'name')
  String? name;

  ///Namespace defines the space within which each name must be unique. An empty namespace is
  ///equivalent to the "default" namespace, but "default" is the canonical representation. Not
  ///all objects are required to be scoped to a namespace - the value of this field for those
  ///objects will be empty.
  ///
  ///Must be a DNS_LABEL. Cannot be updated. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces
  @JsonKey(name: 'namespace')
  String? namespace;

  ///List of objects depended by this object. If ALL objects in the list have been deleted,
  ///this object will be garbage collected. If this object is managed by a controller, then an
  ///entry in this list will point to this controller, with the controller field set to true.
  ///There cannot be more than one managing controller.
  @JsonKey(name: 'ownerReferences')
  List<OwnerReference?>? ownerReferences;

  ///An opaque value that represents the internal version of this object that can be used by
  ///clients to determine when objects have changed. May be used for optimistic concurrency,
  ///change detection, and the watch operation on a resource or set of resources. Clients must
  ///treat these values as opaque and passed unmodified back to the server. They may only be
  ///valid for a particular resource or set of resources.
  ///
  ///Populated by the system. Read-only. Value must be treated as opaque by clients and . More
  ///info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency
  @JsonKey(name: 'resourceVersion')
  String? resourceVersion;

  ///Deprecated: selfLink is a legacy read-only field that is no longer populated by the
  ///system.
  @JsonKey(name: 'selfLink')
  String? selfLink;

  ///UID is the unique in time and space value for this object. It is typically generated by
  ///the server on successful creation of a resource and is not allowed to change on PUT
  ///operations.
  ///
  ///Populated by the system. Read-only. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/names#uids
  @JsonKey(name: 'uid')
  String? uid;

  ItemMetadata({
    this.annotations,
    this.creationTimestamp,
    this.deletionGracePeriodSeconds,
    this.deletionTimestamp,
    this.finalizers,
    this.generateName,
    this.generation,
    this.labels,
    this.managedFields,
    this.name,
    this.namespace,
    this.ownerReferences,
    this.resourceVersion,
    this.selfLink,
    this.uid,
  });

  factory ItemMetadata.fromJson(Map<String, dynamic> json) =>
      _$ItemMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$ItemMetadataToJson(this);
}

@JsonSerializable()
class ManagedField {
  ///APIVersion defines the version of this resource that this field set applies to. The
  ///format is "group/version" just like the top-level APIVersion field. It is necessary to
  ///track the version of a field set because it cannot be automatically converted.
  @JsonKey(name: 'apiVersion')
  String? apiVersion;

  ///FieldsType is the discriminator for the different fields format and version. There is
  ///currently only one possible value: "FieldsV1"
  @JsonKey(name: 'fieldsType')
  String? fieldsType;

  ///FieldsV1 stores a set of fields in a data structure like a Trie, in JSON format.
  ///
  ///Each key is either a '.' representing the field itself, and will always map to an empty
  ///set, or a string representing a sub-field or item. The string will follow one of these
  ///four formats: 'f:<name>', where <name> is the name of a field in a struct, or key in a
  ///map 'v:<value>', where <value> is the exact json formatted value of a list item
  ///'i:<index>', where <index> is position of a item in a list 'k:<keys>', where <keys> is a
  ///map of  a list item's key fields to their unique values If a key maps to an empty Fields
  ///value, the field that key represents is part of the set.
  ///
  ///The exact format is defined in sigs.k8s.io/structured-merge-diff
  @JsonKey(name: 'fieldsV1')
  Map<String, dynamic>? fieldsV1;

  ///Manager is an identifier of the workflow managing these fields.
  @JsonKey(name: 'manager')
  String? manager;

  ///Operation is the type of operation which lead to this ManagedFieldsEntry being created.
  ///The only valid values for this field are 'Apply' and 'Update'.
  @JsonKey(name: 'operation')
  String? operation;

  ///Subresource is the name of the subresource used to update that object, or empty string if
  ///the object was updated through the main resource. The value of this field is used to
  ///distinguish between managers, even if they share the same name. For example, a status
  ///update will be distinct from a regular update using the same manager name. Note that the
  ///APIVersion field is not related to the Subresource field and it always corresponds to the
  ///version of the main resource.
  @JsonKey(name: 'subresource')
  String? subresource;

  ///Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.
  ///Wrappers are provided for many of the factory methods that the time package offers.
  @JsonKey(name: 'time')
  DateTime? time;

  ManagedField({
    this.apiVersion,
    this.fieldsType,
    this.fieldsV1,
    this.manager,
    this.operation,
    this.subresource,
    this.time,
  });

  factory ManagedField.fromJson(Map<String, dynamic> json) =>
      _$ManagedFieldFromJson(json);

  Map<String, dynamic> toJson() => _$ManagedFieldToJson(this);
}

@JsonSerializable()
class OwnerReference {
  ///API version of the referent.
  @JsonKey(name: 'apiVersion')
  String apiVersion;

  ///If true, AND if the owner has the "foregroundDeletion" finalizer, then the owner cannot
  ///be deleted from the key-value store until this reference is removed. See
  ///https://kubernetes.io/docs/concepts/architecture/garbage-collection/#foreground-deletion
  ///for how the garbage collector interacts with this field and enforces the foreground
  ///deletion. Defaults to false. To set this field, a user needs "delete" permission of the
  ///owner, otherwise 422 (Unprocessable Entity) will be returned.
  @JsonKey(name: 'blockOwnerDeletion')
  bool? blockOwnerDeletion;

  ///If true, this reference points to the managing controller.
  @JsonKey(name: 'controller')
  bool? controller;

  ///Kind of the referent. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  @JsonKey(name: 'kind')
  String kind;

  ///Name of the referent. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/names#names
  @JsonKey(name: 'name')
  String name;

  ///UID of the referent. More info:
  ///https://kubernetes.io/docs/concepts/overview/working-with-objects/names#uids
  @JsonKey(name: 'uid')
  String uid;

  OwnerReference({
    required this.apiVersion,
    this.blockOwnerDeletion,
    this.controller,
    required this.kind,
    required this.name,
    required this.uid,
  });

  factory OwnerReference.fromJson(Map<String, dynamic> json) =>
      _$OwnerReferenceFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerReferenceToJson(this);
}

@JsonSerializable()
class Spec {
  ///auditAnnotations contains CEL expressions which are used to produce audit annotations for
  ///the audit event of the API request. validations and auditAnnotations may not both be
  ///empty; a least one of validations or auditAnnotations is required.
  @JsonKey(name: 'auditAnnotations')
  List<AuditAnnotation?>? auditAnnotations;

  ///failurePolicy defines how to handle failures for the admission policy. Failures can occur
  ///from CEL expression parse errors, type check errors, runtime errors and invalid or
  ///mis-configured policy definitions or bindings.
  ///
  ///A policy is invalid if spec.paramKind refers to a non-existent Kind. A binding is invalid
  ///if spec.paramRef.name refers to a non-existent resource.
  ///
  ///failurePolicy does not define how validations that evaluate to false are handled.
  ///
  ///When failurePolicy is set to Fail, ValidatingAdmissionPolicyBinding validationActions
  ///define how failures are enforced.
  ///
  ///Allowed values are Ignore or Fail. Defaults to Fail.
  ///
  ///Possible enum values:
  ///- `"Fail"` means that an error calling the webhook causes the admission to fail.
  ///- `"Ignore"` means that an error calling the webhook is ignored.
  @JsonKey(name: 'failurePolicy')
  FailurePolicy? failurePolicy;

  ///MatchConditions is a list of conditions that must be met for a request to be validated.
  ///Match conditions filter requests that have already been matched by the rules,
  ///namespaceSelector, and objectSelector. An empty list of matchConditions matches all
  ///requests. There are a maximum of 64 match conditions allowed.
  ///
  ///If a parameter object is provided, it can be accessed via the `params` handle in the same
  ///manner as validation expressions.
  ///
  ///The exact matching logic is (in order):
  ///1. If ANY matchCondition evaluates to FALSE, the policy is skipped.
  ///2. If ALL matchConditions evaluate to TRUE, the policy is evaluated.
  ///3. If any matchCondition evaluates to an error (but none are FALSE):
  ///- If failurePolicy=Fail, reject the request
  ///- If failurePolicy=Ignore, the policy is skipped
  @JsonKey(name: 'matchConditions')
  List<MatchCondition?>? matchConditions;

  ///MatchResources decides whether to run the admission control policy on an object based on
  ///whether it meets the match criteria. The exclude rules take precedence over include rules
  ///(if a resource matches both, it is excluded)
  @JsonKey(name: 'matchConstraints')
  MatchConstraints? matchConstraints;

  ///ParamKind is a tuple of Group Kind and Version.
  @JsonKey(name: 'paramKind')
  ParamKind? paramKind;

  ///Validations contain CEL expressions which is used to apply the validation. Validations
  ///and AuditAnnotations may not both be empty; a minimum of one Validations or
  ///AuditAnnotations is required.
  @JsonKey(name: 'validations')
  List<Validation?>? validations;

  ///Variables contain definitions of variables that can be used in composition of other
  ///expressions. Each variable is defined as a named CEL expression. The variables defined
  ///here will be available under `variables` in other expressions of the policy except
  ///MatchConditions because MatchConditions are evaluated before the rest of the policy.
  ///
  ///The expression of a variable can refer to other variables defined earlier in the list but
  ///not those after. Thus, Variables must be sorted by the order of first appearance and
  ///acyclic.
  @JsonKey(name: 'variables')
  List<Variable?>? variables;

  Spec({
    this.auditAnnotations,
    this.failurePolicy,
    this.matchConditions,
    this.matchConstraints,
    this.paramKind,
    this.validations,
    this.variables,
  });

  factory Spec.fromJson(Map<String, dynamic> json) => _$SpecFromJson(json);

  Map<String, dynamic> toJson() => _$SpecToJson(this);
}

@JsonSerializable()
class AuditAnnotation {
  ///key specifies the audit annotation key. The audit annotation keys of a
  ///ValidatingAdmissionPolicy must be unique. The key must be a qualified name
  ///([A-Za-z0-9][-A-Za-z0-9_.]*) no more than 63 bytes in length.
  ///
  ///The key is combined with the resource name of the ValidatingAdmissionPolicy to construct
  ///an audit annotation key: "{ValidatingAdmissionPolicy name}/{key}".
  ///
  ///If an admission webhook uses the same resource name as this ValidatingAdmissionPolicy and
  ///the same audit annotation key, the annotation key will be identical. In this case, the
  ///first annotation written with the key will be included in the audit event and all
  ///subsequent annotations with the same key will be discarded.
  ///
  ///Required.
  @JsonKey(name: 'key')
  String key;

  ///valueExpression represents the expression which is evaluated by CEL to produce an audit
  ///annotation value. The expression must evaluate to either a string or null value. If the
  ///expression evaluates to a string, the audit annotation is included with the string value.
  ///If the expression evaluates to null or empty string the audit annotation will be omitted.
  ///The valueExpression may be no longer than 5kb in length. If the result of the
  ///valueExpression is more than 10kb in length, it will be truncated to 10kb.
  ///
  ///If multiple ValidatingAdmissionPolicyBinding resources match an API request, then the
  ///valueExpression will be evaluated for each binding. All unique values produced by the
  ///valueExpressions will be joined together in a comma-separated list.
  ///
  ///Required.
  @JsonKey(name: 'valueExpression')
  String valueExpression;

  AuditAnnotation({required this.key, required this.valueExpression});

  factory AuditAnnotation.fromJson(Map<String, dynamic> json) =>
      _$AuditAnnotationFromJson(json);

  Map<String, dynamic> toJson() => _$AuditAnnotationToJson(this);
}

///failurePolicy defines how to handle failures for the admission policy. Failures can occur
///from CEL expression parse errors, type check errors, runtime errors and invalid or
///mis-configured policy definitions or bindings.
///
///A policy is invalid if spec.paramKind refers to a non-existent Kind. A binding is invalid
///if spec.paramRef.name refers to a non-existent resource.
///
///failurePolicy does not define how validations that evaluate to false are handled.
///
///When failurePolicy is set to Fail, ValidatingAdmissionPolicyBinding validationActions
///define how failures are enforced.
///
///Allowed values are Ignore or Fail. Defaults to Fail.
///
///Possible enum values:
///- `"Fail"` means that an error calling the webhook causes the admission to fail.
///- `"Ignore"` means that an error calling the webhook is ignored.
enum FailurePolicy {
  @JsonValue('Fail')
  FAIL,
  @JsonValue('Ignore')
  IGNORE,
}

final failurePolicyValues = EnumValues({
  'Fail': FailurePolicy.FAIL,
  'Ignore': FailurePolicy.IGNORE,
});

@JsonSerializable()
class MatchCondition {
  ///Expression represents the expression which will be evaluated by CEL. Must evaluate to
  ///bool. CEL expressions have access to the contents of the AdmissionRequest and Authorizer,
  ///organized into CEL variables:
  ///
  ///'object' - The object from the incoming request. The value is null for DELETE requests.
  ///'oldObject' - The existing object. The value is null for CREATE requests. 'request' -
  ///Attributes of the admission request(/pkg/apis/admission/types.go#AdmissionRequest).
  ///'authorizer' - A CEL Authorizer. May be used to perform authorization checks for the
  ///principal (user or service account) of the request.
  ///See https://pkg.go.dev/k8s.io/apiserver/pkg/cel/library#Authz
  ///'authorizer.requestResource' - A CEL ResourceCheck constructed from the 'authorizer' and
  ///configured with the
  ///request resource.
  ///Documentation on CEL: https://kubernetes.io/docs/reference/using-api/cel/
  ///
  ///Required.
  @JsonKey(name: 'expression')
  String expression;

  ///Name is an identifier for this match condition, used for strategic merging of
  ///MatchConditions, as well as providing an identifier for logging purposes. A good name
  ///should be descriptive of the associated expression. Name must be a qualified name
  ///consisting of alphanumeric characters, '-', '_' or '.', and must start and end with an
  ///alphanumeric character (e.g. 'MyName',  or 'my.name',  or '123-abc', regex used for
  ///validation is '([A-Za-z0-9][-A-Za-z0-9_.]*)?[A-Za-z0-9]') with an optional DNS subdomain
  ///prefix and '/' (e.g. 'example.com/MyName')
  ///
  ///Required.
  @JsonKey(name: 'name')
  String name;

  MatchCondition({required this.expression, required this.name});

  factory MatchCondition.fromJson(Map<String, dynamic> json) =>
      _$MatchConditionFromJson(json);

  Map<String, dynamic> toJson() => _$MatchConditionToJson(this);
}

@JsonSerializable()
class MatchConstraints {
  ///ExcludeResourceRules describes what operations on what resources/subresources the
  ///ValidatingAdmissionPolicy should not care about. The exclude rules take precedence over
  ///include rules (if a resource matches both, it is excluded)
  @JsonKey(name: 'excludeResourceRules')
  List<ExcludeResourceRule?>? excludeResourceRules;

  ///matchPolicy defines how the "MatchResources" list is used to match incoming requests.
  ///Allowed values are "Exact" or "Equivalent".
  ///
  ///- Exact: match a request only if it exactly matches a specified rule. For example, if
  ///deployments can be modified via apps/v1, apps/v1beta1, and extensions/v1beta1, but
  ///"rules" only included `apiGroups:["apps"], apiVersions:["v1"], resources:
  ///["deployments"]`, a request to apps/v1beta1 or extensions/v1beta1 would not be sent to
  ///the ValidatingAdmissionPolicy.
  ///
  ///- Equivalent: match a request if modifies a resource listed in rules, even via another
  ///API group or version. For example, if deployments can be modified via apps/v1,
  ///apps/v1beta1, and extensions/v1beta1, and "rules" only included `apiGroups:["apps"],
  ///apiVersions:["v1"], resources: ["deployments"]`, a request to apps/v1beta1 or
  ///extensions/v1beta1 would be converted to apps/v1 and sent to the
  ///ValidatingAdmissionPolicy.
  ///
  ///Defaults to "Equivalent"
  ///
  ///Possible enum values:
  ///- `"Equivalent"` means requests should be sent to the webhook if they modify a resource
  ///listed in rules via another API group or version.
  ///- `"Exact"` means requests should only be sent to the webhook if they exactly match a
  ///given rule.
  @JsonKey(name: 'matchPolicy')
  MatchPolicy? matchPolicy;

  ///A label selector is a label query over a set of resources. The result of matchLabels and
  ///matchExpressions are ANDed. An empty label selector matches all objects. A null label
  ///selector matches no objects.
  @JsonKey(name: 'namespaceSelector')
  NamespaceSelector? namespaceSelector;

  ///A label selector is a label query over a set of resources. The result of matchLabels and
  ///matchExpressions are ANDed. An empty label selector matches all objects. A null label
  ///selector matches no objects.
  @JsonKey(name: 'objectSelector')
  ObjectSelector? objectSelector;

  ///ResourceRules describes what operations on what resources/subresources the
  ///ValidatingAdmissionPolicy matches. The policy cares about an operation if it matches
  ///_any_ Rule.
  @JsonKey(name: 'resourceRules')
  List<ResourceRule?>? resourceRules;

  MatchConstraints({
    this.excludeResourceRules,
    this.matchPolicy,
    this.namespaceSelector,
    this.objectSelector,
    this.resourceRules,
  });

  factory MatchConstraints.fromJson(Map<String, dynamic> json) =>
      _$MatchConstraintsFromJson(json);

  Map<String, dynamic> toJson() => _$MatchConstraintsToJson(this);
}

@JsonSerializable()
class ExcludeResourceRule {
  ///APIGroups is the API groups the resources belong to. '*' is all groups. If '*' is
  ///present, the length of the slice must be one. Required.
  @JsonKey(name: 'apiGroups')
  List<String?>? apiGroups;

  ///APIVersions is the API versions the resources belong to. '*' is all versions. If '*' is
  ///present, the length of the slice must be one. Required.
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;

  ///Operations is the operations the admission hook cares about - CREATE, UPDATE, DELETE,
  ///CONNECT or * for all of those operations and any future admission operations that are
  ///added. If '*' is present, the length of the slice must be one. Required.
  @JsonKey(name: 'operations')
  List<Operation>? operations;

  ///ResourceNames is an optional white list of names that the rule applies to.  An empty set
  ///means that everything is allowed.
  @JsonKey(name: 'resourceNames')
  List<String?>? resourceNames;

  ///Resources is a list of resources this rule applies to.
  ///
  ///For example: 'pods' means pods. 'pods/log' means the log subresource of pods. '*' means
  ///all resources, but not subresources. 'pods/*' means all subresources of pods. '*/scale'
  ///means all scale subresources. '*/*' means all resources and their subresources.
  ///
  ///If wildcard is present, the validation rule will ensure resources do not overlap with
  ///each other.
  ///
  ///Depending on the enclosing object, subresources might not be allowed. Required.
  @JsonKey(name: 'resources')
  List<String?>? resources;

  ///scope specifies the scope of this rule. Valid values are "Cluster", "Namespaced", and "*"
  ///"Cluster" means that only cluster-scoped resources will match this rule. Namespace API
  ///objects are cluster-scoped. "Namespaced" means that only namespaced resources will match
  ///this rule. "*" means that there are no scope restrictions. Subresources match the scope
  ///of their parent resource. Default is "*".
  ///
  ///
  ///Possible enum values:
  ///- `"*"` means that all scopes are included.
  ///- `"Cluster"` means that scope is limited to cluster-scoped objects. Namespace objects
  ///are cluster-scoped.
  ///- `"Namespaced"` means that scope is limited to namespaced objects.
  @JsonKey(name: 'scope')
  Scope? scope;

  ExcludeResourceRule({
    this.apiGroups,
    this.apiVersions,
    this.operations,
    this.resourceNames,
    this.resources,
    this.scope,
  });

  factory ExcludeResourceRule.fromJson(Map<String, dynamic> json) =>
      _$ExcludeResourceRuleFromJson(json);

  Map<String, dynamic> toJson() => _$ExcludeResourceRuleToJson(this);
}

enum Operation {
  @JsonValue('CONNECT')
  CONNECT,
  @JsonValue('CREATE')
  CREATE,
  @JsonValue('DELETE')
  DELETE,
  @JsonValue('*')
  EMPTY,
  @JsonValue('UPDATE')
  UPDATE,
}

final operationValues = EnumValues({
  'CONNECT': Operation.CONNECT,
  'CREATE': Operation.CREATE,
  'DELETE': Operation.DELETE,
  '*': Operation.EMPTY,
  'UPDATE': Operation.UPDATE,
});

///scope specifies the scope of this rule. Valid values are "Cluster", "Namespaced", and "*"
///"Cluster" means that only cluster-scoped resources will match this rule. Namespace API
///objects are cluster-scoped. "Namespaced" means that only namespaced resources will match
///this rule. "*" means that there are no scope restrictions. Subresources match the scope
///of their parent resource. Default is "*".
///
///
///Possible enum values:
///- `"*"` means that all scopes are included.
///- `"Cluster"` means that scope is limited to cluster-scoped objects. Namespace objects
///are cluster-scoped.
///- `"Namespaced"` means that scope is limited to namespaced objects.
enum Scope {
  @JsonValue('Cluster')
  CLUSTER,
  @JsonValue('*')
  EMPTY,
  @JsonValue('Namespaced')
  NAMESPACED,
}

final scopeValues = EnumValues({
  'Cluster': Scope.CLUSTER,
  '*': Scope.EMPTY,
  'Namespaced': Scope.NAMESPACED,
});

///matchPolicy defines how the "MatchResources" list is used to match incoming requests.
///Allowed values are "Exact" or "Equivalent".
///
///- Exact: match a request only if it exactly matches a specified rule. For example, if
///deployments can be modified via apps/v1, apps/v1beta1, and extensions/v1beta1, but
///"rules" only included `apiGroups:["apps"], apiVersions:["v1"], resources:
///["deployments"]`, a request to apps/v1beta1 or extensions/v1beta1 would not be sent to
///the ValidatingAdmissionPolicy.
///
///- Equivalent: match a request if modifies a resource listed in rules, even via another
///API group or version. For example, if deployments can be modified via apps/v1,
///apps/v1beta1, and extensions/v1beta1, and "rules" only included `apiGroups:["apps"],
///apiVersions:["v1"], resources: ["deployments"]`, a request to apps/v1beta1 or
///extensions/v1beta1 would be converted to apps/v1 and sent to the
///ValidatingAdmissionPolicy.
///
///Defaults to "Equivalent"
///
///Possible enum values:
///- `"Equivalent"` means requests should be sent to the webhook if they modify a resource
///listed in rules via another API group or version.
///- `"Exact"` means requests should only be sent to the webhook if they exactly match a
///given rule.
enum MatchPolicy {
  @JsonValue('Equivalent')
  EQUIVALENT,
  @JsonValue('Exact')
  EXACT,
}

final matchPolicyValues = EnumValues({
  'Equivalent': MatchPolicy.EQUIVALENT,
  'Exact': MatchPolicy.EXACT,
});

@JsonSerializable()
class NamespaceSelector {
  ///matchExpressions is a list of label selector requirements. The requirements are ANDed.
  @JsonKey(name: 'matchExpressions')
  List<NamespaceSelectorMatchExpression?>? matchExpressions;

  ///matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is
  ///equivalent to an element of matchExpressions, whose key field is "key", the operator is
  ///"In", and the values array contains only "value". The requirements are ANDed.
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  NamespaceSelector({this.matchExpressions, this.matchLabels});

  factory NamespaceSelector.fromJson(Map<String, dynamic> json) =>
      _$NamespaceSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$NamespaceSelectorToJson(this);
}

@JsonSerializable()
class NamespaceSelectorMatchExpression {
  ///key is the label key that the selector applies to.
  @JsonKey(name: 'key')
  String key;

  ///operator represents a key's relationship to a set of values. Valid operators are In,
  ///NotIn, Exists and DoesNotExist.
  @JsonKey(name: 'operator')
  String matchExpressionOperator;

  ///values is an array of string values. If the operator is In or NotIn, the values array
  ///must be non-empty. If the operator is Exists or DoesNotExist, the values array must be
  ///empty. This array is replaced during a strategic merge patch.
  @JsonKey(name: 'values')
  List<String?>? values;

  NamespaceSelectorMatchExpression({
    required this.key,
    required this.matchExpressionOperator,
    this.values,
  });

  factory NamespaceSelectorMatchExpression.fromJson(
    Map<String, dynamic> json,
  ) => _$NamespaceSelectorMatchExpressionFromJson(json);

  Map<String, dynamic> toJson() =>
      _$NamespaceSelectorMatchExpressionToJson(this);
}

@JsonSerializable()
class ObjectSelector {
  ///matchExpressions is a list of label selector requirements. The requirements are ANDed.
  @JsonKey(name: 'matchExpressions')
  List<ObjectSelectorMatchExpression?>? matchExpressions;

  ///matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is
  ///equivalent to an element of matchExpressions, whose key field is "key", the operator is
  ///"In", and the values array contains only "value". The requirements are ANDed.
  @JsonKey(name: 'matchLabels')
  Map<String, String?>? matchLabels;

  ObjectSelector({this.matchExpressions, this.matchLabels});

  factory ObjectSelector.fromJson(Map<String, dynamic> json) =>
      _$ObjectSelectorFromJson(json);

  Map<String, dynamic> toJson() => _$ObjectSelectorToJson(this);
}

@JsonSerializable()
class ObjectSelectorMatchExpression {
  ///key is the label key that the selector applies to.
  @JsonKey(name: 'key')
  String key;

  ///operator represents a key's relationship to a set of values. Valid operators are In,
  ///NotIn, Exists and DoesNotExist.
  @JsonKey(name: 'operator')
  String matchExpressionOperator;

  ///values is an array of string values. If the operator is In or NotIn, the values array
  ///must be non-empty. If the operator is Exists or DoesNotExist, the values array must be
  ///empty. This array is replaced during a strategic merge patch.
  @JsonKey(name: 'values')
  List<String?>? values;

  ObjectSelectorMatchExpression({
    required this.key,
    required this.matchExpressionOperator,
    this.values,
  });

  factory ObjectSelectorMatchExpression.fromJson(Map<String, dynamic> json) =>
      _$ObjectSelectorMatchExpressionFromJson(json);

  Map<String, dynamic> toJson() => _$ObjectSelectorMatchExpressionToJson(this);
}

@JsonSerializable()
class ResourceRule {
  ///APIGroups is the API groups the resources belong to. '*' is all groups. If '*' is
  ///present, the length of the slice must be one. Required.
  @JsonKey(name: 'apiGroups')
  List<String?>? apiGroups;

  ///APIVersions is the API versions the resources belong to. '*' is all versions. If '*' is
  ///present, the length of the slice must be one. Required.
  @JsonKey(name: 'apiVersions')
  List<String?>? apiVersions;

  ///Operations is the operations the admission hook cares about - CREATE, UPDATE, DELETE,
  ///CONNECT or * for all of those operations and any future admission operations that are
  ///added. If '*' is present, the length of the slice must be one. Required.
  @JsonKey(name: 'operations')
  List<Operation>? operations;

  ///ResourceNames is an optional white list of names that the rule applies to.  An empty set
  ///means that everything is allowed.
  @JsonKey(name: 'resourceNames')
  List<String?>? resourceNames;

  ///Resources is a list of resources this rule applies to.
  ///
  ///For example: 'pods' means pods. 'pods/log' means the log subresource of pods. '*' means
  ///all resources, but not subresources. 'pods/*' means all subresources of pods. '*/scale'
  ///means all scale subresources. '*/*' means all resources and their subresources.
  ///
  ///If wildcard is present, the validation rule will ensure resources do not overlap with
  ///each other.
  ///
  ///Depending on the enclosing object, subresources might not be allowed. Required.
  @JsonKey(name: 'resources')
  List<String?>? resources;

  ///scope specifies the scope of this rule. Valid values are "Cluster", "Namespaced", and "*"
  ///"Cluster" means that only cluster-scoped resources will match this rule. Namespace API
  ///objects are cluster-scoped. "Namespaced" means that only namespaced resources will match
  ///this rule. "*" means that there are no scope restrictions. Subresources match the scope
  ///of their parent resource. Default is "*".
  ///
  ///
  ///Possible enum values:
  ///- `"*"` means that all scopes are included.
  ///- `"Cluster"` means that scope is limited to cluster-scoped objects. Namespace objects
  ///are cluster-scoped.
  ///- `"Namespaced"` means that scope is limited to namespaced objects.
  @JsonKey(name: 'scope')
  Scope? scope;

  ResourceRule({
    this.apiGroups,
    this.apiVersions,
    this.operations,
    this.resourceNames,
    this.resources,
    this.scope,
  });

  factory ResourceRule.fromJson(Map<String, dynamic> json) =>
      _$ResourceRuleFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceRuleToJson(this);
}

@JsonSerializable()
class ParamKind {
  ///APIVersion is the API group version the resources belong to. In format of
  ///"group/version". Required.
  @JsonKey(name: 'apiVersion')
  String? apiVersion;

  ///Kind is the API kind the resources belong to. Required.
  @JsonKey(name: 'kind')
  String? kind;

  ParamKind({this.apiVersion, this.kind});

  factory ParamKind.fromJson(Map<String, dynamic> json) =>
      _$ParamKindFromJson(json);

  Map<String, dynamic> toJson() => _$ParamKindToJson(this);
}

@JsonSerializable()
class Validation {
  ///Expression represents the expression which will be evaluated by CEL. ref:
  ///https://github.com/google/cel-spec CEL expressions have access to the contents of the API
  ///request/response, organized into CEL variables as well as some other useful variables:
  ///
  ///- 'object' - The object from the incoming request. The value is null for DELETE requests.
  ///- 'oldObject' - The existing object. The value is null for CREATE requests. - 'request' -
  ///Attributes of the API request([ref](/pkg/apis/admission/types.go#AdmissionRequest)). -
  ///'params' - Parameter resource referred to by the policy binding being evaluated. Only
  ///populated if the policy has a ParamKind. - 'namespaceObject' - The namespace object that
  ///the incoming object belongs to. The value is null for cluster-scoped resources. -
  ///'variables' - Map of composited variables, from its name to its lazily evaluated value.
  ///For example, a variable named 'foo' can be accessed as 'variables.foo'.
  ///- 'authorizer' - A CEL Authorizer. May be used to perform authorization checks for the
  ///principal (user or service account) of the request.
  ///See https://pkg.go.dev/k8s.io/apiserver/pkg/cel/library#Authz
  ///- 'authorizer.requestResource' - A CEL ResourceCheck constructed from the 'authorizer'
  ///and configured with the
  ///request resource.
  ///
  ///The `apiVersion`, `kind`, `metadata.name` and `metadata.generateName` are always
  ///accessible from the root of the object. No other metadata properties are accessible.
  ///
  ///Only property names of the form `[a-zA-Z_.-/][a-zA-Z0-9_.-/]*` are accessible. Accessible
  ///property names are escaped according to the following rules when accessed in the
  ///expression: - '__' escapes to '__underscores__' - '.' escapes to '__dot__' - '-' escapes
  ///to '__dash__' - '/' escapes to '__slash__' - Property names that exactly match a CEL
  ///RESERVED keyword escape to '__{keyword}__'. The keywords are:
  ///"true", "false", "null", "in", "as", "break", "const", "continue", "else", "for",
  ///"function", "if",
  ///"import", "let", "loop", "package", "namespace", "return".
  ///Examples:
  ///- Expression accessing a property named "namespace": {"Expression": "object.__namespace__
  ///> 0"}
  ///- Expression accessing a property named "x-prop": {"Expression": "object.x__dash__prop >
  ///0"}
  ///- Expression accessing a property named "redact__d": {"Expression":
  ///"object.redact__underscores__d > 0"}
  ///
  ///Equality on arrays with list type of 'set' or 'map' ignores element order, i.e. [1, 2] ==
  ///[2, 1]. Concatenation on arrays with x-kubernetes-list-type use the semantics of the list
  ///type:
  ///- 'set': `X + Y` performs a union where the array positions of all elements in `X` are
  ///preserved and
  ///non-intersecting elements in `Y` are appended, retaining their partial order.
  ///- 'map': `X + Y` performs a merge where the array positions of all keys in `X` are
  ///preserved but the values
  ///are overwritten by values in `Y` when the key sets of `X` and `Y` intersect. Elements in
  ///`Y` with
  ///non-intersecting keys are appended, retaining their partial order.
  ///Required.
  @JsonKey(name: 'expression')
  String expression;

  ///Message represents the message displayed when validation fails. The message is required
  ///if the Expression contains line breaks. The message must not contain line breaks. If
  ///unset, the message is "failed rule: {Rule}". e.g. "must be a URL with the host matching
  ///spec.host" If the Expression contains line breaks. Message is required. The message must
  ///not contain line breaks. If unset, the message is "failed Expression: {Expression}".
  @JsonKey(name: 'message')
  String? message;

  ///messageExpression declares a CEL expression that evaluates to the validation failure
  ///message that is returned when this rule fails. Since messageExpression is used as a
  ///failure message, it must evaluate to a string. If both message and messageExpression are
  ///present on a validation, then messageExpression will be used if validation fails. If
  ///messageExpression results in a runtime error, the runtime error is logged, and the
  ///validation failure message is produced as if the messageExpression field were unset. If
  ///messageExpression evaluates to an empty string, a string with only spaces, or a string
  ///that contains line breaks, then the validation failure message will also be produced as
  ///if the messageExpression field were unset, and the fact that messageExpression produced
  ///an empty string/string with only spaces/string with line breaks will be logged.
  ///messageExpression has access to all the same variables as the `expression` except for
  ///'authorizer' and 'authorizer.requestResource'. Example: "object.x must be less than max
  ///("+string(params.max)+")"
  @JsonKey(name: 'messageExpression')
  String? messageExpression;

  ///Reason represents a machine-readable description of why this validation failed. If this
  ///is the first validation in the list to fail, this reason, as well as the corresponding
  ///HTTP response code, are used in the HTTP response to the client. The currently supported
  ///reasons are: "Unauthorized", "Forbidden", "Invalid", "RequestEntityTooLarge". If not set,
  ///StatusReasonInvalid is used in the response to the client.
  @JsonKey(name: 'reason')
  String? reason;

  Validation({
    required this.expression,
    this.message,
    this.messageExpression,
    this.reason,
  });

  factory Validation.fromJson(Map<String, dynamic> json) =>
      _$ValidationFromJson(json);

  Map<String, dynamic> toJson() => _$ValidationToJson(this);
}

@JsonSerializable()
class Variable {
  ///Expression is the expression that will be evaluated as the value of the variable. The CEL
  ///expression has access to the same identifiers as the CEL expressions in Validation.
  @JsonKey(name: 'expression')
  String expression;

  ///Name is the name of the variable. The name must be a valid CEL identifier and unique
  ///among all variables. The variable can be accessed in other expressions through
  ///`variables` For example, if name is "foo", the variable will be available as
  ///`variables.foo`
  @JsonKey(name: 'name')
  String name;

  Variable({required this.expression, required this.name});

  factory Variable.fromJson(Map<String, dynamic> json) =>
      _$VariableFromJson(json);

  Map<String, dynamic> toJson() => _$VariableToJson(this);
}

@JsonSerializable()
class Status {
  ///The conditions represent the latest available observations of a policy's current state.
  @JsonKey(name: 'conditions')
  List<Condition?>? conditions;

  ///The generation observed by the controller.
  @JsonKey(name: 'observedGeneration')
  int? observedGeneration;

  ///TypeChecking contains results of type checking the expressions in the
  ///ValidatingAdmissionPolicy
  @JsonKey(name: 'typeChecking')
  TypeChecking? typeChecking;

  Status({this.conditions, this.observedGeneration, this.typeChecking});

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}

@JsonSerializable()
class Condition {
  ///Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.
  ///Wrappers are provided for many of the factory methods that the time package offers.
  @JsonKey(name: 'lastTransitionTime')
  DateTime lastTransitionTime;

  ///message is a human readable message indicating details about the transition. This may be
  ///an empty string.
  @JsonKey(name: 'message')
  String message;

  ///observedGeneration represents the .metadata.generation that the condition was set based
  ///upon. For instance, if .metadata.generation is currently 12, but the
  ///.status.conditions[x].observedGeneration is 9, the condition is out of date with respect
  ///to the current state of the instance.
  @JsonKey(name: 'observedGeneration')
  int? observedGeneration;

  ///reason contains a programmatic identifier indicating the reason for the condition's last
  ///transition. Producers of specific condition types may define expected values and meanings
  ///for this field, and whether the values are considered a guaranteed API. The value should
  ///be a CamelCase string. This field may not be empty.
  @JsonKey(name: 'reason')
  String reason;

  ///status of the condition, one of True, False, Unknown.
  @JsonKey(name: 'status')
  String status;

  ///type of condition in CamelCase or in foo.example.com/CamelCase.
  @JsonKey(name: 'type')
  String type;

  Condition({
    required this.lastTransitionTime,
    required this.message,
    this.observedGeneration,
    required this.reason,
    required this.status,
    required this.type,
  });

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}

@JsonSerializable()
class TypeChecking {
  ///The type checking warnings for each expression.
  @JsonKey(name: 'expressionWarnings')
  List<ExpressionWarning?>? expressionWarnings;

  TypeChecking({this.expressionWarnings});

  factory TypeChecking.fromJson(Map<String, dynamic> json) =>
      _$TypeCheckingFromJson(json);

  Map<String, dynamic> toJson() => _$TypeCheckingToJson(this);
}

@JsonSerializable()
class ExpressionWarning {
  ///The path to the field that refers the expression. For example, the reference to the
  ///expression of the first item of validations is "spec.validations[0].expression"
  @JsonKey(name: 'fieldRef')
  String fieldRef;

  ///The content of type checking information in a human-readable form. Each line of the
  ///warning contains the type that the expression is checked against, followed by the type
  ///check error from the compiler.
  @JsonKey(name: 'warning')
  String warning;

  ExpressionWarning({required this.fieldRef, required this.warning});

  factory ExpressionWarning.fromJson(Map<String, dynamic> json) =>
      _$ExpressionWarningFromJson(json);

  Map<String, dynamic> toJson() => _$ExpressionWarningToJson(this);
}

///Kind is a string value representing the REST resource this object represents. Servers may
///infer this from the endpoint the client submits requests to. Cannot be updated. In
///CamelCase. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
enum ValidatingadmissionpolicylistAdmissionregistrationV1Kind {
  @JsonValue('ValidatingAdmissionPolicyList')
  VALIDATING_ADMISSION_POLICY_LIST,
}

final validatingadmissionpolicylistAdmissionregistrationV1KindValues =
    EnumValues({
      'ValidatingAdmissionPolicyList':
          ValidatingadmissionpolicylistAdmissionregistrationV1Kind
              .VALIDATING_ADMISSION_POLICY_LIST,
    });

///ListMeta describes metadata that synthetic resources must have, including lists and
///various status objects. A resource may have only one of {ObjectMeta, ListMeta}.
@JsonSerializable()
class ValidatingadmissionpolicylistAdmissionregistrationV1Metadata {
  ///continue may be set if the user set a limit on the number of items returned, and
  ///indicates that the server has more data available. The value is opaque and may be used to
  ///issue another request to the endpoint that served this list to retrieve the next set of
  ///available objects. Continuing a consistent list may not be possible if the server
  ///configuration has changed or more than a few minutes have passed. The resourceVersion
  ///field returned when using this continue value will be identical to the value in the first
  ///response, unless you have received this token from an error message.
  @JsonKey(name: 'continue')
  String? metadataContinue;

  ///remainingItemCount is the number of subsequent items in the list which are not included
  ///in this list response. If the list request contained label or field selectors, then the
  ///number of remaining items is unknown and the field will be left unset and omitted during
  ///serialization. If the list is complete (either because it is not chunking or because this
  ///is the last chunk), then there are no more remaining items and this field will be left
  ///unset and omitted during serialization. Servers older than v1.15 do not set this field.
  ///The intended use of the remainingItemCount is *estimating* the size of a collection.
  ///Clients should not rely on the remainingItemCount to be set or to be exact.
  @JsonKey(name: 'remainingItemCount')
  int? remainingItemCount;

  ///String that identifies the server's internal version of this object that can be used by
  ///clients to determine when objects have changed. Value must be treated as opaque by
  ///clients and passed unmodified back to the server. Populated by the system. Read-only.
  ///More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency
  @JsonKey(name: 'resourceVersion')
  String? resourceVersion;

  ///Deprecated: selfLink is a legacy read-only field that is no longer populated by the
  ///system.
  @JsonKey(name: 'selfLink')
  String? selfLink;

  ValidatingadmissionpolicylistAdmissionregistrationV1Metadata({
    this.metadataContinue,
    this.remainingItemCount,
    this.resourceVersion,
    this.selfLink,
  });

  factory ValidatingadmissionpolicylistAdmissionregistrationV1Metadata.fromJson(
    Map<String, dynamic> json,
  ) => _$ValidatingadmissionpolicylistAdmissionregistrationV1MetadataFromJson(
    json,
  );

  Map<String, dynamic> toJson() =>
      _$ValidatingadmissionpolicylistAdmissionregistrationV1MetadataToJson(
        this,
      );
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
