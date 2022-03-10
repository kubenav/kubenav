import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_rbac_v1_role.dart';
import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/pages/resources_details/widgets/details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/details_resources_preview_widget.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/widgets/app_vertical_list_simple_widget.dart';

class RoleDetailsItemWidget extends StatelessWidget
    implements IDetailsItemWidget {
  const RoleDetailsItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    final role = IoK8sApiRbacV1Role.fromJson(item);

    if (role == null) {
      return Container();
    }

    final rules = formatRules(role.rules);

    return Column(
      children: [
        AppVertialListSimpleWidget(
          title: 'Rules',
          items: rules
              .map(
                (rule) => AppVertialListSimpleModel(
                  onTap: () {
                    snackbar(
                      rule.resource,
                      'Non-Resource URLs: ${rule.nonResourceURLs.isNotEmpty ? rule.nonResourceURLs.join(', ') : '-'}\nResource Names: ${rule.resourceNames.isNotEmpty ? rule.resourceNames.join(', ') : '-'}\nVerbs: ${rule.verbs.isNotEmpty ? rule.verbs.join(', ') : '-'}',
                    );
                  },
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
                        'assets/resources/image42x42/roles.png',
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
                                    Characters(''), Characters('\u{200B}'))
                                .toString(),
                            style: primaryTextStyle(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Non-Resource URLs: ${rule.nonResourceURLs.isNotEmpty ? rule.nonResourceURLs.join(', ') : '-'}\nResource Names: ${rule.resourceNames.isNotEmpty ? rule.resourceNames.join(', ') : '-'}\nVerbs: ${rule.verbs.isNotEmpty ? rule.verbs.join(', ') : '-'}',
                            style: secondaryTextStyle(),
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
