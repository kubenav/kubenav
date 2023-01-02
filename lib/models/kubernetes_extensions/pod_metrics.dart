class ApisMetricsV1beta1PodMetricsList {
  String? kind;
  String? apiVersion;
  ApisMetricsV1beta1PodMetricsListMetadata? metadata;
  List<ApisMetricsV1beta1PodMetricsItem>? items;

  ApisMetricsV1beta1PodMetricsList({
    required this.kind,
    required this.apiVersion,
    required this.metadata,
    required this.items,
  });

  factory ApisMetricsV1beta1PodMetricsList.fromJson(
    Map<String, dynamic> data,
  ) {
    return ApisMetricsV1beta1PodMetricsList(
      kind: data.containsKey('kind') ? data['kind'] : null,
      apiVersion: data.containsKey('apiVersion') ? data['apiVersion'] : null,
      metadata: data.containsKey('metadata') && data['metadata'] != null
          ? ApisMetricsV1beta1PodMetricsListMetadata.fromJson(data['metadata'])
          : null,
      items: data.containsKey('items') && data['items'] != null
          ? List<ApisMetricsV1beta1PodMetricsItem>.from(data['items']
              .map((v) => ApisMetricsV1beta1PodMetricsItem.fromJson(v)))
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

class ApisMetricsV1beta1PodMetricsListMetadata {
  String? selfLink;

  ApisMetricsV1beta1PodMetricsListMetadata({
    required this.selfLink,
  });

  factory ApisMetricsV1beta1PodMetricsListMetadata.fromJson(
    Map<String, dynamic> data,
  ) {
    return ApisMetricsV1beta1PodMetricsListMetadata(
      selfLink: data.containsKey('selfLink') ? data['selfLink'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'selfLink': selfLink,
    };
  }
}

class ApisMetricsV1beta1PodMetricsItem {
  ApisMetricsV1beta1PodMetricsItemMetadata? metadata;
  String? timestamp;
  String? window;
  List<ApisMetricsV1beta1PodMetricsItemContainer>? containers;

  ApisMetricsV1beta1PodMetricsItem({
    required this.metadata,
    required this.timestamp,
    required this.window,
    required this.containers,
  });

  factory ApisMetricsV1beta1PodMetricsItem.fromJson(
    Map<String, dynamic> data,
  ) {
    return ApisMetricsV1beta1PodMetricsItem(
      metadata: data.containsKey('metadata') && data['metadata'] != null
          ? ApisMetricsV1beta1PodMetricsItemMetadata.fromJson(data['metadata'])
          : null,
      timestamp: data.containsKey('timestamp') ? data['timestamp'] : null,
      window: data.containsKey('window') ? data['window'] : null,
      containers: data.containsKey('containers') && data['containers'] != null
          ? List<ApisMetricsV1beta1PodMetricsItemContainer>.from(
              data['containers'].map(
                  (v) => ApisMetricsV1beta1PodMetricsItemContainer.fromJson(v)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'metadata': metadata?.toJson(),
      'timestamp': timestamp,
      'window': window,
      'containers': containers!.map((v) => v.toJson()).toList(),
    };
  }
}

class ApisMetricsV1beta1PodMetricsItemMetadata {
  String? name;
  String? namespace;
  String? selfLink;
  String? creationTimestamp;

  ApisMetricsV1beta1PodMetricsItemMetadata({
    required this.name,
    required this.namespace,
    required this.selfLink,
    required this.creationTimestamp,
  });

  factory ApisMetricsV1beta1PodMetricsItemMetadata.fromJson(
    Map<String, dynamic> data,
  ) {
    return ApisMetricsV1beta1PodMetricsItemMetadata(
      name: data.containsKey('name') ? data['name'] : null,
      namespace: data.containsKey('namespace') ? data['namespace'] : null,
      selfLink: data.containsKey('selfLink') ? data['selfLink'] : null,
      creationTimestamp: data.containsKey('creationTimestamp')
          ? data['creationTimestamp']
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'namespace': namespace,
      'selfLink': selfLink,
      'creationTimestamp': creationTimestamp,
    };
  }
}

class ApisMetricsV1beta1PodMetricsItemContainer {
  String? name;
  ApisMetricsV1beta1PodMetricsItemContainerUsage? usage;

  ApisMetricsV1beta1PodMetricsItemContainer({
    required this.name,
    required this.usage,
  });

  factory ApisMetricsV1beta1PodMetricsItemContainer.fromJson(
    Map<String, dynamic> data,
  ) {
    return ApisMetricsV1beta1PodMetricsItemContainer(
      name: data.containsKey('name') ? data['name'] : null,
      usage: data.containsKey('usage') && data['usage'] != null
          ? ApisMetricsV1beta1PodMetricsItemContainerUsage.fromJson(
              data['usage'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'usage': usage?.toJson(),
    };
  }
}

class ApisMetricsV1beta1PodMetricsItemContainerUsage {
  String? cpu;
  String? memory;

  ApisMetricsV1beta1PodMetricsItemContainerUsage({
    required this.cpu,
    required this.memory,
  });

  factory ApisMetricsV1beta1PodMetricsItemContainerUsage.fromJson(
    Map<String, dynamic> data,
  ) {
    return ApisMetricsV1beta1PodMetricsItemContainerUsage(
      cpu: data.containsKey('cpu') ? data['cpu'] : null,
      memory: data.containsKey('memory') ? data['memory'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cpu': cpu,
      'memory': memory,
    };
  }
}
