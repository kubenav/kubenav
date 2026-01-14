// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';

enum IoArgoprojV1alpha1Application$Status$SourceHydrator$CurrentOperationPhase {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Hydrating')
  hydrating('Hydrating'),
  @JsonValue('Failed')
  failed('Failed'),
  @JsonValue('Hydrated')
  hydrated('Hydrated');

  final String? value;

  const IoArgoprojV1alpha1Application$Status$SourceHydrator$CurrentOperationPhase(
    this.value,
  );
}

enum IoArgoprojV1alpha1ApplicationSet$Spec$SyncPolicyApplicationsSync {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('create-only')
  createOnly('create-only'),
  @JsonValue('create-update')
  createUpdate('create-update'),
  @JsonValue('create-delete')
  createDelete('create-delete'),
  @JsonValue('sync')
  $sync('sync');

  final String? value;

  const IoArgoprojV1alpha1ApplicationSet$Spec$SyncPolicyApplicationsSync(
    this.value,
  );
}

enum IoCertManagerAcmeV1Challenge$Spec$Solver$Dns01$AzureDNSEnvironment {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('AzurePublicCloud')
  azurepubliccloud('AzurePublicCloud'),
  @JsonValue('AzureChinaCloud')
  azurechinacloud('AzureChinaCloud'),
  @JsonValue('AzureGermanCloud')
  azuregermancloud('AzureGermanCloud'),
  @JsonValue('AzureUSGovernmentCloud')
  azureusgovernmentcloud('AzureUSGovernmentCloud');

  final String? value;

  const IoCertManagerAcmeV1Challenge$Spec$Solver$Dns01$AzureDNSEnvironment(
    this.value,
  );
}

enum IoCertManagerAcmeV1Challenge$Spec$Solver$Dns01CnameStrategy {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('None')
  none('None'),
  @JsonValue('Follow')
  follow('Follow');

  final String? value;

  const IoCertManagerAcmeV1Challenge$Spec$Solver$Dns01CnameStrategy(this.value);
}

enum IoCertManagerAcmeV1Challenge$Spec$Solver$Dns01$Rfc2136Protocol {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('TCP')
  tcp('TCP'),
  @JsonValue('UDP')
  udp('UDP');

  final String? value;

  const IoCertManagerAcmeV1Challenge$Spec$Solver$Dns01$Rfc2136Protocol(
    this.value,
  );
}

enum IoCertManagerAcmeV1Challenge$SpecType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('HTTP-01')
  http01('HTTP-01'),
  @JsonValue('DNS-01')
  dns01('DNS-01');

  final String? value;

  const IoCertManagerAcmeV1Challenge$SpecType(this.value);
}

enum IoCertManagerAcmeV1Challenge$StatusState {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('valid')
  valid('valid'),
  @JsonValue('ready')
  ready('ready'),
  @JsonValue('pending')
  pending('pending'),
  @JsonValue('processing')
  processing('processing'),
  @JsonValue('invalid')
  invalid('invalid'),
  @JsonValue('expired')
  expired('expired'),
  @JsonValue('errored')
  errored('errored');

  final String? value;

  const IoCertManagerAcmeV1Challenge$StatusState(this.value);
}

enum IoCertManagerAcmeV1Order$Status$Authorizations$ItemInitialState {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('valid')
  valid('valid'),
  @JsonValue('ready')
  ready('ready'),
  @JsonValue('pending')
  pending('pending'),
  @JsonValue('processing')
  processing('processing'),
  @JsonValue('invalid')
  invalid('invalid'),
  @JsonValue('expired')
  expired('expired'),
  @JsonValue('errored')
  errored('errored');

  final String? value;

  const IoCertManagerAcmeV1Order$Status$Authorizations$ItemInitialState(
    this.value,
  );
}

enum IoCertManagerAcmeV1Order$StatusState {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('valid')
  valid('valid'),
  @JsonValue('ready')
  ready('ready'),
  @JsonValue('pending')
  pending('pending'),
  @JsonValue('processing')
  processing('processing'),
  @JsonValue('invalid')
  invalid('invalid'),
  @JsonValue('expired')
  expired('expired'),
  @JsonValue('errored')
  errored('errored');

  final String? value;

  const IoCertManagerAcmeV1Order$StatusState(this.value);
}

enum IoCertManagerV1Certificate$Spec$AdditionalOutputFormats$ItemType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('DER')
  der('DER'),
  @JsonValue('CombinedPEM')
  combinedpem('CombinedPEM');

  final String? value;

  const IoCertManagerV1Certificate$Spec$AdditionalOutputFormats$ItemType(
    this.value,
  );
}

enum IoCertManagerV1Certificate$Spec$Keystores$Pkcs12Profile {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('LegacyRC2')
  legacyrc2('LegacyRC2'),
  @JsonValue('LegacyDES')
  legacydes('LegacyDES'),
  @JsonValue('Modern2023')
  modern2023('Modern2023');

  final String? value;

  const IoCertManagerV1Certificate$Spec$Keystores$Pkcs12Profile(this.value);
}

enum IoCertManagerV1Certificate$Spec$PrivateKeyAlgorithm {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('RSA')
  rsa('RSA'),
  @JsonValue('ECDSA')
  ecdsa('ECDSA'),
  @JsonValue('Ed25519')
  ed25519('Ed25519');

  final String? value;

  const IoCertManagerV1Certificate$Spec$PrivateKeyAlgorithm(this.value);
}

enum IoCertManagerV1Certificate$Spec$PrivateKeyEncoding {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('PKCS1')
  pkcs1('PKCS1'),
  @JsonValue('PKCS8')
  pkcs8('PKCS8');

  final String? value;

  const IoCertManagerV1Certificate$Spec$PrivateKeyEncoding(this.value);
}

enum IoCertManagerV1Certificate$Spec$PrivateKeyRotationPolicy {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Never')
  never('Never'),
  @JsonValue('Always')
  always('Always');

  final String? value;

  const IoCertManagerV1Certificate$Spec$PrivateKeyRotationPolicy(this.value);
}

enum IoCertManagerV1Certificate$SpecSignatureAlgorithm {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('SHA256WithRSA')
  sha256withrsa('SHA256WithRSA'),
  @JsonValue('SHA384WithRSA')
  sha384withrsa('SHA384WithRSA'),
  @JsonValue('SHA512WithRSA')
  sha512withrsa('SHA512WithRSA'),
  @JsonValue('ECDSAWithSHA256')
  ecdsawithsha256('ECDSAWithSHA256'),
  @JsonValue('ECDSAWithSHA384')
  ecdsawithsha384('ECDSAWithSHA384'),
  @JsonValue('ECDSAWithSHA512')
  ecdsawithsha512('ECDSAWithSHA512'),
  @JsonValue('PureEd25519')
  pureed25519('PureEd25519');

  final String? value;

  const IoCertManagerV1Certificate$SpecSignatureAlgorithm(this.value);
}

enum IoCertManagerV1Certificate$SpecUsages {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('signing')
  signing('signing'),
  @JsonValue('digital signature')
  digitalSignature('digital signature'),
  @JsonValue('content commitment')
  contentCommitment('content commitment'),
  @JsonValue('key encipherment')
  keyEncipherment('key encipherment'),
  @JsonValue('key agreement')
  keyAgreement('key agreement'),
  @JsonValue('data encipherment')
  dataEncipherment('data encipherment'),
  @JsonValue('cert sign')
  certSign('cert sign'),
  @JsonValue('crl sign')
  crlSign('crl sign'),
  @JsonValue('encipher only')
  encipherOnly('encipher only'),
  @JsonValue('decipher only')
  decipherOnly('decipher only'),
  @JsonValue('any')
  any('any'),
  @JsonValue('server auth')
  serverAuth('server auth'),
  @JsonValue('client auth')
  clientAuth('client auth'),
  @JsonValue('code signing')
  codeSigning('code signing'),
  @JsonValue('email protection')
  emailProtection('email protection'),
  @JsonValue('s/mime')
  sMime('s/mime'),
  @JsonValue('ipsec end system')
  ipsecEndSystem('ipsec end system'),
  @JsonValue('ipsec tunnel')
  ipsecTunnel('ipsec tunnel'),
  @JsonValue('ipsec user')
  ipsecUser('ipsec user'),
  @JsonValue('timestamping')
  timestamping('timestamping'),
  @JsonValue('ocsp signing')
  ocspSigning('ocsp signing'),
  @JsonValue('microsoft sgc')
  microsoftSgc('microsoft sgc'),
  @JsonValue('netscape sgc')
  netscapeSgc('netscape sgc');

  final String? value;

  const IoCertManagerV1Certificate$SpecUsages(this.value);
}

enum IoCertManagerV1Certificate$Status$Conditions$ItemStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('True')
  $true('True'),
  @JsonValue('False')
  $false('False'),
  @JsonValue('Unknown')
  unknown('Unknown');

  final String? value;

  const IoCertManagerV1Certificate$Status$Conditions$ItemStatus(this.value);
}

enum IoCertManagerV1CertificateRequest$SpecUsages {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('signing')
  signing('signing'),
  @JsonValue('digital signature')
  digitalSignature('digital signature'),
  @JsonValue('content commitment')
  contentCommitment('content commitment'),
  @JsonValue('key encipherment')
  keyEncipherment('key encipherment'),
  @JsonValue('key agreement')
  keyAgreement('key agreement'),
  @JsonValue('data encipherment')
  dataEncipherment('data encipherment'),
  @JsonValue('cert sign')
  certSign('cert sign'),
  @JsonValue('crl sign')
  crlSign('crl sign'),
  @JsonValue('encipher only')
  encipherOnly('encipher only'),
  @JsonValue('decipher only')
  decipherOnly('decipher only'),
  @JsonValue('any')
  any('any'),
  @JsonValue('server auth')
  serverAuth('server auth'),
  @JsonValue('client auth')
  clientAuth('client auth'),
  @JsonValue('code signing')
  codeSigning('code signing'),
  @JsonValue('email protection')
  emailProtection('email protection'),
  @JsonValue('s/mime')
  sMime('s/mime'),
  @JsonValue('ipsec end system')
  ipsecEndSystem('ipsec end system'),
  @JsonValue('ipsec tunnel')
  ipsecTunnel('ipsec tunnel'),
  @JsonValue('ipsec user')
  ipsecUser('ipsec user'),
  @JsonValue('timestamping')
  timestamping('timestamping'),
  @JsonValue('ocsp signing')
  ocspSigning('ocsp signing'),
  @JsonValue('microsoft sgc')
  microsoftSgc('microsoft sgc'),
  @JsonValue('netscape sgc')
  netscapeSgc('netscape sgc');

  final String? value;

  const IoCertManagerV1CertificateRequest$SpecUsages(this.value);
}

enum IoCertManagerV1CertificateRequest$Status$Conditions$ItemStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('True')
  $true('True'),
  @JsonValue('False')
  $false('False'),
  @JsonValue('Unknown')
  unknown('Unknown');

  final String? value;

  const IoCertManagerV1CertificateRequest$Status$Conditions$ItemStatus(
    this.value,
  );
}

enum IoCertManagerV1ClusterIssuer$Spec$Acme$ExternalAccountBindingKeyAlgorithm {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('HS256')
  hs256('HS256'),
  @JsonValue('HS384')
  hs384('HS384'),
  @JsonValue('HS512')
  hs512('HS512');

  final String? value;

  const IoCertManagerV1ClusterIssuer$Spec$Acme$ExternalAccountBindingKeyAlgorithm(
    this.value,
  );
}

enum IoCertManagerV1ClusterIssuer$Spec$Acme$Solvers$Item$Dns01$AzureDNSEnvironment {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('AzurePublicCloud')
  azurepubliccloud('AzurePublicCloud'),
  @JsonValue('AzureChinaCloud')
  azurechinacloud('AzureChinaCloud'),
  @JsonValue('AzureGermanCloud')
  azuregermancloud('AzureGermanCloud'),
  @JsonValue('AzureUSGovernmentCloud')
  azureusgovernmentcloud('AzureUSGovernmentCloud');

  final String? value;

  const IoCertManagerV1ClusterIssuer$Spec$Acme$Solvers$Item$Dns01$AzureDNSEnvironment(
    this.value,
  );
}

enum IoCertManagerV1ClusterIssuer$Spec$Acme$Solvers$Item$Dns01CnameStrategy {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('None')
  none('None'),
  @JsonValue('Follow')
  follow('Follow');

  final String? value;

  const IoCertManagerV1ClusterIssuer$Spec$Acme$Solvers$Item$Dns01CnameStrategy(
    this.value,
  );
}

enum IoCertManagerV1ClusterIssuer$Spec$Acme$Solvers$Item$Dns01$Rfc2136Protocol {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('TCP')
  tcp('TCP'),
  @JsonValue('UDP')
  udp('UDP');

  final String? value;

  const IoCertManagerV1ClusterIssuer$Spec$Acme$Solvers$Item$Dns01$Rfc2136Protocol(
    this.value,
  );
}

enum IoCertManagerV1ClusterIssuer$Status$Conditions$ItemStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('True')
  $true('True'),
  @JsonValue('False')
  $false('False'),
  @JsonValue('Unknown')
  unknown('Unknown');

  final String? value;

  const IoCertManagerV1ClusterIssuer$Status$Conditions$ItemStatus(this.value);
}

enum IoCertManagerV1Issuer$Spec$Acme$ExternalAccountBindingKeyAlgorithm {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('HS256')
  hs256('HS256'),
  @JsonValue('HS384')
  hs384('HS384'),
  @JsonValue('HS512')
  hs512('HS512');

  final String? value;

  const IoCertManagerV1Issuer$Spec$Acme$ExternalAccountBindingKeyAlgorithm(
    this.value,
  );
}

