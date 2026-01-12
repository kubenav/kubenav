import 'package:flutter/material.dart';

import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/widgets/resources/helpers/details_item.dart';

class Metadata {
  Map<String, String?>? annotations;
  DateTime? creationTimestamp;
  Map<String, String?>? labels;
  String? name;
  String? namespace;
  List<OwnerReference?>? ownerReferences;

  Metadata({
    this.annotations,
    this.creationTimestamp,
    this.labels,
    this.name,
    this.namespace,
    this.ownerReferences,
  });
}

class OwnerReference {
  String apiVersion;
  bool? blockOwnerDeletion;
  bool? controller;
  String kind;
  String name;
  String uid;

  OwnerReference({
    required this.apiVersion,
    this.blockOwnerDeletion,
    this.controller,
    required this.kind,
    required this.name,
    required this.uid,
  });
}

/// The [DetailsItemMetadata] widget is used to show the metadata of a
/// Kubernetes resource.
class DetailsItemMetadata extends StatelessWidget {
  const DetailsItemMetadata({
    super.key,
    required this.kind,
    required this.metadata,
  });

  final String? kind;
  final Metadata? metadata;

  @override
  Widget build(BuildContext context) {
    final ownerReferences = metadata?.ownerReferences
        ?.map(
          (ownerReference) =>
              '${ownerReference?.kind} (${ownerReference?.name})',
        )
        .toList();

    return DetailsItem(
      title: 'Metadata',
      details: [
        DetailsItemModel(name: 'Kind', values: kind),
        DetailsItemModel(name: 'Name', values: metadata?.name),
        DetailsItemModel(name: 'Namespace', values: metadata?.namespace),
        DetailsItemModel(
          name: 'Age',
          values: getAge(metadata?.creationTimestamp),
        ),
        DetailsItemModel(
          name: 'Labels',
          values: metadata?.labels?.entries
              .map((e) => '${e.key}: ${e.value}')
              .toList(),
        ),
        DetailsItemModel(
          name: 'Annotations',
          values: metadata?.annotations?.entries
              .map((e) => '${e.key}: ${e.value}')
              .toList(),
        ),
        DetailsItemModel(
          name: 'Owner References',
          values: ownerReferences,
          onTap: (int index) {
            goToReference(
              context,
              Reference(
                apiVersion: metadata?.ownerReferences?[index]?.apiVersion,
                kind: metadata?.ownerReferences?[index]?.kind,
                name: metadata?.ownerReferences?[index]?.name,
                uid: metadata?.ownerReferences?[index]?.uid,
              ),
              metadata?.namespace,
            );
          },
        ),
      ],
    );
  }
}
