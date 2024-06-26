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
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_notification_v1beta1_provider_spec_cert_secret_ref.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_notification_v1beta1_provider_spec_secret_ref.dart';

class IoFluxcdToolkitNotificationV1beta1ProviderSpec {
  /// Returns a new [IoFluxcdToolkitNotificationV1beta1ProviderSpec] instance.
  IoFluxcdToolkitNotificationV1beta1ProviderSpec({
    this.address,
    this.certSecretRef,
    this.channel,
    this.proxy,
    this.secretRef,
    this.suspend,
    this.timeout,
    required this.type,
    this.username,
  });

  /// HTTP/S webhook address of this provider
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? address;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitNotificationV1beta1ProviderSpecCertSecretRef? certSecretRef;

  /// Alert channel for this provider
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? channel;

  /// HTTP/S address of the proxy
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? proxy;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoFluxcdToolkitNotificationV1beta1ProviderSpecSecretRef? secretRef;

  /// This flag tells the controller to suspend subsequent events handling. Defaults to false.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? suspend;

  /// Timeout for sending alerts to the provider.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? timeout;

  /// Type of provider
  IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum type;

  /// Bot username for this provider
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
      other is IoFluxcdToolkitNotificationV1beta1ProviderSpec &&
          other.address == address &&
          other.certSecretRef == certSecretRef &&
          other.channel == channel &&
          other.proxy == proxy &&
          other.secretRef == secretRef &&
          other.suspend == suspend &&
          other.timeout == timeout &&
          other.type == type &&
          other.username == username;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (address == null ? 0 : address!.hashCode) +
      (certSecretRef == null ? 0 : certSecretRef!.hashCode) +
      (channel == null ? 0 : channel!.hashCode) +
      (proxy == null ? 0 : proxy!.hashCode) +
      (secretRef == null ? 0 : secretRef!.hashCode) +
      (suspend == null ? 0 : suspend!.hashCode) +
      (timeout == null ? 0 : timeout!.hashCode) +
      (type.hashCode) +
      (username == null ? 0 : username!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitNotificationV1beta1ProviderSpec[address=$address, certSecretRef=$certSecretRef, channel=$channel, proxy=$proxy, secretRef=$secretRef, suspend=$suspend, timeout=$timeout, type=$type, username=$username]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.address != null) {
      json[r'address'] = this.address;
    } else {
      json[r'address'] = null;
    }
    if (this.certSecretRef != null) {
      json[r'certSecretRef'] = this.certSecretRef;
    } else {
      json[r'certSecretRef'] = null;
    }
    if (this.channel != null) {
      json[r'channel'] = this.channel;
    } else {
      json[r'channel'] = null;
    }
    if (this.proxy != null) {
      json[r'proxy'] = this.proxy;
    } else {
      json[r'proxy'] = null;
    }
    if (this.secretRef != null) {
      json[r'secretRef'] = this.secretRef;
    } else {
      json[r'secretRef'] = null;
    }
    if (this.suspend != null) {
      json[r'suspend'] = this.suspend;
    } else {
      json[r'suspend'] = null;
    }
    if (this.timeout != null) {
      json[r'timeout'] = this.timeout;
    } else {
      json[r'timeout'] = null;
    }
    json[r'type'] = this.type;
    if (this.username != null) {
      json[r'username'] = this.username;
    } else {
      json[r'username'] = null;
    }
    return json;
  }

  /// Returns a new [IoFluxcdToolkitNotificationV1beta1ProviderSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitNotificationV1beta1ProviderSpec? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitNotificationV1beta1ProviderSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitNotificationV1beta1ProviderSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitNotificationV1beta1ProviderSpec(
        address: mapValueOfType<String>(json, r'address'),
        certSecretRef:
            IoFluxcdToolkitNotificationV1beta1ProviderSpecCertSecretRef
                .fromJson(json[r'certSecretRef']),
        channel: mapValueOfType<String>(json, r'channel'),
        proxy: mapValueOfType<String>(json, r'proxy'),
        secretRef:
            IoFluxcdToolkitNotificationV1beta1ProviderSpecSecretRef.fromJson(
                json[r'secretRef']),
        suspend: mapValueOfType<bool>(json, r'suspend'),
        timeout: mapValueOfType<String>(json, r'timeout'),
        type: IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum.fromJson(
            json[r'type'])!,
        username: mapValueOfType<String>(json, r'username'),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitNotificationV1beta1ProviderSpec> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitNotificationV1beta1ProviderSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitNotificationV1beta1ProviderSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitNotificationV1beta1ProviderSpec>
      mapFromJson(dynamic json) {
    final map = <String, IoFluxcdToolkitNotificationV1beta1ProviderSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoFluxcdToolkitNotificationV1beta1ProviderSpec.fromJson(
            entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitNotificationV1beta1ProviderSpec-objects as value to a dart map
  static Map<String, List<IoFluxcdToolkitNotificationV1beta1ProviderSpec>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoFluxcdToolkitNotificationV1beta1ProviderSpec>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitNotificationV1beta1ProviderSpec.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'type',
  };
}

