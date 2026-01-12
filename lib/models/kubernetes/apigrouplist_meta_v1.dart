import 'package:json_annotation/json_annotation.dart';

part 'apigrouplist_meta_v1.g.dart';

///APIGroupList is a list of APIGroup, to allow clients to discover the API at /apis.
@JsonSerializable()
class ApigrouplistMetaV1 {
  ///APIVersion defines the versioned schema of this representation of an object. Servers
  ///should convert recognized schemas to the latest internal value, and may reject
  ///unrecognized values. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
  @JsonKey(name: 'apiVersion')
  ApiVersion? apiVersion;

  ///groups is a list of APIGroup.
  @JsonKey(name: 'groups')
  List<Group?> groups;

  ///Kind is a string value representing the REST resource this object represents. Servers may
  ///infer this from the endpoint the client submits requests to. Cannot be updated. In
  ///CamelCase. More info:
  ///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  @JsonKey(name: 'kind')
  ApigrouplistMetaV1Kind? kind;

  ApigrouplistMetaV1({this.apiVersion, required this.groups, this.kind});

  factory ApigrouplistMetaV1.fromJson(Map<String, dynamic> json) =>
      _$ApigrouplistMetaV1FromJson(json);

  Map<String, dynamic> toJson() => _$ApigrouplistMetaV1ToJson(this);
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

@JsonSerializable()
class Group {
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
  GroupKind? kind;

  ///name is the name of the group.
  @JsonKey(name: 'name')
  String name;

  ///GroupVersion contains the "group/version" and "version" string of a version. It is made a
  ///struct to keep extensibility.
  @JsonKey(name: 'preferredVersion')
  PreferredVersion? preferredVersion;

  ///a map of client CIDR to server address that is serving this group. This is to help
  ///clients reach servers in the most network-efficient way possible. Clients can use the
  ///appropriate server address as per the CIDR that they match. In case of multiple matches,
  ///clients should use the longest matching CIDR. The server returns only those CIDRs that it
  ///thinks that the client can match. For example: the master will return an internal IP CIDR
  ///only, if the client reaches the server using an internal IP. Server looks at
  ///X-Forwarded-For header or X-Real-Ip header or request.RemoteAddr (in that order) to get
  ///the client IP.
  @JsonKey(name: 'serverAddressByClientCIDRs')
  List<ServerAddressByClientCidr?>? serverAddressByClientCidRs;

  ///versions are the versions supported in this group.
  @JsonKey(name: 'versions')
  List<Version?> versions;

  Group({
    this.apiVersion,
    this.kind,
    required this.name,
    this.preferredVersion,
    this.serverAddressByClientCidRs,
    required this.versions,
  });

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

  Map<String, dynamic> toJson() => _$GroupToJson(this);
}

///Kind is a string value representing the REST resource this object represents. Servers may
///infer this from the endpoint the client submits requests to. Cannot be updated. In
///CamelCase. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
enum GroupKind {
  @JsonValue('APIGroup')
  API_GROUP,
}

final groupKindValues = EnumValues({'APIGroup': GroupKind.API_GROUP});

@JsonSerializable()
class PreferredVersion {
  ///groupVersion specifies the API group and version in the form "group/version"
  @JsonKey(name: 'groupVersion')
  String groupVersion;

  ///version specifies the version in the form of "version". This is to save the clients the
  ///trouble of splitting the GroupVersion.
  @JsonKey(name: 'version')
  String version;

  PreferredVersion({required this.groupVersion, required this.version});

  factory PreferredVersion.fromJson(Map<String, dynamic> json) =>
      _$PreferredVersionFromJson(json);

  Map<String, dynamic> toJson() => _$PreferredVersionToJson(this);
}

@JsonSerializable()
class ServerAddressByClientCidr {
  ///The CIDR with which clients can match their IP to figure out the server address that they
  ///should use.
  @JsonKey(name: 'clientCIDR')
  String clientCidr;

  ///Address of this server, suitable for a client that matches the above CIDR. This can be a
  ///hostname, hostname:port, IP or IP:port.
  @JsonKey(name: 'serverAddress')
  String serverAddress;

  ServerAddressByClientCidr({
    required this.clientCidr,
    required this.serverAddress,
  });

  factory ServerAddressByClientCidr.fromJson(Map<String, dynamic> json) =>
      _$ServerAddressByClientCidrFromJson(json);

  Map<String, dynamic> toJson() => _$ServerAddressByClientCidrToJson(this);
}

@JsonSerializable()
class Version {
  ///groupVersion specifies the API group and version in the form "group/version"
  @JsonKey(name: 'groupVersion')
  String groupVersion;

  ///version specifies the version in the form of "version". This is to save the clients the
  ///trouble of splitting the GroupVersion.
  @JsonKey(name: 'version')
  String version;

  Version({required this.groupVersion, required this.version});

  factory Version.fromJson(Map<String, dynamic> json) =>
      _$VersionFromJson(json);

  Map<String, dynamic> toJson() => _$VersionToJson(this);
}

///Kind is a string value representing the REST resource this object represents. Servers may
///infer this from the endpoint the client submits requests to. Cannot be updated. In
///CamelCase. More info:
///https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
enum ApigrouplistMetaV1Kind {
  @JsonValue('APIGroupList')
  API_GROUP_LIST,
}

final apigrouplistMetaV1KindValues = EnumValues({
  'APIGroupList': ApigrouplistMetaV1Kind.API_GROUP_LIST,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
