import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/controllers/provider_config_controller.dart';
import 'package:kubenav/models/provider_config_model.dart';
import 'package:kubenav/models/provider_model.dart';
import 'package:kubenav/pages/clusters/widgets/add_cluster_digitalocean_widget.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/app_bottom_sheet_widget.dart';

class DigitalOceanProviderConfigController extends GetxController {
  ProviderConfigController providerConfigController = Get.find();

  final int providerConfigIndex;

  DigitalOceanProviderConfigController({
    required this.providerConfigIndex,
  });

  final providerConfigFormKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final token = TextEditingController();

  @override
  void onInit() {
    if (providerConfigIndex != -1 &&
        providerConfigController
                .configs[providerConfigIndex].value.digitalocean !=
            null) {
      final providerConfig =
          providerConfigController.configs[providerConfigIndex].value;

      name.text =
          providerConfigController.configs[providerConfigIndex].value.name;
      token.text = providerConfig.digitalocean!.token;
    }

    super.onInit();
  }

  @override
  void onClose() {
    name.dispose();
    token.dispose();

    super.onClose();
  }

  /// [validator] is used to validate all the required fields. If they are missing the validation of the form will fail.
  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    return null;
  }

  void saveProviderConfig(BuildContext context) {
    if (providerConfigFormKey.currentState != null &&
        providerConfigFormKey.currentState!.validate()) {
      if (providerConfigIndex == -1) {
        final providerConfig = ProviderConfig(
          name: name.text,
          provider: 'digitalocean',
          digitalocean: ProviderConfigDigitalOcean(
            token: token.text,
          ),
        );
        final error = providerConfigController.addConfig(providerConfig);
        if (error != null) {
          snackbar('Could not add provider configuration', error);
        } else {
          finish(context);
          Get.bottomSheet(
            BottomSheet(
              onClosing: () {},
              enableDrag: false,
              builder: (builder) {
                return AddClusterDigitalOceanWidget(
                  providerConfig: providerConfig,
                );
              },
            ),
            isScrollControlled: true,
          );
        }
      } else {
        final providerConfig =
            providerConfigController.configs[providerConfigIndex].value;
        final error = providerConfigController.editConfig(
          providerConfigIndex,
          ProviderConfig(
            name: providerConfig.name,
            provider: providerConfig.provider,
            digitalocean: ProviderConfigDigitalOcean(
              token: token.text,
            ),
          ),
        );
        if (error != null) {
          snackbar('Could not save provider configuration', error);
        } else {
          finish(context);
        }
      }
    }
  }
}

class DigitalOceanProviderConfigWidget extends StatelessWidget {
  const DigitalOceanProviderConfigWidget({
    Key? key,
    required this.providerConfigIndex,
  }) : super(key: key);

  final int providerConfigIndex;

  @override
  Widget build(BuildContext context) {
    DigitalOceanProviderConfigController controller = Get.put(
      DigitalOceanProviderConfigController(
          providerConfigIndex: providerConfigIndex),
    );

    return AppBottomSheetWidget(
      title: Providers.digitalocean.title,
      subtitle: Providers.digitalocean.subtitle,
      icon: Providers.digitalocean.image54x54,
      onClosePressed: () {
        finish(context);
      },
      actionText:
          providerConfigIndex == -1 ? 'Save and add cluster(s)' : 'Save',
      onActionPressed: () {
        controller.saveProviderConfig(context);
      },
      child: Form(
        key: controller.providerConfigFormKey,
        child: ListView(
          shrinkWrap: false,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
                controller: controller.name,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
                validator: controller.validator,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
                controller: controller.token,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'API Token',
                ),
                validator: controller.validator,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
