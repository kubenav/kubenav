import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/controllers/provider_config_controller.dart';
import 'package:kubenav/models/provider_config_model.dart';
import 'package:kubenav/models/provider_model.dart';
import 'package:kubenav/pages/clusters/widgets/add_cluster_oidc_widget.dart';
import 'package:kubenav/services/oidc_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/widgets/app_bottom_sheet_widget.dart';

class OIDCProviderConfigController extends GetxController {
  ProviderConfigController providerConfigController = Get.find();

  final int providerConfigIndex;

  OIDCProviderConfigController({
    required this.providerConfigIndex,
  });

  final providerConfigFormKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final discoveryURL = TextEditingController();
  final clientID = TextEditingController();
  RxString pkceMethod = ''.obs;
  final clientSecret = TextEditingController();
  final scopes = TextEditingController();
  final certificateAuthority = TextEditingController();
  final refreshToken = TextEditingController();
  final code = TextEditingController();
  RxString verifier = ''.obs;

  @override
  void onInit() {
    if (providerConfigIndex != -1 &&
        providerConfigController.configs[providerConfigIndex].value.oidc !=
            null) {
      final providerConfig =
          providerConfigController.configs[providerConfigIndex].value;

      name.text =
          providerConfigController.configs[providerConfigIndex].value.name;
      discoveryURL.text = providerConfig.oidc!.discoveryURL;
      clientID.text = providerConfig.oidc!.clientID;
      pkceMethod.value = providerConfig.oidc!.pkceMethod;
      clientSecret.text = providerConfig.oidc!.clientSecret;
      scopes.text = providerConfig.oidc!.scopes;
      certificateAuthority.text = providerConfig.oidc!.certificateAuthority;
      refreshToken.text = providerConfig.oidc!.refreshToken;
      code.text = providerConfig.oidc!.code;
    }

    super.onInit();
  }

  @override
  void onClose() {
    name.dispose();
    discoveryURL.dispose();
    clientID.dispose();
    clientSecret.dispose();
    scopes.dispose();
    certificateAuthority.dispose();
    code.dispose();

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
      final oidcResponse = await OIDCService().getLink(
        discoveryURL.text,
        clientID.text,
        clientSecret.text,
        certificateAuthority.text,
        scopes.text,
        Constants.oidcRedirectURI,
        pkceMethod.value,
      );

      if (oidcResponse.url != null) {
        if (oidcResponse.verifier != null) {
          verifier.value = oidcResponse.verifier!;
        }

        await openUrl(oidcResponse.url!);
      }
    } catch (err) {
      Logger.log(
        'OIDCProviderConfigController signIn',
        'Could not open sign in url',
        err,
      );
      snackbar('Could not generate and open sign in url', err.toString());
    }
  }

  void saveProviderConfig() async {
    if (providerConfigFormKey.currentState != null &&
        providerConfigFormKey.currentState!.validate()) {
      try {
        String tmpRefreshToken = '';
        String tmpIDToken = '';

        if (refreshToken.text == '') {
          final oidcResponse = await OIDCService().getRefreshToken(
            discoveryURL.text,
            clientID.text,
            clientSecret.text,
            certificateAuthority.text,
            scopes.text,
            Constants.oidcRedirectURI,
            pkceMethod.value,
            code.text,
            verifier.value,
          );

          Logger.log(
            'OIDCProviderConfigController saveProviderConfig',
            'getRefreshToken response',
            oidcResponse,
          );

          tmpRefreshToken = oidcResponse.refreshToken ?? '';
          tmpIDToken = oidcResponse.idToken ?? '';
        } else {
          final oidcResponse = await OIDCService().getAccessToken(
            discoveryURL.text,
            clientID.text,
            clientSecret.text,
            certificateAuthority.text,
            scopes.text,
            Constants.oidcRedirectURI,
            refreshToken.text,
          );

          Logger.log(
            'OIDCProviderConfigController saveProviderConfig',
            'getAccessToken response',
            oidcResponse,
          );

          tmpRefreshToken = refreshToken.text;
          tmpIDToken = oidcResponse.idToken ?? '';
        }

        if (providerConfigIndex == -1) {
          final providerConfig = ProviderConfig(
            name: name.text,
            provider: 'oidc',
            oidc: ProviderConfigOIDC(
              discoveryURL: discoveryURL.text,
              clientID: clientID.text,
              clientSecret: clientSecret.text,
              certificateAuthority: certificateAuthority.text,
              scopes: scopes.text,
              pkceMethod: pkceMethod.value,
              verifier: verifier.value,
              code: code.text,
              idToken: tmpIDToken,
              refreshToken: tmpRefreshToken,
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
                  return AddClusterOIDCWidget(
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
              oidc: ProviderConfigOIDC(
                discoveryURL: discoveryURL.text,
                clientID: clientID.text,
                clientSecret: clientSecret.text,
                certificateAuthority: certificateAuthority.text,
                scopes: scopes.text,
                pkceMethod: pkceMethod.value,
                verifier: verifier.value,
                code: code.text,
                idToken: tmpIDToken,
                refreshToken: tmpRefreshToken,
              ),
            ),
          );
          if (error != null) {
            snackbar('Could not save provider configuration', error);
          }
        }
      } catch (err) {
        Logger.log(
          'OIDCProviderConfigController saveProviderConfig',
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
}

class OIDCProviderConfigWidget extends StatelessWidget {
  const OIDCProviderConfigWidget({
    Key? key,
    required this.providerConfigIndex,
  }) : super(key: key);

  final int providerConfigIndex;

  @override
  Widget build(BuildContext context) {
    OIDCProviderConfigController controller = Get.put(
      OIDCProviderConfigController(providerConfigIndex: providerConfigIndex),
    );

    return AppBottomSheetWidget(
      title: Providers.oidc.title,
      subtitle: Providers.oidc.subtitle,
      icon: Providers.oidc.image54x54,
      onClosePressed: () {
        finish(context);
      },
      actionText:
          providerConfigIndex == -1 ? 'Save and add cluster(s)' : 'Save',
      onActionPressed: () {
        controller.saveProviderConfig();
        finish(context);
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
                controller: controller.discoveryURL,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Discovery URL',
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('PKCE Method'),
                  Obx(
                    () => DropdownButton(
                      value: controller.pkceMethod.value,
                      underline: Container(
                        height: 2,
                        color: Constants.colorPrimary,
                      ),
                      onChanged: (String? newValue) {
                        controller.pkceMethod.value = newValue ?? '';
                      },
                      items: [
                        '',
                        'S256',
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
            Obx(() {
              if (controller.pkceMethod.value == '') {
                return Padding(
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
                  ),
                );
              } else {
                return Container();
              }
            }),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
                controller: controller.scopes,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Scopes (optional)',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
                controller: controller.certificateAuthority,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Certificate Authority (optional)',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
                controller: controller.refreshToken,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Refresh Token (optional)',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Constants.colorPrimary,
                  foregroundColor: Colors.white,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
