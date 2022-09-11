import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/controllers/provider_config_controller.dart';
import 'package:kubenav/models/provider_config_model.dart';
import 'package:kubenav/models/provider_model.dart';
import 'package:kubenav/pages/clusters/widgets/add_cluster_awssso_widget.dart';
import 'package:kubenav/services/aws_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/widgets/app_bottom_sheet_widget.dart';

class AWSSSOProviderConfigController extends GetxController {
  ProviderConfigController providerConfigController = Get.find();

  final int providerConfigIndex;
  Rx<AWSSSOConfig>? awsSSOConfig;
  RxBool verified = false.obs;
  Rx<AWSSSOCredentials>? awsSSOCredentials;

  AWSSSOProviderConfigController({
    required this.providerConfigIndex,
  });

  final providerConfigFormKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final startURL = TextEditingController();
  final accountID = TextEditingController();
  final roleName = TextEditingController();
  RxString ssoRegion = 'us-east-1'.obs;
  RxString region = 'us-east-1'.obs;

  @override
  void onInit() {
    if (providerConfigIndex != -1 &&
        providerConfigController.configs[providerConfigIndex].value.awssso !=
            null) {
      final providerConfig =
          providerConfigController.configs[providerConfigIndex].value;

      name.text =
          providerConfigController.configs[providerConfigIndex].value.name;
      startURL.text = providerConfig.awssso!.startURL;
      accountID.text = providerConfig.awssso!.accountID;
      roleName.text = providerConfig.awssso!.roleName;
      ssoRegion.value = providerConfig.awssso!.ssoRegion;
      region.value = providerConfig.awssso!.region;
    }

    super.onInit();
  }

  @override
  void onClose() {
    name.dispose();
    startURL.dispose();
    accountID.dispose();
    roleName.dispose();

    super.onClose();
  }

