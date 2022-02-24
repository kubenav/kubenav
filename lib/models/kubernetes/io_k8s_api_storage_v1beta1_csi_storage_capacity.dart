//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiStorageV1beta1CSIStorageCapacity {
  /// Returns a new [IoK8sApiStorageV1beta1CSIStorageCapacity] instance.
  IoK8sApiStorageV1beta1CSIStorageCapacity({
    this.apiVersion,
    this.capacity,
    this.kind,
    this.maximumVolumeSize,
    this.metadata,
    this.nodeTopology,
    required this.storageClassName,
  });

  /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? apiVersion;

  /// Quantity is a fixed-point representation of a number. It provides convenient marshaling/unmarshaling in JSON and YAML, in addition to String() and AsInt64() accessors.  The serialization format is:  <quantity>        ::= <signedNumber><suffix>   (Note that <suffix> may be empty, from the \"\" case in <decimalSI>.) <digit>           ::= 0 | 1 | ... | 9 <digits>          ::= <digit> | <digit><digits> <number>          ::= <digits> | <digits>.<digits> | <digits>. | .<digits> <sign>            ::= \"+\" | \"-\" <signedNumber>    ::= <number> | <sign><number> <suffix>          ::= <binarySI> | <decimalExponent> | <decimalSI> <binarySI>        ::= Ki | Mi | Gi | Ti | Pi | Ei   (International System of units; See: http://physics.nist.gov/cuu/Units/binary.html) <decimalSI>       ::= m | \"\" | k | M | G | T | P | E   (Note that 1024 = 1Ki but 1000 = 1k; I didn't choose the capitalization.) <decimalExponent> ::= \"e\" <signedNumber> | \"E\" <signedNumber>  No matter which of the three exponent forms is used, no quantity may represent a number greater than 2^63-1 in magnitude, nor may it have more than 3 decimal places. Numbers larger or more precise will be capped or rounded up. (E.g.: 0.1m will rounded up to 1m.) This may be extended in the future if we require larger or smaller quantities.  When a Quantity is parsed from a string, it will remember the type of suffix it had, and will use the same type again when it is serialized.  Before serializing, Quantity will be put in \"canonical form\". This means that Exponent/suffix will be adjusted up or down (with a corresponding increase or decrease in Mantissa) such that:   a. No precision is lost   b. No fractional digits will be emitted   c. The exponent (or suffix) is as large as possible. The sign will be omitted unless the number is negative.  Examples:   1.5 will be serialized as \"1500m\"   1.5Gi will be serialized as \"1536Mi\"  Note that the quantity will NEVER be internally represented by a floating point number. That is the whole point of this exercise.  Non-canonical values will still parse as long as they are well formed, but will be re-emitted in their canonical form. (So always use canonical form, or don't diff.)  This format is intended to make it difficult to use these numbers without writing some sort of special handling code in the hopes that that will cause implementors to also use a fixed point implementation.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? capacity;

  /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? kind;

  /// Quantity is a fixed-point representation of a number. It provides convenient marshaling/unmarshaling in JSON and YAML, in addition to String() and AsInt64() accessors.  The serialization format is:  <quantity>        ::= <signedNumber><suffix>   (Note that <suffix> may be empty, from the \"\" case in <decimalSI>.) <digit>           ::= 0 | 1 | ... | 9 <digits>          ::= <digit> | <digit><digits> <number>          ::= <digits> | <digits>.<digits> | <digits>. | .<digits> <sign>            ::= \"+\" | \"-\" <signedNumber>    ::= <number> | <sign><number> <suffix>          ::= <binarySI> | <decimalExponent> | <decimalSI> <binarySI>        ::= Ki | Mi | Gi | Ti | Pi | Ei   (International System of units; See: http://physics.nist.gov/cuu/Units/binary.html) <decimalSI>       ::= m | \"\" | k | M | G | T | P | E   (Note that 1024 = 1Ki but 1000 = 1k; I didn't choose the capitalization.) <decimalExponent> ::= \"e\" <signedNumber> | \"E\" <signedNumber>  No matter which of the three exponent forms is used, no quantity may represent a number greater than 2^63-1 in magnitude, nor may it have more than 3 decimal places. Numbers larger or more precise will be capped or rounded up. (E.g.: 0.1m will rounded up to 1m.) This may be extended in the future if we require larger or smaller quantities.  When a Quantity is parsed from a string, it will remember the type of suffix it had, and will use the same type again when it is serialized.  Before serializing, Quantity will be put in \"canonical form\". This means that Exponent/suffix will be adjusted up or down (with a corresponding increase or decrease in Mantissa) such that:   a. No precision is lost   b. No fractional digits will be emitted   c. The exponent (or suffix) is as large as possible. The sign will be omitted unless the number is negative.  Examples:   1.5 will be serialized as \"1500m\"   1.5Gi will be serialized as \"1536Mi\"  Note that the quantity will NEVER be internally represented by a floating point number. That is the whole point of this exercise.  Non-canonical values will still parse as long as they are well formed, but will be re-emitted in their canonical form. (So always use canonical form, or don't diff.)  This format is intended to make it difficult to use these numbers without writing some sort of special handling code in the hopes that that will cause implementors to also use a fixed point implementation.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? maximumVolumeSize;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApimachineryPkgApisMetaV1ObjectMeta? metadata;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApimachineryPkgApisMetaV1LabelSelector? nodeTopology;

  /// The name of the StorageClass that the reported capacity applies to. It must meet the same requirements as the name of a StorageClass object (non-empty, DNS subdomain). If that object no longer exists, the CSIStorageCapacity object is obsolete and should be removed by its creator. This field is immutable.
  String storageClassName;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiStorageV1beta1CSIStorageCapacity &&
          other.apiVersion == apiVersion &&
          other.capacity == capacity &&
          other.kind == kind &&
          other.maximumVolumeSize == maximumVolumeSize &&
          other.metadata == metadata &&
          other.nodeTopology == nodeTopology &&
          other.storageClassName == storageClassName;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (apiVersion == null ? 0 : apiVersion!.hashCode) +
      (capacity == null ? 0 : capacity!.hashCode) +
      (kind == null ? 0 : kind!.hashCode) +
      (maximumVolumeSize == null ? 0 : maximumVolumeSize!.hashCode) +
      (metadata == null ? 0 : metadata!.hashCode) +
      (nodeTopology == null ? 0 : nodeTopology!.hashCode) +
      (storageClassName.hashCode);

  @override
  String toString() =>
      'IoK8sApiStorageV1beta1CSIStorageCapacity[apiVersion=$apiVersion, capacity=$capacity, kind=$kind, maximumVolumeSize=$maximumVolumeSize, metadata=$metadata, nodeTopology=$nodeTopology, storageClassName=$storageClassName]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (apiVersion != null) {
      json[r'apiVersion'] = apiVersion;
    }
    if (capacity != null) {
      json[r'capacity'] = capacity;
    }
    if (kind != null) {
      json[r'kind'] = kind;
    }
    if (maximumVolumeSize != null) {
      json[r'maximumVolumeSize'] = maximumVolumeSize;
    }
    if (metadata != null) {
      json[r'metadata'] = metadata;
    }
    if (nodeTopology != null) {
      json[r'nodeTopology'] = nodeTopology;
    }
    json[r'storageClassName'] = storageClassName;
    return json;
  }

  /// Returns a new [IoK8sApiStorageV1beta1CSIStorageCapacity] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiStorageV1beta1CSIStorageCapacity? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiStorageV1beta1CSIStorageCapacity[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiStorageV1beta1CSIStorageCapacity[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiStorageV1beta1CSIStorageCapacity(
        apiVersion: mapValueOfType<String>(json, r'apiVersion'),
        capacity: mapValueOfType<String>(json, r'capacity'),
        kind: mapValueOfType<String>(json, r'kind'),
        maximumVolumeSize: mapValueOfType<String>(json, r'maximumVolumeSize'),
        metadata: IoK8sApimachineryPkgApisMetaV1ObjectMeta.fromJson(
            json[r'metadata']),
        nodeTopology: IoK8sApimachineryPkgApisMetaV1LabelSelector.fromJson(
            json[r'nodeTopology']),
        storageClassName: mapValueOfType<String>(json, r'storageClassName')!,
      );
    }
    return null;
  }

  static List<IoK8sApiStorageV1beta1CSIStorageCapacity>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiStorageV1beta1CSIStorageCapacity>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiStorageV1beta1CSIStorageCapacity.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiStorageV1beta1CSIStorageCapacity> mapFromJson(
      dynamic json) {
    final map = <String, IoK8sApiStorageV1beta1CSIStorageCapacity>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiStorageV1beta1CSIStorageCapacity.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiStorageV1beta1CSIStorageCapacity-objects as value to a dart map
  static Map<String, List<IoK8sApiStorageV1beta1CSIStorageCapacity>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiStorageV1beta1CSIStorageCapacity>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiStorageV1beta1CSIStorageCapacity.listFromJson(
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
    'storageClassName',
  };
}