enum IoCertManagerV1Issuer$Spec$Acme$Solvers$Item$Dns01$AzureDNSEnvironment {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('AzurePublicCloud')
  azurepubliccloud('AzurePublicCloud'),
  @JsonValue('AzureChinaCloud')
  azurechinacloud('AzureChinaCloud'),
  @JsonValue('AzureGermanCloud')
  azuregermancloud('AzureGermanCloud'),
  @JsonValue('AzureUSGovernmentCloud')
  azureusgovernmentcloud('AzureUSGovernmentCloud');

  final String? value;

  const IoCertManagerV1Issuer$Spec$Acme$Solvers$Item$Dns01$AzureDNSEnvironment(
    this.value,
  );
}

enum IoCertManagerV1Issuer$Spec$Acme$Solvers$Item$Dns01CnameStrategy {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('None')
  none('None'),
  @JsonValue('Follow')
  follow('Follow');

  final String? value;

  const IoCertManagerV1Issuer$Spec$Acme$Solvers$Item$Dns01CnameStrategy(
    this.value,
  );
}

enum IoCertManagerV1Issuer$Spec$Acme$Solvers$Item$Dns01$Rfc2136Protocol {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('TCP')
  tcp('TCP'),
  @JsonValue('UDP')
  udp('UDP');

  final String? value;

  const IoCertManagerV1Issuer$Spec$Acme$Solvers$Item$Dns01$Rfc2136Protocol(
    this.value,
  );
}

enum IoCertManagerV1Issuer$Status$Conditions$ItemStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('True')
  $true('True'),
  @JsonValue('False')
  $false('False'),
  @JsonValue('Unknown')
  unknown('Unknown');

  final String? value;

  const IoCertManagerV1Issuer$Status$Conditions$ItemStatus(this.value);
}

enum IoFluxcdToolkitHelmV2HelmRelease$Spec$Chart$SpecReconcileStrategy {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('ChartVersion')
  chartversion('ChartVersion'),
  @JsonValue('Revision')
  revision('Revision');

  final String? value;

  const IoFluxcdToolkitHelmV2HelmRelease$Spec$Chart$SpecReconcileStrategy(
    this.value,
  );
}

enum IoFluxcdToolkitHelmV2HelmRelease$Spec$Chart$Spec$SourceRefKind {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('HelmRepository')
  helmrepository('HelmRepository'),
  @JsonValue('GitRepository')
  gitrepository('GitRepository'),
  @JsonValue('Bucket')
  bucket('Bucket');

  final String? value;

  const IoFluxcdToolkitHelmV2HelmRelease$Spec$Chart$Spec$SourceRefKind(
    this.value,
  );
}

enum IoFluxcdToolkitHelmV2HelmRelease$Spec$Chart$Spec$VerifyProvider {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('cosign')
  cosign('cosign'),
  @JsonValue('notation')
  notation('notation');

  final String? value;

  const IoFluxcdToolkitHelmV2HelmRelease$Spec$Chart$Spec$VerifyProvider(
    this.value,
  );
}

enum IoFluxcdToolkitHelmV2HelmRelease$Spec$ChartRefKind {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('OCIRepository')
  ocirepository('OCIRepository'),
  @JsonValue('HelmChart')
  helmchart('HelmChart'),
  @JsonValue('ExternalArtifact')
  externalartifact('ExternalArtifact');

  final String? value;

  const IoFluxcdToolkitHelmV2HelmRelease$Spec$ChartRefKind(this.value);
}

enum IoFluxcdToolkitHelmV2HelmRelease$Spec$DriftDetectionMode {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('enabled')
  enabled('enabled'),
  @JsonValue('warn')
  warn('warn'),
  @JsonValue('disabled')
  disabled('disabled');

  final String? value;

  const IoFluxcdToolkitHelmV2HelmRelease$Spec$DriftDetectionMode(this.value);
}

enum IoFluxcdToolkitHelmV2HelmRelease$Spec$InstallCrds {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Skip')
  skip('Skip'),
  @JsonValue('Create')
  create('Create'),
  @JsonValue('CreateReplace')
  createreplace('CreateReplace');

  final String? value;

  const IoFluxcdToolkitHelmV2HelmRelease$Spec$InstallCrds(this.value);
}

enum IoFluxcdToolkitHelmV2HelmRelease$Spec$Install$StrategyName {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('RemediateOnFailure')
  remediateonfailure('RemediateOnFailure'),
  @JsonValue('RetryOnFailure')
  retryonfailure('RetryOnFailure');

  final String? value;

  const IoFluxcdToolkitHelmV2HelmRelease$Spec$Install$StrategyName(this.value);
}

enum IoFluxcdToolkitHelmV2HelmRelease$Spec$UninstallDeletionPropagation {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('background')
  background('background'),
  @JsonValue('foreground')
  foreground('foreground'),
  @JsonValue('orphan')
  orphan('orphan');

  final String? value;

  const IoFluxcdToolkitHelmV2HelmRelease$Spec$UninstallDeletionPropagation(
    this.value,
  );
}

enum IoFluxcdToolkitHelmV2HelmRelease$Spec$UpgradeCrds {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Skip')
  skip('Skip'),
  @JsonValue('Create')
  create('Create'),
  @JsonValue('CreateReplace')
  createreplace('CreateReplace');

  final String? value;

  const IoFluxcdToolkitHelmV2HelmRelease$Spec$UpgradeCrds(this.value);
}

enum IoFluxcdToolkitHelmV2HelmRelease$Spec$Upgrade$RemediationStrategy {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('rollback')
  rollback('rollback'),
  @JsonValue('uninstall')
  uninstall('uninstall');

  final String? value;

  const IoFluxcdToolkitHelmV2HelmRelease$Spec$Upgrade$RemediationStrategy(
    this.value,
  );
}

enum IoFluxcdToolkitHelmV2HelmRelease$Spec$Upgrade$StrategyName {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('RemediateOnFailure')
  remediateonfailure('RemediateOnFailure'),
  @JsonValue('RetryOnFailure')
  retryonfailure('RetryOnFailure');

  final String? value;

  const IoFluxcdToolkitHelmV2HelmRelease$Spec$Upgrade$StrategyName(this.value);
}

enum IoFluxcdToolkitHelmV2HelmRelease$Spec$ValuesFrom$ItemKind {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Secret')
  secret('Secret'),
  @JsonValue('ConfigMap')
  configmap('ConfigMap');

  final String? value;

  const IoFluxcdToolkitHelmV2HelmRelease$Spec$ValuesFrom$ItemKind(this.value);
}

enum IoFluxcdToolkitHelmV2HelmRelease$Status$Conditions$ItemStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('True')
  $true('True'),
  @JsonValue('False')
  $false('False'),
  @JsonValue('Unknown')
  unknown('Unknown');

  final String? value;

  const IoFluxcdToolkitHelmV2HelmRelease$Status$Conditions$ItemStatus(
    this.value,
  );
}

enum IoFluxcdToolkitHelmV2HelmRelease$StatusLastAttemptedReleaseAction {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('install')
  install('install'),
  @JsonValue('upgrade')
  upgrade('upgrade');

  final String? value;

  const IoFluxcdToolkitHelmV2HelmRelease$StatusLastAttemptedReleaseAction(
    this.value,
  );
}

enum IoFluxcdToolkitHelmV2beta2HelmRelease$Spec$Chart$SpecReconcileStrategy {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('ChartVersion')
  chartversion('ChartVersion'),
  @JsonValue('Revision')
  revision('Revision');

  final String? value;

  const IoFluxcdToolkitHelmV2beta2HelmRelease$Spec$Chart$SpecReconcileStrategy(
    this.value,
  );
}

enum IoFluxcdToolkitHelmV2beta2HelmRelease$Spec$Chart$Spec$SourceRefKind {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('HelmRepository')
  helmrepository('HelmRepository'),
  @JsonValue('GitRepository')
  gitrepository('GitRepository'),
  @JsonValue('Bucket')
  bucket('Bucket');

  final String? value;

  const IoFluxcdToolkitHelmV2beta2HelmRelease$Spec$Chart$Spec$SourceRefKind(
    this.value,
  );
}

enum IoFluxcdToolkitHelmV2beta2HelmRelease$Spec$Chart$Spec$VerifyProvider {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('cosign')
  cosign('cosign'),
  @JsonValue('notation')
  notation('notation');

  final String? value;

  const IoFluxcdToolkitHelmV2beta2HelmRelease$Spec$Chart$Spec$VerifyProvider(
    this.value,
  );
}

enum IoFluxcdToolkitHelmV2beta2HelmRelease$Spec$ChartRefKind {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('OCIRepository')
  ocirepository('OCIRepository'),
  @JsonValue('HelmChart')
  helmchart('HelmChart');

  final String? value;

  const IoFluxcdToolkitHelmV2beta2HelmRelease$Spec$ChartRefKind(this.value);
}

enum IoFluxcdToolkitHelmV2beta2HelmRelease$Spec$DriftDetectionMode {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('enabled')
  enabled('enabled'),
  @JsonValue('warn')
  warn('warn'),
  @JsonValue('disabled')
  disabled('disabled');

  final String? value;

  const IoFluxcdToolkitHelmV2beta2HelmRelease$Spec$DriftDetectionMode(
    this.value,
  );
}

enum IoFluxcdToolkitHelmV2beta2HelmRelease$Spec$InstallCrds {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Skip')
  skip('Skip'),
  @JsonValue('Create')
  create('Create'),
  @JsonValue('CreateReplace')
  createreplace('CreateReplace');

  final String? value;

  const IoFluxcdToolkitHelmV2beta2HelmRelease$Spec$InstallCrds(this.value);
}

enum IoFluxcdToolkitHelmV2beta2HelmRelease$Spec$PostRenderers$Item$Kustomize$PatchesJson6902$Item$Patch$ItemOp {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('test')
  test('test'),
  @JsonValue('remove')
  remove('remove'),
  @JsonValue('add')
  add('add'),
  @JsonValue('replace')
  replace('replace'),
  @JsonValue('move')
  move('move'),
  @JsonValue('copy')
  copy('copy');

  final String? value;

  const IoFluxcdToolkitHelmV2beta2HelmRelease$Spec$PostRenderers$Item$Kustomize$PatchesJson6902$Item$Patch$ItemOp(
    this.value,
  );
}

enum IoFluxcdToolkitHelmV2beta2HelmRelease$Spec$UninstallDeletionPropagation {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('background')
  background('background'),
  @JsonValue('foreground')
  foreground('foreground'),
  @JsonValue('orphan')
  orphan('orphan');

  final String? value;

  const IoFluxcdToolkitHelmV2beta2HelmRelease$Spec$UninstallDeletionPropagation(
    this.value,
  );
}

enum IoFluxcdToolkitHelmV2beta2HelmRelease$Spec$UpgradeCrds {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Skip')
  skip('Skip'),
  @JsonValue('Create')
  create('Create'),
  @JsonValue('CreateReplace')
  createreplace('CreateReplace');

  final String? value;

  const IoFluxcdToolkitHelmV2beta2HelmRelease$Spec$UpgradeCrds(this.value);
}

enum IoFluxcdToolkitHelmV2beta2HelmRelease$Spec$Upgrade$RemediationStrategy {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('rollback')
  rollback('rollback'),
  @JsonValue('uninstall')
  uninstall('uninstall');

  final String? value;

  const IoFluxcdToolkitHelmV2beta2HelmRelease$Spec$Upgrade$RemediationStrategy(
    this.value,
  );
}

enum IoFluxcdToolkitHelmV2beta2HelmRelease$Spec$ValuesFrom$ItemKind {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Secret')
  secret('Secret'),
  @JsonValue('ConfigMap')
  configmap('ConfigMap');

  final String? value;

  const IoFluxcdToolkitHelmV2beta2HelmRelease$Spec$ValuesFrom$ItemKind(
    this.value,
  );
}

enum IoFluxcdToolkitHelmV2beta2HelmRelease$Status$Conditions$ItemStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('True')
  $true('True'),
  @JsonValue('False')
  $false('False'),
  @JsonValue('Unknown')
  unknown('Unknown');

  final String? value;

  const IoFluxcdToolkitHelmV2beta2HelmRelease$Status$Conditions$ItemStatus(
    this.value,
  );
}

enum IoFluxcdToolkitHelmV2beta2HelmRelease$StatusLastAttemptedReleaseAction {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('install')
  install('install'),
  @JsonValue('upgrade')
  upgrade('upgrade');

  final String? value;

  const IoFluxcdToolkitHelmV2beta2HelmRelease$StatusLastAttemptedReleaseAction(
    this.value,
  );
}

enum IoFluxcdToolkitImageV1ImagePolicy$SpecDigestReflectionPolicy {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Always')
  always('Always'),
  @JsonValue('IfNotPresent')
  ifnotpresent('IfNotPresent'),
  @JsonValue('Never')
  never('Never');

  final String? value;

  const IoFluxcdToolkitImageV1ImagePolicy$SpecDigestReflectionPolicy(
    this.value,
  );
}

enum IoFluxcdToolkitImageV1ImagePolicy$Spec$Policy$AlphabeticalOrder {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('asc')
  asc('asc'),
  @JsonValue('desc')
  desc('desc');

  final String? value;

  const IoFluxcdToolkitImageV1ImagePolicy$Spec$Policy$AlphabeticalOrder(
    this.value,
  );
}

enum IoFluxcdToolkitImageV1ImagePolicy$Spec$Policy$NumericalOrder {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('asc')
  asc('asc'),
  @JsonValue('desc')
  desc('desc');

  final String? value;

  const IoFluxcdToolkitImageV1ImagePolicy$Spec$Policy$NumericalOrder(
    this.value,
  );
}

