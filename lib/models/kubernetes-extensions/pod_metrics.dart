class ApisMetricsV1beta1PodMetricsList {
  String? kind;
  String? apiVersion;
  ApisMetricsV1beta1PodMetricsListMetadata? metadata;
  List<ApisMetricsV1beta1PodMetricsItem>? items;

  ApisMetricsV1beta1PodMetricsList({
    kind,
    apiVersion,
    metadata,
    items,
  });

  ApisMetricsV1beta1PodMetricsList.fromJson(
    Map<String, dynamic> json,
  ) {
    kind = json['kind'];
    apiVersion = json['apiVersion'];
    metadata = json['metadata'] != null
        ? ApisMetricsV1beta1PodMetricsListMetadata.fromJson(json['metadata'])
        : null;
    if (json['items'] != null) {
      items = <ApisMetricsV1beta1PodMetricsItem>[];
      json['items'].forEach((v) {
        items!.add(ApisMetricsV1beta1PodMetricsItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kind'] = kind;
    data['apiVersion'] = apiVersion;
    if (metadata != null) {
      data['metadata'] = metadata!.toJson();
    }
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ApisMetricsV1beta1PodMetricsListMetadata {
  String? selfLink;

  ApisMetricsV1beta1PodMetricsListMetadata({
    selfLink,
  });

  ApisMetricsV1beta1PodMetricsListMetadata.fromJson(
    Map<String, dynamic> json,
  ) {
    selfLink = json['selfLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['selfLink'] = selfLink;
    return data;
  }
}

class ApisMetricsV1beta1PodMetricsItem {
  ApisMetricsV1beta1PodMetricsItemMetadata? metadata;
  String? timestamp;
  String? window;
  List<ApisMetricsV1beta1PodMetricsItemContainer>? containers;

  ApisMetricsV1beta1PodMetricsItem({
    metadata,
    timestamp,
    window,
    containers,
  });

  ApisMetricsV1beta1PodMetricsItem.fromJson(
    Map<String, dynamic> json,
  ) {
    metadata = json['metadata'] != null
        ? ApisMetricsV1beta1PodMetricsItemMetadata.fromJson(json['metadata'])
        : null;
    timestamp = json['timestamp'];
    window = json['window'];
    if (json['containers'] != null) {
      containers = <ApisMetricsV1beta1PodMetricsItemContainer>[];
      json['containers'].forEach((v) {
        containers!.add(ApisMetricsV1beta1PodMetricsItemContainer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (metadata != null) {
      data['metadata'] = metadata!.toJson();
    }
    data['timestamp'] = timestamp;
    data['window'] = window;
    if (containers != null) {
      data['containers'] = containers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ApisMetricsV1beta1PodMetricsItemMetadata {
  String? name;
  String? namespace;
  String? selfLink;
  String? creationTimestamp;

  ApisMetricsV1beta1PodMetricsItemMetadata({
    name,
    namespace,
    selfLink,
    creationTimestamp,
  });

  ApisMetricsV1beta1PodMetricsItemMetadata.fromJson(
    Map<String, dynamic> json,
  ) {
    name = json['name'];
    namespace = json['namespace'];
    selfLink = json['selfLink'];
    creationTimestamp = json['creationTimestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['namespace'] = namespace;
    data['selfLink'] = selfLink;
    data['creationTimestamp'] = creationTimestamp;
    return data;
  }
}

class ApisMetricsV1beta1PodMetricsItemContainer {
  String? name;
  ApisMetricsV1beta1PodMetricsItemContainerUsage? usage;

  ApisMetricsV1beta1PodMetricsItemContainer({
    name,
    usage,
  });

  ApisMetricsV1beta1PodMetricsItemContainer.fromJson(
    Map<String, dynamic> json,
  ) {
    name = json['name'];
    usage = json['usage'] != null
        ? ApisMetricsV1beta1PodMetricsItemContainerUsage.fromJson(json['usage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (usage != null) {
      data['usage'] = usage!.toJson();
    }
    return data;
  }
}

class ApisMetricsV1beta1PodMetricsItemContainerUsage {
  String? cpu;
  String? memory;

  ApisMetricsV1beta1PodMetricsItemContainerUsage({
    cpu,
    memory,
  });

  ApisMetricsV1beta1PodMetricsItemContainerUsage.fromJson(
    Map<String, dynamic> json,
  ) {
    cpu = json['cpu'];
    memory = json['memory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cpu'] = cpu;
    data['memory'] = memory;
    return data;
  }
}
