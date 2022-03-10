import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_networking_v1_network_policy.dart';
import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/pages/resources_details/widgets/details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/details_resources_preview_widget.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/resources/general.dart';

class NetworkPolicyDetailsItemWidget extends StatelessWidget
    implements IDetailsItemWidget {
  const NetworkPolicyDetailsItemWidget({
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
        DetailsResourcesPreviewWidget(
          title: Resources.map['pods']!.title,
          resource: Resources.map['pods']!.resource,
          path: Resources.map['pods']!.path,
          scope: Resources.map['pods']!.scope,
          namespace: np.metadata?.namespace,
          selector: getSelector(np.spec?.podSelector),
        ),
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
