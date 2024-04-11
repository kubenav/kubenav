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

  factory Release.fromJson(
    Map<String, dynamic> data,
  ) {
    return Release(
      name: data.containsKey('name') ? data['name'] : null,
      info: data.containsKey('info') ? Info.fromJson(data['info']) : null,
      chart: data.containsKey('chart') ? Chart.fromJson(data['chart']) : null,
      config: data.containsKey('config') ? data['config'] : null,
      manifest: data.containsKey('manifest') ? data['manifest'] : null,
      version: data.containsKey('version') ? data['version'] : null,
      namespace: data.containsKey('namespace') ? data['namespace'] : null,
      labels: data.containsKey('labels') ? data['labels'] : null,
    );
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

  factory Info.fromJson(
    Map<String, dynamic> data,
  ) {
    return Info(
      firstDeployed:
          data.containsKey('first_deployed') ? data['first_deployed'] : null,
      lastDeployed:
          data.containsKey('last_deployed') ? data['last_deployed'] : null,
      deleted: data.containsKey('deleted') ? data['deleted'] : null,
      description: data.containsKey('description') ? data['description'] : null,
      status: data.containsKey('status') ? data['status'] : null,
      notes: data.containsKey('notes') ? data['notes'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_deployed': firstDeployed,
      'last_deployed': lastDeployed,
      'deleted': deleted,
      'description': description,
      'status': status,
      'notes': notes,
    };
  }
}

class Chart {
  Metadata? metadata;
  List<File>? templates;
  Map<String, dynamic>? values;

  Chart({
    required this.metadata,
    required this.templates,
    required this.values,
  });

  factory Chart.fromJson(
    Map<String, dynamic> data,
  ) {
    return Chart(
      metadata: data.containsKey('metadata')
          ? Metadata.fromJson(data['metadata'])
          : null,
      templates: data.containsKey('templates')
          ? List<File>.from(
              data['templates'].map((template) => File.fromJson(template)),
            )
          : null,
      values: data.containsKey('values') ? data['values'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'metadata': metadata?.toJson(),
      'templates': templates?.map((template) => template.toJson()).toList(),
      'values': values,
    };
  }
}

class Metadata {
  String? version;
  String? appVersion;

  Metadata({
    required this.version,
    required this.appVersion,
  });

  factory Metadata.fromJson(
    Map<String, dynamic> data,
  ) {
    return Metadata(
      version: data.containsKey('version') ? data['version'] : null,
      appVersion: data.containsKey('appVersion') ? data['appVersion'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'version': version,
      'appVersion': appVersion,
    };
  }
}

class File {
  String? name;
  String? data;

  File({
    required this.name,
    required this.data,
  });

  factory File.fromJson(
    Map<String, dynamic> data,
  ) {
    return File(
      name: data.containsKey('name') ? data['name'] : null,
      data: data.containsKey('data') ? data['data'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'data': data,
    };
  }
}