/// Type of provider
class IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const slack =
      IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum._(r'slack');
  static const discord =
      IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum._(r'discord');
  static const msteams =
      IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum._(r'msteams');
  static const rocket =
      IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum._(r'rocket');
  static const generic =
      IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum._(r'generic');
  static const genericHmac =
      IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum._(r'generic-hmac');
  static const github =
      IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum._(r'github');
  static const gitlab =
      IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum._(r'gitlab');
  static const bitbucket =
      IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum._(r'bitbucket');
  static const azuredevops =
      IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum._(r'azuredevops');
  static const googlechat =
      IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum._(r'googlechat');
  static const webex =
      IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum._(r'webex');
  static const sentry =
      IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum._(r'sentry');
  static const azureeventhub =
      IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum._(
          r'azureeventhub');
  static const telegram =
      IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum._(r'telegram');
  static const lark =
      IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum._(r'lark');
  static const matrix =
      IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum._(r'matrix');
  static const opsgenie =
      IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum._(r'opsgenie');
  static const alertmanager =
      IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum._(r'alertmanager');
  static const grafana =
      IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum._(r'grafana');
  static const githubdispatch =
      IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum._(
          r'githubdispatch');

  /// List of all possible values in this [enum][IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum].
  static const values =
      <IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum>[
    slack,
    discord,
    msteams,
    rocket,
    generic,
    genericHmac,
    github,
    gitlab,
    bitbucket,
    azuredevops,
    googlechat,
    webex,
    sentry,
    azureeventhub,
    telegram,
    lark,
    matrix,
    opsgenie,
    alertmanager,
    grafana,
    githubdispatch,
  ];

  static IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum? fromJson(
          dynamic value) =>
      IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnumTypeTransformer()
          .decode(value);

  static List<IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum.fromJson(
                row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum] to String,
/// and [decode] dynamic data back to [IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum].
class IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnumTypeTransformer {
  factory IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnumTypeTransformer() =>
      _instance ??=
          const IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnumTypeTransformer
              ._();

  const IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnumTypeTransformer._();

  String encode(IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'slack':
          return IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum.slack;
        case r'discord':
          return IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum.discord;
        case r'msteams':
          return IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum.msteams;
        case r'rocket':
          return IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum.rocket;
        case r'generic':
          return IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum.generic;
        case r'generic-hmac':
          return IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum
              .genericHmac;
        case r'github':
          return IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum.github;
        case r'gitlab':
          return IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum.gitlab;
        case r'bitbucket':
          return IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum
              .bitbucket;
        case r'azuredevops':
          return IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum
              .azuredevops;
        case r'googlechat':
          return IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum
              .googlechat;
        case r'webex':
          return IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum.webex;
        case r'sentry':
          return IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum.sentry;
        case r'azureeventhub':
          return IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum
              .azureeventhub;
        case r'telegram':
          return IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum
              .telegram;
        case r'lark':
          return IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum.lark;
        case r'matrix':
          return IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum.matrix;
        case r'opsgenie':
          return IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum
              .opsgenie;
        case r'alertmanager':
          return IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum
              .alertmanager;
        case r'grafana':
          return IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum.grafana;
        case r'githubdispatch':
          return IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnum
              .githubdispatch;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnumTypeTransformer] instance.
  static IoFluxcdToolkitNotificationV1beta1ProviderSpecTypeEnumTypeTransformer?
      _instance;
}
