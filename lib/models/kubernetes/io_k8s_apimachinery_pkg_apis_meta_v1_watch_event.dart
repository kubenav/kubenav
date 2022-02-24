//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApimachineryPkgApisMetaV1WatchEvent {
  /// Returns a new [IoK8sApimachineryPkgApisMetaV1WatchEvent] instance.
  IoK8sApimachineryPkgApisMetaV1WatchEvent({
    required this.object,
    required this.type,
  });

  /// RawExtension is used to hold extensions in external versions.  To use this, make a field which has RawExtension as its type in your external, versioned struct, and Object in your internal struct. You also need to register your various plugin types.  // Internal package: type MyAPIObject struct {  runtime.TypeMeta `json:\",inline\"`  MyPlugin runtime.Object `json:\"myPlugin\"` } type PluginA struct {  AOption string `json:\"aOption\"` }  // External package: type MyAPIObject struct {  runtime.TypeMeta `json:\",inline\"`  MyPlugin runtime.RawExtension `json:\"myPlugin\"` } type PluginA struct {  AOption string `json:\"aOption\"` }  // On the wire, the JSON will look something like this: {  \"kind\":\"MyAPIObject\",  \"apiVersion\":\"v1\",  \"myPlugin\": {   \"kind\":\"PluginA\",   \"aOption\":\"foo\",  }, }  So what happens? Decode first uses json or yaml to unmarshal the serialized data into your external MyAPIObject. That causes the raw JSON to be stored, but not unpacked. The next step is to copy (using pkg/conversion) into the internal struct. The runtime package's DefaultScheme has conversion functions installed which will unpack the JSON stored in RawExtension, turning it into the correct object type, and storing it in the Object. (TODO: In the case where the object is of an unknown type, a runtime.Unknown object will be created and stored.)
  Object object;

  String type;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApimachineryPkgApisMetaV1WatchEvent &&
          other.object == object &&
          other.type == type;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (object.hashCode) + (type.hashCode);

  @override
  String toString() =>
      'IoK8sApimachineryPkgApisMetaV1WatchEvent[object=$object, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'object'] = object;
    json[r'type'] = type;
    return json;
  }

  /// Returns a new [IoK8sApimachineryPkgApisMetaV1WatchEvent] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApimachineryPkgApisMetaV1WatchEvent? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApimachineryPkgApisMetaV1WatchEvent[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApimachineryPkgApisMetaV1WatchEvent[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApimachineryPkgApisMetaV1WatchEvent(
        object: mapValueOfType<Object>(json, r'object')!,
        type: mapValueOfType<String>(json, r'type')!,
      );
    }
    return null;
  }

  static List<IoK8sApimachineryPkgApisMetaV1WatchEvent>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApimachineryPkgApisMetaV1WatchEvent>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApimachineryPkgApisMetaV1WatchEvent.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApimachineryPkgApisMetaV1WatchEvent> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApimachineryPkgApisMetaV1WatchEvent>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApimachineryPkgApisMetaV1WatchEvent.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApimachineryPkgApisMetaV1WatchEvent-objects as value to a dart map
  static Map<String, List<IoK8sApimachineryPkgApisMetaV1WatchEvent>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApimachineryPkgApisMetaV1WatchEvent>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApimachineryPkgApisMetaV1WatchEvent.listFromJson(
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
    'object',
    'type',
  };
}
