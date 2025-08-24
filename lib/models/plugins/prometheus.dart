import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';

class Request {
  Map<String, dynamic>? manifest;
  Map<String, dynamic>? prometheus;
  List<Query> queries;
  int timeStart;
  int timeEnd;

  Request({
    required this.manifest,
    required this.prometheus,
    required this.queries,
    required this.timeStart,
    required this.timeEnd,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (manifest != null) {
      data['manifest'] = manifest;
    }
    if (prometheus != null) {
      data['prometheus'] = prometheus;
    }
    data['queries'] = queries.map((e) => e.toJson()).toList();
    data['timeStart'] = timeStart;
    data['timeEnd'] = timeEnd;
    return data;
  }

  @override
  String toString() {
    return json.encode(toJson());
  }
}

class Query {
  String query;
  String label;

  Query({required this.query, required this.label});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['query'] = query;
    data['label'] = label;
    return data;
  }

  factory Query.fromYaml(dynamic yaml) {
    return Query(query: yaml['query'] ?? '', label: yaml['label'] ?? '');
  }

  @override
  String toString() {
    return json.encode(toJson());
  }
}

class Metric {
  String? label;
  List<Datum>? data;

  Metric({required this.label, required this.data});

  Metric.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    if (json['data'] != null) {
      final tmpData = <Datum>[];
      json['data'].forEach((datum) {
        tmpData.add(Datum.fromJson(datum));
      });
      data = tmpData;
    }
  }

  List<FlSpot> toSpots() {
    if (data == null) {
      return [];
    }

    return data!
        .map((e) => FlSpot(e.x?.toDouble() ?? 0, e.y?.toDouble() ?? 0))
        .toList();
  }
}

class Datum {
  int? x;
  num? y;

  Datum({required this.x, required this.y});

  Datum.fromJson(Map<String, dynamic> json) {
    x = json['x'];
    if (json['y'] != null) {
      y = json['y'];
    }
  }
}

class Chart {
  String title;
  String unit;
  List<Query> queries;

  Chart({required this.title, required this.unit, required this.queries});

  factory Chart.fromYaml(dynamic yaml) {
    List<Query> queries = [];
    if (yaml['queries'] != null) {
      final tmpQueries = <Query>[];
      yaml['queries'].forEach((query) {
        tmpQueries.add(Query.fromYaml(query));
      });
      queries = tmpQueries;
    }

    return Chart(
      title: yaml['title'] ?? '',
      unit: yaml['unit'] ?? '',
      queries: queries,
    );
  }
}
