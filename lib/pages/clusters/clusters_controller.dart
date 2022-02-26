import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:kubenav/controllers/cluster_controller.dart';
import 'package:kubenav/models/provider_model.dart';
import 'package:kubenav/pages/clusters/widgets/add_cluster_kubeconfig_widget.dart';
import 'package:kubenav/pages/clusters/widgets/add_cluster_manual_widget.dart';
import 'package:kubenav/pages/clusters/widgets/cluster_actions_widget.dart';
import 'package:kubenav/services/kubernetes_service.dart';
import 'package:kubenav/utils/constants.dart';

class ClustersController extends GetxController {
  ClusterController clusterController = Get.find();
  List<Provider> providers = Providers.list;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Provider? getProvider(String name) {
    for (var i = 0; i < providers.length; i++) {
      if (providers[i].name == name) {
        return providers[i];
      }
    }
  }

  void showAddClusterBottomSheet(int index) {
    Get.bottomSheet(
      BottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.sizeBorderRadius),
        ),
        onClosing: () {},
        enableDrag: false,
        builder: (builder) {
          switch (providers[index].name) {
            case 'manual':
              return AddClusterManualWidget(provider: providers[index]);
            case 'kubeconfig':
              return AddClusterKubeconfigWidget(provider: providers[index]);
            default:
              return AddClusterManualWidget(provider: providers[index]);
          }
        },
      ),
      isScrollControlled: true,
    );
  }

  void showClusterActionsBottomSheet(int index) {
    Get.bottomSheet(
      BottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.sizeBorderRadius),
        ),
        onClosing: () {},
        enableDrag: false,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return ClusterActionsWidget(clusterIndex: index);
        },
      ),
      isScrollControlled: true,
    );
  }

  Future<bool> getClusterStatus(int index) async {
    try {
      await KubernetesService(cluster: clusterController.clusters[index].value)
          .getRequest('/');
      return true;
    } catch (err) {
      debugPrint('Error during getClusterStatus call: $err');
      return false;
    }
  }
}
