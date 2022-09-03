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

class AddClusterAWSSSOController extends GetxController {
  ClusterController clusterController = Get.find();
  final ProviderConfig providerConfig;
  RxString error = ''.obs;
  RxBool loading = false.obs;
  RxList<AWSCluster> clusters = <AWSCluster>[].obs;
  RxList<AWSCluster> selectedClusters = <AWSCluster>[].obs;

  AddClusterAWSSSOController({
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
      if (providerConfig.awssso != null) {
        final tmpClusters = await AWSService().getClusters(
          providerConfig.awssso!.ssoCredentials.accessKeyId!,
          providerConfig.awssso!.ssoCredentials.secretAccessKey!,
          providerConfig.awssso!.region,
          providerConfig.awssso!.ssoCredentials.sessionToken!,
        );

        Logger.log(
          'AddClusterAWSSSOController getClusters',
          'Clusters were returned',
          tmpClusters,
        );
        clusters.value = tmpClusters;
      } else {
        error.value = 'Provider configuration is invalid';
      }
    } catch (err) {
      Logger.log(
        'AddClusterAWSSSOController getClusters',
        'Could not get clusters',
        err,
      );
      error.value = err.toString();
    }

    loading.value = false;
  }

  void addClusters() {
    if (providerConfig.awssso != null) {
      for (var selectedCluster in selectedClusters) {
        if (selectedCluster.name != null && selectedCluster.endpoint != null) {
          final addClusterError = clusterController.addCluster(
            Cluster(
              name:
                  'aws_${providerConfig.awssso!.region}_${selectedCluster.name}',
              provider: 'awssso',
              providerConfig: providerConfig.name,
              providerConfigInternal: selectedCluster.name ?? '',
              clusterServer: selectedCluster.endpoint ?? '',
              clusterCertificateAuthorityData:
                  selectedCluster.certificateAuthority?.data ?? '',
              userToken: providerConfig.awssso!.ssoCredentials.accessToken!,
              userTokenExpireTimestamp:
                  providerConfig.awssso!.ssoCredentials.accessTokenExpire!,
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

class AddClusterAWSSSOWidget extends StatelessWidget {
  const AddClusterAWSSSOWidget({
    Key? key,
    required this.providerConfig,
  }) : super(key: key);

  final ProviderConfig providerConfig;

  @override
  Widget build(BuildContext context) {
    AddClusterAWSSSOController controller = Get.put(
      AddClusterAWSSSOController(providerConfig: providerConfig),
    );

    return AppBottomSheetWidget(
      title: Providers.awssso.title,
      subtitle: Providers.awssso.subtitle,
      icon: Providers.awssso.image54x54,
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
                        icon: Providers.awssso.image250x140,
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
                          flex: 1,
                          child: Text(
                            controller.clusters[index].name ?? '',
                            style: noramlTextStyle(),
                            overflow: TextOverflow.ellipsis,
                          ),
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
