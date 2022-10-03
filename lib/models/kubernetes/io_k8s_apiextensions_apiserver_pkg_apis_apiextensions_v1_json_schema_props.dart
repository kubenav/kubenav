//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element
// ignore_for_file: unnecessary_this
// ignore_for_file: dead_null_aware_expression
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:kubenav/models/kubernetes/helpers.dart';
import 'package:kubenav/models/kubernetes/io_k8s_apiextensions_apiserver_pkg_apis_apiextensions_v1_external_documentation.dart';
import 'package:kubenav/models/kubernetes/io_k8s_apiextensions_apiserver_pkg_apis_apiextensions_v1_validation_rule.dart';

class IoK8sApiextensionsApiserverPkgApisApiextensionsV1JSONSchemaProps {
  /// Returns a new [IoK8sApiextensionsApiserverPkgApisApiextensionsV1JSONSchemaProps] instance.
  IoK8sApiextensionsApiserverPkgApisApiextensionsV1JSONSchemaProps({
    this.dollarRef,
    this.dollarSchema,
    this.additionalItems,
    this.additionalProperties,
    this.allOf = const [],
    this.anyOf = const [],
    this.default_,
    this.definitions = const {},
    this.dependencies = const {},
    this.description,
    this.enum_ = const [],
    this.example,
    this.exclusiveMaximum,
    this.exclusiveMinimum,
    this.externalDocs,
    this.format,
    this.id,
    this.items,
    this.maxItems,
    this.maxLength,
    this.maxProperties,
    this.maximum,
    this.minItems,
    this.minLength,
    this.minProperties,
    this.minimum,
    this.multipleOf,
    this.not,
    this.nullable,
    this.oneOf = const [],
    this.pattern,
    this.patternProperties = const {},
    this.properties = const {},
    this.required_ = const [],
    this.title,
    this.type,
    this.uniqueItems,
    this.xKubernetesEmbeddedResource,
    this.xKubernetesIntOrString,
    this.xKubernetesListMapKeys = const [],
    this.xKubernetesListType,
    this.xKubernetesMapType,
    this.xKubernetesPreserveUnknownFields,
    this.xKubernetesValidations = const [],
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? dollarRef;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? dollarSchema;

  /// JSONSchemaPropsOrBool represents JSONSchemaProps or a boolean value. Defaults to true for the boolean property.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Object? additionalItems;

  /// JSONSchemaPropsOrBool represents JSONSchemaProps or a boolean value. Defaults to true for the boolean property.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Object? additionalProperties;

  List<IoK8sApiextensionsApiserverPkgApisApiextensionsV1JSONSchemaProps> allOf;

  List<IoK8sApiextensionsApiserverPkgApisApiextensionsV1JSONSchemaProps> anyOf;

  /// JSON represents any valid JSON value. These types are supported: bool, int64, float64, string, []interface{}, map[string]interface{} and nil.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Object? default_;

  Map<String, IoK8sApiextensionsApiserverPkgApisApiextensionsV1JSONSchemaProps>
      definitions;

  Map<String, Object> dependencies;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  List<Object> enum_;

  /// JSON represents any valid JSON value. These types are supported: bool, int64, float64, string, []interface{}, map[string]interface{} and nil.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Object? example;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? exclusiveMaximum;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? exclusiveMinimum;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiextensionsApiserverPkgApisApiextensionsV1ExternalDocumentation?
      externalDocs;

  /// format is an OpenAPI v3 format string. Unknown formats are ignored. The following formats are validated:  - bsonobjectid: a bson object ID, i.e. a 24 characters hex string - uri: an URI as parsed by Golang net/url.ParseRequestURI - email: an email address as parsed by Golang net/mail.ParseAddress - hostname: a valid representation for an Internet host name, as defined by RFC 1034, section 3.1 [RFC1034]. - ipv4: an IPv4 IP as parsed by Golang net.ParseIP - ipv6: an IPv6 IP as parsed by Golang net.ParseIP - cidr: a CIDR as parsed by Golang net.ParseCIDR - mac: a MAC address as parsed by Golang net.ParseMAC - uuid: an UUID that allows uppercase defined by the regex (?i)^[0-9a-f]{8}-?[0-9a-f]{4}-?[0-9a-f]{4}-?[0-9a-f]{4}-?[0-9a-f]{12}$ - uuid3: an UUID3 that allows uppercase defined by the regex (?i)^[0-9a-f]{8}-?[0-9a-f]{4}-?3[0-9a-f]{3}-?[0-9a-f]{4}-?[0-9a-f]{12}$ - uuid4: an UUID4 that allows uppercase defined by the regex (?i)^[0-9a-f]{8}-?[0-9a-f]{4}-?4[0-9a-f]{3}-?[89ab][0-9a-f]{3}-?[0-9a-f]{12}$ - uuid5: an UUID5 that allows uppercase defined by the regex (?i)^[0-9a-f]{8}-?[0-9a-f]{4}-?5[0-9a-f]{3}-?[89ab][0-9a-f]{3}-?[0-9a-f]{12}$ - isbn: an ISBN10 or ISBN13 number string like \"0321751043\" or \"978-0321751041\" - isbn10: an ISBN10 number string like \"0321751043\" - isbn13: an ISBN13 number string like \"978-0321751041\" - creditcard: a credit card number defined by the regex ^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\\d{3})\\d{11})$ with any non digit characters mixed in - ssn: a U.S. social security number following the regex ^\\d{3}[- ]?\\d{2}[- ]?\\d{4}$ - hexcolor: an hexadecimal color code like \"#FFFFFF: following the regex ^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$ - rgbcolor: an RGB color code like rgb like \"rgb(255,255,2559\" - byte: base64 encoded binary data - password: any kind of string - date: a date string like \"2006-01-02\" as defined by full-date in RFC3339 - duration: a duration string like \"22 ns\" as parsed by Golang time.ParseDuration or compatible with Scala duration format - datetime: a date time string like \"2014-12-15T19:30:20.000Z\" as defined by date-time in RFC3339.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? format;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// JSONSchemaPropsOrArray represents a value that can either be a JSONSchemaProps or an array of JSONSchemaProps. Mainly here for serialization purposes.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Object? items;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? maxItems;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? maxLength;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? maxProperties;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  double? maximum;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? minItems;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? minLength;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? minProperties;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  double? minimum;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  double? multipleOf;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiextensionsApiserverPkgApisApiextensionsV1JSONSchemaProps? not;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? nullable;

  List<IoK8sApiextensionsApiserverPkgApisApiextensionsV1JSONSchemaProps> oneOf;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? pattern;

  Map<String, IoK8sApiextensionsApiserverPkgApisApiextensionsV1JSONSchemaProps>
      patternProperties;

  Map<String, IoK8sApiextensionsApiserverPkgApisApiextensionsV1JSONSchemaProps>
      properties;

  List<String> required_;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? title;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? type;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? uniqueItems;

  /// x-kubernetes-embedded-resource defines that the value is an embedded Kubernetes runtime.Object, with TypeMeta and ObjectMeta. The type must be object. It is allowed to further restrict the embedded object. kind, apiVersion and metadata are validated automatically. x-kubernetes-preserve-unknown-fields is allowed to be true, but does not have to be if the object is fully specified (up to kind, apiVersion, metadata).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? xKubernetesEmbeddedResource;

  /// x-kubernetes-int-or-string specifies that this value is either an integer or a string. If this is true, an empty type is allowed and type as child of anyOf is permitted if following one of the following patterns:  1) anyOf:    - type: integer    - type: string 2) allOf:    - anyOf:      - type: integer      - type: string    - ... zero or more
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? xKubernetesIntOrString;

  /// x-kubernetes-list-map-keys annotates an array with the x-kubernetes-list-type `map` by specifying the keys used as the index of the map.  This tag MUST only be used on lists that have the \"x-kubernetes-list-type\" extension set to \"map\". Also, the values specified for this attribute must be a scalar typed field of the child structure (no nesting is supported).  The properties specified must either be required or have a default value, to ensure those properties are present for all list items.
  List<String> xKubernetesListMapKeys;

  /// x-kubernetes-list-type annotates an array to further describe its topology. This extension must only be used on lists and may have 3 possible values:  1) `atomic`: the list is treated as a single entity, like a scalar.      Atomic lists will be entirely replaced when updated. This extension      may be used on any type of list (struct, scalar, ...). 2) `set`:      Sets are lists that must not have multiple items with the same value. Each      value must be a scalar, an object with x-kubernetes-map-type `atomic` or an      array with x-kubernetes-list-type `atomic`. 3) `map`:      These lists are like maps in that their elements have a non-index key      used to identify them. Order is preserved upon merge. The map tag      must only be used on a list with elements of type object. Defaults to atomic for arrays.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? xKubernetesListType;

  /// x-kubernetes-map-type annotates an object to further describe its topology. This extension must only be used when type is object and may have 2 possible values:  1) `granular`:      These maps are actual maps (key-value pairs) and each fields are independent      from each other (they can each be manipulated by separate actors). This is      the default behaviour for all maps. 2) `atomic`: the list is treated as a single entity, like a scalar.      Atomic maps will be entirely replaced when updated.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? xKubernetesMapType;

  /// x-kubernetes-preserve-unknown-fields stops the API server decoding step from pruning fields which are not specified in the validation schema. This affects fields recursively, but switches back to normal pruning behaviour if nested properties or additionalProperties are specified in the schema. This can either be true or undefined. False is forbidden.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? xKubernetesPreserveUnknownFields;

  /// x-kubernetes-validations describes a list of validation rules written in the CEL expression language. This field is an alpha-level. Using this field requires the feature gate `CustomResourceValidationExpressions` to be enabled.
  List<IoK8sApiextensionsApiserverPkgApisApiextensionsV1ValidationRule>
      xKubernetesValidations;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiextensionsApiserverPkgApisApiextensionsV1JSONSchemaProps &&
          other.dollarRef == dollarRef &&
          other.dollarSchema == dollarSchema &&
          other.additionalItems == additionalItems &&
          other.additionalProperties == additionalProperties &&
          other.allOf == allOf &&
          other.anyOf == anyOf &&
          other.default_ == default_ &&
          other.definitions == definitions &&
          other.dependencies == dependencies &&
          other.description == description &&
          other.enum_ == enum_ &&
          other.example == example &&
          other.exclusiveMaximum == exclusiveMaximum &&
          other.exclusiveMinimum == exclusiveMinimum &&
          other.externalDocs == externalDocs &&
          other.format == format &&
          other.id == id &&
          other.items == items &&
          other.maxItems == maxItems &&
          other.maxLength == maxLength &&
          other.maxProperties == maxProperties &&
          other.maximum == maximum &&
          other.minItems == minItems &&
          other.minLength == minLength &&
          other.minProperties == minProperties &&
          other.minimum == minimum &&
          other.multipleOf == multipleOf &&
          other.not == not &&
          other.nullable == nullable &&
          other.oneOf == oneOf &&
          other.pattern == pattern &&
          other.patternProperties == patternProperties &&
          other.properties == properties &&
          other.required_ == required_ &&
          other.title == title &&
          other.type == type &&
          other.uniqueItems == uniqueItems &&
          other.xKubernetesEmbeddedResource == xKubernetesEmbeddedResource &&
          other.xKubernetesIntOrString == xKubernetesIntOrString &&
          other.xKubernetesListMapKeys == xKubernetesListMapKeys &&
          other.xKubernetesListType == xKubernetesListType &&
          other.xKubernetesMapType == xKubernetesMapType &&
          other.xKubernetesPreserveUnknownFields ==
              xKubernetesPreserveUnknownFields &&
          other.xKubernetesValidations == xKubernetesValidations;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (dollarRef == null ? 0 : dollarRef!.hashCode) +
      (dollarSchema == null ? 0 : dollarSchema!.hashCode) +
      (additionalItems == null ? 0 : additionalItems!.hashCode) +
      (additionalProperties == null ? 0 : additionalProperties!.hashCode) +
      (allOf.hashCode) +
      (anyOf.hashCode) +
      (default_ == null ? 0 : default_!.hashCode) +
      (definitions.hashCode) +
      (dependencies.hashCode) +
      (description == null ? 0 : description!.hashCode) +
      (enum_.hashCode) +
      (example == null ? 0 : example!.hashCode) +
      (exclusiveMaximum == null ? 0 : exclusiveMaximum!.hashCode) +
      (exclusiveMinimum == null ? 0 : exclusiveMinimum!.hashCode) +
      (externalDocs == null ? 0 : externalDocs!.hashCode) +
      (format == null ? 0 : format!.hashCode) +
      (id == null ? 0 : id!.hashCode) +
      (items == null ? 0 : items!.hashCode) +
      (maxItems == null ? 0 : maxItems!.hashCode) +
      (maxLength == null ? 0 : maxLength!.hashCode) +
      (maxProperties == null ? 0 : maxProperties!.hashCode) +
      (maximum == null ? 0 : maximum!.hashCode) +
      (minItems == null ? 0 : minItems!.hashCode) +
      (minLength == null ? 0 : minLength!.hashCode) +
      (minProperties == null ? 0 : minProperties!.hashCode) +
      (minimum == null ? 0 : minimum!.hashCode) +
      (multipleOf == null ? 0 : multipleOf!.hashCode) +
      (not == null ? 0 : not!.hashCode) +
      (nullable == null ? 0 : nullable!.hashCode) +
      (oneOf.hashCode) +
      (pattern == null ? 0 : pattern!.hashCode) +
      (patternProperties.hashCode) +
      (properties.hashCode) +
      (required_.hashCode) +
      (title == null ? 0 : title!.hashCode) +
      (type == null ? 0 : type!.hashCode) +
      (uniqueItems == null ? 0 : uniqueItems!.hashCode) +
      (xKubernetesEmbeddedResource == null
          ? 0
          : xKubernetesEmbeddedResource!.hashCode) +
      (xKubernetesIntOrString == null ? 0 : xKubernetesIntOrString!.hashCode) +
      (xKubernetesListMapKeys.hashCode) +
      (xKubernetesListType == null ? 0 : xKubernetesListType!.hashCode) +
      (xKubernetesMapType == null ? 0 : xKubernetesMapType!.hashCode) +
      (xKubernetesPreserveUnknownFields == null
          ? 0
          : xKubernetesPreserveUnknownFields!.hashCode) +
      (xKubernetesValidations.hashCode);

  @override
  String toString() =>
      'IoK8sApiextensionsApiserverPkgApisApiextensionsV1JSONSchemaProps[dollarRef=$dollarRef, dollarSchema=$dollarSchema, additionalItems=$additionalItems, additionalProperties=$additionalProperties, allOf=$allOf, anyOf=$anyOf, default_=$default_, definitions=$definitions, dependencies=$dependencies, description=$description, enum_=$enum_, example=$example, exclusiveMaximum=$exclusiveMaximum, exclusiveMinimum=$exclusiveMinimum, externalDocs=$externalDocs, format=$format, id=$id, items=$items, maxItems=$maxItems, maxLength=$maxLength, maxProperties=$maxProperties, maximum=$maximum, minItems=$minItems, minLength=$minLength, minProperties=$minProperties, minimum=$minimum, multipleOf=$multipleOf, not=$not, nullable=$nullable, oneOf=$oneOf, pattern=$pattern, patternProperties=$patternProperties, properties=$properties, required_=$required_, title=$title, type=$type, uniqueItems=$uniqueItems, xKubernetesEmbeddedResource=$xKubernetesEmbeddedResource, xKubernetesIntOrString=$xKubernetesIntOrString, xKubernetesListMapKeys=$xKubernetesListMapKeys, xKubernetesListType=$xKubernetesListType, xKubernetesMapType=$xKubernetesMapType, xKubernetesPreserveUnknownFields=$xKubernetesPreserveUnknownFields, xKubernetesValidations=$xKubernetesValidations]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.dollarRef != null) {
      json[r'$ref'] = this.dollarRef;
    } else {
      json[r'$ref'] = null;
    }
    if (this.dollarSchema != null) {
      json[r'$schema'] = this.dollarSchema;
    } else {
      json[r'$schema'] = null;
    }
    if (this.additionalItems != null) {
      json[r'additionalItems'] = this.additionalItems;
    } else {
      json[r'additionalItems'] = null;
    }
    if (this.additionalProperties != null) {
      json[r'additionalProperties'] = this.additionalProperties;
    } else {
      json[r'additionalProperties'] = null;
    }
    json[r'allOf'] = this.allOf;
    json[r'anyOf'] = this.anyOf;
    if (this.default_ != null) {
      json[r'default'] = this.default_;
    } else {
      json[r'default'] = null;
    }
    json[r'definitions'] = this.definitions;
    json[r'dependencies'] = this.dependencies;
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    json[r'enum'] = this.enum_;
    if (this.example != null) {
      json[r'example'] = this.example;
    } else {
      json[r'example'] = null;
    }
    if (this.exclusiveMaximum != null) {
      json[r'exclusiveMaximum'] = this.exclusiveMaximum;
    } else {
      json[r'exclusiveMaximum'] = null;
    }
    if (this.exclusiveMinimum != null) {
      json[r'exclusiveMinimum'] = this.exclusiveMinimum;
    } else {
      json[r'exclusiveMinimum'] = null;
    }
    if (this.externalDocs != null) {
      json[r'externalDocs'] = this.externalDocs;
    } else {
      json[r'externalDocs'] = null;
    }
    if (this.format != null) {
      json[r'format'] = this.format;
    } else {
      json[r'format'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.items != null) {
      json[r'items'] = this.items;
    } else {
      json[r'items'] = null;
    }
    if (this.maxItems != null) {
      json[r'maxItems'] = this.maxItems;
    } else {
      json[r'maxItems'] = null;
    }
    if (this.maxLength != null) {
      json[r'maxLength'] = this.maxLength;
    } else {
      json[r'maxLength'] = null;
    }
    if (this.maxProperties != null) {
      json[r'maxProperties'] = this.maxProperties;
    } else {
      json[r'maxProperties'] = null;
    }
    if (this.maximum != null) {
      json[r'maximum'] = this.maximum;
    } else {
      json[r'maximum'] = null;
    }
    if (this.minItems != null) {
      json[r'minItems'] = this.minItems;
    } else {
      json[r'minItems'] = null;
    }
    if (this.minLength != null) {
      json[r'minLength'] = this.minLength;
    } else {
      json[r'minLength'] = null;
    }
    if (this.minProperties != null) {
      json[r'minProperties'] = this.minProperties;
    } else {
      json[r'minProperties'] = null;
    }
    if (this.minimum != null) {
      json[r'minimum'] = this.minimum;
    } else {
      json[r'minimum'] = null;
    }
    if (this.multipleOf != null) {
      json[r'multipleOf'] = this.multipleOf;
    } else {
      json[r'multipleOf'] = null;
    }
    if (this.not != null) {
      json[r'not'] = this.not;
    } else {
      json[r'not'] = null;
    }
    if (this.nullable != null) {
      json[r'nullable'] = this.nullable;
    } else {
      json[r'nullable'] = null;
    }
    json[r'oneOf'] = this.oneOf;
    if (this.pattern != null) {
      json[r'pattern'] = this.pattern;
    } else {
      json[r'pattern'] = null;
    }
    json[r'patternProperties'] = this.patternProperties;
    json[r'properties'] = this.properties;
    json[r'required'] = this.required_;
    if (this.title != null) {
      json[r'title'] = this.title;
    } else {
      json[r'title'] = null;
    }
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    if (this.uniqueItems != null) {
      json[r'uniqueItems'] = this.uniqueItems;
    } else {
      json[r'uniqueItems'] = null;
    }
    if (this.xKubernetesEmbeddedResource != null) {
      json[r'x-kubernetes-embedded-resource'] =
          this.xKubernetesEmbeddedResource;
    } else {
      json[r'x-kubernetes-embedded-resource'] = null;
    }
    if (this.xKubernetesIntOrString != null) {
      json[r'x-kubernetes-int-or-string'] = this.xKubernetesIntOrString;
    } else {
      json[r'x-kubernetes-int-or-string'] = null;
    }
    json[r'x-kubernetes-list-map-keys'] = this.xKubernetesListMapKeys;
    if (this.xKubernetesListType != null) {
      json[r'x-kubernetes-list-type'] = this.xKubernetesListType;
    } else {
      json[r'x-kubernetes-list-type'] = null;
    }
    if (this.xKubernetesMapType != null) {
      json[r'x-kubernetes-map-type'] = this.xKubernetesMapType;
    } else {
      json[r'x-kubernetes-map-type'] = null;
    }
    if (this.xKubernetesPreserveUnknownFields != null) {
      json[r'x-kubernetes-preserve-unknown-fields'] =
          this.xKubernetesPreserveUnknownFields;
    } else {
      json[r'x-kubernetes-preserve-unknown-fields'] = null;
    }
    json[r'x-kubernetes-validations'] = this.xKubernetesValidations;
    return json;
  }

  /// Returns a new [IoK8sApiextensionsApiserverPkgApisApiextensionsV1JSONSchemaProps] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiextensionsApiserverPkgApisApiextensionsV1JSONSchemaProps?
      fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiextensionsApiserverPkgApisApiextensionsV1JSONSchemaProps[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiextensionsApiserverPkgApisApiextensionsV1JSONSchemaProps[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiextensionsApiserverPkgApisApiextensionsV1JSONSchemaProps(
        dollarRef: mapValueOfType<String>(json, r'$ref'),
        dollarSchema: mapValueOfType<String>(json, r'$schema'),
        additionalItems: mapValueOfType<Object>(json, r'additionalItems'),
        additionalProperties:
            mapValueOfType<Object>(json, r'additionalProperties'),
        allOf: IoK8sApiextensionsApiserverPkgApisApiextensionsV1JSONSchemaProps
                .listFromJson(json[r'allOf']) ??
            const [],
        anyOf: IoK8sApiextensionsApiserverPkgApisApiextensionsV1JSONSchemaProps
                .listFromJson(json[r'anyOf']) ??
            const [],
        default_: mapValueOfType<Object>(json, r'default'),
        definitions:
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1JSONSchemaProps
                    .mapFromJson(json[r'definitions']) ??
                const {},
        dependencies:
            mapCastOfType<String, Object>(json, r'dependencies') ?? const {},
        description: mapValueOfType<String>(json, r'description'),
        enum_: const [],
        example: mapValueOfType<Object>(json, r'example'),
        exclusiveMaximum: mapValueOfType<bool>(json, r'exclusiveMaximum'),
        exclusiveMinimum: mapValueOfType<bool>(json, r'exclusiveMinimum'),
        externalDocs:
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1ExternalDocumentation
                .fromJson(json[r'externalDocs']),
        format: mapValueOfType<String>(json, r'format'),
        id: mapValueOfType<String>(json, r'id'),
        items: mapValueOfType<Object>(json, r'items'),
        maxItems: mapValueOfType<int>(json, r'maxItems'),
        maxLength: mapValueOfType<int>(json, r'maxLength'),
        maxProperties: mapValueOfType<int>(json, r'maxProperties'),
        maximum: mapValueOfType<double>(json, r'maximum'),
        minItems: mapValueOfType<int>(json, r'minItems'),
        minLength: mapValueOfType<int>(json, r'minLength'),
        minProperties: mapValueOfType<int>(json, r'minProperties'),
        minimum: mapValueOfType<double>(json, r'minimum'),
        multipleOf: mapValueOfType<double>(json, r'multipleOf'),
        not: IoK8sApiextensionsApiserverPkgApisApiextensionsV1JSONSchemaProps
            .fromJson(json[r'not']),
        nullable: mapValueOfType<bool>(json, r'nullable'),
        oneOf: IoK8sApiextensionsApiserverPkgApisApiextensionsV1JSONSchemaProps
                .listFromJson(json[r'oneOf']) ??
            const [],
        pattern: mapValueOfType<String>(json, r'pattern'),
        patternProperties:
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1JSONSchemaProps
                    .mapFromJson(json[r'patternProperties']) ??
                const {},
        properties:
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1JSONSchemaProps
                    .mapFromJson(json[r'properties']) ??
                const {},
        required_: json[r'required'] is List
            ? (json[r'required'] as List).cast<String>()
            : const [],
        title: mapValueOfType<String>(json, r'title'),
        type: mapValueOfType<String>(json, r'type'),
        uniqueItems: mapValueOfType<bool>(json, r'uniqueItems'),
        xKubernetesEmbeddedResource:
            mapValueOfType<bool>(json, r'x-kubernetes-embedded-resource'),
        xKubernetesIntOrString:
            mapValueOfType<bool>(json, r'x-kubernetes-int-or-string'),
        xKubernetesListMapKeys: json[r'x-kubernetes-list-map-keys'] is List
            ? (json[r'x-kubernetes-list-map-keys'] as List).cast<String>()
            : const [],
        xKubernetesListType:
            mapValueOfType<String>(json, r'x-kubernetes-list-type'),
        xKubernetesMapType:
            mapValueOfType<String>(json, r'x-kubernetes-map-type'),
        xKubernetesPreserveUnknownFields:
            mapValueOfType<bool>(json, r'x-kubernetes-preserve-unknown-fields'),
        xKubernetesValidations:
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1ValidationRule
                    .listFromJson(json[r'x-kubernetes-validations']) ??
                const [],
      );
    }
    return null;
  }

  static List<IoK8sApiextensionsApiserverPkgApisApiextensionsV1JSONSchemaProps>?
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result =
        <IoK8sApiextensionsApiserverPkgApisApiextensionsV1JSONSchemaProps>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1JSONSchemaProps
                .fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String,
          IoK8sApiextensionsApiserverPkgApisApiextensionsV1JSONSchemaProps>
      mapFromJson(dynamic json) {
    final map = <String,
        IoK8sApiextensionsApiserverPkgApisApiextensionsV1JSONSchemaProps>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1JSONSchemaProps
                .fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiextensionsApiserverPkgApisApiextensionsV1JSONSchemaProps-objects as value to a dart map
  static Map<
          String,
          List<
              IoK8sApiextensionsApiserverPkgApisApiextensionsV1JSONSchemaProps>>
      mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <
        String,
        List<
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1JSONSchemaProps>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value =
            IoK8sApiextensionsApiserverPkgApisApiextensionsV1JSONSchemaProps
                .listFromJson(
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
  static const requiredKeys = <String>{};
}