enum IoFluxcdToolkitImageV1ImagePolicy$Status$Conditions$ItemStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('True')
  $true('True'),
  @JsonValue('False')
  $false('False'),
  @JsonValue('Unknown')
  unknown('Unknown');

  final String? value;

  const IoFluxcdToolkitImageV1ImagePolicy$Status$Conditions$ItemStatus(
    this.value,
  );
}

enum IoFluxcdToolkitImageV1ImageRepository$SpecProvider {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('generic')
  generic('generic'),
  @JsonValue('aws')
  aws('aws'),
  @JsonValue('azure')
  azure('azure'),
  @JsonValue('gcp')
  gcp('gcp');

  final String? value;

  const IoFluxcdToolkitImageV1ImageRepository$SpecProvider(this.value);
}

enum IoFluxcdToolkitImageV1ImageRepository$Status$Conditions$ItemStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('True')
  $true('True'),
  @JsonValue('False')
  $false('False'),
  @JsonValue('Unknown')
  unknown('Unknown');

  final String? value;

  const IoFluxcdToolkitImageV1ImageRepository$Status$Conditions$ItemStatus(
    this.value,
  );
}

enum IoFluxcdToolkitImageV1ImageUpdateAutomation$Spec$SourceRefKind {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('GitRepository')
  gitrepository('GitRepository');

  final String? value;

  const IoFluxcdToolkitImageV1ImageUpdateAutomation$Spec$SourceRefKind(
    this.value,
  );
}

enum IoFluxcdToolkitImageV1ImageUpdateAutomation$Spec$UpdateStrategy {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Setters')
  setters('Setters');

  final String? value;

  const IoFluxcdToolkitImageV1ImageUpdateAutomation$Spec$UpdateStrategy(
    this.value,
  );
}

enum IoFluxcdToolkitImageV1ImageUpdateAutomation$Status$Conditions$ItemStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('True')
  $true('True'),
  @JsonValue('False')
  $false('False'),
  @JsonValue('Unknown')
  unknown('Unknown');

  final String? value;

  const IoFluxcdToolkitImageV1ImageUpdateAutomation$Status$Conditions$ItemStatus(
    this.value,
  );
}

enum IoFluxcdToolkitImageV1beta2ImagePolicy$SpecDigestReflectionPolicy {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Always')
  always('Always'),
  @JsonValue('IfNotPresent')
  ifnotpresent('IfNotPresent'),
  @JsonValue('Never')
  never('Never');

  final String? value;

  const IoFluxcdToolkitImageV1beta2ImagePolicy$SpecDigestReflectionPolicy(
    this.value,
  );
}

enum IoFluxcdToolkitImageV1beta2ImagePolicy$Spec$Policy$AlphabeticalOrder {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('asc')
  asc('asc'),
  @JsonValue('desc')
  desc('desc');

  final String? value;

  const IoFluxcdToolkitImageV1beta2ImagePolicy$Spec$Policy$AlphabeticalOrder(
    this.value,
  );
}

enum IoFluxcdToolkitImageV1beta2ImagePolicy$Spec$Policy$NumericalOrder {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('asc')
  asc('asc'),
  @JsonValue('desc')
  desc('desc');

  final String? value;

  const IoFluxcdToolkitImageV1beta2ImagePolicy$Spec$Policy$NumericalOrder(
    this.value,
  );
}

enum IoFluxcdToolkitImageV1beta2ImagePolicy$Status$Conditions$ItemStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('True')
  $true('True'),
  @JsonValue('False')
  $false('False'),
  @JsonValue('Unknown')
  unknown('Unknown');

  final String? value;

  const IoFluxcdToolkitImageV1beta2ImagePolicy$Status$Conditions$ItemStatus(
    this.value,
  );
}

enum IoFluxcdToolkitImageV1beta2ImageRepository$SpecProvider {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('generic')
  generic('generic'),
  @JsonValue('aws')
  aws('aws'),
  @JsonValue('azure')
  azure('azure'),
  @JsonValue('gcp')
  gcp('gcp');

  final String? value;

  const IoFluxcdToolkitImageV1beta2ImageRepository$SpecProvider(this.value);
}

enum IoFluxcdToolkitImageV1beta2ImageRepository$Status$Conditions$ItemStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('True')
  $true('True'),
  @JsonValue('False')
  $false('False'),
  @JsonValue('Unknown')
  unknown('Unknown');

  final String? value;

  const IoFluxcdToolkitImageV1beta2ImageRepository$Status$Conditions$ItemStatus(
    this.value,
  );
}

enum IoFluxcdToolkitImageV1beta2ImageUpdateAutomation$Spec$SourceRefKind {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('GitRepository')
  gitrepository('GitRepository');

  final String? value;

  const IoFluxcdToolkitImageV1beta2ImageUpdateAutomation$Spec$SourceRefKind(
    this.value,
  );
}

enum IoFluxcdToolkitImageV1beta2ImageUpdateAutomation$Spec$UpdateStrategy {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Setters')
  setters('Setters');

  final String? value;

  const IoFluxcdToolkitImageV1beta2ImageUpdateAutomation$Spec$UpdateStrategy(
    this.value,
  );
}

enum IoFluxcdToolkitImageV1beta2ImageUpdateAutomation$Status$Conditions$ItemStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('True')
  $true('True'),
  @JsonValue('False')
  $false('False'),
  @JsonValue('Unknown')
  unknown('Unknown');

  final String? value;

  const IoFluxcdToolkitImageV1beta2ImageUpdateAutomation$Status$Conditions$ItemStatus(
    this.value,
  );
}

enum IoFluxcdToolkitKustomizeV1Kustomization$Spec$DecryptionProvider {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('sops')
  sops('sops');

  final String? value;

  const IoFluxcdToolkitKustomizeV1Kustomization$Spec$DecryptionProvider(
    this.value,
  );
}

enum IoFluxcdToolkitKustomizeV1Kustomization$SpecDeletionPolicy {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('MirrorPrune')
  mirrorprune('MirrorPrune'),
  @JsonValue('Delete')
  delete('Delete'),
  @JsonValue('WaitForTermination')
  waitfortermination('WaitForTermination'),
  @JsonValue('Orphan')
  orphan('Orphan');

  final String? value;

  const IoFluxcdToolkitKustomizeV1Kustomization$SpecDeletionPolicy(this.value);
}

enum IoFluxcdToolkitKustomizeV1Kustomization$Spec$PostBuild$SubstituteFrom$ItemKind {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Secret')
  secret('Secret'),
  @JsonValue('ConfigMap')
  configmap('ConfigMap');

  final String? value;

  const IoFluxcdToolkitKustomizeV1Kustomization$Spec$PostBuild$SubstituteFrom$ItemKind(
    this.value,
  );
}

enum IoFluxcdToolkitKustomizeV1Kustomization$Spec$SourceRefKind {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('OCIRepository')
  ocirepository('OCIRepository'),
  @JsonValue('GitRepository')
  gitrepository('GitRepository'),
  @JsonValue('Bucket')
  bucket('Bucket'),
  @JsonValue('ExternalArtifact')
  externalartifact('ExternalArtifact');

  final String? value;

  const IoFluxcdToolkitKustomizeV1Kustomization$Spec$SourceRefKind(this.value);
}

enum IoFluxcdToolkitKustomizeV1Kustomization$Status$Conditions$ItemStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('True')
  $true('True'),
  @JsonValue('False')
  $false('False'),
  @JsonValue('Unknown')
  unknown('Unknown');

  final String? value;

  const IoFluxcdToolkitKustomizeV1Kustomization$Status$Conditions$ItemStatus(
    this.value,
  );
}

enum IoFluxcdToolkitKustomizeV1beta2Kustomization$Spec$DecryptionProvider {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('sops')
  sops('sops');

  final String? value;

  const IoFluxcdToolkitKustomizeV1beta2Kustomization$Spec$DecryptionProvider(
    this.value,
  );
}

enum IoFluxcdToolkitKustomizeV1beta2Kustomization$Spec$PatchesJson6902$Item$Patch$ItemOp {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('test')
  test('test'),
  @JsonValue('remove')
  remove('remove'),
  @JsonValue('add')
  add('add'),
  @JsonValue('replace')
  replace('replace'),
  @JsonValue('move')
  move('move'),
  @JsonValue('copy')
  copy('copy');

  final String? value;

  const IoFluxcdToolkitKustomizeV1beta2Kustomization$Spec$PatchesJson6902$Item$Patch$ItemOp(
    this.value,
  );
}

enum IoFluxcdToolkitKustomizeV1beta2Kustomization$Spec$PostBuild$SubstituteFrom$ItemKind {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Secret')
  secret('Secret'),
  @JsonValue('ConfigMap')
  configmap('ConfigMap');

  final String? value;

  const IoFluxcdToolkitKustomizeV1beta2Kustomization$Spec$PostBuild$SubstituteFrom$ItemKind(
    this.value,
  );
}

enum IoFluxcdToolkitKustomizeV1beta2Kustomization$Spec$SourceRefKind {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('OCIRepository')
  ocirepository('OCIRepository'),
  @JsonValue('GitRepository')
  gitrepository('GitRepository'),
  @JsonValue('Bucket')
  bucket('Bucket');

  final String? value;

  const IoFluxcdToolkitKustomizeV1beta2Kustomization$Spec$SourceRefKind(
    this.value,
  );
}

enum IoFluxcdToolkitKustomizeV1beta2Kustomization$SpecValidation {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('none')
  none('none'),
  @JsonValue('client')
  $client('client'),
  @JsonValue('server')
  server('server');

  final String? value;

  const IoFluxcdToolkitKustomizeV1beta2Kustomization$SpecValidation(this.value);
}

enum IoFluxcdToolkitKustomizeV1beta2Kustomization$Status$Conditions$ItemStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('True')
  $true('True'),
  @JsonValue('False')
  $false('False'),
  @JsonValue('Unknown')
  unknown('Unknown');

  final String? value;

  const IoFluxcdToolkitKustomizeV1beta2Kustomization$Status$Conditions$ItemStatus(
    this.value,
  );
}

enum IoFluxcdToolkitNotificationV1Receiver$Spec$Resources$ItemKind {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Bucket')
  bucket('Bucket'),
  @JsonValue('GitRepository')
  gitrepository('GitRepository'),
  @JsonValue('Kustomization')
  kustomization('Kustomization'),
  @JsonValue('HelmRelease')
  helmrelease('HelmRelease'),
  @JsonValue('HelmChart')
  helmchart('HelmChart'),
  @JsonValue('HelmRepository')
  helmrepository('HelmRepository'),
  @JsonValue('ImageRepository')
  imagerepository('ImageRepository'),
  @JsonValue('ImagePolicy')
  imagepolicy('ImagePolicy'),
  @JsonValue('ImageUpdateAutomation')
  imageupdateautomation('ImageUpdateAutomation'),
  @JsonValue('OCIRepository')
  ocirepository('OCIRepository');

  final String? value;

  const IoFluxcdToolkitNotificationV1Receiver$Spec$Resources$ItemKind(
    this.value,
  );
}

enum IoFluxcdToolkitNotificationV1Receiver$SpecType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('generic')
  generic('generic'),
  @JsonValue('generic-hmac')
  genericHmac('generic-hmac'),
  @JsonValue('github')
  github('github'),
  @JsonValue('gitlab')
  gitlab('gitlab'),
  @JsonValue('bitbucket')
  bitbucket('bitbucket'),
  @JsonValue('harbor')
  harbor('harbor'),
  @JsonValue('dockerhub')
  dockerhub('dockerhub'),
  @JsonValue('quay')
  quay('quay'),
  @JsonValue('gcr')
  gcr('gcr'),
  @JsonValue('nexus')
  nexus('nexus'),
  @JsonValue('acr')
  acr('acr'),
  @JsonValue('cdevents')
  cdevents('cdevents');

  final String? value;

  const IoFluxcdToolkitNotificationV1Receiver$SpecType(this.value);
}

enum IoFluxcdToolkitNotificationV1Receiver$Status$Conditions$ItemStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('True')
  $true('True'),
  @JsonValue('False')
  $false('False'),
  @JsonValue('Unknown')
  unknown('Unknown');

  final String? value;

  const IoFluxcdToolkitNotificationV1Receiver$Status$Conditions$ItemStatus(
    this.value,
  );
}

enum IoFluxcdToolkitNotificationV1beta2Alert$SpecEventSeverity {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('info')
  info('info'),
  @JsonValue('error')
  error('error');

  final String? value;

  const IoFluxcdToolkitNotificationV1beta2Alert$SpecEventSeverity(this.value);
}

enum IoFluxcdToolkitNotificationV1beta2Alert$Spec$EventSources$ItemKind {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Bucket')
  bucket('Bucket'),
  @JsonValue('GitRepository')
  gitrepository('GitRepository'),
  @JsonValue('Kustomization')
  kustomization('Kustomization'),
  @JsonValue('HelmRelease')
  helmrelease('HelmRelease'),
  @JsonValue('HelmChart')
  helmchart('HelmChart'),
  @JsonValue('HelmRepository')
  helmrepository('HelmRepository'),
  @JsonValue('ImageRepository')
  imagerepository('ImageRepository'),
  @JsonValue('ImagePolicy')
  imagepolicy('ImagePolicy'),
  @JsonValue('ImageUpdateAutomation')
  imageupdateautomation('ImageUpdateAutomation'),
  @JsonValue('OCIRepository')
  ocirepository('OCIRepository');

  final String? value;

  const IoFluxcdToolkitNotificationV1beta2Alert$Spec$EventSources$ItemKind(
    this.value,
  );
}

enum IoFluxcdToolkitNotificationV1beta2Alert$Status$Conditions$ItemStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('True')
  $true('True'),
  @JsonValue('False')
  $false('False'),
  @JsonValue('Unknown')
  unknown('Unknown');

  final String? value;

  const IoFluxcdToolkitNotificationV1beta2Alert$Status$Conditions$ItemStatus(
    this.value,
  );
}

