//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IoK8sApiCoreV1Container {
  /// Returns a new [IoK8sApiCoreV1Container] instance.
  IoK8sApiCoreV1Container({
    this.args = const [],
    this.command = const [],
    this.env = const [],
    this.envFrom = const [],
    this.image,
    this.imagePullPolicy,
    this.lifecycle,
    this.livenessProbe,
    required this.name,
    this.ports = const [],
    this.readinessProbe,
    this.resources,
    this.securityContext,
    this.startupProbe,
    this.stdin,
    this.stdinOnce,
    this.terminationMessagePath,
    this.terminationMessagePolicy,
    this.tty,
    this.volumeDevices = const [],
    this.volumeMounts = const [],
    this.workingDir,
  });

  /// Arguments to the entrypoint. The docker image's CMD is used if this is not provided. Variable references $(VAR_NAME) are expanded using the container's environment. If a variable cannot be resolved, the reference in the input string will be unchanged. Double $$ are reduced to a single $, which allows for escaping the $(VAR_NAME) syntax: i.e. \"$$(VAR_NAME)\" will produce the string literal \"$(VAR_NAME)\". Escaped references will never be expanded, regardless of whether the variable exists or not. Cannot be updated. More info: https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/#running-a-command-in-a-shell
  List<String> args;

  /// Entrypoint array. Not executed within a shell. The docker image's ENTRYPOINT is used if this is not provided. Variable references $(VAR_NAME) are expanded using the container's environment. If a variable cannot be resolved, the reference in the input string will be unchanged. Double $$ are reduced to a single $, which allows for escaping the $(VAR_NAME) syntax: i.e. \"$$(VAR_NAME)\" will produce the string literal \"$(VAR_NAME)\". Escaped references will never be expanded, regardless of whether the variable exists or not. Cannot be updated. More info: https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/#running-a-command-in-a-shell
  List<String> command;

  /// List of environment variables to set in the container. Cannot be updated.
  List<IoK8sApiCoreV1EnvVar> env;

  /// List of sources to populate environment variables in the container. The keys defined within a source must be a C_IDENTIFIER. All invalid keys will be reported as an event when the container is starting. When a key exists in multiple sources, the value associated with the last source will take precedence. Values defined by an Env with a duplicate key will take precedence. Cannot be updated.
  List<IoK8sApiCoreV1EnvFromSource> envFrom;

  /// Docker image name. More info: https://kubernetes.io/docs/concepts/containers/images This field is optional to allow higher level config management to default or override container images in workload controllers like Deployments and StatefulSets.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? image;

  /// Image pull policy. One of Always, Never, IfNotPresent. Defaults to Always if :latest tag is specified, or IfNotPresent otherwise. Cannot be updated. More info: https://kubernetes.io/docs/concepts/containers/images#updating-images  Possible enum values:  - `\"Always\"` means that kubelet always attempts to pull the latest image. Container will fail If the pull fails.  - `\"IfNotPresent\"` means that kubelet pulls if the image isn't present on disk. Container will fail if the image isn't present and the pull fails.  - `\"Never\"` means that kubelet never pulls an image, but only uses a local image. Container will fail if the image isn't present
  IoK8sApiCoreV1ContainerImagePullPolicyEnum? imagePullPolicy;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1Lifecycle? lifecycle;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1Probe? livenessProbe;

  /// Name of the container specified as a DNS_LABEL. Each container in a pod must have a unique name (DNS_LABEL). Cannot be updated.
  String name;

  /// List of ports to expose from the container. Exposing a port here gives the system additional information about the network connections a container uses, but is primarily informational. Not specifying a port here DOES NOT prevent that port from being exposed. Any port which is listening on the default \"0.0.0.0\" address inside a container will be accessible from the network. Cannot be updated.
  List<IoK8sApiCoreV1ContainerPort> ports;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1Probe? readinessProbe;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1ResourceRequirements? resources;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1SecurityContext? securityContext;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IoK8sApiCoreV1Probe? startupProbe;

  /// Whether this container should allocate a buffer for stdin in the container runtime. If this is not set, reads from stdin in the container will always result in EOF. Default is false.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? stdin;

  /// Whether the container runtime should close the stdin channel after it has been opened by a single attach. When stdin is true the stdin stream will remain open across multiple attach sessions. If stdinOnce is set to true, stdin is opened on container start, is empty until the first client attaches to stdin, and then remains open and accepts data until the client disconnects, at which time stdin is closed and remains closed until the container is restarted. If this flag is false, a container processes that reads from stdin will never receive an EOF. Default is false
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? stdinOnce;

  /// Optional: Path at which the file to which the container's termination message will be written is mounted into the container's filesystem. Message written is intended to be brief final status, such as an assertion failure message. Will be truncated by the node if greater than 4096 bytes. The total message length across all containers will be limited to 12kb. Defaults to /dev/termination-log. Cannot be updated.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? terminationMessagePath;

  /// Indicate how the termination message should be populated. File will use the contents of terminationMessagePath to populate the container status message on both success and failure. FallbackToLogsOnError will use the last chunk of container log output if the termination message file is empty and the container exited with an error. The log output is limited to 2048 bytes or 80 lines, whichever is smaller. Defaults to File. Cannot be updated.  Possible enum values:  - `\"FallbackToLogsOnError\"` will read the most recent contents of the container logs for the container status message when the container exits with an error and the terminationMessagePath has no contents.  - `\"File\"` is the default behavior and will set the container status message to the contents of the container's terminationMessagePath when the container exits.
  IoK8sApiCoreV1ContainerTerminationMessagePolicyEnum? terminationMessagePolicy;

  /// Whether this container should allocate a TTY for itself, also requires 'stdin' to be true. Default is false.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? tty;

  /// volumeDevices is the list of block devices to be used by the container.
  List<IoK8sApiCoreV1VolumeDevice> volumeDevices;

  /// Pod volumes to mount into the container's filesystem. Cannot be updated.
  List<IoK8sApiCoreV1VolumeMount> volumeMounts;

  /// Container's working directory. If not specified, the container runtime's default will be used, which might be configured in the container image. Cannot be updated.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? workingDir;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IoK8sApiCoreV1Container &&
          other.args == args &&
          other.command == command &&
          other.env == env &&
          other.envFrom == envFrom &&
          other.image == image &&
          other.imagePullPolicy == imagePullPolicy &&
          other.lifecycle == lifecycle &&
          other.livenessProbe == livenessProbe &&
          other.name == name &&
          other.ports == ports &&
          other.readinessProbe == readinessProbe &&
          other.resources == resources &&
          other.securityContext == securityContext &&
          other.startupProbe == startupProbe &&
          other.stdin == stdin &&
          other.stdinOnce == stdinOnce &&
          other.terminationMessagePath == terminationMessagePath &&
          other.terminationMessagePolicy == terminationMessagePolicy &&
          other.tty == tty &&
          other.volumeDevices == volumeDevices &&
          other.volumeMounts == volumeMounts &&
          other.workingDir == workingDir;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (args.hashCode) +
      (command.hashCode) +
      (env.hashCode) +
      (envFrom.hashCode) +
      (image == null ? 0 : image!.hashCode) +
      (imagePullPolicy == null ? 0 : imagePullPolicy!.hashCode) +
      (lifecycle == null ? 0 : lifecycle!.hashCode) +
      (livenessProbe == null ? 0 : livenessProbe!.hashCode) +
      (name.hashCode) +
      (ports.hashCode) +
      (readinessProbe == null ? 0 : readinessProbe!.hashCode) +
      (resources == null ? 0 : resources!.hashCode) +
      (securityContext == null ? 0 : securityContext!.hashCode) +
      (startupProbe == null ? 0 : startupProbe!.hashCode) +
      (stdin == null ? 0 : stdin!.hashCode) +
      (stdinOnce == null ? 0 : stdinOnce!.hashCode) +
      (terminationMessagePath == null ? 0 : terminationMessagePath!.hashCode) +
      (terminationMessagePolicy == null
          ? 0
          : terminationMessagePolicy!.hashCode) +
      (tty == null ? 0 : tty!.hashCode) +
      (volumeDevices.hashCode) +
      (volumeMounts.hashCode) +
      (workingDir == null ? 0 : workingDir!.hashCode);

  @override
  String toString() =>
      'IoK8sApiCoreV1Container[args=$args, command=$command, env=$env, envFrom=$envFrom, image=$image, imagePullPolicy=$imagePullPolicy, lifecycle=$lifecycle, livenessProbe=$livenessProbe, name=$name, ports=$ports, readinessProbe=$readinessProbe, resources=$resources, securityContext=$securityContext, startupProbe=$startupProbe, stdin=$stdin, stdinOnce=$stdinOnce, terminationMessagePath=$terminationMessagePath, terminationMessagePolicy=$terminationMessagePolicy, tty=$tty, volumeDevices=$volumeDevices, volumeMounts=$volumeMounts, workingDir=$workingDir]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json[r'args'] = args;
    json[r'command'] = command;
    json[r'env'] = env;
    json[r'envFrom'] = envFrom;
    if (image != null) {
      json[r'image'] = image;
    }
    if (imagePullPolicy != null) {
      json[r'imagePullPolicy'] = imagePullPolicy;
    }
    if (lifecycle != null) {
      json[r'lifecycle'] = lifecycle;
    }
    if (livenessProbe != null) {
      json[r'livenessProbe'] = livenessProbe;
    }
    json[r'name'] = name;
    json[r'ports'] = ports;
    if (readinessProbe != null) {
      json[r'readinessProbe'] = readinessProbe;
    }
    if (resources != null) {
      json[r'resources'] = resources;
    }
    if (securityContext != null) {
      json[r'securityContext'] = securityContext;
    }
    if (startupProbe != null) {
      json[r'startupProbe'] = startupProbe;
    }
    if (stdin != null) {
      json[r'stdin'] = stdin;
    }
    if (stdinOnce != null) {
      json[r'stdinOnce'] = stdinOnce;
    }
    if (terminationMessagePath != null) {
      json[r'terminationMessagePath'] = terminationMessagePath;
    }
    if (terminationMessagePolicy != null) {
      json[r'terminationMessagePolicy'] = terminationMessagePolicy;
    }
    if (tty != null) {
      json[r'tty'] = tty;
    }
    json[r'volumeDevices'] = volumeDevices;
    json[r'volumeMounts'] = volumeMounts;
    if (workingDir != null) {
      json[r'workingDir'] = workingDir;
    }
    return json;
  }

  /// Returns a new [IoK8sApiCoreV1Container] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IoK8sApiCoreV1Container? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "IoK8sApiCoreV1Container[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "IoK8sApiCoreV1Container[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return IoK8sApiCoreV1Container(
        args: json[r'args'] is List
            ? (json[r'args'] as List).cast<String>()
            : const [],
        command: json[r'command'] is List
            ? (json[r'command'] as List).cast<String>()
            : const [],
        env: IoK8sApiCoreV1EnvVar.listFromJson(json[r'env']) ?? const [],
        envFrom: IoK8sApiCoreV1EnvFromSource.listFromJson(json[r'envFrom']) ??
            const [],
        image: mapValueOfType<String>(json, r'image'),
        imagePullPolicy: IoK8sApiCoreV1ContainerImagePullPolicyEnum.fromJson(
            json[r'imagePullPolicy']),
        lifecycle: IoK8sApiCoreV1Lifecycle.fromJson(json[r'lifecycle']),
        livenessProbe: IoK8sApiCoreV1Probe.fromJson(json[r'livenessProbe']),
        name: mapValueOfType<String>(json, r'name')!,
        ports: IoK8sApiCoreV1ContainerPort.listFromJson(json[r'ports']) ??
            const [],
        readinessProbe: IoK8sApiCoreV1Probe.fromJson(json[r'readinessProbe']),
        resources:
            IoK8sApiCoreV1ResourceRequirements.fromJson(json[r'resources']),
        securityContext:
            IoK8sApiCoreV1SecurityContext.fromJson(json[r'securityContext']),
        startupProbe: IoK8sApiCoreV1Probe.fromJson(json[r'startupProbe']),
        stdin: mapValueOfType<bool>(json, r'stdin'),
        stdinOnce: mapValueOfType<bool>(json, r'stdinOnce'),
        terminationMessagePath:
            mapValueOfType<String>(json, r'terminationMessagePath'),
        terminationMessagePolicy:
            IoK8sApiCoreV1ContainerTerminationMessagePolicyEnum.fromJson(
                json[r'terminationMessagePolicy']),
        tty: mapValueOfType<bool>(json, r'tty'),
        volumeDevices:
            IoK8sApiCoreV1VolumeDevice.listFromJson(json[r'volumeDevices']) ??
                const [],
        volumeMounts:
            IoK8sApiCoreV1VolumeMount.listFromJson(json[r'volumeMounts']) ??
                const [],
        workingDir: mapValueOfType<String>(json, r'workingDir'),
      );
    }
    return null;
  }

  static List<IoK8sApiCoreV1Container>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1Container>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1Container.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IoK8sApiCoreV1Container> mapFromJson(dynamic json) {
    final map = <String, IoK8sApiCoreV1Container>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1Container.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IoK8sApiCoreV1Container-objects as value to a dart map
  static Map<String, List<IoK8sApiCoreV1Container>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<IoK8sApiCoreV1Container>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IoK8sApiCoreV1Container.listFromJson(
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
    'name',
  };
}