  /// [validator] is used to validate all the required fields. If they are missing the validation of the form will fail.
  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    return null;
  }

  void startSSOFlow() async {
    try {
      final ssoConfig = await AWSService().getSSOConfig(
        ssoRegion.value,
        startURL.text,
      );

      Logger.log(
        'AWSSSOProviderConfigController startSSOFlow',
        'SSO config was returned',
        ssoConfig,
      );

      awsSSOConfig = ssoConfig.obs;
      snackbar('Sing in completed', 'You can now click on the verify button');
    } catch (err) {
      Logger.log(
        'AWSSSOProviderConfigController startSSOFlow',
        'Could not get SSO configuration',
        err,
      );
      snackbar('Could not get SSO configuration', err.toString());
    }
  }

  void verifyDevice() async {
    try {
      await openUrl(awsSSOConfig!.value.device!.verificationUriComplete!);
      verified.value = true;
    } catch (err) {
      Logger.log(
        'AWSSSOProviderConfigController verifyDevice',
        'Could not verify device',
        err,
      );
      snackbar('Could not verify device', err.toString());
    }
  }

  void getSSOCredentials() async {
    try {
      final ssoCredentials = await AWSService().getSSOToken(
        accountID.text,
        roleName.text,
        ssoRegion.value,
        awsSSOConfig!.value.client!.clientId!,
        awsSSOConfig!.value.client!.clientSecret!,
        awsSSOConfig!.value.device!.deviceCode!,
        '',
        0,
      );

      Logger.log(
        'AWSSSOProviderConfigController startSSOFlow',
        'SSO config was returned',
        ssoCredentials,
      );

      awsSSOCredentials = ssoCredentials.obs;
      snackbar(
          'Credentials are created', 'You can now click on the save button');
    } catch (err) {
      Logger.log(
        'AWSSSOProviderConfigController startSSOFlow',
        'Could not get SSO credentials',
        err,
      );
      snackbar('Could not get SSO credentials', err.toString());
    }
  }

  void saveProviderConfig(BuildContext context) {
    if (providerConfigFormKey.currentState != null &&
        providerConfigFormKey.currentState!.validate() &&
        awsSSOConfig != null &&
        awsSSOCredentials != null) {
      if (providerConfigIndex == -1) {
        final providerConfig = ProviderConfig(
          name: name.text,
          provider: 'awssso',
          awssso: ProviderConfigAWSSSO(
            startURL: startURL.text,
            accountID: accountID.text,
            roleName: roleName.text,
            ssoRegion: ssoRegion.value,
            region: region.value,
            ssoConfig: awsSSOConfig!.value,
            ssoCredentials: awsSSOCredentials!.value,
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
                return AddClusterAWSSSOWidget(providerConfig: providerConfig);
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
            awssso: ProviderConfigAWSSSO(
              startURL: startURL.text,
              accountID: accountID.text,
              roleName: roleName.text,
              ssoRegion: ssoRegion.value,
              region: region.value,
              ssoConfig: awsSSOConfig!.value,
              ssoCredentials: awsSSOCredentials!.value,
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

class AWSSSOProviderConfigWidget extends StatelessWidget {
  const AWSSSOProviderConfigWidget({
    Key? key,
    required this.providerConfigIndex,
  }) : super(key: key);

  final int providerConfigIndex;

  @override
  Widget build(BuildContext context) {
    AWSSSOProviderConfigController controller = Get.put(
      AWSSSOProviderConfigController(providerConfigIndex: providerConfigIndex),
    );

    return AppBottomSheetWidget(
      title: Providers.aws.title,
      subtitle: Providers.aws.subtitle,
      icon: Providers.aws.image54x54,
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
                controller: controller.startURL,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Start URL',
                ),
                validator: controller.validator,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
                controller: controller.accountID,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Account ID',
                ),
                validator: controller.validator,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
                controller: controller.roleName,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Role Name',
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
                  const Text('SSO Region'),
                  Obx(
                    () => DropdownButton(
                      value: controller.ssoRegion.value,
                      underline: Container(
                        height: 2,
                        color: Constants.colorPrimary,
                      ),
                      onChanged: (String? newValue) {
                        controller.ssoRegion.value = newValue ?? '';
                      },
                      items: [
                        'us-east-1',
                        'us-east-2',
                        'us-west-1',
                        'us-west-2',
                        'af-south-1',
                        'ap-east-1',
                        'ap-south-1',
                        'ap-northeast-1',
                        'ap-northeast-2',
                        'ap-northeast-3',
                        'ap-southeast-1',
                        'ap-southeast-2',
                        'ca-central-1',
                        'cn-north-1',
                        'cn-northwest-1',
                        'eu-central-1',
                        'eu-west-1',
                        'eu-west-2',
                        'eu-west-3',
                        'eu-south-1',
                        'eu-north-1',
                        'me-south-1',
                        'sa-east-1',
                      ].map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .color,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  )
                ],
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
                  const Text('Region'),
                  Obx(
                    () => DropdownButton(
                      value: controller.region.value,
                      underline: Container(
                        height: 2,
                        color: Constants.colorPrimary,
                      ),
                      onChanged: (String? newValue) {
                        controller.region.value = newValue ?? '';
                      },
                      items: [
                        'us-east-1',
                        'us-east-2',
                        'us-west-1',
                        'us-west-2',
                        'af-south-1',
                        'ap-east-1',
                        'ap-south-1',
                        'ap-northeast-1',
                        'ap-northeast-2',
                        'ap-northeast-3',
                        'ap-southeast-1',
                        'ap-southeast-2',
                        'ca-central-1',
                        'cn-north-1',
                        'cn-northwest-1',
                        'eu-central-1',
                        'eu-west-1',
                        'eu-west-2',
                        'eu-west-3',
                        'eu-south-1',
                        'eu-north-1',
                        'me-south-1',
                        'sa-east-1',
                      ].map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .color,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Constants.colorPrimary,
                  onPrimary: Colors.white,
                  minimumSize: const Size.fromHeight(40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      Constants.sizeBorderRadius,
                    ),
                  ),
                ),
                onPressed: controller.startSSOFlow,
                child: Text(
                  'Sign In',
                  style: primaryTextStyle(
                    context,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Constants.colorPrimary,
                  onPrimary: Colors.white,
                  minimumSize: const Size.fromHeight(40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      Constants.sizeBorderRadius,
                    ),
                  ),
                ),
                onPressed: controller.verifyDevice,
                child: Text(
                  'Verify',
                  style: primaryTextStyle(
                    context,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Constants.colorPrimary,
                  onPrimary: Colors.white,
                  minimumSize: const Size.fromHeight(40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      Constants.sizeBorderRadius,
                    ),
                  ),
                ),
                onPressed: controller.getSSOCredentials,
                child: Text(
                  'Get Credentials',
                  style: primaryTextStyle(
                    context,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
