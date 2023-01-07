import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:kubenav/models/kubernetes/io_k8s_api_core_v1_config_map.dart';
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

class ConfigMapDetailsItem extends StatelessWidget
    implements IDetailsItemWidget {
  const ConfigMapDetailsItem({
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
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Copy',
      actionPressed: () {
        Clipboard.setData(
          ClipboardData(
            text: value,
          ),
        );
        Navigator.pop(context);
      },
      actionIsLoading: false,
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
