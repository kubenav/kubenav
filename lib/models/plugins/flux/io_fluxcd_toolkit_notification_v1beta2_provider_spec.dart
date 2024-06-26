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
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_notification_v1beta2_provider_spec_cert_secret_ref.dart';
import 'package:kubenav/models/plugins/flux/io_fluxcd_toolkit_notification_v1beta2_provider_spec_secret_ref.dart';

class IoFluxcdToolkitNotificationV1beta2ProviderSpec {
  /// Returns a new [IoFluxcdToolkitNotificationV1beta2ProviderSpec] instance.
  IoFluxcdToolkitNotificationV1beta2ProviderSpec({
    this.address,
    this.certSecretRef,
    this.channel,
    this.interval,
    this.proxy,
    this.secretRef,
    this.suspend,
    this.timeout,
    required this.type,
    this.username,
  });

  /// Address specifies the endpoint, in a generic sense, to where alerts are sent. What kind of endpoint depends on the specific Provider type being used. For the generic Provider, for example, this is an HTTP/S address. For other Provider types this could be a project ID or a namespace.
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
  IoFluxcdToolkitNotificationV1beta2ProviderSpecCertSecretRef? certSecretRef;

  /// Channel specifies the destination channel where events should be posted.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? channel;

  /// Interval at which to reconcile the Provider with its Secret references.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? interval;

  /// Proxy the HTTP/S address of the proxy server.
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
  IoFluxcdToolkitNotificationV1beta2ProviderSpecSecretRef? secretRef;

  /// Suspend tells the controller to suspend subsequent events handling for this Provider.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? suspend;

  /// Timeout for sending alerts to the Provider.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? timeout;

  /// Type specifies which Provider implementation to use.
  IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum type;

  /// Username specifies the name under which events are posted.
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
      other is IoFluxcdToolkitNotificationV1beta2ProviderSpec &&
          other.address == address &&
          other.certSecretRef == certSecretRef &&
          other.channel == channel &&
          other.interval == interval &&
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
      (interval == null ? 0 : interval!.hashCode) +
      (proxy == null ? 0 : proxy!.hashCode) +
      (secretRef == null ? 0 : secretRef!.hashCode) +
      (suspend == null ? 0 : suspend!.hashCode) +
      (timeout == null ? 0 : timeout!.hashCode) +
      (type.hashCode) +
      (username == null ? 0 : username!.hashCode);

