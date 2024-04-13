import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_rbac_v1_cluster_role.dart';
import 'package:kubenav/models/resource.dart';
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/resources/details/details_item.dart';
import 'package:kubenav/widgets/resources/details/details_resources_preview.dart';
import 'package:kubenav/widgets/shared/app_prometheus_charts_widget.dart';
import 'package:kubenav/widgets/shared/app_vertical_list_simple_widget.dart';

class ClusterRoleDetailsItem extends StatelessWidget
    implements IDetailsItemWidget {
  const ClusterRoleDetailsItem({
    super.key,
    required this.item,
  });

  @override
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    final clusterRole = IoK8sApiRbacV1ClusterRole.fromJson(item);

    if (clusterRole == null) {
      return Container();
    }

    final rules = formatRules(clusterRole.rules);

    return Column(
      children: [
        AppVertialListSimpleWidget(
          title: 'Rules',
          items: rules
              .map(
                (rule) => AppVertialListSimpleModel(
                  onTap: () {
                    showSnackbar(
                      context,
                      rule.resource,
                      'Non-Resource URLs: ${rule.nonResourceURLs.isNotEmpty ? rule.nonResourceURLs.join(', ') : '-'}\nResource Names: ${rule.resourceNames.isNotEmpty ? rule.resourceNames.join(', ') : '-'}\nVerbs: ${rule.verbs.isNotEmpty ? rule.verbs.join(', ') : '-'}',
                    );
                  },
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: theme(context).primary,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(Constants.sizeBorderRadius),
                        ),
                      ),
                      height: 54,
                      width: 54,
                      padding: const EdgeInsets.all(
                        Constants.spacingIcon54x54,
                      ),
                      child: SvgPicture.asset(
                        'assets/resources/clusterroles.svg',
                      ),
                    ),
                    const SizedBox(width: Constants.spacingSmall),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Characters(rule.resource)
                                .replaceAll(
                                  Characters(''),
                                  Characters('\u{200B}'),
                                )
                                .toString(),
                            style: primaryTextStyle(
                              context,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Non-Resource URLs: ${rule.nonResourceURLs.isNotEmpty ? rule.nonResourceURLs.join(', ') : '-'}\nResource Names: ${rule.resourceNames.isNotEmpty ? rule.resourceNames.join(', ') : '-'}\nVerbs: ${rule.verbs.isNotEmpty ? rule.verbs.join(', ') : '-'}',
                            style: secondaryTextStyle(
                              context,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
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
