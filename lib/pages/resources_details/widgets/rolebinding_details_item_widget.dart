import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_rbac_v1_role_binding.dart';
import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/pages/resources_details/widgets/details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/details_resources_preview_widget.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/app_prometheus_charts_widget.dart';
import 'package:kubenav/widgets/app_vertical_list_simple_widget.dart';

class RoleBindingDetailsItemWidget extends StatelessWidget
    implements IDetailsItemWidget {
  const RoleBindingDetailsItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    final roleBinding = IoK8sApiRbacV1RoleBinding.fromJson(item);

    if (roleBinding == null) {
      return Container();
    }

    return Column(
      children: [
        DetailsItemWidget(
          title: 'Configuration',
          details: [
            DetailsItemModel(
              name: 'Role',
              values: '${roleBinding.roleRef.kind}/${roleBinding.roleRef.name}',
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        AppVertialListSimpleWidget(
          title: 'Subjects',
          items: roleBinding.subjects
              .map(
                (subject) => AppVertialListSimpleModel(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Constants.colorPrimary,
                        borderRadius: BorderRadius.all(
                          Radius.circular(Constants.sizeBorderRadius),
                        ),
                      ),
                      height: 54,
                      width: 54,
                      child: Image.asset(
                        'assets/resources/image42x42/rolebindings.png',
                      ),
                    ),
                    const SizedBox(width: Constants.spacingSmall),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            subject.kind,
                            style: primaryTextStyle(
                              context,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '${subject.namespace ?? '-'}/${subject.name}',
                            style: secondaryTextStyle(
                              context,
                            ),
                            maxLines: 2,
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
        DetailsResourcesPreviewWidget(
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