enum IoFluxcdToolkitNotificationV1beta2Provider$SpecType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('slack')
  slack('slack'),
  @JsonValue('discord')
  discord('discord'),
  @JsonValue('msteams')
  msteams('msteams'),
  @JsonValue('rocket')
  rocket('rocket'),
  @JsonValue('generic')
  generic('generic'),
  @JsonValue('generic-hmac')
  genericHmac('generic-hmac'),
  @JsonValue('github')
  github('github'),
  @JsonValue('gitlab')
  gitlab('gitlab'),
  @JsonValue('gitea')
  gitea('gitea'),
  @JsonValue('bitbucketserver')
  bitbucketserver('bitbucketserver'),
  @JsonValue('bitbucket')
  bitbucket('bitbucket'),
  @JsonValue('azuredevops')
  azuredevops('azuredevops'),
  @JsonValue('googlechat')
  googlechat('googlechat'),
  @JsonValue('googlepubsub')
  googlepubsub('googlepubsub'),
  @JsonValue('webex')
  webex('webex'),
  @JsonValue('sentry')
  sentry('sentry'),
  @JsonValue('azureeventhub')
  azureeventhub('azureeventhub'),
  @JsonValue('telegram')
  telegram('telegram'),
  @JsonValue('lark')
  lark('lark'),
  @JsonValue('matrix')
  matrix('matrix'),
  @JsonValue('opsgenie')
  opsgenie('opsgenie'),
  @JsonValue('alertmanager')
  alertmanager('alertmanager'),
  @JsonValue('grafana')
  grafana('grafana'),
  @JsonValue('githubdispatch')
  githubdispatch('githubdispatch'),
  @JsonValue('pagerduty')
  pagerduty('pagerduty'),
  @JsonValue('datadog')
  datadog('datadog');

  final String? value;

  const IoFluxcdToolkitNotificationV1beta2Provider$SpecType(this.value);
}

enum IoFluxcdToolkitNotificationV1beta2Provider$Status$Conditions$ItemStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('True')
  $true('True'),
  @JsonValue('False')
  $false('False'),
  @JsonValue('Unknown')
  unknown('Unknown');

  final String? value;

  const IoFluxcdToolkitNotificationV1beta2Provider$Status$Conditions$ItemStatus(
    this.value,
  );
}

enum IoFluxcdToolkitNotificationV1beta2Receiver$Spec$Resources$ItemKind {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Bucket')
  bucket('Bucket'),
  @JsonValue('GitRepository')
  gitrepository('GitRepository'),
  @JsonValue('Kustomization')
  kustomization('Kustomization'),
  @JsonValue('HelmRelease')
  helmrelease('HelmRelease'),
  @JsonValue('HelmChart')
  helmchart('HelmChart'),
  @JsonValue('HelmRepository')
  helmrepository('HelmRepository'),
  @JsonValue('ImageRepository')
  imagerepository('ImageRepository'),
  @JsonValue('ImagePolicy')
  imagepolicy('ImagePolicy'),
  @JsonValue('ImageUpdateAutomation')
  imageupdateautomation('ImageUpdateAutomation'),
  @JsonValue('OCIRepository')
  ocirepository('OCIRepository');

  final String? value;

  const IoFluxcdToolkitNotificationV1beta2Receiver$Spec$Resources$ItemKind(
    this.value,
  );
}

enum IoFluxcdToolkitNotificationV1beta2Receiver$SpecType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('generic')
  generic('generic'),
  @JsonValue('generic-hmac')
  genericHmac('generic-hmac'),
  @JsonValue('github')
  github('github'),
  @JsonValue('gitlab')
  gitlab('gitlab'),
  @JsonValue('bitbucket')
  bitbucket('bitbucket'),
  @JsonValue('harbor')
  harbor('harbor'),
  @JsonValue('dockerhub')
  dockerhub('dockerhub'),
  @JsonValue('quay')
  quay('quay'),
  @JsonValue('gcr')
  gcr('gcr'),
  @JsonValue('nexus')
  nexus('nexus'),
  @JsonValue('acr')
  acr('acr');

  final String? value;

  const IoFluxcdToolkitNotificationV1beta2Receiver$SpecType(this.value);
}

enum IoFluxcdToolkitNotificationV1beta2Receiver$Status$Conditions$ItemStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('True')
  $true('True'),
  @JsonValue('False')
  $false('False'),
  @JsonValue('Unknown')
  unknown('Unknown');

  final String? value;

  const IoFluxcdToolkitNotificationV1beta2Receiver$Status$Conditions$ItemStatus(
    this.value,
  );
}

enum IoFluxcdToolkitNotificationV1beta3Alert$SpecEventSeverity {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('info')
  info('info'),
  @JsonValue('error')
  error('error');

  final String? value;

  const IoFluxcdToolkitNotificationV1beta3Alert$SpecEventSeverity(this.value);
}

enum IoFluxcdToolkitNotificationV1beta3Alert$Spec$EventSources$ItemKind {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Bucket')
  bucket('Bucket'),
  @JsonValue('GitRepository')
  gitrepository('GitRepository'),
  @JsonValue('Kustomization')
  kustomization('Kustomization'),
  @JsonValue('HelmRelease')
  helmrelease('HelmRelease'),
  @JsonValue('HelmChart')
  helmchart('HelmChart'),
  @JsonValue('HelmRepository')
  helmrepository('HelmRepository'),
  @JsonValue('ImageRepository')
  imagerepository('ImageRepository'),
  @JsonValue('ImagePolicy')
  imagepolicy('ImagePolicy'),
  @JsonValue('ImageUpdateAutomation')
  imageupdateautomation('ImageUpdateAutomation'),
  @JsonValue('OCIRepository')
  ocirepository('OCIRepository');

  final String? value;

  const IoFluxcdToolkitNotificationV1beta3Alert$Spec$EventSources$ItemKind(
    this.value,
  );
}

enum IoFluxcdToolkitNotificationV1beta3Provider$SpecType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('slack')
  slack('slack'),
  @JsonValue('discord')
  discord('discord'),
  @JsonValue('msteams')
  msteams('msteams'),
  @JsonValue('rocket')
  rocket('rocket'),
  @JsonValue('generic')
  generic('generic'),
  @JsonValue('generic-hmac')
  genericHmac('generic-hmac'),
  @JsonValue('github')
  github('github'),
  @JsonValue('gitlab')
  gitlab('gitlab'),
  @JsonValue('gitea')
  gitea('gitea'),
  @JsonValue('bitbucketserver')
  bitbucketserver('bitbucketserver'),
  @JsonValue('bitbucket')
  bitbucket('bitbucket'),
  @JsonValue('azuredevops')
  azuredevops('azuredevops'),
  @JsonValue('googlechat')
  googlechat('googlechat'),
  @JsonValue('googlepubsub')
  googlepubsub('googlepubsub'),
  @JsonValue('webex')
  webex('webex'),
  @JsonValue('sentry')
  sentry('sentry'),
  @JsonValue('azureeventhub')
  azureeventhub('azureeventhub'),
  @JsonValue('telegram')
  telegram('telegram'),
  @JsonValue('lark')
  lark('lark'),
  @JsonValue('matrix')
  matrix('matrix'),
  @JsonValue('opsgenie')
  opsgenie('opsgenie'),
  @JsonValue('alertmanager')
  alertmanager('alertmanager'),
  @JsonValue('grafana')
  grafana('grafana'),
  @JsonValue('githubdispatch')
  githubdispatch('githubdispatch'),
  @JsonValue('pagerduty')
  pagerduty('pagerduty'),
  @JsonValue('datadog')
  datadog('datadog'),
  @JsonValue('nats')
  nats('nats'),
  @JsonValue('zulip')
  zulip('zulip'),
  @JsonValue('otel')
  otel('otel');

  final String? value;

  const IoFluxcdToolkitNotificationV1beta3Provider$SpecType(this.value);
}

enum IoFluxcdToolkitSourceV1Bucket$SpecProvider {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('generic')
  generic('generic'),
  @JsonValue('aws')
  aws('aws'),
  @JsonValue('gcp')
  gcp('gcp'),
  @JsonValue('azure')
  azure('azure');

  final String? value;

  const IoFluxcdToolkitSourceV1Bucket$SpecProvider(this.value);
}

enum IoFluxcdToolkitSourceV1Bucket$Spec$StsProvider {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('aws')
  aws('aws'),
  @JsonValue('ldap')
  ldap('ldap');

  final String? value;

  const IoFluxcdToolkitSourceV1Bucket$Spec$StsProvider(this.value);
}

enum IoFluxcdToolkitSourceV1Bucket$Status$Conditions$ItemStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('True')
  $true('True'),
  @JsonValue('False')
  $false('False'),
  @JsonValue('Unknown')
  unknown('Unknown');

  final String? value;

  const IoFluxcdToolkitSourceV1Bucket$Status$Conditions$ItemStatus(this.value);
}

enum IoFluxcdToolkitSourceV1ExternalArtifact$Status$Conditions$ItemStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('True')
  $true('True'),
  @JsonValue('False')
  $false('False'),
  @JsonValue('Unknown')
  unknown('Unknown');

  final String? value;

  const IoFluxcdToolkitSourceV1ExternalArtifact$Status$Conditions$ItemStatus(
    this.value,
  );
}

enum IoFluxcdToolkitSourceV1GitRepository$SpecProvider {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('generic')
  generic('generic'),
  @JsonValue('azure')
  azure('azure'),
  @JsonValue('github')
  github('github');

  final String? value;

  const IoFluxcdToolkitSourceV1GitRepository$SpecProvider(this.value);
}

enum IoFluxcdToolkitSourceV1GitRepository$Spec$VerifyMode {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('head')
  head('head'),
  @JsonValue('HEAD')
  $head('HEAD'),
  @JsonValue('Tag')
  tag('Tag'),
  @JsonValue('TagAndHEAD')
  tagandhead('TagAndHEAD');

  final String? value;

  const IoFluxcdToolkitSourceV1GitRepository$Spec$VerifyMode(this.value);
}

enum IoFluxcdToolkitSourceV1GitRepository$Status$Conditions$ItemStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('True')
  $true('True'),
  @JsonValue('False')
  $false('False'),
  @JsonValue('Unknown')
  unknown('Unknown');

  final String? value;

  const IoFluxcdToolkitSourceV1GitRepository$Status$Conditions$ItemStatus(
    this.value,
  );
}

enum IoFluxcdToolkitSourceV1HelmChart$SpecReconcileStrategy {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('ChartVersion')
  chartversion('ChartVersion'),
  @JsonValue('Revision')
  revision('Revision');

  final String? value;

  const IoFluxcdToolkitSourceV1HelmChart$SpecReconcileStrategy(this.value);
}

enum IoFluxcdToolkitSourceV1HelmChart$Spec$SourceRefKind {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('HelmRepository')
  helmrepository('HelmRepository'),
  @JsonValue('GitRepository')
  gitrepository('GitRepository'),
  @JsonValue('Bucket')
  bucket('Bucket');

  final String? value;

  const IoFluxcdToolkitSourceV1HelmChart$Spec$SourceRefKind(this.value);
}

enum IoFluxcdToolkitSourceV1HelmChart$Spec$VerifyProvider {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('cosign')
  cosign('cosign'),
  @JsonValue('notation')
  notation('notation');

  final String? value;

  const IoFluxcdToolkitSourceV1HelmChart$Spec$VerifyProvider(this.value);
}

enum IoFluxcdToolkitSourceV1HelmChart$Status$Conditions$ItemStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('True')
  $true('True'),
  @JsonValue('False')
  $false('False'),
  @JsonValue('Unknown')
  unknown('Unknown');

  final String? value;

  const IoFluxcdToolkitSourceV1HelmChart$Status$Conditions$ItemStatus(
    this.value,
  );
}

enum IoFluxcdToolkitSourceV1HelmRepository$SpecProvider {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('generic')
  generic('generic'),
  @JsonValue('aws')
  aws('aws'),
  @JsonValue('azure')
  azure('azure'),
  @JsonValue('gcp')
  gcp('gcp');

  final String? value;

  const IoFluxcdToolkitSourceV1HelmRepository$SpecProvider(this.value);
}

enum IoFluxcdToolkitSourceV1HelmRepository$SpecType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('default')
  $default('default'),
  @JsonValue('oci')
  oci('oci');

  final String? value;

  const IoFluxcdToolkitSourceV1HelmRepository$SpecType(this.value);
}

enum IoFluxcdToolkitSourceV1HelmRepository$Status$Conditions$ItemStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('True')
  $true('True'),
  @JsonValue('False')
  $false('False'),
  @JsonValue('Unknown')
  unknown('Unknown');

  final String? value;

  const IoFluxcdToolkitSourceV1HelmRepository$Status$Conditions$ItemStatus(
    this.value,
  );
}

enum IoFluxcdToolkitSourceV1OCIRepository$Spec$LayerSelectorOperation {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('extract')
  extract('extract'),
  @JsonValue('copy')
  copy('copy');

  final String? value;

  const IoFluxcdToolkitSourceV1OCIRepository$Spec$LayerSelectorOperation(
    this.value,
  );
}

enum IoFluxcdToolkitSourceV1OCIRepository$SpecProvider {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('generic')
  generic('generic'),
  @JsonValue('aws')
  aws('aws'),
  @JsonValue('azure')
  azure('azure'),
  @JsonValue('gcp')
  gcp('gcp');

  final String? value;

  const IoFluxcdToolkitSourceV1OCIRepository$SpecProvider(this.value);
}

