//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiCoreV1HTTPGetAction {
  /// Returns a new [IoK8sApiCoreV1HTTPGetAction] instance.
  IoK8sApiCoreV1HTTPGetAction({
    this.host,
    this.httpHeaders = const [],
    this.path,
    required this.port,
    this.scheme,
  });

  /// Host name to connect to, defaults to the pod IP. You probably want to set \"Host\" in httpHeaders instead.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? host;

  /// Custom headers to set in the request. HTTP allows repeated headers.
  List<IoK8sApiCoreV1HTTPHeader> httpHeaders;

  /// Path to access on the HTTP server.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? path;

  /// IntOrString is a type that can hold an int32 or a string.  When used in JSON or YAML marshalling and unmarshalling, it produces or consumes the inner type.  This allows you to have, for example, a JSON field that can accept a name or number.
  dynamic port;

  /// Scheme to use for connecting to the host. Defaults to HTTP.  Possible enum values:  - `\"HTTP\"` means that the scheme used will be http://  - `\"HTTPS\"` means that the scheme used will be https://
  IoK8sApiCoreV1HTTPGetActionSchemeEnum? scheme;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1HTTPGetAction &&
          other.host == host &&
          other.httpHeaders == httpHeaders &&
          other.path == path &&
          other.port == port &&
          other.scheme == scheme;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (host == null ? 0 : host!.hashCode) +
      (httpHeaders.hashCode) +
      (path == null ? 0 : path!.hashCode) +
      (port.hashCode) +
      (scheme == null ? 0 : scheme!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1HTTPGetAction[host=$host, httpHeaders=$httpHeaders, path=$path, port=$port, scheme=$scheme]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (host != null) {
      json[r'host'] = host;
    }
    json[r'httpHeaders'] = httpHeaders;
    if (path != null) {
      json[r'path'] = path;
    }
    json[r'port'] = port;
    if (scheme != null) {
      json[r'scheme'] = scheme;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1HTTPGetAction] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1HTTPGetAction? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1HTTPGetAction[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1HTTPGetAction[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1HTTPGetAction(
        host: mapValueOfType<String>(json, r'host'),
        httpHeaders:
            IoK8sApiCoreV1HTTPHeader.listFromJson(json[r'httpHeaders']) ??
                const [],
        path: mapValueOfType<String>(json, r'path'),
        port: mapValueOfType<dynamic>(json, r'port')!,
        scheme: IoK8sApiCoreV1HTTPGetActionSchemeEnum.fromJson(json[r'scheme']),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1HTTPGetAction>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1HTTPGetAction>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1HTTPGetAction.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1HTTPGetAction> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1HTTPGetAction>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1HTTPGetAction.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1HTTPGetAction-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1HTTPGetAction>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1HTTPGetAction>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1HTTPGetAction.listFromJson(
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
    'port',
  };
}

/// Scheme to use for connecting to the host. Defaults to HTTP.  Possible enum values:  - `\"HTTP\"` means that the scheme used will be http://  - `\"HTTPS\"` means that the scheme used will be https://
class IoK8sApiCoreV1HTTPGetActionSchemeEnum {
  /// Instantiate a new enum with the provided [value].
  const IoK8sApiCoreV1HTTPGetActionSchemeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const HTTP = IoK8sApiCoreV1HTTPGetActionSchemeEnum._(r'HTTP');
  static const HTTPS = IoK8sApiCoreV1HTTPGetActionSchemeEnum._(r'HTTPS');

  /// List of all possible values in this [enum][IoK8sApiCoreV1HTTPGetActionSchemeEnum].
  static const values = <IoK8sApiCoreV1HTTPGetActionSchemeEnum>[
    HTTP,
    HTTPS,
  ];

  static IoK8sApiCoreV1HTTPGetActionSchemeEnum? fromJson(dynamic value) =>
      IoK8sApiCoreV1HTTPGetActionSchemeEnumTypeTransformer().decode(value);

  static List<IoK8sApiCoreV1HTTPGetActionSchemeEnum>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1HTTPGetActionSchemeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1HTTPGetActionSchemeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoK8sApiCoreV1HTTPGetActionSchemeEnum] to String,
/// and [decode] dynamic data back to [IoK8sApiCoreV1HTTPGetActionSchemeEnum].
class IoK8sApiCoreV1HTTPGetActionSchemeEnumTypeTransformer {
  factory IoK8sApiCoreV1HTTPGetActionSchemeEnumTypeTransformer() =>
      _instance ??=
          const IoK8sApiCoreV1HTTPGetActionSchemeEnumTypeTransformer._();

  const IoK8sApiCoreV1HTTPGetActionSchemeEnumTypeTransformer._();

  String encode(IoK8sApiCoreV1HTTPGetActionSchemeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a IoK8sApiCoreV1HTTPGetActionSchemeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoK8sApiCoreV1HTTPGetActionSchemeEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'HTTP':
          return IoK8sApiCoreV1HTTPGetActionSchemeEnum.HTTP;
        case r'HTTPS':
          return IoK8sApiCoreV1HTTPGetActionSchemeEnum.HTTPS;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoK8sApiCoreV1HTTPGetActionSchemeEnumTypeTransformer] instance.
  static IoK8sApiCoreV1HTTPGetActionSchemeEnumTypeTransformer? _instance;
}
