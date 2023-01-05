import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_networking_v1_network_policy.dart';
import 'package:kubenav/models/resource.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/widgets/resources/details/details_item.dart';
import 'package:kubenav/widgets/resources/details/details_resources_preview.dart';
import 'package:kubenav/widgets/shared/app_prometheus_charts_widget.dart';

class NetworkPolicyDetailsItem extends StatelessWidget
    implements IDetailsItemWidget {
  const NetworkPolicyDetailsItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    final np = IoK8sApiNetworkingV1NetworkPolicy.fromJson(item);

    if (np == null || np.spec == null) {
      return Container();
    }

    return Column(
      children: [
        DetailsItemWidget(
          title: 'Configuration',
          details: [
            DetailsItemModel(
              name: 'Pod Selector',
              values: np.spec?.podSelector.matchLabels.entries
                      .map((e) => '${e.key}=${e.value}')
                      .toList() ??
                  '-',
            ),
            DetailsItemModel(
              name: 'Policy Types',
              values: np.spec?.policyTypes ?? '-',
            ),
            DetailsItemModel(
              name: 'Egress Rules',
              values: np.spec?.egress.length,
            ),
            DetailsItemModel(
              name: 'Ingress Rules',
              values: np.spec?.ingress.length,
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreview(
          title: Resources.map['pods']!.title,
          resource: Resources.map['pods']!.resource,
          path: Resources.map['pods']!.path,
          scope: Resources.map['pods']!.scope,
          additionalPrinterColumns:
              Resources.map['pods']!.additionalPrinterColumns,
          namespace: np.metadata?.namespace,
          selector: getSelector(np.spec?.podSelector),
        ),
        const SizedBox(height: Constants.spacingMiddle),
        DetailsResourcesPreview(
          title: Resources.map['events']!.title,
          resource: Resources.map['events']!.resource,
          path: Resources.map['events']!.path,
          scope: Resources.map['events']!.scope,
          additionalPrinterColumns:
              Resources.map['events']!.additionalPrinterColumns,
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