enum IoFluxcdToolkitSourceV1OCIRepository$Spec$VerifyProvider {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('cosign')
  cosign('cosign'),
  @JsonValue('notation')
  notation('notation');

  final String? value;

  const IoFluxcdToolkitSourceV1OCIRepository$Spec$VerifyProvider(this.value);
}

enum IoFluxcdToolkitSourceV1OCIRepository$Status$Conditions$ItemStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('True')
  $true('True'),
  @JsonValue('False')
  $false('False'),
  @JsonValue('Unknown')
  unknown('Unknown');

  final String? value;

  const IoFluxcdToolkitSourceV1OCIRepository$Status$Conditions$ItemStatus(
    this.value,
  );
}

enum IoFluxcdToolkitSourceV1OCIRepository$Status$ObservedLayerSelectorOperation {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('extract')
  extract('extract'),
  @JsonValue('copy')
  copy('copy');

  final String? value;

  const IoFluxcdToolkitSourceV1OCIRepository$Status$ObservedLayerSelectorOperation(
    this.value,
  );
}

enum IoFluxcdToolkitSourceV1beta2Bucket$SpecProvider {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('generic')
  generic('generic'),
  @JsonValue('aws')
  aws('aws'),
  @JsonValue('gcp')
  gcp('gcp'),
  @JsonValue('azure')
  azure('azure');

  final String? value;

  const IoFluxcdToolkitSourceV1beta2Bucket$SpecProvider(this.value);
}

enum IoFluxcdToolkitSourceV1beta2Bucket$Spec$StsProvider {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('aws')
  aws('aws'),
  @JsonValue('ldap')
  ldap('ldap');

  final String? value;

  const IoFluxcdToolkitSourceV1beta2Bucket$Spec$StsProvider(this.value);
}

enum IoFluxcdToolkitSourceV1beta2Bucket$Status$Conditions$ItemStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('True')
  $true('True'),
  @JsonValue('False')
  $false('False'),
  @JsonValue('Unknown')
  unknown('Unknown');

  final String? value;

  const IoFluxcdToolkitSourceV1beta2Bucket$Status$Conditions$ItemStatus(
    this.value,
  );
}

enum IoFluxcdToolkitSourceV1beta2GitRepository$SpecGitImplementation {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('go-git')
  goGit('go-git'),
  @JsonValue('libgit2')
  libgit2('libgit2');

  final String? value;

  const IoFluxcdToolkitSourceV1beta2GitRepository$SpecGitImplementation(
    this.value,
  );
}

enum IoFluxcdToolkitSourceV1beta2GitRepository$Spec$VerifyMode {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('head')
  head('head');

  final String? value;

  const IoFluxcdToolkitSourceV1beta2GitRepository$Spec$VerifyMode(this.value);
}

enum IoFluxcdToolkitSourceV1beta2GitRepository$Status$Conditions$ItemStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('True')
  $true('True'),
  @JsonValue('False')
  $false('False'),
  @JsonValue('Unknown')
  unknown('Unknown');

  final String? value;

  const IoFluxcdToolkitSourceV1beta2GitRepository$Status$Conditions$ItemStatus(
    this.value,
  );
}

enum IoFluxcdToolkitSourceV1beta2HelmChart$SpecReconcileStrategy {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('ChartVersion')
  chartversion('ChartVersion'),
  @JsonValue('Revision')
  revision('Revision');

  final String? value;

  const IoFluxcdToolkitSourceV1beta2HelmChart$SpecReconcileStrategy(this.value);
}

enum IoFluxcdToolkitSourceV1beta2HelmChart$Spec$SourceRefKind {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('HelmRepository')
  helmrepository('HelmRepository'),
  @JsonValue('GitRepository')
  gitrepository('GitRepository'),
  @JsonValue('Bucket')
  bucket('Bucket');

  final String? value;

  const IoFluxcdToolkitSourceV1beta2HelmChart$Spec$SourceRefKind(this.value);
}

enum IoFluxcdToolkitSourceV1beta2HelmChart$Spec$VerifyProvider {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('cosign')
  cosign('cosign'),
  @JsonValue('notation')
  notation('notation');

  final String? value;

  const IoFluxcdToolkitSourceV1beta2HelmChart$Spec$VerifyProvider(this.value);
}

enum IoFluxcdToolkitSourceV1beta2HelmChart$Status$Conditions$ItemStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('True')
  $true('True'),
  @JsonValue('False')
  $false('False'),
  @JsonValue('Unknown')
  unknown('Unknown');

  final String? value;

  const IoFluxcdToolkitSourceV1beta2HelmChart$Status$Conditions$ItemStatus(
    this.value,
  );
}

enum IoFluxcdToolkitSourceV1beta2HelmRepository$SpecProvider {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('generic')
  generic('generic'),
  @JsonValue('aws')
  aws('aws'),
  @JsonValue('azure')
  azure('azure'),
  @JsonValue('gcp')
  gcp('gcp');

  final String? value;

  const IoFluxcdToolkitSourceV1beta2HelmRepository$SpecProvider(this.value);
}

enum IoFluxcdToolkitSourceV1beta2HelmRepository$SpecType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('default')
  $default('default'),
  @JsonValue('oci')
  oci('oci');

  final String? value;

  const IoFluxcdToolkitSourceV1beta2HelmRepository$SpecType(this.value);
}

enum IoFluxcdToolkitSourceV1beta2HelmRepository$Status$Conditions$ItemStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('True')
  $true('True'),
  @JsonValue('False')
  $false('False'),
  @JsonValue('Unknown')
  unknown('Unknown');

  final String? value;

  const IoFluxcdToolkitSourceV1beta2HelmRepository$Status$Conditions$ItemStatus(
    this.value,
  );
}

enum IoFluxcdToolkitSourceV1beta2OCIRepository$Spec$LayerSelectorOperation {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('extract')
  extract('extract'),
  @JsonValue('copy')
  copy('copy');

  final String? value;

  const IoFluxcdToolkitSourceV1beta2OCIRepository$Spec$LayerSelectorOperation(
    this.value,
  );
}

enum IoFluxcdToolkitSourceV1beta2OCIRepository$SpecProvider {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('generic')
  generic('generic'),
  @JsonValue('aws')
  aws('aws'),
  @JsonValue('azure')
  azure('azure'),
  @JsonValue('gcp')
  gcp('gcp');

  final String? value;

  const IoFluxcdToolkitSourceV1beta2OCIRepository$SpecProvider(this.value);
}

enum IoFluxcdToolkitSourceV1beta2OCIRepository$Spec$VerifyProvider {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('cosign')
  cosign('cosign'),
  @JsonValue('notation')
  notation('notation');

  final String? value;

  const IoFluxcdToolkitSourceV1beta2OCIRepository$Spec$VerifyProvider(
    this.value,
  );
}

enum IoFluxcdToolkitSourceV1beta2OCIRepository$Status$Conditions$ItemStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('True')
  $true('True'),
  @JsonValue('False')
  $false('False'),
  @JsonValue('Unknown')
  unknown('Unknown');

  final String? value;

  const IoFluxcdToolkitSourceV1beta2OCIRepository$Status$Conditions$ItemStatus(
    this.value,
  );
}

enum IoFluxcdToolkitSourceV1beta2OCIRepository$Status$ObservedLayerSelectorOperation {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('extract')
  extract('extract'),
  @JsonValue('copy')
  copy('copy');

  final String? value;

  const IoFluxcdToolkitSourceV1beta2OCIRepository$Status$ObservedLayerSelectorOperation(
    this.value,
  );
}

enum IoK8sApiAdmissionregistrationV1MatchResourcesMatchPolicy {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Equivalent')
  equivalent('Equivalent'),
  @JsonValue('Exact')
  exact('Exact');

  final String? value;

  const IoK8sApiAdmissionregistrationV1MatchResourcesMatchPolicy(this.value);
}

enum IoK8sApiAdmissionregistrationV1MutatingWebhookFailurePolicy {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Fail')
  fail('Fail'),
  @JsonValue('Ignore')
  ignore('Ignore');

  final String? value;

  const IoK8sApiAdmissionregistrationV1MutatingWebhookFailurePolicy(this.value);
}

enum IoK8sApiAdmissionregistrationV1MutatingWebhookMatchPolicy {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Equivalent')
  equivalent('Equivalent'),
  @JsonValue('Exact')
  exact('Exact');

  final String? value;

  const IoK8sApiAdmissionregistrationV1MutatingWebhookMatchPolicy(this.value);
}

enum IoK8sApiAdmissionregistrationV1MutatingWebhookReinvocationPolicy {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('IfNeeded')
  ifneeded('IfNeeded'),
  @JsonValue('Never')
  never('Never');

  final String? value;

  const IoK8sApiAdmissionregistrationV1MutatingWebhookReinvocationPolicy(
    this.value,
  );
}

enum IoK8sApiAdmissionregistrationV1MutatingWebhookSideEffects {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('None')
  none('None'),
  @JsonValue('NoneOnDryRun')
  noneondryrun('NoneOnDryRun'),
  @JsonValue('Some')
  some('Some'),
  @JsonValue('Unknown')
  unknown('Unknown');

  final String? value;

  const IoK8sApiAdmissionregistrationV1MutatingWebhookSideEffects(this.value);
}

enum IoK8sApiAdmissionregistrationV1NamedRuleWithOperationsOperations {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('*')
  undefined('*'),
  @JsonValue('CONNECT')
  connect('CONNECT'),
  @JsonValue('CREATE')
  create('CREATE'),
  @JsonValue('DELETE')
  delete('DELETE'),
  @JsonValue('UPDATE')
  update('UPDATE');

  final String? value;

  const IoK8sApiAdmissionregistrationV1NamedRuleWithOperationsOperations(
    this.value,
  );
}

enum IoK8sApiAdmissionregistrationV1NamedRuleWithOperationsScope {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('*')
  undefined('*'),
  @JsonValue('Cluster')
  cluster('Cluster'),
  @JsonValue('Namespaced')
  namespaced('Namespaced');

  final String? value;

  const IoK8sApiAdmissionregistrationV1NamedRuleWithOperationsScope(this.value);
}

enum IoK8sApiAdmissionregistrationV1RuleWithOperationsOperations {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('*')
  undefined('*'),
  @JsonValue('CONNECT')
  connect('CONNECT'),
  @JsonValue('CREATE')
  create('CREATE'),
  @JsonValue('DELETE')
  delete('DELETE'),
  @JsonValue('UPDATE')
  update('UPDATE');

  final String? value;

  const IoK8sApiAdmissionregistrationV1RuleWithOperationsOperations(this.value);
}

enum IoK8sApiAdmissionregistrationV1RuleWithOperationsScope {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('*')
  undefined('*'),
  @JsonValue('Cluster')
  cluster('Cluster'),
  @JsonValue('Namespaced')
  namespaced('Namespaced');

  final String? value;

  const IoK8sApiAdmissionregistrationV1RuleWithOperationsScope(this.value);
}

enum IoK8sApiAdmissionregistrationV1ValidatingAdmissionPolicyBindingSpecValidationActions {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Audit')
  audit('Audit'),
  @JsonValue('Deny')
  deny('Deny'),
  @JsonValue('Warn')
  warn('Warn');

  final String? value;

  const IoK8sApiAdmissionregistrationV1ValidatingAdmissionPolicyBindingSpecValidationActions(
    this.value,
  );
}

enum IoK8sApiAdmissionregistrationV1ValidatingAdmissionPolicySpecFailurePolicy {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Fail')
  fail('Fail'),
  @JsonValue('Ignore')
  ignore('Ignore');

  final String? value;

  const IoK8sApiAdmissionregistrationV1ValidatingAdmissionPolicySpecFailurePolicy(
    this.value,
  );
}

enum IoK8sApiAdmissionregistrationV1ValidatingWebhookFailurePolicy {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Fail')
  fail('Fail'),
  @JsonValue('Ignore')
  ignore('Ignore');

  final String? value;

  const IoK8sApiAdmissionregistrationV1ValidatingWebhookFailurePolicy(
    this.value,
  );
}

enum IoK8sApiAdmissionregistrationV1ValidatingWebhookMatchPolicy {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Equivalent')
  equivalent('Equivalent'),
  @JsonValue('Exact')
  exact('Exact');

  final String? value;

  const IoK8sApiAdmissionregistrationV1ValidatingWebhookMatchPolicy(this.value);
}

enum IoK8sApiAdmissionregistrationV1ValidatingWebhookSideEffects {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('None')
  none('None'),
  @JsonValue('NoneOnDryRun')
  noneondryrun('NoneOnDryRun'),
  @JsonValue('Some')
  some('Some'),
  @JsonValue('Unknown')
  unknown('Unknown');

  final String? value;

  const IoK8sApiAdmissionregistrationV1ValidatingWebhookSideEffects(this.value);
}

enum IoK8sApiAppsV1DaemonSetUpdateStrategyType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('OnDelete')
  ondelete('OnDelete'),
  @JsonValue('RollingUpdate')
  rollingupdate('RollingUpdate');

  final String? value;

  const IoK8sApiAppsV1DaemonSetUpdateStrategyType(this.value);
}

enum IoK8sApiAppsV1DeploymentStrategyType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Recreate')
  recreate('Recreate'),
  @JsonValue('RollingUpdate')
  rollingupdate('RollingUpdate');

  final String? value;

  const IoK8sApiAppsV1DeploymentStrategyType(this.value);
}

enum IoK8sApiAppsV1StatefulSetSpecPodManagementPolicy {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('OrderedReady')
  orderedready('OrderedReady'),
  @JsonValue('Parallel')
  parallel('Parallel');

  final String? value;

  const IoK8sApiAppsV1StatefulSetSpecPodManagementPolicy(this.value);
}

