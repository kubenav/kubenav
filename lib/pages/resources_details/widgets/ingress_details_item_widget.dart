import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_networking_v1_ingress.dart';
import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/pages/resources_details/widgets/details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/details_resources_preview_widget.dart';
import 'package:kubenav/utils/constants.dart';

class IngressDetailsItemWidget extends StatelessWidget
    implements IDetailsItemWidget {
  const IngressDetailsItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  final dynamic item;

  List<Widget> buildRules(IoK8sApiNetworkingV1Ingress ingress) {
    if (ingress.spec == null || ingress.spec!.rules.isEmpty) {
      return [Container()];
    }

    final List<Widget> ruleWidgets = [];

    for (var i = 0; i < ingress.spec!.rules.length; i++) {
      ruleWidgets.add(
        const SizedBox(height: Constants.spacingMiddle),
      );
      ruleWidgets.add(
        DetailsItemWidget(
          title: 'Rule ${i + 1}',
          details: [
            DetailsItemModel(
              name: 'Host',
              values: ingress.spec!.rules[i].host ?? '-',
            ),
            DetailsItemModel(
              name: 'Paths',
              values: ingress.spec!.rules[i].http?.paths
                      .map((e) => e.path ?? '-')
                      .toList() ??
                  '-',
            ),
            DetailsItemModel(
              name: 'Backend',
              values: ingress.spec!.rules[i].http?.paths
                      .map((e) => e.backend.service?.name ?? '-')
                      .toList() ??
                  '-',
            ),
          ],
        ),
      );
    }

    return ruleWidgets;
  }

  @override
  Widget build(BuildContext context) {
    final ingress = IoK8sApiNetworkingV1Ingress.fromJson(item);

    if (ingress == null || ingress.spec == null) {
      return Container();
    }

    return Column(
      children: [
        DetailsItemWidget(
          title: 'Configuration',
          details: [
            DetailsItemModel(
              name: 'Default Backend',
              values: ingress.spec!.defaultBackend?.service?.name ?? '-',
            ),
            DetailsItemModel(
              name: 'Ingress Class',
              values: ingress.spec!.ingressClassName ?? '-',
            ),
            DetailsItemModel(
              name: 'Address',
              values: ingress.status?.loadBalancer?.ingress
                      .where((e) => e.ip != null)
                      .map((e) => e.ip ?? '-')
                      .toList() ??
                  '-',
            ),
          ],
        ),
        ...buildRules(ingress),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreviewWidget(
          title: Resources.map['events']!.title,
          resource: Resources.map['events']!.resource,
          path: Resources.map['events']!.path,
          scope: Resources.map['events']!.scope,
          namespace: item['metadata']['namespace'],
          selector:
              'fieldSelector=involvedObject.name=${item['metadata']['name']}',
        ),
      ],
    );
  }
}
