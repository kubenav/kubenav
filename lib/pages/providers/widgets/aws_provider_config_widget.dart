import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/controllers/provider_config_controller.dart';
import 'package:kubenav/models/provider_config_model.dart';
import 'package:kubenav/models/provider_model.dart';
import 'package:kubenav/pages/clusters/widgets/add_cluster_aws_widget.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/app_bottom_sheet_widget.dart';

class AWSProviderConfigController extends GetxController {
  ProviderConfigController providerConfigController = Get.find();

  final int providerConfigIndex;

  AWSProviderConfigController({
    required this.providerConfigIndex,
  });

  final providerConfigFormKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final accessKeyID = TextEditingController();
  final secretKey = TextEditingController();
  RxString region = 'us-east-1'.obs;
  final sessionToken = TextEditingController();

  @override
  void onInit() {
    if (providerConfigIndex != -1 &&
        providerConfigController.configs[providerConfigIndex].value.aws !=
            null) {
      final providerConfig =
          providerConfigController.configs[providerConfigIndex].value;

      name.text =
          providerConfigController.configs[providerConfigIndex].value.name;
      accessKeyID.text = providerConfig.aws!.accessKeyID;
      secretKey.text = providerConfig.aws!.secretKey;
      region.value = providerConfig.aws!.region;
      sessionToken.text = providerConfig.aws!.sessionToken;
    }

    super.onInit();
  }

  @override
  void onClose() {
    name.dispose();
    accessKeyID.dispose();
    secretKey.dispose();
    sessionToken.dispose();

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
          provider: 'aws',
          aws: ProviderConfigAWS(
            accessKeyID: accessKeyID.text,
            secretKey: secretKey.text,
            region: region.value,
            sessionToken: sessionToken.text,
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
                return AddClusterAWSWidget(providerConfig: providerConfig);
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
            aws: ProviderConfigAWS(
              accessKeyID: accessKeyID.text,
              secretKey: secretKey.text,
              region: region.value,
              sessionToken: sessionToken.text,
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

class AWSProviderConfigWidget extends StatelessWidget {
  const AWSProviderConfigWidget({
    Key? key,
    required this.providerConfigIndex,
  }) : super(key: key);

  final int providerConfigIndex;

  @override
  Widget build(BuildContext context) {
    AWSProviderConfigController controller = Get.put(
      AWSProviderConfigController(providerConfigIndex: providerConfigIndex),
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
                controller: controller.accessKeyID,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Access Key ID',
                ),
                validator: controller.validator,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
                controller: controller.secretKey,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Secret Key',
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
                          child: Text(value),
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
              child: TextFormField(
                controller: controller.sessionToken,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Session Token',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