enum IoK8sApiAppsV1StatefulSetUpdateStrategyType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('OnDelete')
  ondelete('OnDelete'),
  @JsonValue('RollingUpdate')
  rollingupdate('RollingUpdate');

  final String? value;

  const IoK8sApiAppsV1StatefulSetUpdateStrategyType(this.value);
}

enum IoK8sApiBatchV1CronJobSpecConcurrencyPolicy {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Allow')
  allow('Allow'),
  @JsonValue('Forbid')
  forbid('Forbid'),
  @JsonValue('Replace')
  replace('Replace');

  final String? value;

  const IoK8sApiBatchV1CronJobSpecConcurrencyPolicy(this.value);
}

enum IoK8sApiBatchV1JobSpecCompletionMode {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Indexed')
  indexed('Indexed'),
  @JsonValue('NonIndexed')
  nonindexed('NonIndexed');

  final String? value;

  const IoK8sApiBatchV1JobSpecCompletionMode(this.value);
}

enum IoK8sApiBatchV1JobSpecPodReplacementPolicy {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Failed')
  failed('Failed'),
  @JsonValue('TerminatingOrFailed')
  terminatingorfailed('TerminatingOrFailed');

  final String? value;

  const IoK8sApiBatchV1JobSpecPodReplacementPolicy(this.value);
}

enum IoK8sApiBatchV1PodFailurePolicyOnExitCodesRequirementOperator {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('In')
  $in('In'),
  @JsonValue('NotIn')
  notin('NotIn');

  final String? value;

  const IoK8sApiBatchV1PodFailurePolicyOnExitCodesRequirementOperator(
    this.value,
  );
}

enum IoK8sApiBatchV1PodFailurePolicyRuleAction {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Count')
  count('Count'),
  @JsonValue('FailIndex')
  failindex('FailIndex'),
  @JsonValue('FailJob')
  failjob('FailJob'),
  @JsonValue('Ignore')
  ignore('Ignore');

  final String? value;

  const IoK8sApiBatchV1PodFailurePolicyRuleAction(this.value);
}

enum IoK8sApiCertificatesV1CertificateSigningRequestSpecUsages {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('any')
  any('any'),
  @JsonValue('cert sign')
  certSign('cert sign'),
  @JsonValue('client auth')
  clientAuth('client auth'),
  @JsonValue('code signing')
  codeSigning('code signing'),
  @JsonValue('content commitment')
  contentCommitment('content commitment'),
  @JsonValue('crl sign')
  crlSign('crl sign'),
  @JsonValue('data encipherment')
  dataEncipherment('data encipherment'),
  @JsonValue('decipher only')
  decipherOnly('decipher only'),
  @JsonValue('digital signature')
  digitalSignature('digital signature'),
  @JsonValue('email protection')
  emailProtection('email protection'),
  @JsonValue('encipher only')
  encipherOnly('encipher only'),
  @JsonValue('ipsec end system')
  ipsecEndSystem('ipsec end system'),
  @JsonValue('ipsec tunnel')
  ipsecTunnel('ipsec tunnel'),
  @JsonValue('ipsec user')
  ipsecUser('ipsec user'),
  @JsonValue('key agreement')
  keyAgreement('key agreement'),
  @JsonValue('key encipherment')
  keyEncipherment('key encipherment'),
  @JsonValue('microsoft sgc')
  microsoftSgc('microsoft sgc'),
  @JsonValue('netscape sgc')
  netscapeSgc('netscape sgc'),
  @JsonValue('ocsp signing')
  ocspSigning('ocsp signing'),
  @JsonValue('s/mime')
  sMime('s/mime'),
  @JsonValue('server auth')
  serverAuth('server auth'),
  @JsonValue('signing')
  signing('signing'),
  @JsonValue('timestamping')
  timestamping('timestamping');

  final String? value;

  const IoK8sApiCertificatesV1CertificateSigningRequestSpecUsages(this.value);
}

enum IoK8sApiCoreV1AppArmorProfileType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Localhost')
  localhost('Localhost'),
  @JsonValue('RuntimeDefault')
  runtimedefault('RuntimeDefault'),
  @JsonValue('Unconfined')
  unconfined('Unconfined');

  final String? value;

  const IoK8sApiCoreV1AppArmorProfileType(this.value);
}

enum IoK8sApiCoreV1AzureDiskVolumeSourceCachingMode {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('None')
  none('None'),
  @JsonValue('ReadOnly')
  readonly('ReadOnly'),
  @JsonValue('ReadWrite')
  readwrite('ReadWrite');

  final String? value;

  const IoK8sApiCoreV1AzureDiskVolumeSourceCachingMode(this.value);
}

enum IoK8sApiCoreV1AzureDiskVolumeSourceKind {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Dedicated')
  dedicated('Dedicated'),
  @JsonValue('Managed')
  managed('Managed'),
  @JsonValue('Shared')
  shared('Shared');

  final String? value;

  const IoK8sApiCoreV1AzureDiskVolumeSourceKind(this.value);
}

enum IoK8sApiCoreV1ContainerImagePullPolicy {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Always')
  always('Always'),
  @JsonValue('IfNotPresent')
  ifnotpresent('IfNotPresent'),
  @JsonValue('Never')
  never('Never');

  final String? value;

  const IoK8sApiCoreV1ContainerImagePullPolicy(this.value);
}

enum IoK8sApiCoreV1ContainerTerminationMessagePolicy {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('FallbackToLogsOnError')
  fallbacktologsonerror('FallbackToLogsOnError'),
  @JsonValue('File')
  file('File');

  final String? value;

  const IoK8sApiCoreV1ContainerTerminationMessagePolicy(this.value);
}

enum IoK8sApiCoreV1ContainerPortProtocol {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('SCTP')
  sctp('SCTP'),
  @JsonValue('TCP')
  tcp('TCP'),
  @JsonValue('UDP')
  udp('UDP');

  final String? value;

  const IoK8sApiCoreV1ContainerPortProtocol(this.value);
}

enum IoK8sApiCoreV1ContainerStatusStopSignal {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('SIGABRT')
  sigabrt('SIGABRT'),
  @JsonValue('SIGALRM')
  sigalrm('SIGALRM'),
  @JsonValue('SIGBUS')
  sigbus('SIGBUS'),
  @JsonValue('SIGCHLD')
  sigchld('SIGCHLD'),
  @JsonValue('SIGCLD')
  sigcld('SIGCLD'),
  @JsonValue('SIGCONT')
  sigcont('SIGCONT'),
  @JsonValue('SIGFPE')
  sigfpe('SIGFPE'),
  @JsonValue('SIGHUP')
  sighup('SIGHUP'),
  @JsonValue('SIGILL')
  sigill('SIGILL'),
  @JsonValue('SIGINT')
  sigint('SIGINT'),
  @JsonValue('SIGIO')
  sigio('SIGIO'),
  @JsonValue('SIGIOT')
  sigiot('SIGIOT'),
  @JsonValue('SIGKILL')
  sigkill('SIGKILL'),
  @JsonValue('SIGPIPE')
  sigpipe('SIGPIPE'),
  @JsonValue('SIGPOLL')
  sigpoll('SIGPOLL'),
  @JsonValue('SIGPROF')
  sigprof('SIGPROF'),
  @JsonValue('SIGPWR')
  sigpwr('SIGPWR'),
  @JsonValue('SIGQUIT')
  sigquit('SIGQUIT'),
  @JsonValue('SIGRTMAX')
  sigrtmax('SIGRTMAX'),
  @JsonValue('SIGRTMAX-1')
  sigrtmax1('SIGRTMAX-1'),
  @JsonValue('SIGRTMAX-10')
  sigrtmax10('SIGRTMAX-10'),
  @JsonValue('SIGRTMAX-11')
  sigrtmax11('SIGRTMAX-11'),
  @JsonValue('SIGRTMAX-12')
  sigrtmax12('SIGRTMAX-12'),
  @JsonValue('SIGRTMAX-13')
  sigrtmax13('SIGRTMAX-13'),
  @JsonValue('SIGRTMAX-14')
  sigrtmax14('SIGRTMAX-14'),
  @JsonValue('SIGRTMAX-2')
  sigrtmax2('SIGRTMAX-2'),
  @JsonValue('SIGRTMAX-3')
  sigrtmax3('SIGRTMAX-3'),
  @JsonValue('SIGRTMAX-4')
  sigrtmax4('SIGRTMAX-4'),
  @JsonValue('SIGRTMAX-5')
  sigrtmax5('SIGRTMAX-5'),
  @JsonValue('SIGRTMAX-6')
  sigrtmax6('SIGRTMAX-6'),
  @JsonValue('SIGRTMAX-7')
  sigrtmax7('SIGRTMAX-7'),
  @JsonValue('SIGRTMAX-8')
  sigrtmax8('SIGRTMAX-8'),
  @JsonValue('SIGRTMAX-9')
  sigrtmax9('SIGRTMAX-9'),
  @JsonValue('SIGRTMIN')
  sigrtmin('SIGRTMIN'),
  @JsonValue('SIGRTMIN+1')
  sigrtmin1('SIGRTMIN+1'),
  @JsonValue('SIGRTMIN+10')
  sigrtmin10('SIGRTMIN+10'),
  @JsonValue('SIGRTMIN+11')
  sigrtmin11('SIGRTMIN+11'),
  @JsonValue('SIGRTMIN+12')
  sigrtmin12('SIGRTMIN+12'),
  @JsonValue('SIGRTMIN+13')
  sigrtmin13('SIGRTMIN+13'),
  @JsonValue('SIGRTMIN+14')
  sigrtmin14('SIGRTMIN+14'),
  @JsonValue('SIGRTMIN+15')
  sigrtmin15('SIGRTMIN+15'),
  @JsonValue('SIGRTMIN+2')
  sigrtmin2('SIGRTMIN+2'),
  @JsonValue('SIGRTMIN+3')
  sigrtmin3('SIGRTMIN+3'),
  @JsonValue('SIGRTMIN+4')
  sigrtmin4('SIGRTMIN+4'),
  @JsonValue('SIGRTMIN+5')
  sigrtmin5('SIGRTMIN+5'),
  @JsonValue('SIGRTMIN+6')
  sigrtmin6('SIGRTMIN+6'),
  @JsonValue('SIGRTMIN+7')
  sigrtmin7('SIGRTMIN+7'),
  @JsonValue('SIGRTMIN+8')
  sigrtmin8('SIGRTMIN+8'),
  @JsonValue('SIGRTMIN+9')
  sigrtmin9('SIGRTMIN+9'),
  @JsonValue('SIGSEGV')
  sigsegv('SIGSEGV'),
  @JsonValue('SIGSTKFLT')
  sigstkflt('SIGSTKFLT'),
  @JsonValue('SIGSTOP')
  sigstop('SIGSTOP'),
  @JsonValue('SIGSYS')
  sigsys('SIGSYS'),
  @JsonValue('SIGTERM')
  sigterm('SIGTERM'),
  @JsonValue('SIGTRAP')
  sigtrap('SIGTRAP'),
  @JsonValue('SIGTSTP')
  sigtstp('SIGTSTP'),
  @JsonValue('SIGTTIN')
  sigttin('SIGTTIN'),
  @JsonValue('SIGTTOU')
  sigttou('SIGTTOU'),
  @JsonValue('SIGURG')
  sigurg('SIGURG'),
  @JsonValue('SIGUSR1')
  sigusr1('SIGUSR1'),
  @JsonValue('SIGUSR2')
  sigusr2('SIGUSR2'),
  @JsonValue('SIGVTALRM')
  sigvtalrm('SIGVTALRM'),
  @JsonValue('SIGWINCH')
  sigwinch('SIGWINCH'),
  @JsonValue('SIGXCPU')
  sigxcpu('SIGXCPU'),
  @JsonValue('SIGXFSZ')
  sigxfsz('SIGXFSZ');

  final String? value;

  const IoK8sApiCoreV1ContainerStatusStopSignal(this.value);
}

enum IoK8sApiCoreV1EndpointPortProtocol {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('SCTP')
  sctp('SCTP'),
  @JsonValue('TCP')
  tcp('TCP'),
  @JsonValue('UDP')
  udp('UDP');

  final String? value;

  const IoK8sApiCoreV1EndpointPortProtocol(this.value);
}

enum IoK8sApiCoreV1EphemeralContainerImagePullPolicy {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Always')
  always('Always'),
  @JsonValue('IfNotPresent')
  ifnotpresent('IfNotPresent'),
  @JsonValue('Never')
  never('Never');

  final String? value;

  const IoK8sApiCoreV1EphemeralContainerImagePullPolicy(this.value);
}

enum IoK8sApiCoreV1EphemeralContainerTerminationMessagePolicy {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('FallbackToLogsOnError')
  fallbacktologsonerror('FallbackToLogsOnError'),
  @JsonValue('File')
  file('File');

  final String? value;

  const IoK8sApiCoreV1EphemeralContainerTerminationMessagePolicy(this.value);
}

enum IoK8sApiCoreV1HTTPGetActionScheme {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('HTTP')
  http('HTTP'),
  @JsonValue('HTTPS')
  https('HTTPS');

  final String? value;

  const IoK8sApiCoreV1HTTPGetActionScheme(this.value);
}

enum IoK8sApiCoreV1HostPathVolumeSourceType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('')
  $null(''),
  @JsonValue('BlockDevice')
  blockdevice('BlockDevice'),
  @JsonValue('CharDevice')
  chardevice('CharDevice'),
  @JsonValue('Directory')
  directory('Directory'),
  @JsonValue('DirectoryOrCreate')
  directoryorcreate('DirectoryOrCreate'),
  @JsonValue('File')
  file('File'),
  @JsonValue('FileOrCreate')
  fileorcreate('FileOrCreate'),
  @JsonValue('Socket')
  socket('Socket');

  final String? value;

  const IoK8sApiCoreV1HostPathVolumeSourceType(this.value);
}

