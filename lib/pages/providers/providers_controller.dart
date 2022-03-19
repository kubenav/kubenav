import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/controllers/provider_config_controller.dart';
import 'package:kubenav/pages/providers/widgets/provider_config_actions_widget.dart';
import 'package:kubenav/utils/constants.dart';

class ProvidersController extends GetxController {
  ProviderConfigController providerConfigController = Get.find();

  void showProviderConfigActionsBottomSheet(int index) {
    Get.bottomSheet(
      BottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.sizeBorderRadius),
        ),
        onClosing: () {},
        enableDrag: false,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return ProviderConfigActionsWidget(providerConfigIndex: index);
        },
      ),
      isScrollControlled: true,
    );
  }
}
