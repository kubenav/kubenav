// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challengelist_acme_v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChallengelistAcmeV1 _$ChallengelistAcmeV1FromJson(Map<String, dynamic> json) =>
    ChallengelistAcmeV1(
      apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
      items: (json['items'] as List<dynamic>)
          .map(
            (e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      kind: $enumDecodeNullable(_$ChallengelistAcmeV1KindEnumMap, json['kind']),
      metadata: json['metadata'] == null
          ? null
          : ChallengelistAcmeV1Metadata.fromJson(
              json['metadata'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$ChallengelistAcmeV1ToJson(
  ChallengelistAcmeV1 instance,
) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'items': instance.items,
  'kind': _$ChallengelistAcmeV1KindEnumMap[instance.kind],
  'metadata': instance.metadata,
};

const _$ApiVersionEnumMap = {
  ApiVersion.ACME_CERT_MANAGER_IO_V1: 'acme.cert-manager.io/v1',
};

const _$ChallengelistAcmeV1KindEnumMap = {
  ChallengelistAcmeV1Kind.CHALLENGE_LIST: 'ChallengeList',
};

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
  apiVersion: $enumDecodeNullable(_$ApiVersionEnumMap, json['apiVersion']),
  kind: $enumDecodeNullable(_$ItemKindEnumMap, json['kind']),
  metadata: ItemMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
  spec: ItemSpec.fromJson(json['spec'] as Map<String, dynamic>),
  status: json['status'] == null
      ? null
      : Status.fromJson(json['status'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
  'apiVersion': _$ApiVersionEnumMap[instance.apiVersion],
  'kind': _$ItemKindEnumMap[instance.kind],
  'metadata': instance.metadata,
  'spec': instance.spec,
  'status': instance.status,
};

const _$ItemKindEnumMap = {ItemKind.CHALLENGE: 'Challenge'};

ItemMetadata _$ItemMetadataFromJson(Map<String, dynamic> json) => ItemMetadata(
  annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  creationTimestamp: json['creationTimestamp'] == null
      ? null
      : DateTime.parse(json['creationTimestamp'] as String),
  deletionGracePeriodSeconds: (json['deletionGracePeriodSeconds'] as num?)
      ?.toInt(),
  deletionTimestamp: json['deletionTimestamp'] == null
      ? null
      : DateTime.parse(json['deletionTimestamp'] as String),
  finalizers: (json['finalizers'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  generateName: json['generateName'] as String?,
  generation: (json['generation'] as num?)?.toInt(),
  labels: (json['labels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  managedFields: (json['managedFields'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : ManagedField.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  name: json['name'] as String?,
  namespace: json['namespace'] as String?,
  ownerReferences: (json['ownerReferences'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : OwnerReference.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  resourceVersion: json['resourceVersion'] as String?,
  selfLink: json['selfLink'] as String?,
  uid: json['uid'] as String?,
);

Map<String, dynamic> _$ItemMetadataToJson(ItemMetadata instance) =>
    <String, dynamic>{
      'annotations': instance.annotations,
      'creationTimestamp': instance.creationTimestamp?.toIso8601String(),
      'deletionGracePeriodSeconds': instance.deletionGracePeriodSeconds,
      'deletionTimestamp': instance.deletionTimestamp?.toIso8601String(),
      'finalizers': instance.finalizers,
      'generateName': instance.generateName,
      'generation': instance.generation,
      'labels': instance.labels,
      'managedFields': instance.managedFields,
      'name': instance.name,
      'namespace': instance.namespace,
      'ownerReferences': instance.ownerReferences,
      'resourceVersion': instance.resourceVersion,
      'selfLink': instance.selfLink,
      'uid': instance.uid,
    };

ManagedField _$ManagedFieldFromJson(Map<String, dynamic> json) => ManagedField(
  apiVersion: json['apiVersion'] as String?,
  fieldsType: json['fieldsType'] as String?,
  fieldsV1: json['fieldsV1'] as Map<String, dynamic>?,
  manager: json['manager'] as String?,
  operation: json['operation'] as String?,
  subresource: json['subresource'] as String?,
  time: json['time'] == null ? null : DateTime.parse(json['time'] as String),
);

Map<String, dynamic> _$ManagedFieldToJson(ManagedField instance) =>
    <String, dynamic>{
      'apiVersion': instance.apiVersion,
      'fieldsType': instance.fieldsType,
      'fieldsV1': instance.fieldsV1,
      'manager': instance.manager,
      'operation': instance.operation,
      'subresource': instance.subresource,
      'time': instance.time?.toIso8601String(),
    };

OwnerReference _$OwnerReferenceFromJson(Map<String, dynamic> json) =>
    OwnerReference(
      apiVersion: json['apiVersion'] as String,
      blockOwnerDeletion: json['blockOwnerDeletion'] as bool?,
      controller: json['controller'] as bool?,
      kind: json['kind'] as String,
      name: json['name'] as String,
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$OwnerReferenceToJson(OwnerReference instance) =>
    <String, dynamic>{
      'apiVersion': instance.apiVersion,
      'blockOwnerDeletion': instance.blockOwnerDeletion,
      'controller': instance.controller,
      'kind': instance.kind,
      'name': instance.name,
      'uid': instance.uid,
    };

ItemSpec _$ItemSpecFromJson(Map<String, dynamic> json) => ItemSpec(
  authorizationUrl: json['authorizationURL'] as String,
  dnsName: json['dnsName'] as String,
  issuerRef: IssuerRef.fromJson(json['issuerRef'] as Map<String, dynamic>),
  key: json['key'] as String,
  solver: Solver.fromJson(json['solver'] as Map<String, dynamic>),
  token: json['token'] as String,
  type: $enumDecode(_$TypeEnumMap, json['type']),
  url: json['url'] as String,
  wildcard: json['wildcard'] as bool?,
);

Map<String, dynamic> _$ItemSpecToJson(ItemSpec instance) => <String, dynamic>{
  'authorizationURL': instance.authorizationUrl,
  'dnsName': instance.dnsName,
  'issuerRef': instance.issuerRef,
  'key': instance.key,
  'solver': instance.solver,
  'token': instance.token,
  'type': _$TypeEnumMap[instance.type]!,
  'url': instance.url,
  'wildcard': instance.wildcard,
};

const _$TypeEnumMap = {Type.DNS_01: 'DNS-01', Type.HTTP_01: 'HTTP-01'};

IssuerRef _$IssuerRefFromJson(Map<String, dynamic> json) => IssuerRef(
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  name: json['name'] as String,
);

Map<String, dynamic> _$IssuerRefToJson(IssuerRef instance) => <String, dynamic>{
  'group': instance.group,
  'kind': instance.kind,
  'name': instance.name,
};

Solver _$SolverFromJson(Map<String, dynamic> json) => Solver(
  dns01: json['dns01'] == null
      ? null
      : Dns01.fromJson(json['dns01'] as Map<String, dynamic>),
  http01: json['http01'] == null
      ? null
      : Http01.fromJson(json['http01'] as Map<String, dynamic>),
  selector: json['selector'] == null
      ? null
      : Selector.fromJson(json['selector'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SolverToJson(Solver instance) => <String, dynamic>{
  'dns01': instance.dns01,
  'http01': instance.http01,
  'selector': instance.selector,
};

Dns01 _$Dns01FromJson(Map<String, dynamic> json) => Dns01(
  acmeDns: json['acmeDNS'] == null
      ? null
      : AcmeDns.fromJson(json['acmeDNS'] as Map<String, dynamic>),
  akamai: json['akamai'] == null
      ? null
      : Akamai.fromJson(json['akamai'] as Map<String, dynamic>),
  azureDns: json['azureDNS'] == null
      ? null
      : AzureDns.fromJson(json['azureDNS'] as Map<String, dynamic>),
  cloudDns: json['cloudDNS'] == null
      ? null
      : CloudDns.fromJson(json['cloudDNS'] as Map<String, dynamic>),
  cloudflare: json['cloudflare'] == null
      ? null
      : Cloudflare.fromJson(json['cloudflare'] as Map<String, dynamic>),
  cnameStrategy: $enumDecodeNullable(
    _$CnameStrategyEnumMap,
    json['cnameStrategy'],
  ),
  digitalocean: json['digitalocean'] == null
      ? null
      : Digitalocean.fromJson(json['digitalocean'] as Map<String, dynamic>),
  rfc2136: json['rfc2136'] == null
      ? null
      : Rfc2136.fromJson(json['rfc2136'] as Map<String, dynamic>),
  route53: json['route53'] == null
      ? null
      : Route53.fromJson(json['route53'] as Map<String, dynamic>),
  webhook: json['webhook'] == null
      ? null
      : Webhook.fromJson(json['webhook'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Dns01ToJson(Dns01 instance) => <String, dynamic>{
  'acmeDNS': instance.acmeDns,
  'akamai': instance.akamai,
  'azureDNS': instance.azureDns,
  'cloudDNS': instance.cloudDns,
  'cloudflare': instance.cloudflare,
  'cnameStrategy': _$CnameStrategyEnumMap[instance.cnameStrategy],
  'digitalocean': instance.digitalocean,
  'rfc2136': instance.rfc2136,
  'route53': instance.route53,
  'webhook': instance.webhook,
};

const _$CnameStrategyEnumMap = {
  CnameStrategy.FOLLOW: 'Follow',
  CnameStrategy.NONE: 'None',
};

AcmeDns _$AcmeDnsFromJson(Map<String, dynamic> json) => AcmeDns(
  accountSecretRef: AccountSecretRef.fromJson(
    json['accountSecretRef'] as Map<String, dynamic>,
  ),
  host: json['host'] as String,
);

Map<String, dynamic> _$AcmeDnsToJson(AcmeDns instance) => <String, dynamic>{
  'accountSecretRef': instance.accountSecretRef,
  'host': instance.host,
};

AccountSecretRef _$AccountSecretRefFromJson(Map<String, dynamic> json) =>
    AccountSecretRef(key: json['key'] as String?, name: json['name'] as String);

Map<String, dynamic> _$AccountSecretRefToJson(AccountSecretRef instance) =>
    <String, dynamic>{'key': instance.key, 'name': instance.name};

Akamai _$AkamaiFromJson(Map<String, dynamic> json) => Akamai(
  accessTokenSecretRef: AccessTokenSecretRef.fromJson(
    json['accessTokenSecretRef'] as Map<String, dynamic>,
  ),
  clientSecretSecretRef: AkamaiClientSecretSecretRef.fromJson(
    json['clientSecretSecretRef'] as Map<String, dynamic>,
  ),
  clientTokenSecretRef: ClientTokenSecretRef.fromJson(
    json['clientTokenSecretRef'] as Map<String, dynamic>,
  ),
  serviceConsumerDomain: json['serviceConsumerDomain'] as String,
);

Map<String, dynamic> _$AkamaiToJson(Akamai instance) => <String, dynamic>{
  'accessTokenSecretRef': instance.accessTokenSecretRef,
  'clientSecretSecretRef': instance.clientSecretSecretRef,
  'clientTokenSecretRef': instance.clientTokenSecretRef,
  'serviceConsumerDomain': instance.serviceConsumerDomain,
};

AccessTokenSecretRef _$AccessTokenSecretRefFromJson(
  Map<String, dynamic> json,
) => AccessTokenSecretRef(
  key: json['key'] as String?,
  name: json['name'] as String,
);

Map<String, dynamic> _$AccessTokenSecretRefToJson(
  AccessTokenSecretRef instance,
) => <String, dynamic>{'key': instance.key, 'name': instance.name};

AkamaiClientSecretSecretRef _$AkamaiClientSecretSecretRefFromJson(
  Map<String, dynamic> json,
) => AkamaiClientSecretSecretRef(
  key: json['key'] as String?,
  name: json['name'] as String,
);

Map<String, dynamic> _$AkamaiClientSecretSecretRefToJson(
  AkamaiClientSecretSecretRef instance,
) => <String, dynamic>{'key': instance.key, 'name': instance.name};

ClientTokenSecretRef _$ClientTokenSecretRefFromJson(
  Map<String, dynamic> json,
) => ClientTokenSecretRef(
  key: json['key'] as String?,
  name: json['name'] as String,
);

Map<String, dynamic> _$ClientTokenSecretRefToJson(
  ClientTokenSecretRef instance,
) => <String, dynamic>{'key': instance.key, 'name': instance.name};

AzureDns _$AzureDnsFromJson(Map<String, dynamic> json) => AzureDns(
  clientId: json['clientID'] as String?,
  clientSecretSecretRef: json['clientSecretSecretRef'] == null
      ? null
      : AzureDnsClientSecretSecretRef.fromJson(
          json['clientSecretSecretRef'] as Map<String, dynamic>,
        ),
  environment: $enumDecodeNullable(_$EnvironmentEnumMap, json['environment']),
  hostedZoneName: json['hostedZoneName'] as String?,
  managedIdentity: json['managedIdentity'] == null
      ? null
      : ManagedIdentity.fromJson(
          json['managedIdentity'] as Map<String, dynamic>,
        ),
  resourceGroupName: json['resourceGroupName'] as String,
  subscriptionId: json['subscriptionID'] as String,
  tenantId: json['tenantID'] as String?,
);

Map<String, dynamic> _$AzureDnsToJson(AzureDns instance) => <String, dynamic>{
  'clientID': instance.clientId,
  'clientSecretSecretRef': instance.clientSecretSecretRef,
  'environment': _$EnvironmentEnumMap[instance.environment],
  'hostedZoneName': instance.hostedZoneName,
  'managedIdentity': instance.managedIdentity,
  'resourceGroupName': instance.resourceGroupName,
  'subscriptionID': instance.subscriptionId,
  'tenantID': instance.tenantId,
};

const _$EnvironmentEnumMap = {
  Environment.AZURE_CHINA_CLOUD: 'AzureChinaCloud',
  Environment.AZURE_GERMAN_CLOUD: 'AzureGermanCloud',
  Environment.AZURE_PUBLIC_CLOUD: 'AzurePublicCloud',
  Environment.AZURE_US_GOVERNMENT_CLOUD: 'AzureUSGovernmentCloud',
};

AzureDnsClientSecretSecretRef _$AzureDnsClientSecretSecretRefFromJson(
  Map<String, dynamic> json,
) => AzureDnsClientSecretSecretRef(
  key: json['key'] as String?,
  name: json['name'] as String,
);

Map<String, dynamic> _$AzureDnsClientSecretSecretRefToJson(
  AzureDnsClientSecretSecretRef instance,
) => <String, dynamic>{'key': instance.key, 'name': instance.name};

ManagedIdentity _$ManagedIdentityFromJson(Map<String, dynamic> json) =>
    ManagedIdentity(
      clientId: json['clientID'] as String?,
      resourceId: json['resourceID'] as String?,
      tenantId: json['tenantID'] as String?,
    );

Map<String, dynamic> _$ManagedIdentityToJson(ManagedIdentity instance) =>
    <String, dynamic>{
      'clientID': instance.clientId,
      'resourceID': instance.resourceId,
      'tenantID': instance.tenantId,
    };

CloudDns _$CloudDnsFromJson(Map<String, dynamic> json) => CloudDns(
  hostedZoneName: json['hostedZoneName'] as String?,
  project: json['project'] as String,
  serviceAccountSecretRef: json['serviceAccountSecretRef'] == null
      ? null
      : ServiceAccountSecretRef.fromJson(
          json['serviceAccountSecretRef'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$CloudDnsToJson(CloudDns instance) => <String, dynamic>{
  'hostedZoneName': instance.hostedZoneName,
  'project': instance.project,
  'serviceAccountSecretRef': instance.serviceAccountSecretRef,
};

ServiceAccountSecretRef _$ServiceAccountSecretRefFromJson(
  Map<String, dynamic> json,
) => ServiceAccountSecretRef(
  key: json['key'] as String?,
  name: json['name'] as String,
);

Map<String, dynamic> _$ServiceAccountSecretRefToJson(
  ServiceAccountSecretRef instance,
) => <String, dynamic>{'key': instance.key, 'name': instance.name};

Cloudflare _$CloudflareFromJson(Map<String, dynamic> json) => Cloudflare(
  apiKeySecretRef: json['apiKeySecretRef'] == null
      ? null
      : ApiKeySecretRef.fromJson(
          json['apiKeySecretRef'] as Map<String, dynamic>,
        ),
  apiTokenSecretRef: json['apiTokenSecretRef'] == null
      ? null
      : ApiTokenSecretRef.fromJson(
          json['apiTokenSecretRef'] as Map<String, dynamic>,
        ),
  email: json['email'] as String?,
);

Map<String, dynamic> _$CloudflareToJson(Cloudflare instance) =>
    <String, dynamic>{
      'apiKeySecretRef': instance.apiKeySecretRef,
      'apiTokenSecretRef': instance.apiTokenSecretRef,
      'email': instance.email,
    };

ApiKeySecretRef _$ApiKeySecretRefFromJson(Map<String, dynamic> json) =>
    ApiKeySecretRef(key: json['key'] as String?, name: json['name'] as String);

Map<String, dynamic> _$ApiKeySecretRefToJson(ApiKeySecretRef instance) =>
    <String, dynamic>{'key': instance.key, 'name': instance.name};

ApiTokenSecretRef _$ApiTokenSecretRefFromJson(Map<String, dynamic> json) =>
    ApiTokenSecretRef(
      key: json['key'] as String?,
      name: json['name'] as String,
    );

Map<String, dynamic> _$ApiTokenSecretRefToJson(ApiTokenSecretRef instance) =>
    <String, dynamic>{'key': instance.key, 'name': instance.name};

Digitalocean _$DigitaloceanFromJson(Map<String, dynamic> json) => Digitalocean(
  tokenSecretRef: TokenSecretRef.fromJson(
    json['tokenSecretRef'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$DigitaloceanToJson(Digitalocean instance) =>
    <String, dynamic>{'tokenSecretRef': instance.tokenSecretRef};

TokenSecretRef _$TokenSecretRefFromJson(Map<String, dynamic> json) =>
    TokenSecretRef(key: json['key'] as String?, name: json['name'] as String);

Map<String, dynamic> _$TokenSecretRefToJson(TokenSecretRef instance) =>
    <String, dynamic>{'key': instance.key, 'name': instance.name};

Rfc2136 _$Rfc2136FromJson(Map<String, dynamic> json) => Rfc2136(
  nameserver: json['nameserver'] as String,
  protocol: $enumDecodeNullable(_$ProtocolEnumMap, json['protocol']),
  tsigAlgorithm: json['tsigAlgorithm'] as String?,
  tsigKeyName: json['tsigKeyName'] as String?,
  tsigSecretSecretRef: json['tsigSecretSecretRef'] == null
      ? null
      : TsigSecretSecretRef.fromJson(
          json['tsigSecretSecretRef'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$Rfc2136ToJson(Rfc2136 instance) => <String, dynamic>{
  'nameserver': instance.nameserver,
  'protocol': _$ProtocolEnumMap[instance.protocol],
  'tsigAlgorithm': instance.tsigAlgorithm,
  'tsigKeyName': instance.tsigKeyName,
  'tsigSecretSecretRef': instance.tsigSecretSecretRef,
};

const _$ProtocolEnumMap = {Protocol.TCP: 'TCP', Protocol.UDP: 'UDP'};

TsigSecretSecretRef _$TsigSecretSecretRefFromJson(Map<String, dynamic> json) =>
    TsigSecretSecretRef(
      key: json['key'] as String?,
      name: json['name'] as String,
    );

Map<String, dynamic> _$TsigSecretSecretRefToJson(
  TsigSecretSecretRef instance,
) => <String, dynamic>{'key': instance.key, 'name': instance.name};

Route53 _$Route53FromJson(Map<String, dynamic> json) => Route53(
  accessKeyId: json['accessKeyID'] as String?,
  accessKeyIdSecretRef: json['accessKeyIDSecretRef'] == null
      ? null
      : AccessKeyIdSecretRef.fromJson(
          json['accessKeyIDSecretRef'] as Map<String, dynamic>,
        ),
  auth: json['auth'] == null
      ? null
      : Auth.fromJson(json['auth'] as Map<String, dynamic>),
  hostedZoneId: json['hostedZoneID'] as String?,
  region: json['region'] as String?,
  role: json['role'] as String?,
  secretAccessKeySecretRef: json['secretAccessKeySecretRef'] == null
      ? null
      : SecretAccessKeySecretRef.fromJson(
          json['secretAccessKeySecretRef'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$Route53ToJson(Route53 instance) => <String, dynamic>{
  'accessKeyID': instance.accessKeyId,
  'accessKeyIDSecretRef': instance.accessKeyIdSecretRef,
  'auth': instance.auth,
  'hostedZoneID': instance.hostedZoneId,
  'region': instance.region,
  'role': instance.role,
  'secretAccessKeySecretRef': instance.secretAccessKeySecretRef,
};

AccessKeyIdSecretRef _$AccessKeyIdSecretRefFromJson(
  Map<String, dynamic> json,
) => AccessKeyIdSecretRef(
  key: json['key'] as String?,
  name: json['name'] as String,
);

Map<String, dynamic> _$AccessKeyIdSecretRefToJson(
  AccessKeyIdSecretRef instance,
) => <String, dynamic>{'key': instance.key, 'name': instance.name};

Auth _$AuthFromJson(Map<String, dynamic> json) => Auth(
  kubernetes: Kubernetes.fromJson(json['kubernetes'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AuthToJson(Auth instance) => <String, dynamic>{
  'kubernetes': instance.kubernetes,
};

Kubernetes _$KubernetesFromJson(Map<String, dynamic> json) => Kubernetes(
  serviceAccountRef: ServiceAccountRef.fromJson(
    json['serviceAccountRef'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$KubernetesToJson(Kubernetes instance) =>
    <String, dynamic>{'serviceAccountRef': instance.serviceAccountRef};

ServiceAccountRef _$ServiceAccountRefFromJson(Map<String, dynamic> json) =>
    ServiceAccountRef(
      audiences: (json['audiences'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$ServiceAccountRefToJson(ServiceAccountRef instance) =>
    <String, dynamic>{'audiences': instance.audiences, 'name': instance.name};

SecretAccessKeySecretRef _$SecretAccessKeySecretRefFromJson(
  Map<String, dynamic> json,
) => SecretAccessKeySecretRef(
  key: json['key'] as String?,
  name: json['name'] as String,
);

Map<String, dynamic> _$SecretAccessKeySecretRefToJson(
  SecretAccessKeySecretRef instance,
) => <String, dynamic>{'key': instance.key, 'name': instance.name};

Webhook _$WebhookFromJson(Map<String, dynamic> json) => Webhook(
  config: json['config'],
  groupName: json['groupName'] as String,
  solverName: json['solverName'] as String,
);

Map<String, dynamic> _$WebhookToJson(Webhook instance) => <String, dynamic>{
  'config': instance.config,
  'groupName': instance.groupName,
  'solverName': instance.solverName,
};

Http01 _$Http01FromJson(Map<String, dynamic> json) => Http01(
  gatewayHttpRoute: json['gatewayHTTPRoute'] == null
      ? null
      : GatewayHttpRoute.fromJson(
          json['gatewayHTTPRoute'] as Map<String, dynamic>,
        ),
  ingress: json['ingress'] == null
      ? null
      : Ingress.fromJson(json['ingress'] as Map<String, dynamic>),
);

Map<String, dynamic> _$Http01ToJson(Http01 instance) => <String, dynamic>{
  'gatewayHTTPRoute': instance.gatewayHttpRoute,
  'ingress': instance.ingress,
};

GatewayHttpRoute _$GatewayHttpRouteFromJson(Map<String, dynamic> json) =>
    GatewayHttpRoute(
      labels: (json['labels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      parentRefs: (json['parentRefs'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : ParentRef.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      podTemplate: json['podTemplate'] == null
          ? null
          : GatewayHttpRoutePodTemplate.fromJson(
              json['podTemplate'] as Map<String, dynamic>,
            ),
      serviceType: json['serviceType'] as String?,
    );

Map<String, dynamic> _$GatewayHttpRouteToJson(GatewayHttpRoute instance) =>
    <String, dynamic>{
      'labels': instance.labels,
      'parentRefs': instance.parentRefs,
      'podTemplate': instance.podTemplate,
      'serviceType': instance.serviceType,
    };

ParentRef _$ParentRefFromJson(Map<String, dynamic> json) => ParentRef(
  group: json['group'] as String?,
  kind: json['kind'] as String?,
  name: json['name'] as String,
  namespace: json['namespace'] as String?,
  port: (json['port'] as num?)?.toInt(),
  sectionName: json['sectionName'] as String?,
);

Map<String, dynamic> _$ParentRefToJson(ParentRef instance) => <String, dynamic>{
  'group': instance.group,
  'kind': instance.kind,
  'name': instance.name,
  'namespace': instance.namespace,
  'port': instance.port,
  'sectionName': instance.sectionName,
};

GatewayHttpRoutePodTemplate _$GatewayHttpRoutePodTemplateFromJson(
  Map<String, dynamic> json,
) => GatewayHttpRoutePodTemplate(
  metadata: json['metadata'] == null
      ? null
      : PurpleMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
  spec: json['spec'] == null
      ? null
      : PurpleSpec.fromJson(json['spec'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GatewayHttpRoutePodTemplateToJson(
  GatewayHttpRoutePodTemplate instance,
) => <String, dynamic>{'metadata': instance.metadata, 'spec': instance.spec};

PurpleMetadata _$PurpleMetadataFromJson(Map<String, dynamic> json) =>
    PurpleMetadata(
      annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      labels: (json['labels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
    );

Map<String, dynamic> _$PurpleMetadataToJson(PurpleMetadata instance) =>
    <String, dynamic>{
      'annotations': instance.annotations,
      'labels': instance.labels,
    };

PurpleSpec _$PurpleSpecFromJson(Map<String, dynamic> json) => PurpleSpec(
  affinity: json['affinity'] == null
      ? null
      : PurpleAffinity.fromJson(json['affinity'] as Map<String, dynamic>),
  imagePullSecrets: (json['imagePullSecrets'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : PurpleImagePullSecret.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  nodeSelector: (json['nodeSelector'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  priorityClassName: json['priorityClassName'] as String?,
  resources: json['resources'] == null
      ? null
      : PurpleResources.fromJson(json['resources'] as Map<String, dynamic>),
  securityContext: json['securityContext'] == null
      ? null
      : PurpleSecurityContext.fromJson(
          json['securityContext'] as Map<String, dynamic>,
        ),
  serviceAccountName: json['serviceAccountName'] as String?,
  tolerations: (json['tolerations'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : PurpleToleration.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$PurpleSpecToJson(PurpleSpec instance) =>
    <String, dynamic>{
      'affinity': instance.affinity,
      'imagePullSecrets': instance.imagePullSecrets,
      'nodeSelector': instance.nodeSelector,
      'priorityClassName': instance.priorityClassName,
      'resources': instance.resources,
      'securityContext': instance.securityContext,
      'serviceAccountName': instance.serviceAccountName,
      'tolerations': instance.tolerations,
    };

PurpleAffinity _$PurpleAffinityFromJson(Map<String, dynamic> json) =>
    PurpleAffinity(
      nodeAffinity: json['nodeAffinity'] == null
          ? null
          : PurpleNodeAffinity.fromJson(
              json['nodeAffinity'] as Map<String, dynamic>,
            ),
      podAffinity: json['podAffinity'] == null
          ? null
          : PurplePodAffinity.fromJson(
              json['podAffinity'] as Map<String, dynamic>,
            ),
      podAntiAffinity: json['podAntiAffinity'] == null
          ? null
          : PurplePodAntiAffinity.fromJson(
              json['podAntiAffinity'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$PurpleAffinityToJson(PurpleAffinity instance) =>
    <String, dynamic>{
      'nodeAffinity': instance.nodeAffinity,
      'podAffinity': instance.podAffinity,
      'podAntiAffinity': instance.podAntiAffinity,
    };

PurpleNodeAffinity _$PurpleNodeAffinityFromJson(
  Map<String, dynamic> json,
) => PurpleNodeAffinity(
  preferredDuringSchedulingIgnoredDuringExecution:
      (json['preferredDuringSchedulingIgnoredDuringExecution']
              as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : PurplePreferredDuringSchedulingIgnoredDuringExecution.fromJson(
                    e as Map<String, dynamic>,
                  ),
          )
          .toList(),
  requiredDuringSchedulingIgnoredDuringExecution:
      json['requiredDuringSchedulingIgnoredDuringExecution'] == null
      ? null
      : PurpleRequiredDuringSchedulingIgnoredDuringExecution.fromJson(
          json['requiredDuringSchedulingIgnoredDuringExecution']
              as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$PurpleNodeAffinityToJson(PurpleNodeAffinity instance) =>
    <String, dynamic>{
      'preferredDuringSchedulingIgnoredDuringExecution':
          instance.preferredDuringSchedulingIgnoredDuringExecution,
      'requiredDuringSchedulingIgnoredDuringExecution':
          instance.requiredDuringSchedulingIgnoredDuringExecution,
    };

PurplePreferredDuringSchedulingIgnoredDuringExecution
_$PurplePreferredDuringSchedulingIgnoredDuringExecutionFromJson(
  Map<String, dynamic> json,
) => PurplePreferredDuringSchedulingIgnoredDuringExecution(
  preference: PurplePreference.fromJson(
    json['preference'] as Map<String, dynamic>,
  ),
  weight: (json['weight'] as num).toInt(),
);

Map<String, dynamic>
_$PurplePreferredDuringSchedulingIgnoredDuringExecutionToJson(
  PurplePreferredDuringSchedulingIgnoredDuringExecution instance,
) => <String, dynamic>{
  'preference': instance.preference,
  'weight': instance.weight,
};

PurplePreference _$PurplePreferenceFromJson(Map<String, dynamic> json) =>
    PurplePreference(
      matchExpressions: (json['matchExpressions'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : PurpleMatchExpression.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      matchFields: (json['matchFields'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : PurpleMatchField.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$PurplePreferenceToJson(PurplePreference instance) =>
    <String, dynamic>{
      'matchExpressions': instance.matchExpressions,
      'matchFields': instance.matchFields,
    };

PurpleMatchExpression _$PurpleMatchExpressionFromJson(
  Map<String, dynamic> json,
) => PurpleMatchExpression(
  key: json['key'] as String,
  matchExpressionOperator: json['operator'] as String,
  values: (json['values'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$PurpleMatchExpressionToJson(
  PurpleMatchExpression instance,
) => <String, dynamic>{
  'key': instance.key,
  'operator': instance.matchExpressionOperator,
  'values': instance.values,
};

PurpleMatchField _$PurpleMatchFieldFromJson(Map<String, dynamic> json) =>
    PurpleMatchField(
      key: json['key'] as String,
      matchFieldOperator: json['operator'] as String,
      values: (json['values'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$PurpleMatchFieldToJson(PurpleMatchField instance) =>
    <String, dynamic>{
      'key': instance.key,
      'operator': instance.matchFieldOperator,
      'values': instance.values,
    };

PurpleRequiredDuringSchedulingIgnoredDuringExecution
_$PurpleRequiredDuringSchedulingIgnoredDuringExecutionFromJson(
  Map<String, dynamic> json,
) => PurpleRequiredDuringSchedulingIgnoredDuringExecution(
  nodeSelectorTerms: (json['nodeSelectorTerms'] as List<dynamic>)
      .map(
        (e) => e == null
            ? null
            : PurpleNodeSelectorTerm.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic>
_$PurpleRequiredDuringSchedulingIgnoredDuringExecutionToJson(
  PurpleRequiredDuringSchedulingIgnoredDuringExecution instance,
) => <String, dynamic>{'nodeSelectorTerms': instance.nodeSelectorTerms};

PurpleNodeSelectorTerm _$PurpleNodeSelectorTermFromJson(
  Map<String, dynamic> json,
) => PurpleNodeSelectorTerm(
  matchExpressions: (json['matchExpressions'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FluffyMatchExpression.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  matchFields: (json['matchFields'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FluffyMatchField.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$PurpleNodeSelectorTermToJson(
  PurpleNodeSelectorTerm instance,
) => <String, dynamic>{
  'matchExpressions': instance.matchExpressions,
  'matchFields': instance.matchFields,
};

FluffyMatchExpression _$FluffyMatchExpressionFromJson(
  Map<String, dynamic> json,
) => FluffyMatchExpression(
  key: json['key'] as String,
  matchExpressionOperator: json['operator'] as String,
  values: (json['values'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$FluffyMatchExpressionToJson(
  FluffyMatchExpression instance,
) => <String, dynamic>{
  'key': instance.key,
  'operator': instance.matchExpressionOperator,
  'values': instance.values,
};

FluffyMatchField _$FluffyMatchFieldFromJson(Map<String, dynamic> json) =>
    FluffyMatchField(
      key: json['key'] as String,
      matchFieldOperator: json['operator'] as String,
      values: (json['values'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$FluffyMatchFieldToJson(FluffyMatchField instance) =>
    <String, dynamic>{
      'key': instance.key,
      'operator': instance.matchFieldOperator,
      'values': instance.values,
    };

PurplePodAffinity _$PurplePodAffinityFromJson(
  Map<String, dynamic> json,
) => PurplePodAffinity(
  preferredDuringSchedulingIgnoredDuringExecution:
      (json['preferredDuringSchedulingIgnoredDuringExecution']
              as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : FluffyPreferredDuringSchedulingIgnoredDuringExecution.fromJson(
                    e as Map<String, dynamic>,
                  ),
          )
          .toList(),
  requiredDuringSchedulingIgnoredDuringExecution:
      (json['requiredDuringSchedulingIgnoredDuringExecution'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : FluffyRequiredDuringSchedulingIgnoredDuringExecution.fromJson(
                    e as Map<String, dynamic>,
                  ),
          )
          .toList(),
);

Map<String, dynamic> _$PurplePodAffinityToJson(PurplePodAffinity instance) =>
    <String, dynamic>{
      'preferredDuringSchedulingIgnoredDuringExecution':
          instance.preferredDuringSchedulingIgnoredDuringExecution,
      'requiredDuringSchedulingIgnoredDuringExecution':
          instance.requiredDuringSchedulingIgnoredDuringExecution,
    };

FluffyPreferredDuringSchedulingIgnoredDuringExecution
_$FluffyPreferredDuringSchedulingIgnoredDuringExecutionFromJson(
  Map<String, dynamic> json,
) => FluffyPreferredDuringSchedulingIgnoredDuringExecution(
  podAffinityTerm: PurplePodAffinityTerm.fromJson(
    json['podAffinityTerm'] as Map<String, dynamic>,
  ),
  weight: (json['weight'] as num).toInt(),
);

Map<String, dynamic>
_$FluffyPreferredDuringSchedulingIgnoredDuringExecutionToJson(
  FluffyPreferredDuringSchedulingIgnoredDuringExecution instance,
) => <String, dynamic>{
  'podAffinityTerm': instance.podAffinityTerm,
  'weight': instance.weight,
};

PurplePodAffinityTerm _$PurplePodAffinityTermFromJson(
  Map<String, dynamic> json,
) => PurplePodAffinityTerm(
  labelSelector: json['labelSelector'] == null
      ? null
      : PurpleLabelSelector.fromJson(
          json['labelSelector'] as Map<String, dynamic>,
        ),
  matchLabelKeys: (json['matchLabelKeys'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  mismatchLabelKeys: (json['mismatchLabelKeys'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  namespaces: (json['namespaces'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  namespaceSelector: json['namespaceSelector'] == null
      ? null
      : PurpleNamespaceSelector.fromJson(
          json['namespaceSelector'] as Map<String, dynamic>,
        ),
  topologyKey: json['topologyKey'] as String,
);

Map<String, dynamic> _$PurplePodAffinityTermToJson(
  PurplePodAffinityTerm instance,
) => <String, dynamic>{
  'labelSelector': instance.labelSelector,
  'matchLabelKeys': instance.matchLabelKeys,
  'mismatchLabelKeys': instance.mismatchLabelKeys,
  'namespaces': instance.namespaces,
  'namespaceSelector': instance.namespaceSelector,
  'topologyKey': instance.topologyKey,
};

PurpleLabelSelector _$PurpleLabelSelectorFromJson(Map<String, dynamic> json) =>
    PurpleLabelSelector(
      matchExpressions: (json['matchExpressions'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : TentacledMatchExpression.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      matchLabels: (json['matchLabels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
    );

Map<String, dynamic> _$PurpleLabelSelectorToJson(
  PurpleLabelSelector instance,
) => <String, dynamic>{
  'matchExpressions': instance.matchExpressions,
  'matchLabels': instance.matchLabels,
};

TentacledMatchExpression _$TentacledMatchExpressionFromJson(
  Map<String, dynamic> json,
) => TentacledMatchExpression(
  key: json['key'] as String,
  matchExpressionOperator: json['operator'] as String,
  values: (json['values'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$TentacledMatchExpressionToJson(
  TentacledMatchExpression instance,
) => <String, dynamic>{
  'key': instance.key,
  'operator': instance.matchExpressionOperator,
  'values': instance.values,
};

PurpleNamespaceSelector _$PurpleNamespaceSelectorFromJson(
  Map<String, dynamic> json,
) => PurpleNamespaceSelector(
  matchExpressions: (json['matchExpressions'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : StickyMatchExpression.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  matchLabels: (json['matchLabels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$PurpleNamespaceSelectorToJson(
  PurpleNamespaceSelector instance,
) => <String, dynamic>{
  'matchExpressions': instance.matchExpressions,
  'matchLabels': instance.matchLabels,
};

StickyMatchExpression _$StickyMatchExpressionFromJson(
  Map<String, dynamic> json,
) => StickyMatchExpression(
  key: json['key'] as String,
  matchExpressionOperator: json['operator'] as String,
  values: (json['values'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$StickyMatchExpressionToJson(
  StickyMatchExpression instance,
) => <String, dynamic>{
  'key': instance.key,
  'operator': instance.matchExpressionOperator,
  'values': instance.values,
};

FluffyRequiredDuringSchedulingIgnoredDuringExecution
_$FluffyRequiredDuringSchedulingIgnoredDuringExecutionFromJson(
  Map<String, dynamic> json,
) => FluffyRequiredDuringSchedulingIgnoredDuringExecution(
  labelSelector: json['labelSelector'] == null
      ? null
      : FluffyLabelSelector.fromJson(
          json['labelSelector'] as Map<String, dynamic>,
        ),
  matchLabelKeys: (json['matchLabelKeys'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  mismatchLabelKeys: (json['mismatchLabelKeys'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  namespaces: (json['namespaces'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  namespaceSelector: json['namespaceSelector'] == null
      ? null
      : FluffyNamespaceSelector.fromJson(
          json['namespaceSelector'] as Map<String, dynamic>,
        ),
  topologyKey: json['topologyKey'] as String,
);

Map<String, dynamic>
_$FluffyRequiredDuringSchedulingIgnoredDuringExecutionToJson(
  FluffyRequiredDuringSchedulingIgnoredDuringExecution instance,
) => <String, dynamic>{
  'labelSelector': instance.labelSelector,
  'matchLabelKeys': instance.matchLabelKeys,
  'mismatchLabelKeys': instance.mismatchLabelKeys,
  'namespaces': instance.namespaces,
  'namespaceSelector': instance.namespaceSelector,
  'topologyKey': instance.topologyKey,
};

FluffyLabelSelector _$FluffyLabelSelectorFromJson(Map<String, dynamic> json) =>
    FluffyLabelSelector(
      matchExpressions: (json['matchExpressions'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : IndigoMatchExpression.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      matchLabels: (json['matchLabels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
    );

Map<String, dynamic> _$FluffyLabelSelectorToJson(
  FluffyLabelSelector instance,
) => <String, dynamic>{
  'matchExpressions': instance.matchExpressions,
  'matchLabels': instance.matchLabels,
};

IndigoMatchExpression _$IndigoMatchExpressionFromJson(
  Map<String, dynamic> json,
) => IndigoMatchExpression(
  key: json['key'] as String,
  matchExpressionOperator: json['operator'] as String,
  values: (json['values'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$IndigoMatchExpressionToJson(
  IndigoMatchExpression instance,
) => <String, dynamic>{
  'key': instance.key,
  'operator': instance.matchExpressionOperator,
  'values': instance.values,
};

FluffyNamespaceSelector _$FluffyNamespaceSelectorFromJson(
  Map<String, dynamic> json,
) => FluffyNamespaceSelector(
  matchExpressions: (json['matchExpressions'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : IndecentMatchExpression.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  matchLabels: (json['matchLabels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$FluffyNamespaceSelectorToJson(
  FluffyNamespaceSelector instance,
) => <String, dynamic>{
  'matchExpressions': instance.matchExpressions,
  'matchLabels': instance.matchLabels,
};

IndecentMatchExpression _$IndecentMatchExpressionFromJson(
  Map<String, dynamic> json,
) => IndecentMatchExpression(
  key: json['key'] as String,
  matchExpressionOperator: json['operator'] as String,
  values: (json['values'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$IndecentMatchExpressionToJson(
  IndecentMatchExpression instance,
) => <String, dynamic>{
  'key': instance.key,
  'operator': instance.matchExpressionOperator,
  'values': instance.values,
};

PurplePodAntiAffinity _$PurplePodAntiAffinityFromJson(
  Map<String, dynamic> json,
) => PurplePodAntiAffinity(
  preferredDuringSchedulingIgnoredDuringExecution:
      (json['preferredDuringSchedulingIgnoredDuringExecution']
              as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : TentacledPreferredDuringSchedulingIgnoredDuringExecution.fromJson(
                    e as Map<String, dynamic>,
                  ),
          )
          .toList(),
  requiredDuringSchedulingIgnoredDuringExecution:
      (json['requiredDuringSchedulingIgnoredDuringExecution'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : TentacledRequiredDuringSchedulingIgnoredDuringExecution.fromJson(
                    e as Map<String, dynamic>,
                  ),
          )
          .toList(),
);

Map<String, dynamic> _$PurplePodAntiAffinityToJson(
  PurplePodAntiAffinity instance,
) => <String, dynamic>{
  'preferredDuringSchedulingIgnoredDuringExecution':
      instance.preferredDuringSchedulingIgnoredDuringExecution,
  'requiredDuringSchedulingIgnoredDuringExecution':
      instance.requiredDuringSchedulingIgnoredDuringExecution,
};

TentacledPreferredDuringSchedulingIgnoredDuringExecution
_$TentacledPreferredDuringSchedulingIgnoredDuringExecutionFromJson(
  Map<String, dynamic> json,
) => TentacledPreferredDuringSchedulingIgnoredDuringExecution(
  podAffinityTerm: FluffyPodAffinityTerm.fromJson(
    json['podAffinityTerm'] as Map<String, dynamic>,
  ),
  weight: (json['weight'] as num).toInt(),
);

Map<String, dynamic>
_$TentacledPreferredDuringSchedulingIgnoredDuringExecutionToJson(
  TentacledPreferredDuringSchedulingIgnoredDuringExecution instance,
) => <String, dynamic>{
  'podAffinityTerm': instance.podAffinityTerm,
  'weight': instance.weight,
};

FluffyPodAffinityTerm _$FluffyPodAffinityTermFromJson(
  Map<String, dynamic> json,
) => FluffyPodAffinityTerm(
  labelSelector: json['labelSelector'] == null
      ? null
      : TentacledLabelSelector.fromJson(
          json['labelSelector'] as Map<String, dynamic>,
        ),
  matchLabelKeys: (json['matchLabelKeys'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  mismatchLabelKeys: (json['mismatchLabelKeys'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  namespaces: (json['namespaces'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  namespaceSelector: json['namespaceSelector'] == null
      ? null
      : TentacledNamespaceSelector.fromJson(
          json['namespaceSelector'] as Map<String, dynamic>,
        ),
  topologyKey: json['topologyKey'] as String,
);

Map<String, dynamic> _$FluffyPodAffinityTermToJson(
  FluffyPodAffinityTerm instance,
) => <String, dynamic>{
  'labelSelector': instance.labelSelector,
  'matchLabelKeys': instance.matchLabelKeys,
  'mismatchLabelKeys': instance.mismatchLabelKeys,
  'namespaces': instance.namespaces,
  'namespaceSelector': instance.namespaceSelector,
  'topologyKey': instance.topologyKey,
};

TentacledLabelSelector _$TentacledLabelSelectorFromJson(
  Map<String, dynamic> json,
) => TentacledLabelSelector(
  matchExpressions: (json['matchExpressions'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : HilariousMatchExpression.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  matchLabels: (json['matchLabels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$TentacledLabelSelectorToJson(
  TentacledLabelSelector instance,
) => <String, dynamic>{
  'matchExpressions': instance.matchExpressions,
  'matchLabels': instance.matchLabels,
};

HilariousMatchExpression _$HilariousMatchExpressionFromJson(
  Map<String, dynamic> json,
) => HilariousMatchExpression(
  key: json['key'] as String,
  matchExpressionOperator: json['operator'] as String,
  values: (json['values'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$HilariousMatchExpressionToJson(
  HilariousMatchExpression instance,
) => <String, dynamic>{
  'key': instance.key,
  'operator': instance.matchExpressionOperator,
  'values': instance.values,
};

TentacledNamespaceSelector _$TentacledNamespaceSelectorFromJson(
  Map<String, dynamic> json,
) => TentacledNamespaceSelector(
  matchExpressions: (json['matchExpressions'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : AmbitiousMatchExpression.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  matchLabels: (json['matchLabels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$TentacledNamespaceSelectorToJson(
  TentacledNamespaceSelector instance,
) => <String, dynamic>{
  'matchExpressions': instance.matchExpressions,
  'matchLabels': instance.matchLabels,
};

AmbitiousMatchExpression _$AmbitiousMatchExpressionFromJson(
  Map<String, dynamic> json,
) => AmbitiousMatchExpression(
  key: json['key'] as String,
  matchExpressionOperator: json['operator'] as String,
  values: (json['values'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$AmbitiousMatchExpressionToJson(
  AmbitiousMatchExpression instance,
) => <String, dynamic>{
  'key': instance.key,
  'operator': instance.matchExpressionOperator,
  'values': instance.values,
};

TentacledRequiredDuringSchedulingIgnoredDuringExecution
_$TentacledRequiredDuringSchedulingIgnoredDuringExecutionFromJson(
  Map<String, dynamic> json,
) => TentacledRequiredDuringSchedulingIgnoredDuringExecution(
  labelSelector: json['labelSelector'] == null
      ? null
      : StickyLabelSelector.fromJson(
          json['labelSelector'] as Map<String, dynamic>,
        ),
  matchLabelKeys: (json['matchLabelKeys'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  mismatchLabelKeys: (json['mismatchLabelKeys'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  namespaces: (json['namespaces'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  namespaceSelector: json['namespaceSelector'] == null
      ? null
      : StickyNamespaceSelector.fromJson(
          json['namespaceSelector'] as Map<String, dynamic>,
        ),
  topologyKey: json['topologyKey'] as String,
);

Map<String, dynamic>
_$TentacledRequiredDuringSchedulingIgnoredDuringExecutionToJson(
  TentacledRequiredDuringSchedulingIgnoredDuringExecution instance,
) => <String, dynamic>{
  'labelSelector': instance.labelSelector,
  'matchLabelKeys': instance.matchLabelKeys,
  'mismatchLabelKeys': instance.mismatchLabelKeys,
  'namespaces': instance.namespaces,
  'namespaceSelector': instance.namespaceSelector,
  'topologyKey': instance.topologyKey,
};

StickyLabelSelector _$StickyLabelSelectorFromJson(Map<String, dynamic> json) =>
    StickyLabelSelector(
      matchExpressions: (json['matchExpressions'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : CunningMatchExpression.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      matchLabels: (json['matchLabels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
    );

Map<String, dynamic> _$StickyLabelSelectorToJson(
  StickyLabelSelector instance,
) => <String, dynamic>{
  'matchExpressions': instance.matchExpressions,
  'matchLabels': instance.matchLabels,
};

CunningMatchExpression _$CunningMatchExpressionFromJson(
  Map<String, dynamic> json,
) => CunningMatchExpression(
  key: json['key'] as String,
  matchExpressionOperator: json['operator'] as String,
  values: (json['values'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$CunningMatchExpressionToJson(
  CunningMatchExpression instance,
) => <String, dynamic>{
  'key': instance.key,
  'operator': instance.matchExpressionOperator,
  'values': instance.values,
};

StickyNamespaceSelector _$StickyNamespaceSelectorFromJson(
  Map<String, dynamic> json,
) => StickyNamespaceSelector(
  matchExpressions: (json['matchExpressions'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : MagentaMatchExpression.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  matchLabels: (json['matchLabels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$StickyNamespaceSelectorToJson(
  StickyNamespaceSelector instance,
) => <String, dynamic>{
  'matchExpressions': instance.matchExpressions,
  'matchLabels': instance.matchLabels,
};

MagentaMatchExpression _$MagentaMatchExpressionFromJson(
  Map<String, dynamic> json,
) => MagentaMatchExpression(
  key: json['key'] as String,
  matchExpressionOperator: json['operator'] as String,
  values: (json['values'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$MagentaMatchExpressionToJson(
  MagentaMatchExpression instance,
) => <String, dynamic>{
  'key': instance.key,
  'operator': instance.matchExpressionOperator,
  'values': instance.values,
};

PurpleImagePullSecret _$PurpleImagePullSecretFromJson(
  Map<String, dynamic> json,
) => PurpleImagePullSecret(name: json['name'] as String?);

Map<String, dynamic> _$PurpleImagePullSecretToJson(
  PurpleImagePullSecret instance,
) => <String, dynamic>{'name': instance.name};

PurpleResources _$PurpleResourcesFromJson(Map<String, dynamic> json) =>
    PurpleResources(
      limits: json['limits'] as Map<String, dynamic>?,
      requests: json['requests'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$PurpleResourcesToJson(PurpleResources instance) =>
    <String, dynamic>{'limits': instance.limits, 'requests': instance.requests};

PurpleSecurityContext _$PurpleSecurityContextFromJson(
  Map<String, dynamic> json,
) => PurpleSecurityContext(
  fsGroup: (json['fsGroup'] as num?)?.toInt(),
  fsGroupChangePolicy: json['fsGroupChangePolicy'] as String?,
  runAsGroup: (json['runAsGroup'] as num?)?.toInt(),
  runAsNonRoot: json['runAsNonRoot'] as bool?,
  runAsUser: (json['runAsUser'] as num?)?.toInt(),
  seccompProfile: json['seccompProfile'] == null
      ? null
      : PurpleSeccompProfile.fromJson(
          json['seccompProfile'] as Map<String, dynamic>,
        ),
  seLinuxOptions: json['seLinuxOptions'] == null
      ? null
      : PurpleSeLinuxOptions.fromJson(
          json['seLinuxOptions'] as Map<String, dynamic>,
        ),
  supplementalGroups: (json['supplementalGroups'] as List<dynamic>?)
      ?.map((e) => (e as num?)?.toInt())
      .toList(),
  sysctls: (json['sysctls'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : PurpleSysctl.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$PurpleSecurityContextToJson(
  PurpleSecurityContext instance,
) => <String, dynamic>{
  'fsGroup': instance.fsGroup,
  'fsGroupChangePolicy': instance.fsGroupChangePolicy,
  'runAsGroup': instance.runAsGroup,
  'runAsNonRoot': instance.runAsNonRoot,
  'runAsUser': instance.runAsUser,
  'seccompProfile': instance.seccompProfile,
  'seLinuxOptions': instance.seLinuxOptions,
  'supplementalGroups': instance.supplementalGroups,
  'sysctls': instance.sysctls,
};

PurpleSeLinuxOptions _$PurpleSeLinuxOptionsFromJson(
  Map<String, dynamic> json,
) => PurpleSeLinuxOptions(
  level: json['level'] as String?,
  role: json['role'] as String?,
  type: json['type'] as String?,
  user: json['user'] as String?,
);

Map<String, dynamic> _$PurpleSeLinuxOptionsToJson(
  PurpleSeLinuxOptions instance,
) => <String, dynamic>{
  'level': instance.level,
  'role': instance.role,
  'type': instance.type,
  'user': instance.user,
};

PurpleSeccompProfile _$PurpleSeccompProfileFromJson(
  Map<String, dynamic> json,
) => PurpleSeccompProfile(
  localhostProfile: json['localhostProfile'] as String?,
  type: json['type'] as String,
);

Map<String, dynamic> _$PurpleSeccompProfileToJson(
  PurpleSeccompProfile instance,
) => <String, dynamic>{
  'localhostProfile': instance.localhostProfile,
  'type': instance.type,
};

PurpleSysctl _$PurpleSysctlFromJson(Map<String, dynamic> json) =>
    PurpleSysctl(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$PurpleSysctlToJson(PurpleSysctl instance) =>
    <String, dynamic>{'name': instance.name, 'value': instance.value};

PurpleToleration _$PurpleTolerationFromJson(Map<String, dynamic> json) =>
    PurpleToleration(
      effect: json['effect'] as String?,
      key: json['key'] as String?,
      tolerationOperator: json['operator'] as String?,
      tolerationSeconds: (json['tolerationSeconds'] as num?)?.toInt(),
      value: json['value'] as String?,
    );

Map<String, dynamic> _$PurpleTolerationToJson(PurpleToleration instance) =>
    <String, dynamic>{
      'effect': instance.effect,
      'key': instance.key,
      'operator': instance.tolerationOperator,
      'tolerationSeconds': instance.tolerationSeconds,
      'value': instance.value,
    };

Ingress _$IngressFromJson(Map<String, dynamic> json) => Ingress(
  ingressClass: json['class'] as String?,
  ingressClassName: json['ingressClassName'] as String?,
  ingressTemplate: json['ingressTemplate'] == null
      ? null
      : IngressTemplate.fromJson(
          json['ingressTemplate'] as Map<String, dynamic>,
        ),
  name: json['name'] as String?,
  podTemplate: json['podTemplate'] == null
      ? null
      : IngressPodTemplate.fromJson(
          json['podTemplate'] as Map<String, dynamic>,
        ),
  serviceType: json['serviceType'] as String?,
);

Map<String, dynamic> _$IngressToJson(Ingress instance) => <String, dynamic>{
  'class': instance.ingressClass,
  'ingressClassName': instance.ingressClassName,
  'ingressTemplate': instance.ingressTemplate,
  'name': instance.name,
  'podTemplate': instance.podTemplate,
  'serviceType': instance.serviceType,
};

IngressTemplate _$IngressTemplateFromJson(Map<String, dynamic> json) =>
    IngressTemplate(
      metadata: json['metadata'] == null
          ? null
          : IngressTemplateMetadata.fromJson(
              json['metadata'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$IngressTemplateToJson(IngressTemplate instance) =>
    <String, dynamic>{'metadata': instance.metadata};

IngressTemplateMetadata _$IngressTemplateMetadataFromJson(
  Map<String, dynamic> json,
) => IngressTemplateMetadata(
  annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  labels: (json['labels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$IngressTemplateMetadataToJson(
  IngressTemplateMetadata instance,
) => <String, dynamic>{
  'annotations': instance.annotations,
  'labels': instance.labels,
};

IngressPodTemplate _$IngressPodTemplateFromJson(Map<String, dynamic> json) =>
    IngressPodTemplate(
      metadata: json['metadata'] == null
          ? null
          : FluffyMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
      spec: json['spec'] == null
          ? null
          : FluffySpec.fromJson(json['spec'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IngressPodTemplateToJson(IngressPodTemplate instance) =>
    <String, dynamic>{'metadata': instance.metadata, 'spec': instance.spec};

FluffyMetadata _$FluffyMetadataFromJson(Map<String, dynamic> json) =>
    FluffyMetadata(
      annotations: (json['annotations'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
      labels: (json['labels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
    );

Map<String, dynamic> _$FluffyMetadataToJson(FluffyMetadata instance) =>
    <String, dynamic>{
      'annotations': instance.annotations,
      'labels': instance.labels,
    };

FluffySpec _$FluffySpecFromJson(Map<String, dynamic> json) => FluffySpec(
  affinity: json['affinity'] == null
      ? null
      : FluffyAffinity.fromJson(json['affinity'] as Map<String, dynamic>),
  imagePullSecrets: (json['imagePullSecrets'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FluffyImagePullSecret.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  nodeSelector: (json['nodeSelector'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  priorityClassName: json['priorityClassName'] as String?,
  resources: json['resources'] == null
      ? null
      : FluffyResources.fromJson(json['resources'] as Map<String, dynamic>),
  securityContext: json['securityContext'] == null
      ? null
      : FluffySecurityContext.fromJson(
          json['securityContext'] as Map<String, dynamic>,
        ),
  serviceAccountName: json['serviceAccountName'] as String?,
  tolerations: (json['tolerations'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : FluffyToleration.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$FluffySpecToJson(FluffySpec instance) =>
    <String, dynamic>{
      'affinity': instance.affinity,
      'imagePullSecrets': instance.imagePullSecrets,
      'nodeSelector': instance.nodeSelector,
      'priorityClassName': instance.priorityClassName,
      'resources': instance.resources,
      'securityContext': instance.securityContext,
      'serviceAccountName': instance.serviceAccountName,
      'tolerations': instance.tolerations,
    };

FluffyAffinity _$FluffyAffinityFromJson(Map<String, dynamic> json) =>
    FluffyAffinity(
      nodeAffinity: json['nodeAffinity'] == null
          ? null
          : FluffyNodeAffinity.fromJson(
              json['nodeAffinity'] as Map<String, dynamic>,
            ),
      podAffinity: json['podAffinity'] == null
          ? null
          : FluffyPodAffinity.fromJson(
              json['podAffinity'] as Map<String, dynamic>,
            ),
      podAntiAffinity: json['podAntiAffinity'] == null
          ? null
          : FluffyPodAntiAffinity.fromJson(
              json['podAntiAffinity'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$FluffyAffinityToJson(FluffyAffinity instance) =>
    <String, dynamic>{
      'nodeAffinity': instance.nodeAffinity,
      'podAffinity': instance.podAffinity,
      'podAntiAffinity': instance.podAntiAffinity,
    };

FluffyNodeAffinity _$FluffyNodeAffinityFromJson(
  Map<String, dynamic> json,
) => FluffyNodeAffinity(
  preferredDuringSchedulingIgnoredDuringExecution:
      (json['preferredDuringSchedulingIgnoredDuringExecution']
              as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : StickyPreferredDuringSchedulingIgnoredDuringExecution.fromJson(
                    e as Map<String, dynamic>,
                  ),
          )
          .toList(),
  requiredDuringSchedulingIgnoredDuringExecution:
      json['requiredDuringSchedulingIgnoredDuringExecution'] == null
      ? null
      : StickyRequiredDuringSchedulingIgnoredDuringExecution.fromJson(
          json['requiredDuringSchedulingIgnoredDuringExecution']
              as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$FluffyNodeAffinityToJson(FluffyNodeAffinity instance) =>
    <String, dynamic>{
      'preferredDuringSchedulingIgnoredDuringExecution':
          instance.preferredDuringSchedulingIgnoredDuringExecution,
      'requiredDuringSchedulingIgnoredDuringExecution':
          instance.requiredDuringSchedulingIgnoredDuringExecution,
    };

StickyPreferredDuringSchedulingIgnoredDuringExecution
_$StickyPreferredDuringSchedulingIgnoredDuringExecutionFromJson(
  Map<String, dynamic> json,
) => StickyPreferredDuringSchedulingIgnoredDuringExecution(
  preference: FluffyPreference.fromJson(
    json['preference'] as Map<String, dynamic>,
  ),
  weight: (json['weight'] as num).toInt(),
);

Map<String, dynamic>
_$StickyPreferredDuringSchedulingIgnoredDuringExecutionToJson(
  StickyPreferredDuringSchedulingIgnoredDuringExecution instance,
) => <String, dynamic>{
  'preference': instance.preference,
  'weight': instance.weight,
};

FluffyPreference _$FluffyPreferenceFromJson(Map<String, dynamic> json) =>
    FluffyPreference(
      matchExpressions: (json['matchExpressions'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : FriskyMatchExpression.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      matchFields: (json['matchFields'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : TentacledMatchField.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$FluffyPreferenceToJson(FluffyPreference instance) =>
    <String, dynamic>{
      'matchExpressions': instance.matchExpressions,
      'matchFields': instance.matchFields,
    };

FriskyMatchExpression _$FriskyMatchExpressionFromJson(
  Map<String, dynamic> json,
) => FriskyMatchExpression(
  key: json['key'] as String,
  matchExpressionOperator: json['operator'] as String,
  values: (json['values'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$FriskyMatchExpressionToJson(
  FriskyMatchExpression instance,
) => <String, dynamic>{
  'key': instance.key,
  'operator': instance.matchExpressionOperator,
  'values': instance.values,
};

TentacledMatchField _$TentacledMatchFieldFromJson(Map<String, dynamic> json) =>
    TentacledMatchField(
      key: json['key'] as String,
      matchFieldOperator: json['operator'] as String,
      values: (json['values'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$TentacledMatchFieldToJson(
  TentacledMatchField instance,
) => <String, dynamic>{
  'key': instance.key,
  'operator': instance.matchFieldOperator,
  'values': instance.values,
};

StickyRequiredDuringSchedulingIgnoredDuringExecution
_$StickyRequiredDuringSchedulingIgnoredDuringExecutionFromJson(
  Map<String, dynamic> json,
) => StickyRequiredDuringSchedulingIgnoredDuringExecution(
  nodeSelectorTerms: (json['nodeSelectorTerms'] as List<dynamic>)
      .map(
        (e) => e == null
            ? null
            : FluffyNodeSelectorTerm.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic>
_$StickyRequiredDuringSchedulingIgnoredDuringExecutionToJson(
  StickyRequiredDuringSchedulingIgnoredDuringExecution instance,
) => <String, dynamic>{'nodeSelectorTerms': instance.nodeSelectorTerms};

FluffyNodeSelectorTerm _$FluffyNodeSelectorTermFromJson(
  Map<String, dynamic> json,
) => FluffyNodeSelectorTerm(
  matchExpressions: (json['matchExpressions'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : MischievousMatchExpression.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  matchFields: (json['matchFields'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : StickyMatchField.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$FluffyNodeSelectorTermToJson(
  FluffyNodeSelectorTerm instance,
) => <String, dynamic>{
  'matchExpressions': instance.matchExpressions,
  'matchFields': instance.matchFields,
};

MischievousMatchExpression _$MischievousMatchExpressionFromJson(
  Map<String, dynamic> json,
) => MischievousMatchExpression(
  key: json['key'] as String,
  matchExpressionOperator: json['operator'] as String,
  values: (json['values'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$MischievousMatchExpressionToJson(
  MischievousMatchExpression instance,
) => <String, dynamic>{
  'key': instance.key,
  'operator': instance.matchExpressionOperator,
  'values': instance.values,
};

StickyMatchField _$StickyMatchFieldFromJson(Map<String, dynamic> json) =>
    StickyMatchField(
      key: json['key'] as String,
      matchFieldOperator: json['operator'] as String,
      values: (json['values'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$StickyMatchFieldToJson(StickyMatchField instance) =>
    <String, dynamic>{
      'key': instance.key,
      'operator': instance.matchFieldOperator,
      'values': instance.values,
    };

FluffyPodAffinity _$FluffyPodAffinityFromJson(
  Map<String, dynamic> json,
) => FluffyPodAffinity(
  preferredDuringSchedulingIgnoredDuringExecution:
      (json['preferredDuringSchedulingIgnoredDuringExecution']
              as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : IndigoPreferredDuringSchedulingIgnoredDuringExecution.fromJson(
                    e as Map<String, dynamic>,
                  ),
          )
          .toList(),
  requiredDuringSchedulingIgnoredDuringExecution:
      (json['requiredDuringSchedulingIgnoredDuringExecution'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : IndigoRequiredDuringSchedulingIgnoredDuringExecution.fromJson(
                    e as Map<String, dynamic>,
                  ),
          )
          .toList(),
);

Map<String, dynamic> _$FluffyPodAffinityToJson(FluffyPodAffinity instance) =>
    <String, dynamic>{
      'preferredDuringSchedulingIgnoredDuringExecution':
          instance.preferredDuringSchedulingIgnoredDuringExecution,
      'requiredDuringSchedulingIgnoredDuringExecution':
          instance.requiredDuringSchedulingIgnoredDuringExecution,
    };

IndigoPreferredDuringSchedulingIgnoredDuringExecution
_$IndigoPreferredDuringSchedulingIgnoredDuringExecutionFromJson(
  Map<String, dynamic> json,
) => IndigoPreferredDuringSchedulingIgnoredDuringExecution(
  podAffinityTerm: TentacledPodAffinityTerm.fromJson(
    json['podAffinityTerm'] as Map<String, dynamic>,
  ),
  weight: (json['weight'] as num).toInt(),
);

Map<String, dynamic>
_$IndigoPreferredDuringSchedulingIgnoredDuringExecutionToJson(
  IndigoPreferredDuringSchedulingIgnoredDuringExecution instance,
) => <String, dynamic>{
  'podAffinityTerm': instance.podAffinityTerm,
  'weight': instance.weight,
};

TentacledPodAffinityTerm _$TentacledPodAffinityTermFromJson(
  Map<String, dynamic> json,
) => TentacledPodAffinityTerm(
  labelSelector: json['labelSelector'] == null
      ? null
      : IndigoLabelSelector.fromJson(
          json['labelSelector'] as Map<String, dynamic>,
        ),
  matchLabelKeys: (json['matchLabelKeys'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  mismatchLabelKeys: (json['mismatchLabelKeys'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  namespaces: (json['namespaces'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  namespaceSelector: json['namespaceSelector'] == null
      ? null
      : IndigoNamespaceSelector.fromJson(
          json['namespaceSelector'] as Map<String, dynamic>,
        ),
  topologyKey: json['topologyKey'] as String,
);

Map<String, dynamic> _$TentacledPodAffinityTermToJson(
  TentacledPodAffinityTerm instance,
) => <String, dynamic>{
  'labelSelector': instance.labelSelector,
  'matchLabelKeys': instance.matchLabelKeys,
  'mismatchLabelKeys': instance.mismatchLabelKeys,
  'namespaces': instance.namespaces,
  'namespaceSelector': instance.namespaceSelector,
  'topologyKey': instance.topologyKey,
};

IndigoLabelSelector _$IndigoLabelSelectorFromJson(Map<String, dynamic> json) =>
    IndigoLabelSelector(
      matchExpressions: (json['matchExpressions'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : BraggadociousMatchExpression.fromJson(
                    e as Map<String, dynamic>,
                  ),
          )
          .toList(),
      matchLabels: (json['matchLabels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String?),
      ),
    );

Map<String, dynamic> _$IndigoLabelSelectorToJson(
  IndigoLabelSelector instance,
) => <String, dynamic>{
  'matchExpressions': instance.matchExpressions,
  'matchLabels': instance.matchLabels,
};

BraggadociousMatchExpression _$BraggadociousMatchExpressionFromJson(
  Map<String, dynamic> json,
) => BraggadociousMatchExpression(
  key: json['key'] as String,
  matchExpressionOperator: json['operator'] as String,
  values: (json['values'] as List<dynamic>?)?.map((e) => e as String?).toList(),
);

Map<String, dynamic> _$BraggadociousMatchExpressionToJson(
  BraggadociousMatchExpression instance,
) => <String, dynamic>{
  'key': instance.key,
  'operator': instance.matchExpressionOperator,
  'values': instance.values,
};

IndigoNamespaceSelector _$IndigoNamespaceSelectorFromJson(
  Map<String, dynamic> json,
) => IndigoNamespaceSelector(
  matchExpressions: (json['matchExpressions'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : MatchExpression1.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  matchLabels: (json['matchLabels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$IndigoNamespaceSelectorToJson(
  IndigoNamespaceSelector instance,
) => <String, dynamic>{
  'matchExpressions': instance.matchExpressions,
  'matchLabels': instance.matchLabels,
};

MatchExpression1 _$MatchExpression1FromJson(Map<String, dynamic> json) =>
    MatchExpression1(
      key: json['key'] as String,
      matchExpressionOperator: json['operator'] as String,
      values: (json['values'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$MatchExpression1ToJson(MatchExpression1 instance) =>
    <String, dynamic>{
      'key': instance.key,
      'operator': instance.matchExpressionOperator,
      'values': instance.values,
    };

IndigoRequiredDuringSchedulingIgnoredDuringExecution
_$IndigoRequiredDuringSchedulingIgnoredDuringExecutionFromJson(
  Map<String, dynamic> json,
) => IndigoRequiredDuringSchedulingIgnoredDuringExecution(
  labelSelector: json['labelSelector'] == null
      ? null
      : IndecentLabelSelector.fromJson(
          json['labelSelector'] as Map<String, dynamic>,
        ),
  matchLabelKeys: (json['matchLabelKeys'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  mismatchLabelKeys: (json['mismatchLabelKeys'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  namespaces: (json['namespaces'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  namespaceSelector: json['namespaceSelector'] == null
      ? null
      : IndecentNamespaceSelector.fromJson(
          json['namespaceSelector'] as Map<String, dynamic>,
        ),
  topologyKey: json['topologyKey'] as String,
);

Map<String, dynamic>
_$IndigoRequiredDuringSchedulingIgnoredDuringExecutionToJson(
  IndigoRequiredDuringSchedulingIgnoredDuringExecution instance,
) => <String, dynamic>{
  'labelSelector': instance.labelSelector,
  'matchLabelKeys': instance.matchLabelKeys,
  'mismatchLabelKeys': instance.mismatchLabelKeys,
  'namespaces': instance.namespaces,
  'namespaceSelector': instance.namespaceSelector,
  'topologyKey': instance.topologyKey,
};

IndecentLabelSelector _$IndecentLabelSelectorFromJson(
  Map<String, dynamic> json,
) => IndecentLabelSelector(
  matchExpressions: (json['matchExpressions'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : MatchExpression2.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  matchLabels: (json['matchLabels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$IndecentLabelSelectorToJson(
  IndecentLabelSelector instance,
) => <String, dynamic>{
  'matchExpressions': instance.matchExpressions,
  'matchLabels': instance.matchLabels,
};

MatchExpression2 _$MatchExpression2FromJson(Map<String, dynamic> json) =>
    MatchExpression2(
      key: json['key'] as String,
      matchExpressionOperator: json['operator'] as String,
      values: (json['values'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$MatchExpression2ToJson(MatchExpression2 instance) =>
    <String, dynamic>{
      'key': instance.key,
      'operator': instance.matchExpressionOperator,
      'values': instance.values,
    };

IndecentNamespaceSelector _$IndecentNamespaceSelectorFromJson(
  Map<String, dynamic> json,
) => IndecentNamespaceSelector(
  matchExpressions: (json['matchExpressions'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : MatchExpression3.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  matchLabels: (json['matchLabels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$IndecentNamespaceSelectorToJson(
  IndecentNamespaceSelector instance,
) => <String, dynamic>{
  'matchExpressions': instance.matchExpressions,
  'matchLabels': instance.matchLabels,
};

MatchExpression3 _$MatchExpression3FromJson(Map<String, dynamic> json) =>
    MatchExpression3(
      key: json['key'] as String,
      matchExpressionOperator: json['operator'] as String,
      values: (json['values'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$MatchExpression3ToJson(MatchExpression3 instance) =>
    <String, dynamic>{
      'key': instance.key,
      'operator': instance.matchExpressionOperator,
      'values': instance.values,
    };

FluffyPodAntiAffinity _$FluffyPodAntiAffinityFromJson(
  Map<String, dynamic> json,
) => FluffyPodAntiAffinity(
  preferredDuringSchedulingIgnoredDuringExecution:
      (json['preferredDuringSchedulingIgnoredDuringExecution']
              as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : IndecentPreferredDuringSchedulingIgnoredDuringExecution.fromJson(
                    e as Map<String, dynamic>,
                  ),
          )
          .toList(),
  requiredDuringSchedulingIgnoredDuringExecution:
      (json['requiredDuringSchedulingIgnoredDuringExecution'] as List<dynamic>?)
          ?.map(
            (e) => e == null
                ? null
                : IndecentRequiredDuringSchedulingIgnoredDuringExecution.fromJson(
                    e as Map<String, dynamic>,
                  ),
          )
          .toList(),
);

Map<String, dynamic> _$FluffyPodAntiAffinityToJson(
  FluffyPodAntiAffinity instance,
) => <String, dynamic>{
  'preferredDuringSchedulingIgnoredDuringExecution':
      instance.preferredDuringSchedulingIgnoredDuringExecution,
  'requiredDuringSchedulingIgnoredDuringExecution':
      instance.requiredDuringSchedulingIgnoredDuringExecution,
};

IndecentPreferredDuringSchedulingIgnoredDuringExecution
_$IndecentPreferredDuringSchedulingIgnoredDuringExecutionFromJson(
  Map<String, dynamic> json,
) => IndecentPreferredDuringSchedulingIgnoredDuringExecution(
  podAffinityTerm: StickyPodAffinityTerm.fromJson(
    json['podAffinityTerm'] as Map<String, dynamic>,
  ),
  weight: (json['weight'] as num).toInt(),
);

Map<String, dynamic>
_$IndecentPreferredDuringSchedulingIgnoredDuringExecutionToJson(
  IndecentPreferredDuringSchedulingIgnoredDuringExecution instance,
) => <String, dynamic>{
  'podAffinityTerm': instance.podAffinityTerm,
  'weight': instance.weight,
};

StickyPodAffinityTerm _$StickyPodAffinityTermFromJson(
  Map<String, dynamic> json,
) => StickyPodAffinityTerm(
  labelSelector: json['labelSelector'] == null
      ? null
      : HilariousLabelSelector.fromJson(
          json['labelSelector'] as Map<String, dynamic>,
        ),
  matchLabelKeys: (json['matchLabelKeys'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  mismatchLabelKeys: (json['mismatchLabelKeys'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  namespaces: (json['namespaces'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  namespaceSelector: json['namespaceSelector'] == null
      ? null
      : HilariousNamespaceSelector.fromJson(
          json['namespaceSelector'] as Map<String, dynamic>,
        ),
  topologyKey: json['topologyKey'] as String,
);

Map<String, dynamic> _$StickyPodAffinityTermToJson(
  StickyPodAffinityTerm instance,
) => <String, dynamic>{
  'labelSelector': instance.labelSelector,
  'matchLabelKeys': instance.matchLabelKeys,
  'mismatchLabelKeys': instance.mismatchLabelKeys,
  'namespaces': instance.namespaces,
  'namespaceSelector': instance.namespaceSelector,
  'topologyKey': instance.topologyKey,
};

HilariousLabelSelector _$HilariousLabelSelectorFromJson(
  Map<String, dynamic> json,
) => HilariousLabelSelector(
  matchExpressions: (json['matchExpressions'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : MatchExpression4.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  matchLabels: (json['matchLabels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$HilariousLabelSelectorToJson(
  HilariousLabelSelector instance,
) => <String, dynamic>{
  'matchExpressions': instance.matchExpressions,
  'matchLabels': instance.matchLabels,
};

MatchExpression4 _$MatchExpression4FromJson(Map<String, dynamic> json) =>
    MatchExpression4(
      key: json['key'] as String,
      matchExpressionOperator: json['operator'] as String,
      values: (json['values'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$MatchExpression4ToJson(MatchExpression4 instance) =>
    <String, dynamic>{
      'key': instance.key,
      'operator': instance.matchExpressionOperator,
      'values': instance.values,
    };

HilariousNamespaceSelector _$HilariousNamespaceSelectorFromJson(
  Map<String, dynamic> json,
) => HilariousNamespaceSelector(
  matchExpressions: (json['matchExpressions'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : MatchExpression5.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  matchLabels: (json['matchLabels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$HilariousNamespaceSelectorToJson(
  HilariousNamespaceSelector instance,
) => <String, dynamic>{
  'matchExpressions': instance.matchExpressions,
  'matchLabels': instance.matchLabels,
};

MatchExpression5 _$MatchExpression5FromJson(Map<String, dynamic> json) =>
    MatchExpression5(
      key: json['key'] as String,
      matchExpressionOperator: json['operator'] as String,
      values: (json['values'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$MatchExpression5ToJson(MatchExpression5 instance) =>
    <String, dynamic>{
      'key': instance.key,
      'operator': instance.matchExpressionOperator,
      'values': instance.values,
    };

IndecentRequiredDuringSchedulingIgnoredDuringExecution
_$IndecentRequiredDuringSchedulingIgnoredDuringExecutionFromJson(
  Map<String, dynamic> json,
) => IndecentRequiredDuringSchedulingIgnoredDuringExecution(
  labelSelector: json['labelSelector'] == null
      ? null
      : AmbitiousLabelSelector.fromJson(
          json['labelSelector'] as Map<String, dynamic>,
        ),
  matchLabelKeys: (json['matchLabelKeys'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  mismatchLabelKeys: (json['mismatchLabelKeys'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  namespaces: (json['namespaces'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  namespaceSelector: json['namespaceSelector'] == null
      ? null
      : AmbitiousNamespaceSelector.fromJson(
          json['namespaceSelector'] as Map<String, dynamic>,
        ),
  topologyKey: json['topologyKey'] as String,
);

Map<String, dynamic>
_$IndecentRequiredDuringSchedulingIgnoredDuringExecutionToJson(
  IndecentRequiredDuringSchedulingIgnoredDuringExecution instance,
) => <String, dynamic>{
  'labelSelector': instance.labelSelector,
  'matchLabelKeys': instance.matchLabelKeys,
  'mismatchLabelKeys': instance.mismatchLabelKeys,
  'namespaces': instance.namespaces,
  'namespaceSelector': instance.namespaceSelector,
  'topologyKey': instance.topologyKey,
};

AmbitiousLabelSelector _$AmbitiousLabelSelectorFromJson(
  Map<String, dynamic> json,
) => AmbitiousLabelSelector(
  matchExpressions: (json['matchExpressions'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : MatchExpression6.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  matchLabels: (json['matchLabels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$AmbitiousLabelSelectorToJson(
  AmbitiousLabelSelector instance,
) => <String, dynamic>{
  'matchExpressions': instance.matchExpressions,
  'matchLabels': instance.matchLabels,
};

MatchExpression6 _$MatchExpression6FromJson(Map<String, dynamic> json) =>
    MatchExpression6(
      key: json['key'] as String,
      matchExpressionOperator: json['operator'] as String,
      values: (json['values'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$MatchExpression6ToJson(MatchExpression6 instance) =>
    <String, dynamic>{
      'key': instance.key,
      'operator': instance.matchExpressionOperator,
      'values': instance.values,
    };

AmbitiousNamespaceSelector _$AmbitiousNamespaceSelectorFromJson(
  Map<String, dynamic> json,
) => AmbitiousNamespaceSelector(
  matchExpressions: (json['matchExpressions'] as List<dynamic>?)
      ?.map(
        (e) => e == null
            ? null
            : MatchExpression7.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  matchLabels: (json['matchLabels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$AmbitiousNamespaceSelectorToJson(
  AmbitiousNamespaceSelector instance,
) => <String, dynamic>{
  'matchExpressions': instance.matchExpressions,
  'matchLabels': instance.matchLabels,
};

MatchExpression7 _$MatchExpression7FromJson(Map<String, dynamic> json) =>
    MatchExpression7(
      key: json['key'] as String,
      matchExpressionOperator: json['operator'] as String,
      values: (json['values'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    );

Map<String, dynamic> _$MatchExpression7ToJson(MatchExpression7 instance) =>
    <String, dynamic>{
      'key': instance.key,
      'operator': instance.matchExpressionOperator,
      'values': instance.values,
    };

FluffyImagePullSecret _$FluffyImagePullSecretFromJson(
  Map<String, dynamic> json,
) => FluffyImagePullSecret(name: json['name'] as String?);

Map<String, dynamic> _$FluffyImagePullSecretToJson(
  FluffyImagePullSecret instance,
) => <String, dynamic>{'name': instance.name};

FluffyResources _$FluffyResourcesFromJson(Map<String, dynamic> json) =>
    FluffyResources(
      limits: json['limits'] as Map<String, dynamic>?,
      requests: json['requests'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$FluffyResourcesToJson(FluffyResources instance) =>
    <String, dynamic>{'limits': instance.limits, 'requests': instance.requests};

FluffySecurityContext _$FluffySecurityContextFromJson(
  Map<String, dynamic> json,
) => FluffySecurityContext(
  fsGroup: (json['fsGroup'] as num?)?.toInt(),
  fsGroupChangePolicy: json['fsGroupChangePolicy'] as String?,
  runAsGroup: (json['runAsGroup'] as num?)?.toInt(),
  runAsNonRoot: json['runAsNonRoot'] as bool?,
  runAsUser: (json['runAsUser'] as num?)?.toInt(),
  seccompProfile: json['seccompProfile'] == null
      ? null
      : FluffySeccompProfile.fromJson(
          json['seccompProfile'] as Map<String, dynamic>,
        ),
  seLinuxOptions: json['seLinuxOptions'] == null
      ? null
      : FluffySeLinuxOptions.fromJson(
          json['seLinuxOptions'] as Map<String, dynamic>,
        ),
  supplementalGroups: (json['supplementalGroups'] as List<dynamic>?)
      ?.map((e) => (e as num?)?.toInt())
      .toList(),
  sysctls: (json['sysctls'] as List<dynamic>?)
      ?.map(
        (e) =>
            e == null ? null : FluffySysctl.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$FluffySecurityContextToJson(
  FluffySecurityContext instance,
) => <String, dynamic>{
  'fsGroup': instance.fsGroup,
  'fsGroupChangePolicy': instance.fsGroupChangePolicy,
  'runAsGroup': instance.runAsGroup,
  'runAsNonRoot': instance.runAsNonRoot,
  'runAsUser': instance.runAsUser,
  'seccompProfile': instance.seccompProfile,
  'seLinuxOptions': instance.seLinuxOptions,
  'supplementalGroups': instance.supplementalGroups,
  'sysctls': instance.sysctls,
};

FluffySeLinuxOptions _$FluffySeLinuxOptionsFromJson(
  Map<String, dynamic> json,
) => FluffySeLinuxOptions(
  level: json['level'] as String?,
  role: json['role'] as String?,
  type: json['type'] as String?,
  user: json['user'] as String?,
);

Map<String, dynamic> _$FluffySeLinuxOptionsToJson(
  FluffySeLinuxOptions instance,
) => <String, dynamic>{
  'level': instance.level,
  'role': instance.role,
  'type': instance.type,
  'user': instance.user,
};

FluffySeccompProfile _$FluffySeccompProfileFromJson(
  Map<String, dynamic> json,
) => FluffySeccompProfile(
  localhostProfile: json['localhostProfile'] as String?,
  type: json['type'] as String,
);

Map<String, dynamic> _$FluffySeccompProfileToJson(
  FluffySeccompProfile instance,
) => <String, dynamic>{
  'localhostProfile': instance.localhostProfile,
  'type': instance.type,
};

FluffySysctl _$FluffySysctlFromJson(Map<String, dynamic> json) =>
    FluffySysctl(name: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$FluffySysctlToJson(FluffySysctl instance) =>
    <String, dynamic>{'name': instance.name, 'value': instance.value};

FluffyToleration _$FluffyTolerationFromJson(Map<String, dynamic> json) =>
    FluffyToleration(
      effect: json['effect'] as String?,
      key: json['key'] as String?,
      tolerationOperator: json['operator'] as String?,
      tolerationSeconds: (json['tolerationSeconds'] as num?)?.toInt(),
      value: json['value'] as String?,
    );

Map<String, dynamic> _$FluffyTolerationToJson(FluffyToleration instance) =>
    <String, dynamic>{
      'effect': instance.effect,
      'key': instance.key,
      'operator': instance.tolerationOperator,
      'tolerationSeconds': instance.tolerationSeconds,
      'value': instance.value,
    };

Selector _$SelectorFromJson(Map<String, dynamic> json) => Selector(
  dnsNames: (json['dnsNames'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  dnsZones: (json['dnsZones'] as List<dynamic>?)
      ?.map((e) => e as String?)
      .toList(),
  matchLabels: (json['matchLabels'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
);

Map<String, dynamic> _$SelectorToJson(Selector instance) => <String, dynamic>{
  'dnsNames': instance.dnsNames,
  'dnsZones': instance.dnsZones,
  'matchLabels': instance.matchLabels,
};

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
  presented: json['presented'] as bool?,
  processing: json['processing'] as bool?,
  reason: json['reason'] as String?,
  state: $enumDecodeNullable(_$StateEnumMap, json['state']),
);

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
  'presented': instance.presented,
  'processing': instance.processing,
  'reason': instance.reason,
  'state': _$StateEnumMap[instance.state],
};

const _$StateEnumMap = {
  State.ERRORED: 'errored',
  State.EXPIRED: 'expired',
  State.INVALID: 'invalid',
  State.PENDING: 'pending',
  State.PROCESSING: 'processing',
  State.READY: 'ready',
  State.VALID: 'valid',
};

ChallengelistAcmeV1Metadata _$ChallengelistAcmeV1MetadataFromJson(
  Map<String, dynamic> json,
) => ChallengelistAcmeV1Metadata(
  metadataContinue: json['continue'] as String?,
  remainingItemCount: (json['remainingItemCount'] as num?)?.toInt(),
  resourceVersion: json['resourceVersion'] as String?,
  selfLink: json['selfLink'] as String?,
);

Map<String, dynamic> _$ChallengelistAcmeV1MetadataToJson(
  ChallengelistAcmeV1Metadata instance,
) => <String, dynamic>{
  'continue': instance.metadataContinue,
  'remainingItemCount': instance.remainingItemCount,
  'resourceVersion': instance.resourceVersion,
  'selfLink': instance.selfLink,
};
