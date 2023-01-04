import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_apimachinery_pkg_apis_meta_v1_object_meta.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/widgets/resources/details/details_item.dart';

class DetailsItemMetadata extends StatelessWidget {
  const DetailsItemMetadata({
    Key? key,
    required this.item,
  }) : super(key: key);

  final dynamic item;

  @override
  Widget build(BuildContext context) {
    final metadata =
        IoK8sApimachineryPkgApisMetaV1ObjectMeta.fromJson(item['metadata']);

    List<DetailsItemModel> detailsItems = [];
    if (metadata != null) {
      if (metadata.name != null) {
        detailsItems.add(DetailsItemModel(
          name: 'Name',
          values: metadata.name!,
        ));
      }

      if (metadata.namespace != null) {
        detailsItems.add(DetailsItemModel(
          name: 'Namespace',
          values: metadata.namespace!,
        ));
      }

      detailsItems.add(DetailsItemModel(
        name: 'Age',
        values: getAge(metadata.creationTimestamp),
      ));

      List<String> labelValues = [];
      metadata.labels.forEach((key, value) => labelValues.add('$key: $value'));
      if (labelValues.isNotEmpty) {
        detailsItems.add(DetailsItemModel(
          name: 'Labels',
          values: labelValues,
        ));
      }

      List<String> annotationValues = [];
      metadata.annotations
          .forEach((key, value) => annotationValues.add('$key: $value'));
      if (annotationValues.isNotEmpty) {
        detailsItems.add(DetailsItemModel(
          name: 'Annotations',
          values: annotationValues,
        ));
      }

      final ownerReferences = metadata.ownerReferences
          .map((ownerReference) =>
              '${ownerReference.kind} (${ownerReference.name})')
          .toList();
      if (ownerReferences.isNotEmpty) {
        detailsItems.add(DetailsItemModel(
          name: 'Controlled by',
          values: ownerReferences,
        ));
      }
    }

    return DetailsItemWidget(
      title: 'Metadata',
      details: detailsItems,
    );
  }
}