enum IoK8sApiCoreV1ImageVolumeSourcePullPolicy {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Always')
  always('Always'),
  @JsonValue('IfNotPresent')
  ifnotpresent('IfNotPresent'),
  @JsonValue('Never')
  never('Never');

  final String? value;

  const IoK8sApiCoreV1ImageVolumeSourcePullPolicy(this.value);
}

enum IoK8sApiCoreV1LifecycleStopSignal {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('SIGABRT')
  sigabrt('SIGABRT'),
  @JsonValue('SIGALRM')
  sigalrm('SIGALRM'),
  @JsonValue('SIGBUS')
  sigbus('SIGBUS'),
  @JsonValue('SIGCHLD')
  sigchld('SIGCHLD'),
  @JsonValue('SIGCLD')
  sigcld('SIGCLD'),
  @JsonValue('SIGCONT')
  sigcont('SIGCONT'),
  @JsonValue('SIGFPE')
  sigfpe('SIGFPE'),
  @JsonValue('SIGHUP')
  sighup('SIGHUP'),
  @JsonValue('SIGILL')
  sigill('SIGILL'),
  @JsonValue('SIGINT')
  sigint('SIGINT'),
  @JsonValue('SIGIO')
  sigio('SIGIO'),
  @JsonValue('SIGIOT')
  sigiot('SIGIOT'),
  @JsonValue('SIGKILL')
  sigkill('SIGKILL'),
  @JsonValue('SIGPIPE')
  sigpipe('SIGPIPE'),
  @JsonValue('SIGPOLL')
  sigpoll('SIGPOLL'),
  @JsonValue('SIGPROF')
  sigprof('SIGPROF'),
  @JsonValue('SIGPWR')
  sigpwr('SIGPWR'),
  @JsonValue('SIGQUIT')
  sigquit('SIGQUIT'),
  @JsonValue('SIGRTMAX')
  sigrtmax('SIGRTMAX'),
  @JsonValue('SIGRTMAX-1')
  sigrtmax1('SIGRTMAX-1'),
  @JsonValue('SIGRTMAX-10')
  sigrtmax10('SIGRTMAX-10'),
  @JsonValue('SIGRTMAX-11')
  sigrtmax11('SIGRTMAX-11'),
  @JsonValue('SIGRTMAX-12')
  sigrtmax12('SIGRTMAX-12'),
  @JsonValue('SIGRTMAX-13')
  sigrtmax13('SIGRTMAX-13'),
  @JsonValue('SIGRTMAX-14')
  sigrtmax14('SIGRTMAX-14'),
  @JsonValue('SIGRTMAX-2')
  sigrtmax2('SIGRTMAX-2'),
  @JsonValue('SIGRTMAX-3')
  sigrtmax3('SIGRTMAX-3'),
  @JsonValue('SIGRTMAX-4')
  sigrtmax4('SIGRTMAX-4'),
  @JsonValue('SIGRTMAX-5')
  sigrtmax5('SIGRTMAX-5'),
  @JsonValue('SIGRTMAX-6')
  sigrtmax6('SIGRTMAX-6'),
  @JsonValue('SIGRTMAX-7')
  sigrtmax7('SIGRTMAX-7'),
  @JsonValue('SIGRTMAX-8')
  sigrtmax8('SIGRTMAX-8'),
  @JsonValue('SIGRTMAX-9')
  sigrtmax9('SIGRTMAX-9'),
  @JsonValue('SIGRTMIN')
  sigrtmin('SIGRTMIN'),
  @JsonValue('SIGRTMIN+1')
  sigrtmin1('SIGRTMIN+1'),
  @JsonValue('SIGRTMIN+10')
  sigrtmin10('SIGRTMIN+10'),
  @JsonValue('SIGRTMIN+11')
  sigrtmin11('SIGRTMIN+11'),
  @JsonValue('SIGRTMIN+12')
  sigrtmin12('SIGRTMIN+12'),
  @JsonValue('SIGRTMIN+13')
  sigrtmin13('SIGRTMIN+13'),
  @JsonValue('SIGRTMIN+14')
  sigrtmin14('SIGRTMIN+14'),
  @JsonValue('SIGRTMIN+15')
  sigrtmin15('SIGRTMIN+15'),
  @JsonValue('SIGRTMIN+2')
  sigrtmin2('SIGRTMIN+2'),
  @JsonValue('SIGRTMIN+3')
  sigrtmin3('SIGRTMIN+3'),
  @JsonValue('SIGRTMIN+4')
  sigrtmin4('SIGRTMIN+4'),
  @JsonValue('SIGRTMIN+5')
  sigrtmin5('SIGRTMIN+5'),
  @JsonValue('SIGRTMIN+6')
  sigrtmin6('SIGRTMIN+6'),
  @JsonValue('SIGRTMIN+7')
  sigrtmin7('SIGRTMIN+7'),
  @JsonValue('SIGRTMIN+8')
  sigrtmin8('SIGRTMIN+8'),
  @JsonValue('SIGRTMIN+9')
  sigrtmin9('SIGRTMIN+9'),
  @JsonValue('SIGSEGV')
  sigsegv('SIGSEGV'),
  @JsonValue('SIGSTKFLT')
  sigstkflt('SIGSTKFLT'),
  @JsonValue('SIGSTOP')
  sigstop('SIGSTOP'),
  @JsonValue('SIGSYS')
  sigsys('SIGSYS'),
  @JsonValue('SIGTERM')
  sigterm('SIGTERM'),
  @JsonValue('SIGTRAP')
  sigtrap('SIGTRAP'),
  @JsonValue('SIGTSTP')
  sigtstp('SIGTSTP'),
  @JsonValue('SIGTTIN')
  sigttin('SIGTTIN'),
  @JsonValue('SIGTTOU')
  sigttou('SIGTTOU'),
  @JsonValue('SIGURG')
  sigurg('SIGURG'),
  @JsonValue('SIGUSR1')
  sigusr1('SIGUSR1'),
  @JsonValue('SIGUSR2')
  sigusr2('SIGUSR2'),
  @JsonValue('SIGVTALRM')
  sigvtalrm('SIGVTALRM'),
  @JsonValue('SIGWINCH')
  sigwinch('SIGWINCH'),
  @JsonValue('SIGXCPU')
  sigxcpu('SIGXCPU'),
  @JsonValue('SIGXFSZ')
  sigxfsz('SIGXFSZ');

  final String? value;

  const IoK8sApiCoreV1LifecycleStopSignal(this.value);
}

enum IoK8sApiCoreV1ModifyVolumeStatusStatus {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('InProgress')
  inprogress('InProgress'),
  @JsonValue('Infeasible')
  infeasible('Infeasible'),
  @JsonValue('Pending')
  pending('Pending');

  final String? value;

  const IoK8sApiCoreV1ModifyVolumeStatusStatus(this.value);
}

enum IoK8sApiCoreV1NamespaceStatusPhase {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Active')
  active('Active'),
  @JsonValue('Terminating')
  terminating('Terminating');

  final String? value;

  const IoK8sApiCoreV1NamespaceStatusPhase(this.value);
}

enum IoK8sApiCoreV1NodeSelectorRequirementOperator {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('DoesNotExist')
  doesnotexist('DoesNotExist'),
  @JsonValue('Exists')
  exists('Exists'),
  @JsonValue('Gt')
  gt('Gt'),
  @JsonValue('In')
  $in('In'),
  @JsonValue('Lt')
  lt('Lt'),
  @JsonValue('NotIn')
  notin('NotIn');

  final String? value;

  const IoK8sApiCoreV1NodeSelectorRequirementOperator(this.value);
}

enum IoK8sApiCoreV1NodeStatusPhase {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Pending')
  pending('Pending'),
  @JsonValue('Running')
  running('Running'),
  @JsonValue('Terminated')
  terminated('Terminated');

  final String? value;

  const IoK8sApiCoreV1NodeStatusPhase(this.value);
}

enum IoK8sApiCoreV1PersistentVolumeClaimSpecAccessModes {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('ReadOnlyMany')
  readonlymany('ReadOnlyMany'),
  @JsonValue('ReadWriteMany')
  readwritemany('ReadWriteMany'),
  @JsonValue('ReadWriteOnce')
  readwriteonce('ReadWriteOnce'),
  @JsonValue('ReadWriteOncePod')
  readwriteoncepod('ReadWriteOncePod');

  final String? value;

  const IoK8sApiCoreV1PersistentVolumeClaimSpecAccessModes(this.value);
}

enum IoK8sApiCoreV1PersistentVolumeClaimSpecVolumeMode {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Block')
  block('Block'),
  @JsonValue('Filesystem')
  filesystem('Filesystem');

  final String? value;

  const IoK8sApiCoreV1PersistentVolumeClaimSpecVolumeMode(this.value);
}

enum IoK8sApiCoreV1PersistentVolumeClaimStatusAccessModes {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('ReadOnlyMany')
  readonlymany('ReadOnlyMany'),
  @JsonValue('ReadWriteMany')
  readwritemany('ReadWriteMany'),
  @JsonValue('ReadWriteOnce')
  readwriteonce('ReadWriteOnce'),
  @JsonValue('ReadWriteOncePod')
  readwriteoncepod('ReadWriteOncePod');

  final String? value;

  const IoK8sApiCoreV1PersistentVolumeClaimStatusAccessModes(this.value);
}

enum IoK8sApiCoreV1PersistentVolumeClaimStatusPhase {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Bound')
  bound('Bound'),
  @JsonValue('Lost')
  lost('Lost'),
  @JsonValue('Pending')
  pending('Pending');

  final String? value;

  const IoK8sApiCoreV1PersistentVolumeClaimStatusPhase(this.value);
}

enum IoK8sApiCoreV1PersistentVolumeSpecAccessModes {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('ReadOnlyMany')
  readonlymany('ReadOnlyMany'),
  @JsonValue('ReadWriteMany')
  readwritemany('ReadWriteMany'),
  @JsonValue('ReadWriteOnce')
  readwriteonce('ReadWriteOnce'),
  @JsonValue('ReadWriteOncePod')
  readwriteoncepod('ReadWriteOncePod');

  final String? value;

  const IoK8sApiCoreV1PersistentVolumeSpecAccessModes(this.value);
}

enum IoK8sApiCoreV1PersistentVolumeSpecPersistentVolumeReclaimPolicy {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Delete')
  delete('Delete'),
  @JsonValue('Recycle')
  recycle('Recycle'),
  @JsonValue('Retain')
  retain('Retain');

  final String? value;

  const IoK8sApiCoreV1PersistentVolumeSpecPersistentVolumeReclaimPolicy(
    this.value,
  );
}

enum IoK8sApiCoreV1PersistentVolumeSpecVolumeMode {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Block')
  block('Block'),
  @JsonValue('Filesystem')
  filesystem('Filesystem');

  final String? value;

  const IoK8sApiCoreV1PersistentVolumeSpecVolumeMode(this.value);
}

enum IoK8sApiCoreV1PersistentVolumeStatusPhase {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Available')
  available('Available'),
  @JsonValue('Bound')
  bound('Bound'),
  @JsonValue('Failed')
  failed('Failed'),
  @JsonValue('Pending')
  pending('Pending'),
  @JsonValue('Released')
  released('Released');

  final String? value;

  const IoK8sApiCoreV1PersistentVolumeStatusPhase(this.value);
}

enum IoK8sApiCoreV1PodSecurityContextFsGroupChangePolicy {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Always')
  always('Always'),
  @JsonValue('OnRootMismatch')
  onrootmismatch('OnRootMismatch');

  final String? value;

  const IoK8sApiCoreV1PodSecurityContextFsGroupChangePolicy(this.value);
}

enum IoK8sApiCoreV1PodSecurityContextSupplementalGroupsPolicy {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Merge')
  merge('Merge'),
  @JsonValue('Strict')
  strict('Strict');

  final String? value;

  const IoK8sApiCoreV1PodSecurityContextSupplementalGroupsPolicy(this.value);
}

enum IoK8sApiCoreV1PodSpecDnsPolicy {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('ClusterFirst')
  clusterfirst('ClusterFirst'),
  @JsonValue('ClusterFirstWithHostNet')
  clusterfirstwithhostnet('ClusterFirstWithHostNet'),
  @JsonValue('Default')
  $default('Default'),
  @JsonValue('None')
  none('None');

  final String? value;

  const IoK8sApiCoreV1PodSpecDnsPolicy(this.value);
}

enum IoK8sApiCoreV1PodSpecPreemptionPolicy {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Never')
  never('Never'),
  @JsonValue('PreemptLowerPriority')
  preemptlowerpriority('PreemptLowerPriority');

  final String? value;

  const IoK8sApiCoreV1PodSpecPreemptionPolicy(this.value);
}

enum IoK8sApiCoreV1PodSpecRestartPolicy {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Always')
  always('Always'),
  @JsonValue('Never')
  never('Never'),
  @JsonValue('OnFailure')
  onfailure('OnFailure');

  final String? value;

  const IoK8sApiCoreV1PodSpecRestartPolicy(this.value);
}

enum IoK8sApiCoreV1PodStatusPhase {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Failed')
  failed('Failed'),
  @JsonValue('Pending')
  pending('Pending'),
  @JsonValue('Running')
  running('Running'),
  @JsonValue('Succeeded')
  succeeded('Succeeded'),
  @JsonValue('Unknown')
  unknown('Unknown');

  final String? value;

  const IoK8sApiCoreV1PodStatusPhase(this.value);
}

enum IoK8sApiCoreV1PodStatusQosClass {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('BestEffort')
  besteffort('BestEffort'),
  @JsonValue('Burstable')
  burstable('Burstable'),
  @JsonValue('Guaranteed')
  guaranteed('Guaranteed');

  final String? value;