/// Image pull policy. One of Always, Never, IfNotPresent. Defaults to Always if :latest tag is specified, or IfNotPresent otherwise. Cannot be updated. More info: https://kubernetes.io/docs/concepts/containers/images#updating-images  Possible enum values:  - `\"Always\"` means that kubelet always attempts to pull the latest image. Container will fail If the pull fails.  - `\"IfNotPresent\"` means that kubelet pulls if the image isn't present on disk. Container will fail if the image isn't present and the pull fails.  - `\"Never\"` means that kubelet never pulls an image, but only uses a local image. Container will fail if the image isn't present
class IoK8sApiCoreV1ContainerImagePullPolicyEnum {
  /// Instantiate a new enum with the provided [value].
  const IoK8sApiCoreV1ContainerImagePullPolicyEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const always = IoK8sApiCoreV1ContainerImagePullPolicyEnum._(r'Always');
  static const ifNotPresent =
      IoK8sApiCoreV1ContainerImagePullPolicyEnum._(r'IfNotPresent');
  static const never = IoK8sApiCoreV1ContainerImagePullPolicyEnum._(r'Never');

  /// List of all possible values in this [enum][IoK8sApiCoreV1ContainerImagePullPolicyEnum].
  static const values = <IoK8sApiCoreV1ContainerImagePullPolicyEnum>[
    always,
    ifNotPresent,
    never,
  ];

