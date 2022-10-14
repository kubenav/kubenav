class Release {
  String? name;
  Info? info;
  Chart? chart;
  Map<String, dynamic>? config;
  String? manifest;
  int? version;
  String? namespace;
  Map<String, String>? labels;

  Release({
    required this.name,
    required this.info,
    required this.chart,
    required this.config,
    required this.manifest,
    required this.version,
    required this.namespace,
    required this.labels,
  });

  Release.fromJson(
    Map<String, dynamic> json,
  ) {
    name = json['name'];
    info = json['info'] != null ? Info.fromJson(json['info']) : null;
    chart = json['chart'] != null ? Chart.fromJson(json['chart']) : null;
    config = json['config'];
    manifest = json['manifest'];
    version = json['version'];
    namespace = json['namespace'];
    labels = json['labels'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (info != null) {
      data['info'] = info!.toJson();
    }
    if (chart != null) {
      data['chart'] = chart!.toJson();
    }
    data['config'] = config;
    data['manifest'] = manifest;
    data['version'] = version;
    data['namespace'] = namespace;
    data['labels'] = labels;
    return data;
  }
}

class Info {
  String? firstDeployed;
  String? lastDeployed;
  String? deleted;
  String? description;
  String? status;
  String? notes;

  Info({
    required this.firstDeployed,
    required this.lastDeployed,
    required this.deleted,
    required this.description,
    required this.status,
    required this.notes,
  });

  Info.fromJson(
    Map<String, dynamic> json,
  ) {
    firstDeployed = json['first_deployed'];
    lastDeployed = json['last_deployed'];
    deleted = json['deleted'];
    description = json['description'];
    status = json['status'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_deployed'] = firstDeployed;
    data['last_deployed'] = lastDeployed;
    data['deleted'] = deleted;
    data['description'] = description;
    data['status'] = status;
    data['notes'] = notes;
    return data;
  }
}

class Chart {
  Metadata? metadata;
  List<File>? templates;
  Map<String, dynamic>? values;

  Chart({
    required this.templates,
    required this.values,
  });

  Chart.fromJson(
    Map<String, dynamic> json,
  ) {
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['templates'] != null) {
      final tmpTemplates = <File>[];
      json['templates'].forEach((template) {
        tmpTemplates.add(File.fromJson(template));
      });
      templates = tmpTemplates;
    }
    values = json['values'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (metadata != null) {
      data['metadata'] = metadata!.toJson();
    }
    if (templates != null) {
      data['templates'] =
          templates!.map((template) => template.toJson()).toList();
    }
    data['values'] = values;
    return data;
  }
}

class Metadata {
  String? version;
  String? appVersion;

  Metadata({
    required this.version,
    required this.appVersion,
  });

  Metadata.fromJson(
    Map<String, dynamic> json,
  ) {
    version = json['version'];
    appVersion = json['appVersion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['version'] = version;
    data['appVersion'] = appVersion;
    return data;
  }
}

class File {
  String? name;
  String? data;

  File({
    required this.name,
    required this.data,
  });

  File.fromJson(
    Map<String, dynamic> json,
  ) {
    name = json['name'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = <String, dynamic>{};
    jsonData['name'] = name;
    jsonData['data'] = data;
    return jsonData;
  }
}
