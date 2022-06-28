import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:kubenav/controllers/cluster_controller.dart';
import 'package:kubenav/controllers/provider_config_controller.dart';
import 'package:kubenav/models/provider_config_model.dart';
import 'package:kubenav/services/aws_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';

class AWSSSOProviderReauthenticateController extends GetxController {
  ClusterController clusterConfigController = Get.find();
  ProviderConfigController providerConfigController = Get.find();

  late int providerConfigIndex;
  Rx<AWSSSOConfig>? awsSSOConfig;
  RxBool verified = false.obs;
  Rx<AWSSSOCredentials>? awsSSOCredentials;

  AWSSSOProviderReauthenticateController();

  @override
  void onInit() {
    final cluster = clusterConfigController.getActiveCluster();
    if (cluster != null) {
      providerConfigIndex =
          providerConfigController.getIndex(cluster.providerConfigInternal);
    } else {
      providerConfigIndex = -1;
    }

    super.onInit();
  }

  void startSSOFlow() async {
    try {
      final providerConfig =
          providerConfigController.configs[providerConfigIndex].value;

      final ssoConfig = await AWSService().getSSOConfig(
        providerConfig.awssso!.ssoRegion,
        providerConfig.awssso!.startURL,
      );

      Logger.log(
        'AWSSSOProviderReauthenticateController startSSOFlow',
        'SSO config was returned',
        ssoConfig,
      );

      awsSSOConfig = ssoConfig.obs;
      snackbar('Sing in completed', 'You can now click on the verify button');
    } catch (err) {
      Logger.log(
        'AWSSSOProviderReauthenticateController startSSOFlow',
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
        'AWSSSOProviderReauthenticateController verifyDevice',
        'Could not verify device',
        err,
      );
      snackbar('Could not verify device', err.toString());
    }
  }

  void getSSOCredentials() async {
    try {
      final providerConfig =
          providerConfigController.configs[providerConfigIndex].value;

      final ssoCredentials = await AWSService().getSSOToken(
        providerConfig.awssso!.accountID,
        providerConfig.awssso!.roleName,
        providerConfig.awssso!.ssoRegion,
        awsSSOConfig!.value.client!.clientId!,
        awsSSOConfig!.value.client!.clientSecret!,
        awsSSOConfig!.value.device!.deviceCode!,
        "",
        0,
      );

      Logger.log(
        'AWSSSOProviderReauthenticateController startSSOFlow',
        'SSO config was returned',
        ssoCredentials,
      );

      awsSSOCredentials = ssoCredentials.obs;

      final error = providerConfigController.editConfig(
        providerConfigIndex,
        ProviderConfig(
          name: providerConfig.name,
          provider: providerConfig.provider,
          awssso: ProviderConfigAWSSSO(
            startURL: providerConfig.awssso!.startURL,
            accountID: providerConfig.awssso!.accountID,
            roleName: providerConfig.awssso!.roleName,
            ssoRegion: providerConfig.awssso!.ssoRegion,
            region: providerConfig.awssso!.region,
            ssoConfig: awsSSOConfig!.value,
            ssoCredentials: awsSSOCredentials!.value,
          ),
        ),
      );
      if (error != null) {
        snackbar('Could not save provider configuration', error);
      } else {
        snackbar(
          'Provider configuration saved',
          'Refresh the view to use the new credentials',
        );
      }
    } catch (err) {
      Logger.log(
        'AWSSSOProviderReauthenticateController startSSOFlow',
        'Could not get SSO credentials',
        err,
      );
      snackbar('Could not get SSO credentials', err.toString());
    }
  }
}

class AWSSSOProviderReauthenticateWidget extends StatelessWidget {
  const AWSSSOProviderReauthenticateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AWSSSOProviderReauthenticateController controller = Get.put(
      AWSSSOProviderReauthenticateController(),
    );

    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Constants.spacingSmall,
            horizontal: Constants.spacingSmall,
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
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Constants.spacingSmall,
            horizontal: Constants.spacingSmall,
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
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Constants.spacingSmall,
            horizontal: Constants.spacingSmall,
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
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
