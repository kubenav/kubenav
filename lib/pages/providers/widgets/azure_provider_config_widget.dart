import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/controllers/provider_config_controller.dart';
import 'package:kubenav/models/provider_config_model.dart';
import 'package:kubenav/models/provider_model.dart';
import 'package:kubenav/pages/clusters/widgets/add_cluster_azure_widget.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/app_bottom_sheet_widget.dart';

class AzureProviderConfigController extends GetxController {
  ProviderConfigController providerConfigController = Get.find();

  final int providerConfigIndex;

  AzureProviderConfigController({
    required this.providerConfigIndex,
  });

  final providerConfigFormKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final subscriptionID = TextEditingController();
  final tenantID = TextEditingController();
  final clientID = TextEditingController();
  final clientSecret = TextEditingController();
  RxBool isAdmin = false.obs;

  @override
  void onInit() {
    if (providerConfigIndex != -1 &&
        providerConfigController.configs[providerConfigIndex].value.azure !=
            null) {
      final providerConfig =
          providerConfigController.configs[providerConfigIndex].value;

      name.text =
          providerConfigController.configs[providerConfigIndex].value.name;
      subscriptionID.text = providerConfig.azure!.subscriptionID;
      tenantID.text = providerConfig.azure!.tenantID;
      clientID.text = providerConfig.azure!.clientID;
      clientSecret.text = providerConfig.azure!.clientSecret;
      isAdmin.value = providerConfig.azure!.isAdmin;
    }

    super.onInit();
  }

  @override
  void onClose() {
    name.dispose();
    subscriptionID.dispose();
    tenantID.dispose();
    clientID.dispose();
    clientSecret.dispose();

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
          provider: 'azure',
          azure: ProviderConfigAzure(
            subscriptionID: subscriptionID.text,
            tenantID: tenantID.text,
            clientID: clientID.text,
            clientSecret: clientSecret.text,
            isAdmin: isAdmin.value,
          ),
        );
        final error = providerConfigController.addConfig(providerConfig);
        if (error != null) {
          snackbar('Could not add provider configuration', error);
        } else {
          finish(context);
          Get.bottomSheet(
            BottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Constants.sizeBorderRadius),
              ),
              onClosing: () {},
              enableDrag: false,
              builder: (builder) {
                return AddClusterAzureWidget(providerConfig: providerConfig);
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
            azure: ProviderConfigAzure(
              subscriptionID: subscriptionID.text,
              tenantID: tenantID.text,
              clientID: clientID.text,
              clientSecret: clientSecret.text,
              isAdmin: isAdmin.value,
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

class AzureProviderConfigWidget extends StatelessWidget {
  const AzureProviderConfigWidget({
    Key? key,
    required this.providerConfigIndex,
  }) : super(key: key);

  final int providerConfigIndex;

  @override
  Widget build(BuildContext context) {
    AzureProviderConfigController controller = Get.put(
      AzureProviderConfigController(providerConfigIndex: providerConfigIndex),
    );

    return AppBottomSheetWidget(
      title: Providers.azure.title,
      subtitle: Providers.azure.subtitle,
      icon: Providers.azure.image54x54,
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
                maxLines: null,
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
                controller: controller.subscriptionID,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Subscription ID',
                ),
                validator: controller.validator,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
                controller: controller.tenantID,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Tenant ID',
                ),
                validator: controller.validator,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
                controller: controller.clientID,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Client ID',
                ),
                validator: controller.validator,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
                controller: controller.clientSecret,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Client Secret',
                ),
                validator: controller.validator,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Admin'),
                  Obx(
                    () => Switch(
                      activeColor: Constants.colorPrimary,
                      onChanged: (val) =>
                          controller.isAdmin.value = !controller.isAdmin.value,
                      value: controller.isAdmin.value,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
