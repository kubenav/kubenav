import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_networking_v1_ingress.dart';
import 'package:kubenav/models/resource.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/widgets/resources/details/details_item.dart';
import 'package:kubenav/widgets/resources/details/details_resources_preview.dart';
import 'package:kubenav/widgets/shared/app_prometheus_charts_widget.dart';

class IngressDetailsItem extends StatelessWidget implements IDetailsItemWidget {
  const IngressDetailsItem({
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
        DetailsResourcesPreview(
          title: Resources.map['events']!.title,
          resource: Resources.map['events']!.resource,
          path: Resources.map['events']!.path,
          scope: Resources.map['events']!.scope,
          namespace: item['metadata']['namespace'],
          selector:
              'fieldSelector=involvedObject.name=${item['metadata']['name']}',
        ),
        const SizedBox(height: Constants.spacingMiddle),
        AppPrometheusChartsWidget(
          manifest: item,
          defaultCharts: const [],
        ),
      ],
    );
  }
}
