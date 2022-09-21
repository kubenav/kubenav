import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/controllers/provider_config_controller.dart';
import 'package:kubenav/models/provider_config_model.dart';
import 'package:kubenav/models/provider_model.dart';
import 'package:kubenav/pages/clusters/widgets/add_cluster_google_widget.dart';
import 'package:kubenav/services/google_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/widgets/app_bottom_sheet_widget.dart';

class GoogleProviderConfigController extends GetxController {
  ProviderConfigController providerConfigController = Get.find();

  final int providerConfigIndex;

  GoogleProviderConfigController({
    required this.providerConfigIndex,
  });

  final providerConfigFormKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final clientID = TextEditingController();
  final clientSecret = TextEditingController();
  final code = TextEditingController();

  @override
  void onInit() {
    if (providerConfigIndex != -1 &&
        providerConfigController.configs[providerConfigIndex].value.google !=
            null) {
      final providerConfig =
          providerConfigController.configs[providerConfigIndex].value;

      name.text =
          providerConfigController.configs[providerConfigIndex].value.name;
      clientID.text = providerConfig.google!.clientID;
      clientSecret.text = providerConfig.google!.clientSecret;
      code.text = providerConfig.google!.code;
    }

    super.onInit();
  }

  @override
  void onClose() {
    name.dispose();
    clientID.dispose();

    super.onClose();
  }

  /// [validator] is used to validate all the required fields. If they are missing the validation of the form will fail.
  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    return null;
  }

  void signIn() async {
    try {
      await openUrl(
          'https://accounts.google.com/o/oauth2/v2/auth?client_id=${clientID.text}&redirect_uri=${Constants.googleRedirectURI}&response_type=code&scope=https://www.googleapis.com/auth/cloud-platform&access_type=offline&include_granted_scopes=true');
    } catch (err) {
      Logger.log(
        'GoogleProviderConfigController signIn',
        'Could not open sign in url',
        err,
      );
      snackbar('Could not open sign in url', err.toString());
    }
  }

  void saveProviderConfig() async {
    try {
      final googleTokens = await GoogleService()
          .getTokensFromCode(clientID.text, clientSecret.text, code.text);

      if (googleTokens.accessToken != null &&
          googleTokens.expiresIn != null &&
          googleTokens.refreshToken != null) {
        final expires = DateTime.now().millisecondsSinceEpoch +
            googleTokens.expiresIn! * 1000;

        if (providerConfigIndex == -1) {
          final providerConfig = ProviderConfig(
            name: name.text,
            provider: 'google',
            google: ProviderConfigGoogle(
              clientID: clientID.text,
              clientSecret: clientSecret.text,
              code: code.text,
              accessToken: googleTokens.accessToken!,
              accessTokenExpires: expires,
              refreshToken: googleTokens.refreshToken!,
            ),
          );
          final error = providerConfigController.addConfig(providerConfig);
          if (error != null) {
            snackbar('Could not add provider configuration', error);
          } else {
            Get.bottomSheet(
              BottomSheet(
                onClosing: () {},
                enableDrag: false,
                builder: (builder) {
                  return AddClusterGoogleWidget(
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
              google: ProviderConfigGoogle(
                clientID: clientID.text,
                clientSecret: clientSecret.text,
                code: code.text,
                accessToken: googleTokens.accessToken!,
                accessTokenExpires: expires,
                refreshToken: googleTokens.refreshToken!,
              ),
            ),
          );
          if (error != null) {
            snackbar('Could not save provider configuration', error);
          }
        }
      }
    } catch (err) {
      Logger.log(
        'GoogleProviderConfigController saveProviderConfig',
        'Could not get access token',
        err,
      );
      snackbar(
        'Could not get access token',
        err.toString(),
      );
    }
  }
}

class GoogleProviderConfigWidget extends StatelessWidget {
  const GoogleProviderConfigWidget({
    Key? key,
    required this.providerConfigIndex,
  }) : super(key: key);

  final int providerConfigIndex;

  @override
  Widget build(BuildContext context) {
    GoogleProviderConfigController controller = Get.put(
      GoogleProviderConfigController(providerConfigIndex: providerConfigIndex),
    );

    return AppBottomSheetWidget(
      title: Providers.google.title,
      subtitle: Providers.google.subtitle,
      icon: Providers.google.image54x54,
      onClosePressed: () {
        finish(context);
      },
      actionText:
          providerConfigIndex == -1 ? 'Save and add cluster(s)' : 'Save',
      onActionPressed: () {
        if (controller.providerConfigFormKey.currentState != null &&
            controller.providerConfigFormKey.currentState!.validate()) {
          controller.saveProviderConfig();
          finish(context);
        }
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
                controller: controller.clientID,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: 1,
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
                maxLines: 1,
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
                onPressed: controller.signIn,
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
              child: TextFormField(
                controller: controller.code,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Code',
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
