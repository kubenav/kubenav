import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kubenav/models/cluster_model.dart';
import 'package:kubenav/models/provider_model.dart';
import 'package:kubenav/services/cluster_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';

class ClusterItemController extends GetxController {
  Cluster cluster;
  RxBool statusOk = false.obs;

  ClusterItemController({required this.cluster});

  @override
  void onInit() {
    getClusterStatus();
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

  // getClusterStatus makes an request against the Kubernetes api of the given cluster. If the request returns a status
  // code >= 200 and < 300 we set the 'statusOk' variable to 'true'. If the request fails with another status code, we set
  // the 'statusOk' variable to 'false'.
  void getClusterStatus() async {
    try {
      await ClusterService(cluster: cluster).checkHealth();
      debugPrint('getClusterStatus success');
      statusOk.value = true;
    } catch (err) {
      debugPrint('getClusterStatus error: $err');
      statusOk.value = false;
    }
  }
}

class ClusterItemWidget extends StatelessWidget {
  const ClusterItemWidget({
    Key? key,
    required this.cluster,
    required this.isActiveCluster,
    this.provider,
    this.onTap,
    this.onDoubleTap,
  }) : super(key: key);

  final Cluster cluster;
  final bool isActiveCluster;
  final Provider? provider;
  final void Function()? onTap;
  final void Function()? onDoubleTap;

  @override
  Widget build(BuildContext context) {
    ClusterItemController controller = Get.put(
      ClusterItemController(cluster: cluster),
      tag: cluster.name,
    );

    return Obx(
      () {
        return Container(
          margin: const EdgeInsets.only(
            bottom: Constants.spacingMiddle,
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
            onTap: onTap,
            onDoubleTap: onDoubleTap,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cluster.name,
                          style: primaryTextStyle(),
                        ),
                        Text(
                          provider != null ? provider!.title : '-',
                          style: secondaryTextStyle(),
                        ),
                      ],
                    ),
                    Icon(
                      isActiveCluster
                          ? Icons.radio_button_checked
                          : Icons.radio_button_unchecked,
                      size: 24,
                      color: controller.statusOk.value
                          ? Constants.colorSuccess
                          : Constants.colorDanger,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
