import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_endpoints.dart';
import 'package:kubenav/models/plugins/prometheus.dart';
import 'package:kubenav/models/resource.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/resources/details/details_item.dart';
import 'package:kubenav/widgets/resources/details/details_resources_preview.dart';
import 'package:kubenav/widgets/shared/app_prometheus_charts_widget.dart';

class EndpointDetailsItem extends StatelessWidget
    implements IDetailsItemWidget {
  const EndpointDetailsItem({
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
                  showSnackbar(
                    endpoint.subsets[i].addresses[i].ip,
                    'Hostname: ${endpoint.subsets[i].addresses[i].hostname ?? '-'}\nNode Name: ${endpoint.subsets[i].addresses[i].nodeName ?? '-'}\nTarget: ${endpoint.subsets[i].addresses[i].targetRef != null ? '${endpoint.subsets[i].addresses[i].targetRef!.kind ?? '-'}/${endpoint.subsets[i].addresses[i].targetRef!.name ?? '-'}' : '-'}',
                  );
                }),
            DetailsItemModel(
              name: 'Ports',
              values: endpoint.subsets[i].ports
                  .map((port) =>
                      '${port.port}${port.protocol != null ? '/${port.protocol}' : ''}${port.name != null ? ' (${port.name})' : ''}')
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
          defaultCharts: [
            Chart(
              title: 'Addresses',
              unit: '',
              queries: [
                Query(
                  query:
                      'kube_endpoint_address_available{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", endpoint="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}',
                  label: 'Available',
                ),
                Query(
                  query:
                      'kube_endpoint_address_not_ready{namespace="{{with .metadata}}{{with .namespace}}{{.}}{{end}}{{end}}", endpoint="{{with .metadata}}{{with .name}}{{.}}{{end}}{{end}}"}',
                  label: 'Not Ready',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