  @override
  String toString() =>
      'IoFluxcdToolkitNotificationV1beta2ProviderSpec[address=$address, certSecretRef=$certSecretRef, channel=$channel, interval=$interval, proxy=$proxy, secretRef=$secretRef, suspend=$suspend, timeout=$timeout, type=$type, username=$username]';

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
    if (this.interval != null) {
      json[r'interval'] = this.interval;
    } else {
      json[r'interval'] = null;
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

  /// Returns a new [IoFluxcdToolkitNotificationV1beta2ProviderSpec] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoFluxcdToolkitNotificationV1beta2ProviderSpec? fromJson(
      dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoFluxcdToolkitNotificationV1beta2ProviderSpec[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoFluxcdToolkitNotificationV1beta2ProviderSpec[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoFluxcdToolkitNotificationV1beta2ProviderSpec(
        address: mapValueOfType<String>(json, r'address'),
        certSecretRef:
            IoFluxcdToolkitNotificationV1beta2ProviderSpecCertSecretRef
                .fromJson(json[r'certSecretRef']),
        channel: mapValueOfType<String>(json, r'channel'),
        interval: mapValueOfType<String>(json, r'interval'),
        proxy: mapValueOfType<String>(json, r'proxy'),
        secretRef:
            IoFluxcdToolkitNotificationV1beta2ProviderSpecSecretRef.fromJson(
                json[r'secretRef']),
        suspend: mapValueOfType<bool>(json, r'suspend'),
        timeout: mapValueOfType<String>(json, r'timeout'),
        type: IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum.fromJson(
            json[r'type'])!,
        username: mapValueOfType<String>(json, r'username'),
      );
    }
    return null;
  }

  static List<IoFluxcdToolkitNotificationV1beta2ProviderSpec> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitNotificationV1beta2ProviderSpec>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitNotificationV1beta2ProviderSpec.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoFluxcdToolkitNotificationV1beta2ProviderSpec>
      mapFromJson(dynamic json) {
    final map = <String, IoFluxcdToolkitNotificationV1beta2ProviderSpec>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoFluxcdToolkitNotificationV1beta2ProviderSpec.fromJson(
            entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoFluxcdToolkitNotificationV1beta2ProviderSpec-objects as value to a dart map
  static Map<String, List<IoFluxcdToolkitNotificationV1beta2ProviderSpec>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map =
        <String, List<IoFluxcdToolkitNotificationV1beta2ProviderSpec>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] =
            IoFluxcdToolkitNotificationV1beta2ProviderSpec.listFromJson(
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

/// Type specifies which Provider implementation to use.
class IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const slack =
      IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum._(r'slack');
  static const discord =
      IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum._(r'discord');
  static const msteams =
      IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum._(r'msteams');
  static const rocket =
      IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum._(r'rocket');
  static const generic =
      IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum._(r'generic');
  static const genericHmac =
      IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum._(r'generic-hmac');
  static const github =
      IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum._(r'github');
  static const gitlab =
      IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum._(r'gitlab');
  static const gitea =
      IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum._(r'gitea');
  static const bitbucketserver =
      IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum._(
          r'bitbucketserver');
  static const bitbucket =
      IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum._(r'bitbucket');
  static const azuredevops =
      IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum._(r'azuredevops');
  static const googlechat =
      IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum._(r'googlechat');
  static const googlepubsub =
      IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum._(r'googlepubsub');
  static const webex =
      IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum._(r'webex');
  static const sentry =
      IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum._(r'sentry');
  static const azureeventhub =
      IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum._(
          r'azureeventhub');
  static const telegram =
      IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum._(r'telegram');
  static const lark =
      IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum._(r'lark');
  static const matrix =
      IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum._(r'matrix');
  static const opsgenie =
      IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum._(r'opsgenie');
  static const alertmanager =
      IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum._(r'alertmanager');
  static const grafana =
      IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum._(r'grafana');
  static const githubdispatch =
      IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum._(
          r'githubdispatch');
  static const pagerduty =
      IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum._(r'pagerduty');
  static const datadog =
      IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum._(r'datadog');

  /// List of all possible values in this [enum][IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum].
  static const values =
      <IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum>[
    slack,
    discord,
    msteams,
    rocket,
    generic,
    genericHmac,
    github,
    gitlab,
    gitea,
    bitbucketserver,
    bitbucket,
    azuredevops,
    googlechat,
    googlepubsub,
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
    pagerduty,
    datadog,
  ];

  static IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum? fromJson(
          dynamic value) =>
      IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnumTypeTransformer()
          .decode(value);

  static List<IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum>
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum.fromJson(
                row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum] to String,
/// and [decode] dynamic data back to [IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum].
class IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnumTypeTransformer {
  factory IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnumTypeTransformer() =>
      _instance ??=
          const IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnumTypeTransformer
              ._();

  const IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnumTypeTransformer._();

  String encode(IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'slack':
          return IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum.slack;
        case r'discord':
          return IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum.discord;
        case r'msteams':
          return IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum.msteams;
        case r'rocket':
          return IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum.rocket;
        case r'generic':
          return IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum.generic;
        case r'generic-hmac':
          return IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum
              .genericHmac;
        case r'github':
          return IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum.github;
        case r'gitlab':
          return IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum.gitlab;
        case r'gitea':
          return IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum.gitea;
        case r'bitbucketserver':
          return IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum
              .bitbucketserver;
        case r'bitbucket':
          return IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum
              .bitbucket;
        case r'azuredevops':
          return IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum
              .azuredevops;
        case r'googlechat':
          return IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum
              .googlechat;
        case r'googlepubsub':
          return IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum
              .googlepubsub;
        case r'webex':
          return IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum.webex;
        case r'sentry':
          return IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum.sentry;
        case r'azureeventhub':
          return IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum
              .azureeventhub;
        case r'telegram':
          return IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum
              .telegram;
        case r'lark':
          return IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum.lark;
        case r'matrix':
          return IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum.matrix;
        case r'opsgenie':
          return IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum
              .opsgenie;
        case r'alertmanager':
          return IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum
              .alertmanager;
        case r'grafana':
          return IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum.grafana;
        case r'githubdispatch':
          return IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum
              .githubdispatch;
        case r'pagerduty':
          return IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum
              .pagerduty;
        case r'datadog':
          return IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnum.datadog;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnumTypeTransformer] instance.
  static IoFluxcdToolkitNotificationV1beta2ProviderSpecTypeEnumTypeTransformer?
      _instance;
}