  static IoK8sApiCoreV1ContainerImagePullPolicyEnum? fromJson(dynamic value) =>
      IoK8sApiCoreV1ContainerImagePullPolicyEnumTypeTransformer().decode(value);

  static List<IoK8sApiCoreV1ContainerImagePullPolicyEnum>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1ContainerImagePullPolicyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IoK8sApiCoreV1ContainerImagePullPolicyEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoK8sApiCoreV1ContainerImagePullPolicyEnum] to String,
/// and [decode] dynamic data back to [IoK8sApiCoreV1ContainerImagePullPolicyEnum].
class IoK8sApiCoreV1ContainerImagePullPolicyEnumTypeTransformer {
  factory IoK8sApiCoreV1ContainerImagePullPolicyEnumTypeTransformer() =>
      _instance ??=
          const IoK8sApiCoreV1ContainerImagePullPolicyEnumTypeTransformer._();

  const IoK8sApiCoreV1ContainerImagePullPolicyEnumTypeTransformer._();

  String encode(IoK8sApiCoreV1ContainerImagePullPolicyEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a IoK8sApiCoreV1ContainerImagePullPolicyEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoK8sApiCoreV1ContainerImagePullPolicyEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'Always':
          return IoK8sApiCoreV1ContainerImagePullPolicyEnum.always;
        case r'IfNotPresent':
          return IoK8sApiCoreV1ContainerImagePullPolicyEnum.ifNotPresent;
        case r'Never':
          return IoK8sApiCoreV1ContainerImagePullPolicyEnum.never;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoK8sApiCoreV1ContainerImagePullPolicyEnumTypeTransformer] instance.
  static IoK8sApiCoreV1ContainerImagePullPolicyEnumTypeTransformer? _instance;
}

