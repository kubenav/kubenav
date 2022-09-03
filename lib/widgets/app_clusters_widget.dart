import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/controllers/cluster_controller.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/custom_icons.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/app_bottom_sheet_widget.dart';

class AppClustersController extends GetxController {
  ClusterController clusterController = Get.find();
}

/// [AppClustersWidget] is a widget which can be used to switch the active Kubernetes cluster. It should be used within
/// a bootom sheet as follows:
///
/// ```
/// Get.bottomSheet(
///   BottomSheet(
///     shape: RoundedRectangleBorder(
///       borderRadius: BorderRadius.circular(Constants.sizeBorderRadius),
///     ),
///     onClosing: () {},
///     enableDrag: false,
///     builder: (builder) {
///       return const AppClustersWidget();
///     },
///   ),
///   isScrollControlled: true,
/// );
/// ```
class AppClustersWidget extends StatelessWidget {
  const AppClustersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppClustersController controller = Get.put(
      AppClustersController(),
    );

    return AppBottomSheetWidget(
      title: 'Clusters',
      subtitle: 'Select the active cluster',
      icon: CustomIcons.clusters,
      onClosePressed: () {
        finish(context);
      },
      actionText: 'Close',
      onActionPressed: () {
        finish(context);
      },
      child: ListView(
        children: List.generate(
          controller.clusterController.clusters.length,
          (index) => Container(
            margin: const EdgeInsets.only(
              top: Constants.spacingSmall,
              bottom: Constants.spacingSmall,
              left: Constants.spacingExtraSmall,
              right: Constants.spacingExtraSmall,
            ),
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Constants.shadowColorGlobal,
                  blurRadius: Constants.sizeBorderBlurRadius,
                  spreadRadius: Constants.sizeBorderSpreadRadius,
                  offset: const Offset(0.0, 0.0),
                ),
              ],
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(Constants.sizeBorderRadius),
              ),
            ),
            child: InkWell(
              onTap: () {
                controller.clusterController.setActiveCluster(index);
                finish(context);
              },
              child: Row(
                children: [
                  Icon(
                    index ==
                            controller
                                .clusterController.activeClusterIndex.value
                        ? Icons.radio_button_checked
                        : Icons.radio_button_unchecked,
                    size: 24,
                    color: Constants.colorPrimary,
                  ),
                  const SizedBox(width: Constants.spacingSmall),
                  Expanded(
                    flex: 1,
                    child: Text(
                      controller.clusterController.clusters[index].value.name,
                      style: noramlTextStyle(),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
