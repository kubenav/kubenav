import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_svg/svg.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_secret.dart';
import 'package:kubenav/models/resource.dart';
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/resources/details/details_item.dart';
import 'package:kubenav/widgets/resources/details/details_resources_preview.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';
import 'package:kubenav/widgets/shared/app_prometheus_charts_widget.dart';
import 'package:kubenav/widgets/shared/app_vertical_list_simple_widget.dart';

class SecretDetailsItem extends StatelessWidget implements IDetailsItemWidget {
  const SecretDetailsItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  final dynamic item;

  Widget buildBottomSheet(
    BuildContext context,
    String key,
    String value,
  ) {
    return AppBottomSheetWidget(
      title: key,
      subtitle: 'Data',
      icon: 'assets/resources/secrets.svg',
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Copy',
      actionPressed: () {
        Clipboard.setData(
          ClipboardData(
            text: utf8.fuse(base64).decode(value),
          ),
        );
        Navigator.pop(context);
      },
      actionIsLoading: false,
      child: Form(
        key: const Key('secret/data'),
        child: ListView(
          shrinkWrap: false,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              child: Text(utf8.fuse(base64).decode(value)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final secret = IoK8sApiCoreV1Secret.fromJson(item);

    if (secret == null) {
      return Container();
    }

    return Column(
      children: [
        AppVertialListSimpleWidget(
          title: 'Data',
          items: secret.data.entries
              .map(
                (data) => AppVertialListSimpleModel(
                  onTap: () {
                    showModal(
                      context,
                      buildBottomSheet(
                        context,
                        data.key,
                        data.value,
                      ),
                    );
                  },
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: theme(context).colorPrimary,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(Constants.sizeBorderRadius),
                        ),
                      ),
                      height: 54,
                      width: 54,
                      padding: const EdgeInsets.all(
                        Constants.spacingIcon54x54,
                      ),
                      child: SvgPicture.asset('assets/resources/secrets.svg'),
                    ),
                    const SizedBox(width: Constants.spacingSmall),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.key,
                            style: primaryTextStyle(
                              context,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            data.value,
                            style: secondaryTextStyle(
                              context,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: Constants.spacingSmall),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: theme(context)
                          .colorTextSecondary
                          .withOpacity(Constants.opacityIcon),
                      size: 24,
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
