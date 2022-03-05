class ApisMetricsV1beta1NodeMetricsList {
  String? kind;
  String? apiVersion;
  ApisMetricsV1beta1NodeMetricsListMetadata? metadata;
  List<ApisMetricsV1beta1NodeMetricsItem>? items;

  ApisMetricsV1beta1NodeMetricsList({
    kind,
    apiVersion,
    metadata,
    items,
  });

  ApisMetricsV1beta1NodeMetricsList.fromJson(
    Map<String, dynamic> json,
  ) {
    kind = json['kind'];
    apiVersion = json['apiVersion'];
    metadata = json['metadata'] != null
        ? ApisMetricsV1beta1NodeMetricsListMetadata.fromJson(json['metadata'])
        : null;
    if (json['items'] != null) {
      items = <ApisMetricsV1beta1NodeMetricsItem>[];
      json['items'].forEach((v) {
        items!.add(ApisMetricsV1beta1NodeMetricsItem.fromJson(v));
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

class ApisMetricsV1beta1NodeMetricsListMetadata {
  String? selfLink;

  ApisMetricsV1beta1NodeMetricsListMetadata({
    selfLink,
  });

  ApisMetricsV1beta1NodeMetricsListMetadata.fromJson(
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

class ApisMetricsV1beta1NodeMetricsItem {
  ApisMetricsV1beta1NodeMetricsItemMetadata? metadata;
  String? timestamp;
  String? window;
  ApisMetricsV1beta1NodeMetricsItemUsage? usage;

  ApisMetricsV1beta1NodeMetricsItem({
    metadata,
    timestamp,
    window,
    usage,
  });

  ApisMetricsV1beta1NodeMetricsItem.fromJson(
    Map<String, dynamic> json,
  ) {
    metadata = json['metadata'] != null
        ? ApisMetricsV1beta1NodeMetricsItemMetadata.fromJson(json['metadata'])
        : null;
    timestamp = json['timestamp'];
    window = json['window'];
    usage = json['usage'] != null
        ? ApisMetricsV1beta1NodeMetricsItemUsage.fromJson(json['usage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (metadata != null) {
      data['metadata'] = metadata!.toJson();
    }
    data['timestamp'] = timestamp;
    data['window'] = window;
    if (usage != null) {
      data['usage'] = usage!.toJson();
    }
    return data;
  }
}

class ApisMetricsV1beta1NodeMetricsItemMetadata {
  String? name;
  String? selfLink;
  String? creationTimestamp;

  ApisMetricsV1beta1NodeMetricsItemMetadata({
    name,
    selfLink,
    creationTimestamp,
  });

  ApisMetricsV1beta1NodeMetricsItemMetadata.fromJson(
    Map<String, dynamic> json,
  ) {
    name = json['name'];
    selfLink = json['selfLink'];
    creationTimestamp = json['creationTimestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['selfLink'] = selfLink;
    data['creationTimestamp'] = creationTimestamp;
    return data;
  }
}

class ApisMetricsV1beta1NodeMetricsItemUsage {
  String? cpu;
  String? memory;

  ApisMetricsV1beta1NodeMetricsItemUsage({
    cpu,
    memory,
  });

  ApisMetricsV1beta1NodeMetricsItemUsage.fromJson(
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
