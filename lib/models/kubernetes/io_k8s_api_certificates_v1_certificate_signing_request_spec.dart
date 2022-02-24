//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiCertificatesV1CertificateSigningRequestSpec {
  /// Returns a new [IoK8sApiCertificatesV1CertificateSigningRequestSpec] instance.
  IoK8sApiCertificatesV1CertificateSigningRequestSpec({
    this.expirationSeconds,
    this.extra = const {},
    this.groups = const [],
    required this.request,
    required this.signerName,
    this.uid,
    this.usages = const [],
    this.username,
  });

  /// expirationSeconds is the requested duration of validity of the issued certificate. The certificate signer may issue a certificate with a different validity duration so a client must check the delta between the notBefore and and notAfter fields in the issued certificate to determine the actual duration.  The v1.22+ in-tree implementations of the well-known Kubernetes signers will honor this field as long as the requested duration is not greater than the maximum duration they will honor per the --cluster-signing-duration CLI flag to the Kubernetes controller manager.  Certificate signers may not honor this field for various reasons:    1. Old signer that is unaware of the field (such as the in-tree      implementations prior to v1.22)   2. Signer whose configured maximum is shorter than the requested duration   3. Signer whose configured minimum is longer than the requested duration  The minimum valid value for expirationSeconds is 600, i.e. 10 minutes.  As of v1.22, this field is beta and is controlled via the CSRDuration feature gate.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? expirationSeconds;

  /// extra contains extra attributes of the user that created the CertificateSigningRequest. Populated by the API server on creation and immutable.
  Map<String, List<String>> extra;

  /// groups contains group membership of the user that created the CertificateSigningRequest. Populated by the API server on creation and immutable.
  List<String> groups;

  /// request contains an x509 certificate signing request encoded in a \"CERTIFICATE REQUEST\" PEM block. When serialized as JSON or YAML, the data is additionally base64-encoded.
  String request;

  /// signerName indicates the requested signer, and is a qualified name.  List/watch requests for CertificateSigningRequests can filter on this field using a \"spec.signerName=NAME\" fieldSelector.  Well-known Kubernetes signers are:  1. \"kubernetes.io/kube-apiserver-client\": issues client certificates that can be used to authenticate to kube-apiserver.   Requests for this signer are never auto-approved by kube-controller-manager, can be issued by the \"csrsigning\" controller in kube-controller-manager.  2. \"kubernetes.io/kube-apiserver-client-kubelet\": issues client certificates that kubelets use to authenticate to kube-apiserver.   Requests for this signer can be auto-approved by the \"csrapproving\" controller in kube-controller-manager, and can be issued by the \"csrsigning\" controller in kube-controller-manager.  3. \"kubernetes.io/kubelet-serving\" issues serving certificates that kubelets use to serve TLS endpoints, which kube-apiserver can connect to securely.   Requests for this signer are never auto-approved by kube-controller-manager, and can be issued by the \"csrsigning\" controller in kube-controller-manager.  More details are available at https://k8s.io/docs/reference/access-authn-authz/certificate-signing-requests/#kubernetes-signers  Custom signerNames can also be specified. The signer defines:  1. Trust distribution: how trust (CA bundles) are distributed.  2. Permitted subjects: and behavior when a disallowed subject is requested.  3. Required, permitted, or forbidden x509 extensions in the request (including whether subjectAltNames are allowed, which types, restrictions on allowed values) and behavior when a disallowed extension is requested.  4. Required, permitted, or forbidden key usages / extended key usages.  5. Expiration/certificate lifetime: whether it is fixed by the signer, configurable by the admin.  6. Whether or not requests for CA certificates are allowed.
  String signerName;

  /// uid contains the uid of the user that created the CertificateSigningRequest. Populated by the API server on creation and immutable.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? uid;

  /// usages specifies a set of key usages requested in the issued certificate.  Requests for TLS client certificates typically request: \"digital signature\", \"key encipherment\", \"client auth\".  Requests for TLS serving certificates typically request: \"key encipherment\", \"digital signature\", \"server auth\".  Valid values are:  \"signing\", \"digital signature\", \"content commitment\",  \"key encipherment\", \"key agreement\", \"data encipherment\",  \"cert sign\", \"crl sign\", \"encipher only\", \"decipher only\", \"any\",  \"server auth\", \"client auth\",  \"code signing\", \"email protection\", \"s/mime\",  \"ipsec end system\", \"ipsec tunnel\", \"ipsec user\",  \"timestamping\", \"ocsp signing\", \"microsoft sgc\", \"netscape sgc\"
  List<String> usages;

  /// username contains the name of the user that created the CertificateSigningRequest. Populated by the API server on creation and immutable.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? username;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCertificatesV1CertificateSigningRequestSpec &&
          other.expirationSeconds == expirationSeconds &&
          other.extra == extra &&
          other.groups == groups &&
          other.request == request &&
          other.signerName == signerName &&
          other.uid == uid &&
          other.usages == usages &&
          other.username == username;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (expirationSeconds == null ? 0 : expirationSeconds!.hashCode) +
      (extra.hashCode) +
      (groups.hashCode) +
      (request.hashCode) +
      (signerName.hashCode) +
      (uid == null ? 0 : uid!.hashCode) +
      (usages.hashCode) +
      (username == null ? 0 : username!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCertificatesV1CertificateSigningRequestSpec[expirationSeconds=$expirationSeconds, extra=$extra, groups=$groups, request=$request, signerName=$signerName, uid=$uid, usages=$usages, username=$username]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (expirationSeconds != null) {
      json[r'expirationSeconds'] = expirationSeconds;
    }
    json[r'extra'] = extra;
    json[r'groups'] = groups;
    json[r'request'] = request;
    json[r'signerName'] = signerName;
    if (uid != null) {
      json[r'uid'] = uid;
    }
    json[r'usages'] = usages;
    if (username != null) {
      json[r'username'] = username;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCertificatesV1CertificateSigningRequestSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCertificatesV1CertificateSigningRequestSpec? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCertificatesV1CertificateSigningRequestSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCertificatesV1CertificateSigningRequestSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCertificatesV1CertificateSigningRequestSpec(
        expirationSeconds: mapValueOfType<int>(json, r'expirationSeconds'),
        // TODO: Fix original generated code
        // extra: json[r'extra'] == null ? const {} : mapCastOfType<String, List>(json, r'extra'),
        extra: const {},
        groups: json[r'groups'] is List
            ? (json[r'groups'] as List).cast<String>()
            : const [],
        request: mapValueOfType<String>(json, r'request')!,
        signerName: mapValueOfType<String>(json, r'signerName')!,
        uid: mapValueOfType<String>(json, r'uid'),
        usages: json[r'usages'] is List
            ? (json[r'usages'] as List).cast<String>()
            : const [],
        username: mapValueOfType<String>(json, r'username'),
      );
    }
    return null;
  }

  static List<IoK8sApiCertificatesV1CertificateSigningRequestSpec>?
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCertificatesV1CertificateSigningRequestSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiCertificatesV1CertificateSigningRequestSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCertificatesV1CertificateSigningRequestSpec>
      mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCertificatesV1CertificateSigningRequestSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiCertificatesV1CertificateSigningRequestSpec.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCertificatesV1CertificateSigningRequestSpec-objects as value to a dart map
  static Map<String, List<IoK8sApiCertificatesV1CertificateSigningRequestSpec>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoK8sApiCertificatesV1CertificateSigningRequestSpec>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiCertificatesV1CertificateSigningRequestSpec.listFromJson(
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
    'request',
    'signerName',
  };
}
