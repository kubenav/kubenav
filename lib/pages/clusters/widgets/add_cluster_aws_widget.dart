import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/controllers/cluster_controller.dart';
import 'package:kubenav/models/cluster_model.dart';
import 'package:kubenav/models/provider_config_model.dart';
import 'package:kubenav/models/provider_model.dart';
import 'package:kubenav/services/aws_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/widgets/app_bottom_sheet_widget.dart';
import 'package:kubenav/widgets/app_error_widget.dart';

class AddClusterAWSController extends GetxController {
  ClusterController clusterController = Get.find();
  final ProviderConfig providerConfig;
  RxString error = ''.obs;
  RxBool loading = false.obs;
  RxList<AWSCluster> clusters = <AWSCluster>[].obs;
  RxList<AWSCluster> selectedClusters = <AWSCluster>[].obs;

  AddClusterAWSController({
    required this.providerConfig,
  });

  @override
  void onInit() {
    getClusters();
    super.onInit();
  }

  void getClusters() async {
    loading.value = true;

    try {
      if (providerConfig.aws != null) {
        final tmpClusters = await AWSService().getClusters(
          providerConfig.aws!.accessKeyID,
          providerConfig.aws!.secretKey,
          providerConfig.aws!.region,
          providerConfig.aws!.sessionToken,
        );

        Logger.log(
          'AddClusterAWSController getClusters',
          'Clusters were returned',
          tmpClusters,
        );
        clusters.value = tmpClusters;
      } else {
        error.value = 'Provider configuration is invalid';
      }
    } catch (err) {
      Logger.log(
        'AddClusterAWSController getClusters',
        'Could not get clusters',
        err,
      );
      error.value = err.toString();
    }

    loading.value = false;
  }

  void addClusters() {
    if (providerConfig.aws != null) {
      for (var selectedCluster in selectedClusters) {
        if (selectedCluster.name != null && selectedCluster.endpoint != null) {
          final addClusterError = clusterController.addCluster(
            Cluster(
              name: 'aws_${providerConfig.aws!.region}_${selectedCluster.name}',
              provider: 'aws',
              providerConfig: providerConfig.name,
              providerConfigInternal: selectedCluster.name ?? '',
              clusterServer: selectedCluster.endpoint ?? '',
              clusterCertificateAuthorityData:
                  selectedCluster.certificateAuthority?.data ?? '',
            ),
          );
          if (addClusterError != null) {
            snackbar(
              'Could not add cluster ${selectedCluster.name}',
              addClusterError,
            );
          }
        }
      }
    }
  }
}

class AddClusterAWSWidget extends StatelessWidget {
  const AddClusterAWSWidget({
    Key? key,
    required this.providerConfig,
  }) : super(key: key);

  final ProviderConfig providerConfig;

  @override
  Widget build(BuildContext context) {
    AddClusterAWSController controller = Get.put(
      AddClusterAWSController(providerConfig: providerConfig),
    );

    return AppBottomSheetWidget(
      title: Providers.aws.title,
      subtitle: Providers.aws.subtitle,
      icon: Providers.aws.image54x54,
      onClosePressed: () {
        finish(context);
      },
      actionText: 'Add Clusters',
      onActionPressed: () {
        controller.addClusters();
        finish(context);
      },
      child: Obx(
        () {
          if (controller.loading.value) {
            return Flex(
              direction: Axis.vertical,
              children: [
                Expanded(
                  child: Wrap(
                    children: const [
                      CircularProgressIndicator(color: Constants.colorPrimary),
                    ],
                  ),
                ),
              ],
            );
          }

          if (controller.error.value != '') {
            return Flex(
              direction: Axis.vertical,
              children: [
                Expanded(
                  child: Wrap(
                    children: [
                      AppErrorWidget(
                        message: 'Could not load clusters',
                        details: controller.error.value,
                        icon: Providers.aws.image250x140,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }

          return ListView(
            children: [
              ...List.generate(
                controller.clusters.length,
                (index) {
                  return Container(
                    margin: const EdgeInsets.only(
                      top: Constants.spacingSmall,
                      bottom: Constants.spacingSmall,
                      left: Constants.spacingExtraSmall,
                      right: Constants.spacingExtraSmall,
                    ),
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
                    child: Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          fillColor: MaterialStateProperty.all(
                            Constants.colorPrimary,
                          ),
                          value: controller.selectedClusters
                                  .where((c) =>
                                      c.name == controller.clusters[index].name)
                                  .toList()
                                  .length ==
                              1,
                          onChanged: (bool? value) {
                            if (value == true) {
                              controller.selectedClusters
                                  .add(controller.clusters[index]);
                            }
                            if (value == false) {
                              controller.selectedClusters.value = controller
                                  .selectedClusters
                                  .where((c) =>
                                      c.name != controller.clusters[index].name)
                                  .toList();
                            }
                          },
                        ),
                        const SizedBox(width: Constants.spacingSmall),
                        Expanded(
                          child: Text(
                            controller.clusters[index].name ?? '',
                            style: noramlTextStyle(),
                            overflow: TextOverflow.ellipsis,
                          ),
                          flex: 1,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