  const IoK8sApiCoreV1PodStatusQosClass(this.value);
}

enum IoK8sApiCoreV1PortStatusProtocol {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('SCTP')
  sctp('SCTP'),
  @JsonValue('TCP')
  tcp('TCP'),
  @JsonValue('UDP')
  udp('UDP');

  final String? value;

  const IoK8sApiCoreV1PortStatusProtocol(this.value);
}

enum IoK8sApiCoreV1ResourceQuotaSpecScopes {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('BestEffort')
  besteffort('BestEffort'),
  @JsonValue('CrossNamespacePodAffinity')
  crossnamespacepodaffinity('CrossNamespacePodAffinity'),
  @JsonValue('NotBestEffort')
  notbesteffort('NotBestEffort'),
  @JsonValue('NotTerminating')
  notterminating('NotTerminating'),
  @JsonValue('PriorityClass')
  priorityclass('PriorityClass'),
  @JsonValue('Terminating')
  terminating('Terminating'),
  @JsonValue('VolumeAttributesClass')
  volumeattributesclass('VolumeAttributesClass');

  final String? value;

  const IoK8sApiCoreV1ResourceQuotaSpecScopes(this.value);
}

enum IoK8sApiCoreV1ScopedResourceSelectorRequirementOperator {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('DoesNotExist')
  doesnotexist('DoesNotExist'),
  @JsonValue('Exists')
  exists('Exists'),
  @JsonValue('In')
  $in('In'),
  @JsonValue('NotIn')
  notin('NotIn');

  final String? value;

  const IoK8sApiCoreV1ScopedResourceSelectorRequirementOperator(this.value);
}

enum IoK8sApiCoreV1ScopedResourceSelectorRequirementScopeName {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('BestEffort')
  besteffort('BestEffort'),
  @JsonValue('CrossNamespacePodAffinity')
  crossnamespacepodaffinity('CrossNamespacePodAffinity'),
  @JsonValue('NotBestEffort')
  notbesteffort('NotBestEffort'),
  @JsonValue('NotTerminating')
  notterminating('NotTerminating'),
  @JsonValue('PriorityClass')
  priorityclass('PriorityClass'),
  @JsonValue('Terminating')
  terminating('Terminating'),
  @JsonValue('VolumeAttributesClass')
  volumeattributesclass('VolumeAttributesClass');

  final String? value;

  const IoK8sApiCoreV1ScopedResourceSelectorRequirementScopeName(this.value);
}

enum IoK8sApiCoreV1SeccompProfileType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Localhost')
  localhost('Localhost'),
  @JsonValue('RuntimeDefault')
  runtimedefault('RuntimeDefault'),
  @JsonValue('Unconfined')
  unconfined('Unconfined');

  final String? value;

  const IoK8sApiCoreV1SeccompProfileType(this.value);
}

enum IoK8sApiCoreV1SecurityContextProcMount {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Default')
  $default('Default'),
  @JsonValue('Unmasked')
  unmasked('Unmasked');

  final String? value;

  const IoK8sApiCoreV1SecurityContextProcMount(this.value);
}

enum IoK8sApiCoreV1ServicePortProtocol {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('SCTP')
  sctp('SCTP'),
  @JsonValue('TCP')
  tcp('TCP'),
  @JsonValue('UDP')
  udp('UDP');

  final String? value;

  const IoK8sApiCoreV1ServicePortProtocol(this.value);
}

enum IoK8sApiCoreV1ServiceSpecExternalTrafficPolicy {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Cluster')
  cluster('Cluster'),
  @JsonValue('Local')
  local('Local');

  final String? value;

  const IoK8sApiCoreV1ServiceSpecExternalTrafficPolicy(this.value);
}

enum IoK8sApiCoreV1ServiceSpecInternalTrafficPolicy {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Cluster')
  cluster('Cluster'),
  @JsonValue('Local')
  local('Local');

  final String? value;

  const IoK8sApiCoreV1ServiceSpecInternalTrafficPolicy(this.value);
}

enum IoK8sApiCoreV1ServiceSpecIpFamilies {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('')
  $null(''),
  @JsonValue('IPv4')
  ipv4('IPv4'),
  @JsonValue('IPv6')
  ipv6('IPv6');

  final String? value;

  const IoK8sApiCoreV1ServiceSpecIpFamilies(this.value);
}

enum IoK8sApiCoreV1ServiceSpecIpFamilyPolicy {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('PreferDualStack')
  preferdualstack('PreferDualStack'),
  @JsonValue('RequireDualStack')
  requiredualstack('RequireDualStack'),
  @JsonValue('SingleStack')
  singlestack('SingleStack');

  final String? value;

  const IoK8sApiCoreV1ServiceSpecIpFamilyPolicy(this.value);
}

enum IoK8sApiCoreV1ServiceSpecSessionAffinity {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('ClientIP')
  clientip('ClientIP'),
  @JsonValue('None')
  none('None');

  final String? value;

  const IoK8sApiCoreV1ServiceSpecSessionAffinity(this.value);
}

enum IoK8sApiCoreV1ServiceSpecType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('ClusterIP')
  clusterip('ClusterIP'),
  @JsonValue('ExternalName')
  externalname('ExternalName'),
  @JsonValue('LoadBalancer')
  loadbalancer('LoadBalancer'),
  @JsonValue('NodePort')
  nodeport('NodePort');

  final String? value;

  const IoK8sApiCoreV1ServiceSpecType(this.value);
}

enum IoK8sApiCoreV1TaintEffect {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('NoExecute')
  noexecute('NoExecute'),
  @JsonValue('NoSchedule')
  noschedule('NoSchedule'),
  @JsonValue('PreferNoSchedule')
  prefernoschedule('PreferNoSchedule');

  final String? value;

  const IoK8sApiCoreV1TaintEffect(this.value);
}

enum IoK8sApiCoreV1TolerationEffect {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('NoExecute')
  noexecute('NoExecute'),
  @JsonValue('NoSchedule')
  noschedule('NoSchedule'),
  @JsonValue('PreferNoSchedule')
  prefernoschedule('PreferNoSchedule');

  final String? value;

  const IoK8sApiCoreV1TolerationEffect(this.value);
}

enum IoK8sApiCoreV1TolerationOperator {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Equal')
  equal('Equal'),
  @JsonValue('Exists')
  exists('Exists'),
  @JsonValue('Gt')
  gt('Gt'),
  @JsonValue('Lt')
  lt('Lt');

  final String? value;

  const IoK8sApiCoreV1TolerationOperator(this.value);
}

enum IoK8sApiCoreV1TopologySpreadConstraintNodeAffinityPolicy {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Honor')
  honor('Honor'),
  @JsonValue('Ignore')
  ignore('Ignore');

  final String? value;

  const IoK8sApiCoreV1TopologySpreadConstraintNodeAffinityPolicy(this.value);
}

enum IoK8sApiCoreV1TopologySpreadConstraintNodeTaintsPolicy {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Honor')
  honor('Honor'),
  @JsonValue('Ignore')
  ignore('Ignore');

  final String? value;

  const IoK8sApiCoreV1TopologySpreadConstraintNodeTaintsPolicy(this.value);
}

enum IoK8sApiCoreV1TopologySpreadConstraintWhenUnsatisfiable {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('DoNotSchedule')
  donotschedule('DoNotSchedule'),
  @JsonValue('ScheduleAnyway')
  scheduleanyway('ScheduleAnyway');

  final String? value;

  const IoK8sApiCoreV1TopologySpreadConstraintWhenUnsatisfiable(this.value);
}

enum IoK8sApiCoreV1VolumeMountMountPropagation {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Bidirectional')
  bidirectional('Bidirectional'),
  @JsonValue('HostToContainer')
  hosttocontainer('HostToContainer'),
  @JsonValue('None')
  none('None');

  final String? value;

  const IoK8sApiCoreV1VolumeMountMountPropagation(this.value);
}

enum IoK8sApiDiscoveryV1EndpointPortProtocol {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('SCTP')
  sctp('SCTP'),
  @JsonValue('TCP')
  tcp('TCP'),
  @JsonValue('UDP')
  udp('UDP');

  final String? value;

  const IoK8sApiDiscoveryV1EndpointPortProtocol(this.value);
}

enum IoK8sApiDiscoveryV1EndpointSliceAddressType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('FQDN')
  fqdn('FQDN'),
  @JsonValue('IPv4')
  ipv4('IPv4'),
  @JsonValue('IPv6')
  ipv6('IPv6');

  final String? value;

  const IoK8sApiDiscoveryV1EndpointSliceAddressType(this.value);
}

enum IoK8sApiNetworkingV1HTTPIngressPathPathType {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Exact')
  exact('Exact'),
  @JsonValue('ImplementationSpecific')
  implementationspecific('ImplementationSpecific'),
  @JsonValue('Prefix')
  prefix('Prefix');

  final String? value;

  const IoK8sApiNetworkingV1HTTPIngressPathPathType(this.value);
}

enum IoK8sApiNetworkingV1IngressPortStatusProtocol {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('SCTP')
  sctp('SCTP'),
  @JsonValue('TCP')
  tcp('TCP'),
  @JsonValue('UDP')
  udp('UDP');

  final String? value;

  const IoK8sApiNetworkingV1IngressPortStatusProtocol(this.value);
}

enum IoK8sApiNetworkingV1NetworkPolicyPortProtocol {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('SCTP')
  sctp('SCTP'),
  @JsonValue('TCP')
  tcp('TCP'),
  @JsonValue('UDP')
  udp('UDP');

  final String? value;

  const IoK8sApiNetworkingV1NetworkPolicyPortProtocol(this.value);
}

enum IoK8sApiNetworkingV1NetworkPolicySpecPolicyTypes {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Egress')
  egress('Egress'),
  @JsonValue('Ingress')
  ingress('Ingress');

  final String? value;

  const IoK8sApiNetworkingV1NetworkPolicySpecPolicyTypes(this.value);
}

enum IoK8sApiPolicyV1PodDisruptionBudgetSpecUnhealthyPodEvictionPolicy {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('AlwaysAllow')
  alwaysallow('AlwaysAllow'),
  @JsonValue('IfHealthyBudget')
  ifhealthybudget('IfHealthyBudget');

  final String? value;

  const IoK8sApiPolicyV1PodDisruptionBudgetSpecUnhealthyPodEvictionPolicy(
    this.value,
  );
}

enum IoK8sApiResourceV1DeviceAllocationConfigurationSource {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('FromClaim')
  fromclaim('FromClaim'),
  @JsonValue('FromClass')
  fromclass('FromClass');

  final String? value;

  const IoK8sApiResourceV1DeviceAllocationConfigurationSource(this.value);
}

enum IoK8sApiResourceV1DeviceSubRequestAllocationMode {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('All')
  all('All'),
  @JsonValue('ExactCount')
  exactcount('ExactCount');

  final String? value;

  const IoK8sApiResourceV1DeviceSubRequestAllocationMode(this.value);
}

enum IoK8sApiResourceV1DeviceTaintEffect {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('NoExecute')
  noexecute('NoExecute'),
  @JsonValue('NoSchedule')
  noschedule('NoSchedule'),
  @JsonValue('None')
  none('None');

  final String? value;

  const IoK8sApiResourceV1DeviceTaintEffect(this.value);
}

enum IoK8sApiResourceV1DeviceTolerationEffect {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('NoExecute')
  noexecute('NoExecute'),
  @JsonValue('NoSchedule')
  noschedule('NoSchedule'),
  @JsonValue('None')
  none('None');

  final String? value;

  const IoK8sApiResourceV1DeviceTolerationEffect(this.value);
}

enum IoK8sApiResourceV1DeviceTolerationOperator {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Equal')
  equal('Equal'),
  @JsonValue('Exists')
  exists('Exists');

  final String? value;

  const IoK8sApiResourceV1DeviceTolerationOperator(this.value);
}

enum IoK8sApiResourceV1ExactDeviceRequestAllocationMode {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('All')
  all('All'),
  @JsonValue('ExactCount')
  exactcount('ExactCount');

  final String? value;

  const IoK8sApiResourceV1ExactDeviceRequestAllocationMode(this.value);
}

enum IoK8sApiSchedulingV1PriorityClassPreemptionPolicy {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Never')
  never('Never'),
  @JsonValue('PreemptLowerPriority')
  preemptlowerpriority('PreemptLowerPriority');

  final String? value;

  const IoK8sApiSchedulingV1PriorityClassPreemptionPolicy(this.value);
}

enum IoK8sApiStorageV1StorageClassReclaimPolicy {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Delete')
  delete('Delete'),
  @JsonValue('Recycle')
  recycle('Recycle'),
  @JsonValue('Retain')
  retain('Retain');

  final String? value;

  const IoK8sApiStorageV1StorageClassReclaimPolicy(this.value);
}

enum IoK8sApiStorageV1StorageClassVolumeBindingMode {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Immediate')
  immediate('Immediate'),
  @JsonValue('WaitForFirstConsumer')
  waitforfirstconsumer('WaitForFirstConsumer');

  final String? value;

  const IoK8sApiStorageV1StorageClassVolumeBindingMode(this.value);
}

enum IoK8sApiextensionsApiserverPkgApisApiextensionsV1ValidationRuleReason {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('FieldValueDuplicate')
  fieldvalueduplicate('FieldValueDuplicate'),
  @JsonValue('FieldValueForbidden')
  fieldvalueforbidden('FieldValueForbidden'),
  @JsonValue('FieldValueInvalid')
  fieldvalueinvalid('FieldValueInvalid'),
  @JsonValue('FieldValueRequired')
  fieldvaluerequired('FieldValueRequired');

  final String? value;

  const IoK8sApiextensionsApiserverPkgApisApiextensionsV1ValidationRuleReason(
    this.value,
  );
}
