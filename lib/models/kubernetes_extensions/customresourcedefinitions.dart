import 'package:json_annotation/json_annotation.dart';

part 'customresourcedefinitions.g.dart';

@JsonSerializable()
class CustomResourceDefinitionList {
  @JsonKey(name: 'items')
  List<CustomResourceDefinition?> items;

  CustomResourceDefinitionList({required this.items});

  factory CustomResourceDefinitionList.fromJson(Map<String, dynamic> json) =>
      _$CustomResourceDefinitionListFromJson(json);

  Map<String, dynamic> toJson() => _$CustomResourceDefinitionListToJson(this);
}

@JsonSerializable()
class CustomResourceDefinition {
  @JsonKey(name: 'metadata')
  CustomResourceDefinitionMetadata? metadata;

  @JsonKey(name: 'spec')
  CustomResourceDefinitionSpec? spec;

  @JsonKey(name: 'status')
  CustomResourceDefinitionStatus? status;

  CustomResourceDefinition({required this.spec});

  factory CustomResourceDefinition.fromJson(Map<String, dynamic> json) =>
      _$CustomResourceDefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$CustomResourceDefinitionToJson(this);
}

@JsonSerializable()
class CustomResourceDefinitionSpec {
  @JsonKey(name: 'conversion')
  CustomResourceConversion? conversion;

  @JsonKey(name: 'group')
  String group;

  @JsonKey(name: 'names')
  CustomResourceDefinitionNames names;

  @JsonKey(name: 'preserveUnknownFields')
  bool? preserveUnknownFields;

  @JsonKey(name: 'scope')
  String scope;

  @JsonKey(name: 'versions')
  List<CustomResourceDefinitionVersion> versions;

  CustomResourceDefinitionSpec({
    required this.group,
    required this.names,
    this.preserveUnknownFields,
    required this.scope,
    this.versions = const [],
  });

  factory CustomResourceDefinitionSpec.fromJson(Map<String, dynamic> json) =>
      _$CustomResourceDefinitionSpecFromJson(json);

  Map<String, dynamic> toJson() => _$CustomResourceDefinitionSpecToJson(this);
}

@JsonSerializable()
class CustomResourceConversion {
  String strategy;

  CustomResourceConversion({required this.strategy});

  factory CustomResourceConversion.fromJson(Map<String, dynamic> json) =>
      _$CustomResourceConversionFromJson(json);

  Map<String, dynamic> toJson() => _$CustomResourceConversionToJson(this);
}

@JsonSerializable()
class CustomResourceDefinitionNames {
  @JsonKey(name: 'categories')
  List<String> categories;

  @JsonKey(name: 'kind')
  String kind;

  @JsonKey(name: 'listKind')
  String? listKind;

  @JsonKey(name: 'plural')
  String plural;

  @JsonKey(name: 'shortNames')
  List<String> shortNames;

  @JsonKey(name: 'singular')
  String? singular;

  CustomResourceDefinitionNames({
    this.categories = const [],
    required this.kind,
    this.listKind,
    required this.plural,
    this.shortNames = const [],
    this.singular,
  });

  factory CustomResourceDefinitionNames.fromJson(Map<String, dynamic> json) =>
      _$CustomResourceDefinitionNamesFromJson(json);

  Map<String, dynamic> toJson() => _$CustomResourceDefinitionNamesToJson(this);
}

@JsonSerializable()
class CustomResourceDefinitionVersion {
  @JsonKey(name: 'additionalPrinterColumns')
  List<CustomResourceColumnDefinition> additionalPrinterColumns;

  @JsonKey(name: 'deprecated')
  bool? deprecated;

  @JsonKey(name: 'deprecationWarning')
  String? deprecationWarning;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'served')
  bool served;

  @JsonKey(name: 'storage')
  bool storage;

  CustomResourceDefinitionVersion({
    this.additionalPrinterColumns = const [],
    this.deprecated,
    this.deprecationWarning,
    required this.name,
    required this.served,
    required this.storage,
  });

  factory CustomResourceDefinitionVersion.fromJson(Map<String, dynamic> json) =>
      _$CustomResourceDefinitionVersionFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CustomResourceDefinitionVersionToJson(this);
}

