import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/api.dart'
    show IoK8sApiCoreV1Endpoints;
import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/pages/resources_details/widgets/details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/details_resources_preview_widget.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';

class EndpointDetailsItemWidget extends StatelessWidget
    implements IDetailsItemWidget {
  const EndpointDetailsItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  final dynamic item;

  List<Widget> buildSubsets(IoK8sApiCoreV1Endpoints endpoint) {
    final List<Widget> ruleWidgets = [];

    for (var i = 0; i < endpoint.subsets.length; i++) {
      ruleWidgets.add(
        DetailsItemWidget(
          title: 'Subset ${i + 1}',
          details: [
            DetailsItemModel(
                name: 'Addresses',
                values: endpoint.subsets[i].addresses
                    .map((address) =>
                        '${address.ip}${address.hostname != null ? ' (${address.hostname})' : ''}')
                    .toList(),
                onTap: (index) {
                  snackbar(endpoint.subsets[i].addresses[i].ip,
                      'Hostname: ${endpoint.subsets[i].addresses[i].hostname ?? '-'}\nNode Name: ${endpoint.subsets[i].addresses[i].nodeName ?? '-'}\nTarget: ${endpoint.subsets[i].addresses[i].targetRef != null ? '${endpoint.subsets[i].addresses[i].targetRef!.kind ?? '-'}/${endpoint.subsets[i].addresses[i].targetRef!.name ?? '-'}' : '-'}');
                }),
            DetailsItemModel(
              name: 'Ports',
              values: endpoint.subsets[i].ports
                  .map((port) =>
                      '${port.port}${port.protocol != null ? '/${port.protocol!.value}' : ''}${port.name != null ? ' (${port.name})' : ''}')
                  .toList(),
            ),
          ],
        ),
      );
      ruleWidgets.add(
        const SizedBox(height: Constants.spacingMiddle),
      );
    }

    return ruleWidgets;
  }

  @override
  Widget build(BuildContext context) {
    final endpoint = IoK8sApiCoreV1Endpoints.fromJson(item);

    if (endpoint == null) {
      return Container();
    }

    return Column(
      children: [
        ...buildSubsets(endpoint),
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