/// Indicate how the termination message should be populated. File will use the contents of terminationMessagePath to populate the container status message on both success and failure. FallbackToLogsOnError will use the last chunk of container log output if the termination message file is empty and the container exited with an error. The log output is limited to 2048 bytes or 80 lines, whichever is smaller. Defaults to File. Cannot be updated.  Possible enum values:  - `\"FallbackToLogsOnError\"` will read the most recent contents of the container logs for the container status message when the container exits with an error and the terminationMessagePath has no contents.  - `\"File\"` is the default behavior and will set the container status message to the contents of the container's terminationMessagePath when the container exits.
class IoK8sApiCoreV1ContainerTerminationMessagePolicyEnum {
  /// Instantiate a new enum with the provided [value].
  const IoK8sApiCoreV1ContainerTerminationMessagePolicyEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const fallbackToLogsOnError =
      IoK8sApiCoreV1ContainerTerminationMessagePolicyEnum._(
          r'FallbackToLogsOnError');
  static const file =
      IoK8sApiCoreV1ContainerTerminationMessagePolicyEnum._(r'File');

  /// List of all possible values in this [enum][IoK8sApiCoreV1ContainerTerminationMessagePolicyEnum].
  static const values = <IoK8sApiCoreV1ContainerTerminationMessagePolicyEnum>[
    fallbackToLogsOnError,
    file,
  ];