@JsonSerializable()
class CustomResourceColumnDefinition {
  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'format')
  String? format;

  @JsonKey(name: 'jsonPath')
  String jsonPath;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'priority')
  int? priority;

  @JsonKey(name: 'type')
  String type;

  CustomResourceColumnDefinition({
    this.description,
    this.format,
    required this.jsonPath,
    required this.name,
    this.priority,
    required this.type,
  });

  factory CustomResourceColumnDefinition.fromJson(Map<String, dynamic> json) =>
      _$CustomResourceColumnDefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$CustomResourceColumnDefinitionToJson(this);
}

@JsonSerializable()
class CustomResourceDefinitionMetadata {
  @JsonKey(name: 'annotations')
  Map<String, String?>? annotations;

  @JsonKey(name: 'creationTimestamp')
  DateTime? creationTimestamp;

  @JsonKey(name: 'deletionGracePeriodSeconds')
  int? deletionGracePeriodSeconds;

  @JsonKey(name: 'deletionTimestamp')
  DateTime? deletionTimestamp;

  @JsonKey(name: 'finalizers')
  List<String?>? finalizers;

  @JsonKey(name: 'generateName')
  String? generateName;

  @JsonKey(name: 'generation')
  int? generation;

  @JsonKey(name: 'labels')
  Map<String, String?>? labels;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'namespace')
  String? namespace;

  @JsonKey(name: 'ownerReferences')
  List<OwnerReference?>? ownerReferences;

  @JsonKey(name: 'resourceVersion')
  String? resourceVersion;

  @JsonKey(name: 'selfLink')
  String? selfLink;

  @JsonKey(name: 'uid')
  String? uid;

  CustomResourceDefinitionMetadata({
    this.annotations,
    this.creationTimestamp,
    this.deletionGracePeriodSeconds,
    this.deletionTimestamp,
    this.finalizers,
    this.generateName,
    this.generation,
    this.labels,
    this.name,
    this.namespace,
    this.ownerReferences,
    this.resourceVersion,
    this.selfLink,
    this.uid,
  });

  factory CustomResourceDefinitionMetadata.fromJson(
    Map<String, dynamic> json,
  ) => _$CustomResourceDefinitionMetadataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CustomResourceDefinitionMetadataToJson(this);
}

@JsonSerializable()
class OwnerReference {
  @JsonKey(name: 'apiVersion')
  String apiVersion;

  @JsonKey(name: 'blockOwnerDeletion')
  bool? blockOwnerDeletion;

  @JsonKey(name: 'controller')
  bool? controller;

  @JsonKey(name: 'kind')
  String kind;

  @JsonKey(name: 'name')
  String name;

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
class CustomResourceDefinitionStatus {
  @JsonKey(name: 'conditions')
  List<Condition?>? conditions;

  @JsonKey(name: 'storedVersions')
  List<String>? storedVersions;

  CustomResourceDefinitionStatus({this.conditions, this.storedVersions});

  factory CustomResourceDefinitionStatus.fromJson(Map<String, dynamic> json) =>
      _$CustomResourceDefinitionStatusFromJson(json);

  Map<String, dynamic> toJson() => _$CustomResourceDefinitionStatusToJson(this);
}

@JsonSerializable()
class Condition {
  @JsonKey(name: 'lastTransitionTime')
  DateTime? lastTransitionTime;

  @JsonKey(name: 'lastUpdateTime')
  DateTime? lastUpdateTime;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'reason')
  String? reason;

  @JsonKey(name: 'status')
  String status;

  @JsonKey(name: 'type')
  String type;

  Condition({
    this.lastTransitionTime,
    this.lastUpdateTime,
    this.message,
    this.reason,
    required this.status,
    required this.type,
  });

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}
