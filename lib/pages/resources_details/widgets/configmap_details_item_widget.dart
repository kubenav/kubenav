import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_config_map.dart';
import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/pages/resources_details/widgets/details_item_widget.dart';
import 'package:kubenav/pages/resources_details/widgets/details_resources_preview_widget.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/app_bottom_sheet_widget.dart';
import 'package:kubenav/widgets/app_prometheus_metrics_widget.dart';
import 'package:kubenav/widgets/app_vertical_list_simple_widget.dart';

class ConfigMapDetailsItemWidget extends StatelessWidget
    implements IDetailsItemWidget {
  const ConfigMapDetailsItemWidget({
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
      icon: 'assets/resources/image54x54/configmaps.png',
      onClosePressed: () {
        finish(context);
      },
      actionText: 'Copy',
      onActionPressed: () {
        Clipboard.setData(
          ClipboardData(
            text: value,
          ),
        );
        finish(context);
      },
      child: Form(
        key: const Key('configmap/data'),
        child: ListView(
          shrinkWrap: false,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              child: Text(value),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final configMap = IoK8sApiCoreV1ConfigMap.fromJson(item);

    if (configMap == null) {
      return Container();
    }

    return Column(
      children: [
        AppVertialListSimpleWidget(
          title: 'Data',
          items: configMap.data.entries
              .map(
                (data) => AppVertialListSimpleModel(
                  onTap: () {
                    Get.bottomSheet(
                      BottomSheet(
                        onClosing: () {},
                        enableDrag: false,
                        builder: (builder) {
                          return buildBottomSheet(
                              context, data.key, data.value);
                        },
                      ),
                      isScrollControlled: true,
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
                        'assets/resources/image42x42/configmaps.png',
                      ),
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
                      color: Colors.grey[300],
                      size: 24,
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
        AppPrometheusMetricsWidget(
          manifest: item,
          defaultCharts: const [],
        ),
      ],
    );
  }
}
