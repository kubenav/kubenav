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
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_acme_v1_challenge_spec_solver_dns01_azure_dns_client_secret_secret_ref.dart';
import 'package:kubenav/models/plugins/cert-manager/io_cert_manager_acme_v1_challenge_spec_solver_dns01_azure_dns_managed_identity.dart';

class IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNS {
  /// Returns a new [IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNS] instance.
  IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNS({
    this.clientID,
    this.clientSecretSecretRef,
    this.environment,
    this.hostedZoneName,
    this.managedIdentity,
    required this.resourceGroupName,
    required this.subscriptionID,
    this.tenantID,
  });

  /// Auth: Azure Service Principal: The ClientID of the Azure Service Principal used to authenticate with Azure DNS. If set, ClientSecret and TenantID must also be set.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? clientID;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSClientSecretSecretRef?
      clientSecretSecretRef;

  /// name of the Azure environment (default AzurePublicCloud)
  IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSEnvironmentEnum?
      environment;

  /// name of the DNS zone that should be used
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? hostedZoneName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSManagedIdentity?
      managedIdentity;

  /// resource group the DNS zone is located in
  String resourceGroupName;

  /// ID of the Azure subscription
  String subscriptionID;

  /// Auth: Azure Service Principal: The TenantID of the Azure Service Principal used to authenticate with Azure DNS. If set, ClientID and ClientSecret must also be set.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? tenantID;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNS &&
          other.clientID == clientID &&
          other.clientSecretSecretRef == clientSecretSecretRef &&
          other.environment == environment &&
          other.hostedZoneName == hostedZoneName &&
          other.managedIdentity == managedIdentity &&
          other.resourceGroupName == resourceGroupName &&
          other.subscriptionID == subscriptionID &&
          other.tenantID == tenantID;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (clientID == null ? 0 : clientID!.hashCode) +
      (clientSecretSecretRef == null ? 0 : clientSecretSecretRef!.hashCode) +
      (environment == null ? 0 : environment!.hashCode) +
      (hostedZoneName == null ? 0 : hostedZoneName!.hashCode) +
      (managedIdentity == null ? 0 : managedIdentity!.hashCode) +
      (resourceGroupName.hashCode) +
      (subscriptionID.hashCode) +
      (tenantID == null ? 0 : tenantID!.hashCode);

  @override
  String toString() =>
      'IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNS[clientID=$clientID, clientSecretSecretRef=$clientSecretSecretRef, environment=$environment, hostedZoneName=$hostedZoneName, managedIdentity=$managedIdentity, resourceGroupName=$resourceGroupName, subscriptionID=$subscriptionID, tenantID=$tenantID]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.clientID != null) {
      json[r'clientID'] = this.clientID;
    } else {
      json[r'clientID'] = null;
    }
    if (this.clientSecretSecretRef != null) {
      json[r'clientSecretSecretRef'] = this.clientSecretSecretRef;
    } else {
      json[r'clientSecretSecretRef'] = null;
    }
    if (this.environment != null) {
      json[r'environment'] = this.environment;
    } else {
      json[r'environment'] = null;
    }
    if (this.hostedZoneName != null) {
      json[r'hostedZoneName'] = this.hostedZoneName;
    } else {
      json[r'hostedZoneName'] = null;
    }
    if (this.managedIdentity != null) {
      json[r'managedIdentity'] = this.managedIdentity;
    } else {
      json[r'managedIdentity'] = null;
    }
    json[r'resourceGroupName'] = this.resourceGroupName;
    json[r'subscriptionID'] = this.subscriptionID;
    if (this.tenantID != null) {
      json[r'tenantID'] = this.tenantID;
    } else {
      json[r'tenantID'] = null;
    }
    return json;
  }

  /// Returns a new [IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNS] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNS? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNS[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNS[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNS(
        clientID: mapValueOfType<String>(json, r'clientID'),
        clientSecretSecretRef:
            IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSClientSecretSecretRef
                .fromJson(json[r'clientSecretSecretRef']),
        environment:
            IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSEnvironmentEnum
                .fromJson(json[r'environment']),
        hostedZoneName: mapValueOfType<String>(json, r'hostedZoneName'),
        managedIdentity:
            IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSManagedIdentity
                .fromJson(json[r'managedIdentity']),
        resourceGroupName: mapValueOfType<String>(json, r'resourceGroupName')!,
        subscriptionID: mapValueOfType<String>(json, r'subscriptionID')!,
        tenantID: mapValueOfType<String>(json, r'tenantID'),
      );
    }
    return null;
  }

  static List<IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNS> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNS>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNS.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNS>
      mapFromJson(dynamic json) {
    final map = <String, IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNS>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNS.fromJson(
                entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNS-objects as value to a dart map
  static Map<String, List<IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNS>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNS>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNS.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'resourceGroupName',
    'subscriptionID',
  };
}

/// name of the Azure environment (default AzurePublicCloud)
class IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSEnvironmentEnum {
  /// Instantiate a new enum with the provided [value].
  const IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSEnvironmentEnum._(
      this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const azurePublicCloud =
      IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSEnvironmentEnum._(
          r'AzurePublicCloud');
  static const azureChinaCloud =
      IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSEnvironmentEnum._(
          r'AzureChinaCloud');
  static const azureGermanCloud =
      IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSEnvironmentEnum._(
          r'AzureGermanCloud');
  static const azureUSGovernmentCloud =
      IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSEnvironmentEnum._(
          r'AzureUSGovernmentCloud');

  /// List of all possible values in this [enum][IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSEnvironmentEnum].
  static const values =
      <IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSEnvironmentEnum>[
    azurePublicCloud,
    azureChinaCloud,
    azureGermanCloud,
    azureUSGovernmentCloud,
  ];

  static IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSEnvironmentEnum?
      fromJson(dynamic value) =>
          IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSEnvironmentEnumTypeTransformer()
              .decode(value);

  static List<
          IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSEnvironmentEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSEnvironmentEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSEnvironmentEnum
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSEnvironmentEnum] to String,
/// and [decode] dynamic data back to [IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSEnvironmentEnum].
class IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSEnvironmentEnumTypeTransformer {
  factory IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSEnvironmentEnumTypeTransformer() =>
      _instance ??=
          const IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSEnvironmentEnumTypeTransformer
              ._();

  const IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSEnvironmentEnumTypeTransformer._();

  String encode(
          IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSEnvironmentEnum
              data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSEnvironmentEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSEnvironmentEnum? decode(
      dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'AzurePublicCloud':
          return IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSEnvironmentEnum
              .azurePublicCloud;
        case r'AzureChinaCloud':
          return IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSEnvironmentEnum
              .azureChinaCloud;
        case r'AzureGermanCloud':
          return IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSEnvironmentEnum
              .azureGermanCloud;
        case r'AzureUSGovernmentCloud':
          return IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSEnvironmentEnum
              .azureUSGovernmentCloud;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSEnvironmentEnumTypeTransformer] instance.
  static IoCertManagerAcmeV1ChallengeSpecSolverDns01AzureDNSEnvironmentEnumTypeTransformer?
      _instance;
}