  static IoK8sApiCoreV1ContainerTerminationMessagePolicyEnum? fromJson(
          dynamic value) =>
      IoK8sApiCoreV1ContainerTerminationMessagePolicyEnumTypeTransformer()
          .decode(value);

  static List<IoK8sApiCoreV1ContainerTerminationMessagePolicyEnum>?
      listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <IoK8sApiCoreV1ContainerTerminationMessagePolicyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value =
            IoK8sApiCoreV1ContainerTerminationMessagePolicyEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IoK8sApiCoreV1ContainerTerminationMessagePolicyEnum] to String,
/// and [decode] dynamic data back to [IoK8sApiCoreV1ContainerTerminationMessagePolicyEnum].
class IoK8sApiCoreV1ContainerTerminationMessagePolicyEnumTypeTransformer {
  factory IoK8sApiCoreV1ContainerTerminationMessagePolicyEnumTypeTransformer() =>
      _instance ??=
          const IoK8sApiCoreV1ContainerTerminationMessagePolicyEnumTypeTransformer
              ._();

  const IoK8sApiCoreV1ContainerTerminationMessagePolicyEnumTypeTransformer._();

  String encode(IoK8sApiCoreV1ContainerTerminationMessagePolicyEnum data) =>
      data.value;

  /// Decodes a [dynamic value][data] to a IoK8sApiCoreV1ContainerTerminationMessagePolicyEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IoK8sApiCoreV1ContainerTerminationMessagePolicyEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'FallbackToLogsOnError':
          return IoK8sApiCoreV1ContainerTerminationMessagePolicyEnum
              .fallbackToLogsOnError;
        case r'File':
          return IoK8sApiCoreV1ContainerTerminationMessagePolicyEnum.file;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [IoK8sApiCoreV1ContainerTerminationMessagePolicyEnumTypeTransformer] instance.
  static IoK8sApiCoreV1ContainerTerminationMessagePolicyEnumTypeTransformer?
      _instance;
}
