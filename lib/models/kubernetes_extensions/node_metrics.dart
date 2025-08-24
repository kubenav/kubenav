class ApisMetricsV1beta1NodeMetricsList {
  String? kind;
  String? apiVersion;
  ApisMetricsV1beta1NodeMetricsListMetadata? metadata;
  List<ApisMetricsV1beta1NodeMetricsItem>? items;

  ApisMetricsV1beta1NodeMetricsList({
    required this.kind,
    required this.apiVersion,
    required this.metadata,
    required this.items,
  });

  factory ApisMetricsV1beta1NodeMetricsList.fromJson(
    Map<String, dynamic> data,
  ) {
    return ApisMetricsV1beta1NodeMetricsList(
      kind: data.containsKey('kind') ? data['kind'] : null,
      apiVersion: data.containsKey('apiVersion') ? data['apiVersion'] : null,
      metadata: data.containsKey('metadata') && data['metadata'] != null
          ? ApisMetricsV1beta1NodeMetricsListMetadata.fromJson(data['metadata'])
          : null,
      items: data.containsKey('items') && data['items'] != null
          ? List<ApisMetricsV1beta1NodeMetricsItem>.from(
              data['items'].map(
                (v) => ApisMetricsV1beta1NodeMetricsItem.fromJson(v),
              ),
            )
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'kind': kind,
      'apiVersion': apiVersion,
      'metadata': metadata?.toJson(),
      'items': items?.map((v) => v.toJson()).toList(),
    };
  }
}

class ApisMetricsV1beta1NodeMetricsListMetadata {
  String? selfLink;

  ApisMetricsV1beta1NodeMetricsListMetadata({required this.selfLink});

  factory ApisMetricsV1beta1NodeMetricsListMetadata.fromJson(
    Map<String, dynamic> data,
  ) {
    return ApisMetricsV1beta1NodeMetricsListMetadata(
      selfLink: data.containsKey('selfLink') ? data['selfLink'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'selfLink': selfLink};
  }
}

class ApisMetricsV1beta1NodeMetricsItem {
  ApisMetricsV1beta1NodeMetricsItemMetadata? metadata;
  String? timestamp;
  String? window;
  ApisMetricsV1beta1NodeMetricsItemUsage? usage;

  ApisMetricsV1beta1NodeMetricsItem({
    required this.metadata,
    required this.timestamp,
    required this.window,
    required this.usage,
  });

  factory ApisMetricsV1beta1NodeMetricsItem.fromJson(
    Map<String, dynamic> data,
  ) {
    return ApisMetricsV1beta1NodeMetricsItem(
      metadata: data.containsKey('metadata') && data['metadata'] != null
          ? ApisMetricsV1beta1NodeMetricsItemMetadata.fromJson(data['metadata'])
          : null,
      timestamp: data.containsKey('timestamp') ? data['timestamp'] : null,
      window: data.containsKey('window') ? data['window'] : null,
      usage: data.containsKey('usage') && data['usage'] != null
          ? ApisMetricsV1beta1NodeMetricsItemUsage.fromJson(data['usage'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'metadata': metadata?.toJson(),
      'timestamp': timestamp,
      'window': window,
      'usage': usage?.toJson(),
    };
  }
}

class ApisMetricsV1beta1NodeMetricsItemMetadata {
  String? name;
  String? selfLink;
  String? creationTimestamp;

  ApisMetricsV1beta1NodeMetricsItemMetadata({
    required this.name,
    required this.selfLink,
    required this.creationTimestamp,
  });

  factory ApisMetricsV1beta1NodeMetricsItemMetadata.fromJson(
    Map<String, dynamic> data,
  ) {
    return ApisMetricsV1beta1NodeMetricsItemMetadata(
      name: data.containsKey('name') ? data['name'] : null,
      selfLink: data.containsKey('selfLink') ? data['selfLink'] : null,
      creationTimestamp: data.containsKey('creationTimestamp')
          ? data['creationTimestamp']
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'selfLink': selfLink,
      'creationTimestamp': creationTimestamp,
    };
  }
}

class ApisMetricsV1beta1NodeMetricsItemUsage {
  String? cpu;
  String? memory;

  ApisMetricsV1beta1NodeMetricsItemUsage({
    required this.cpu,
    required this.memory,
  });

  factory ApisMetricsV1beta1NodeMetricsItemUsage.fromJson(
    Map<String, dynamic> data,
  ) {
    return ApisMetricsV1beta1NodeMetricsItemUsage(
      cpu: data.containsKey('cpu') ? data['cpu'] : null,
      memory: data.containsKey('memory') ? data['memory'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'cpu': cpu, 'memory': memory};
  }
}
