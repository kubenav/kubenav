import 'package:json_annotation/json_annotation.dart';

part 'apiresourcelist_meta_v1.g.dart';

///APIResourceList is a list of APIResource, it is used to expose the name of the resources
///supported in a specific group and version, and if the resource is namespaced.
@JsonSerializable()
class ApiresourcelistMetaV1 {
  ///APIVersion defines the versioned schema of this representation of an object. Servers
  ///should convert recognized schemas to the latest internal value, and may reject
  ///unrecognized values. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
  @JsonKey(name: 'apiVersion')
  ApiVersion? apiVersion;

  ///groupVersion is the group and version this APIResourceList is for.
  @JsonKey(name: 'groupVersion')
  String groupVersion;

  ///Kind is a string value representing the REST resource this object represents. Servers may
  ///infer this from the endpoint the client submits requests to. Cannot be updated. In
  ///CamelCase. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  @JsonKey(name: 'kind')
  Kind? kind;

  ///resources contains the name of the resources and if they are namespaced.
  @JsonKey(name: 'resources')
  List<Resource?> resources;

  ApiresourcelistMetaV1({
    this.apiVersion,
    required this.groupVersion,
    this.kind,
    required this.resources,
  });

  factory ApiresourcelistMetaV1.fromJson(Map<String, dynamic> json) =>
      _$ApiresourcelistMetaV1FromJson(json);

  Map<String, dynamic> toJson() => _$ApiresourcelistMetaV1ToJson(this);
}

///APIVersion defines the versioned schema of this representation of an object. Servers
///should convert recognized schemas to the latest internal value, and may reject
///unrecognized values. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
enum ApiVersion {
  @JsonValue('v1')
  V1,
}

final apiVersionValues = EnumValues({'v1': ApiVersion.V1});

///Kind is a string value representing the REST resource this object represents. Servers may
///infer this from the endpoint the client submits requests to. Cannot be updated. In
///CamelCase. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
enum Kind {
  @JsonValue('APIResourceList')
  API_RESOURCE_LIST,
}

final kindValues = EnumValues({'APIResourceList': Kind.API_RESOURCE_LIST});

@JsonSerializable()
class Resource {
  ///categories is a list of the grouped resources this resource belongs to (e.g. 'all')
  @JsonKey(name: 'categories')
  List<String?>? categories;

  ///group is the preferred group of the resource.  Empty implies the group of the containing
  ///resource list. For subresources, this may have a different value, for example: Scale".
  @JsonKey(name: 'group')
  String? group;

  ///kind is the kind for the resource (e.g. 'Foo' is the kind for a resource 'foo')
  @JsonKey(name: 'kind')
  String kind;

  ///name is the plural name of the resource.
  @JsonKey(name: 'name')
  String name;

  ///namespaced indicates if a resource is namespaced or not.
  @JsonKey(name: 'namespaced')
  bool namespaced;

  ///shortNames is a list of suggested short names of the resource.
  @JsonKey(name: 'shortNames')
  List<String?>? shortNames;

  ///singularName is the singular name of the resource.  This allows clients to handle plural
  ///and singular opaquely. The singularName is more correct for reporting status on a single
  ///item and both singular and plural are allowed from the kubectl CLI interface.
  @JsonKey(name: 'singularName')
  String singularName;

  ///The hash value of the storage version, the version this resource is converted to when
  ///written to the data store. Value must be treated as opaque by clients. Only equality
  ///comparison on the value is valid. This is an alpha feature and may change or be removed
  ///in the future. The field is populated by the apiserver only if the StorageVersionHash
  ///feature gate is enabled. This field will remain optional even if it graduates.
  @JsonKey(name: 'storageVersionHash')
  String? storageVersionHash;

  ///verbs is a list of supported kube verbs (this includes get, list, watch, create, update,
  ///patch, delete, deletecollection, and proxy)
  @JsonKey(name: 'verbs')
  List<String?> verbs;

  ///version is the preferred version of the resource.  Empty implies the version of the
  ///containing resource list For subresources, this may have a different value, for example:
  ///v1 (while inside a v1beta1 version of the core resource's group)".
  @JsonKey(name: 'version')
  String? version;

  Resource({
    this.categories,
    this.group,
    required this.kind,
    required this.name,
    required this.namespaced,
    this.shortNames,
    required this.singularName,
    this.storageVersionHash,
    required this.verbs,
    this.version,
  });

  factory Resource.fromJson(Map<String, dynamic> json) =>
      _$ResourceFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceToJson(this);
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
