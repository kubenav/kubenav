import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_apimachinery_pkg_apis_meta_v1_object_meta.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/widgets/resources/helpers/details_item.dart';

/// The [DetailsItemMetadata] widget is used to show the metadata of a
/// Kubernetes resource.
class DetailsItemMetadata extends StatelessWidget {
  const DetailsItemMetadata({
    super.key,
    required this.kind,
    required this.metadata,
  });

  final String? kind;
  final IoK8sApimachineryPkgApisMetaV1ObjectMeta? metadata;

  @override
  Widget build(BuildContext context) {
    final ownerReferences = metadata?.ownerReferences
        .map(
          (ownerReference) => '${ownerReference.kind} (${ownerReference.name})',
        )
        .toList();

    return DetailsItem(
      title: 'Metadata',
      details: [
        DetailsItemModel(
          name: 'Kind',
          values: kind,
        ),
        DetailsItemModel(
          name: 'Name',
          values: metadata?.name,
        ),
        DetailsItemModel(
          name: 'Namespace',
          values: metadata?.namespace,
        ),
        DetailsItemModel(
          name: 'Age',
          values: getAge(metadata?.creationTimestamp),
        ),
        DetailsItemModel(
          name: 'Labels',
          values: metadata?.labels.entries
              .map((e) => '${e.key}: ${e.value}')
              .toList(),
        ),
        DetailsItemModel(
          name: 'Annotations',
          values: metadata?.annotations.entries
              .map((e) => '${e.key}: ${e.value}')
              .toList(),
        ),
        DetailsItemModel(
          name: 'Owner References',
          values: ownerReferences,
          onTap: (int index) {
            final goToFunc = goToReference(
              context,
              metadata?.ownerReferences[index],
              metadata?.namespace,
            );

            goToFunc();
          },
        ),
      ],
    );
  }
}
