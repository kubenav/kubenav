import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/controllers/provider_config_controller.dart';
import 'package:kubenav/models/provider_config_model.dart';
import 'package:kubenav/models/provider_model.dart';
import 'package:kubenav/pages/clusters/widgets/add_cluster_azure_widget.dart';
import 'package:kubenav/pages/clusters/widgets/add_cluster_digitalocean_widget.dart';
import 'package:kubenav/pages/clusters/widgets/add_cluster_kubeconfig_widget.dart';
import 'package:kubenav/pages/clusters/widgets/add_cluster_manual_widget.dart';
import 'package:kubenav/pages/providers/widgets/aws_provider_config_widget.dart';
import 'package:kubenav/pages/providers/widgets/azure_provider_config_widget.dart';
import 'package:kubenav/pages/providers/widgets/digitalocean_provider_config_widget.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/app_actions_widget.dart';

class ReuseProviderConfigActionsController extends GetxController {
  ProviderConfigController providerConfigController = Get.find();
  final String provider;

  ReuseProviderConfigActionsController({
    required this.provider,
  });

  void useExisting(ProviderConfig providerConfig) {
    Get.bottomSheet(
      BottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.sizeBorderRadius),
        ),
        onClosing: () {},
        enableDrag: false,
        builder: (builder) {
          switch (provider) {
            case 'manual':
              return AddClusterManualWidget(
                provider: Providers.manual,
              );
            case 'kubeconfig':
              return AddClusterKubeconfigWidget(
                provider: Providers.kubeconfig,
              );
            case 'azure':
              return AddClusterAzureWidget(
                providerConfig: providerConfig,
              );
            case 'digitalocean':
              return AddClusterDigitalOceanWidget(
                providerConfig: providerConfig,
              );
            default:
              return AddClusterManualWidget(provider: Providers.manual);
          }
        },
      ),
      isScrollControlled: true,
    );
  }

  void useNew() {
    Get.bottomSheet(
      BottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.sizeBorderRadius),
        ),
        onClosing: () {},
        enableDrag: false,
        builder: (builder) {
          switch (provider) {
            case 'manual':
              return AddClusterManualWidget(
                provider: Providers.manual,
              );
            case 'kubeconfig':
              return AddClusterKubeconfigWidget(
                provider: Providers.kubeconfig,
              );
            case 'aws':
              return const AWSProviderConfigWidget(
                providerConfigIndex: -1,
              );
            case 'azure':
              return const AzureProviderConfigWidget(
                providerConfigIndex: -1,
              );
            case 'digitalocean':
              return const DigitalOceanProviderConfigWidget(
                providerConfigIndex: -1,
              );
            default:
              return AddClusterManualWidget(provider: Providers.manual);
          }
        },
      ),
      isScrollControlled: true,
    );
  }
}

class ReuseProviderConfigActionsWidget extends StatelessWidget {
  const ReuseProviderConfigActionsWidget({
    Key? key,
    required this.provider,
  }) : super(key: key);

  final String provider;

  @override
  Widget build(BuildContext context) {
    ReuseProviderConfigActionsController controller = Get.put(
      ReuseProviderConfigActionsController(
        provider: provider,
      ),
    );

    final List<AppActionsWidgetAction> actions =
        controller.providerConfigController.configs
            .where((c) => c.value.provider == provider)
            .map(
              (p) => AppActionsWidgetAction(
                title: p.value.name,
                onTap: () {
                  finish(context);
                  controller.useExisting(p.value);
                },
              ),
            )
            .toList();

    actions.add(
      AppActionsWidgetAction(
        title: 'Add Provider Configuration',
        onTap: () {
          finish(context);
          controller.useNew();
        },
      ),
    );

    return AppActionsWidget(
      actions: actions,
    );
  }
}
