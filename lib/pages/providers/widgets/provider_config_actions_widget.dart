import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/controllers/cluster_controller.dart';
import 'package:kubenav/controllers/provider_config_controller.dart';
import 'package:kubenav/pages/providers/widgets/aws_provider_config_widget.dart';
import 'package:kubenav/pages/providers/widgets/awssso_provider_config_widget.dart';
import 'package:kubenav/pages/providers/widgets/azure_provider_config_widget.dart';
import 'package:kubenav/pages/providers/widgets/digitalocean_provider_config_widget.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/app_actions_widget.dart';

class ProviderConfigActionsController extends GetxController {
  ClusterController clusterController = Get.find();
  ProviderConfigController providerConfigController = Get.find();
  final int providerConfigIndex;

  ProviderConfigActionsController({
    required this.providerConfigIndex,
  });

  void delete() {
    final providerConfig =
        providerConfigController.configs[providerConfigIndex].value;

    var providerConfigIsUsed = false;
    for (var cluster in clusterController.clusters) {
      if (cluster.value.providerConfig == providerConfig.name) {
        providerConfigIsUsed = true;
      }
    }

    if (providerConfigIsUsed) {
      snackbar(
        'Could not delete provider configuration',
        'The provider configuration ${providerConfig.name} is still used by a cluster',
      );
    } else {
      providerConfigController.deleteConfig(providerConfigIndex);
      snackbar(
        'Provider configuration was deleted',
        'The provider configuration ${providerConfig.name} was deleted',
      );
    }
  }

  void edit() {
    final providerConfig =
        providerConfigController.configs[providerConfigIndex].value;

    Get.bottomSheet(
      BottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.sizeBorderRadius),
        ),
        onClosing: () {},
        enableDrag: false,
        builder: (builder) {
          switch (providerConfig.provider) {
            case 'aws':
              return AWSProviderConfigWidget(
                providerConfigIndex: providerConfigIndex,
              );
            case 'awssso':
              return AWSSSOProviderConfigWidget(
                providerConfigIndex: providerConfigIndex,
              );
            case 'azure':
              return AzureProviderConfigWidget(
                providerConfigIndex: providerConfigIndex,
              );
            case 'digitalocean':
              return DigitalOceanProviderConfigWidget(
                providerConfigIndex: providerConfigIndex,
              );
            default:
              return Container();
          }
        },
      ),
      isScrollControlled: true,
    );
  }
}

class ProviderConfigActionsWidget extends StatelessWidget {
  const ProviderConfigActionsWidget({
    Key? key,
    required this.providerConfigIndex,
  }) : super(key: key);

  final int providerConfigIndex;

  @override
  Widget build(BuildContext context) {
    ProviderConfigActionsController controller = Get.put(
      ProviderConfigActionsController(
        providerConfigIndex: providerConfigIndex,
      ),
    );

    return AppActionsWidget(
      actions: [
        AppActionsWidgetAction(
          title: 'Edit',
          onTap: () {
            finish(context);
            controller.edit();
          },
        ),
        AppActionsWidgetAction(
          title: 'Delete',
          color: Constants.colorDanger,
          onTap: () {
            controller.delete();
            finish(context);
          },
        ),
      ],
    );
  }
}
