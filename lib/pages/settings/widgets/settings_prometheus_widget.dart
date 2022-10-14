import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/controllers/global_settings_controller.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/app_bottom_sheet_widget.dart';

class SettingsPrometheusController extends GetxController {
  final bool currentPrometheusEnabled;
  final String currentPrometheusAddress;
  final String currentPrometheusNamespace;
  final String currentPrometheusLabelSelector;
  final String currentPrometheusContainer;
  final int currentPrometheusPort;
  final String currentPrometheusUsername;
  final String currentPrometheusPassword;
  final String currentPrometheusToken;

  GlobalSettingsController globalSettingsController = Get.find();
  final prometheusFormKey = GlobalKey<FormState>();
  RxBool prometheusEnabled = false.obs;
  final prometheusAddress = TextEditingController();
  final prometheusNamespace = TextEditingController();
  final prometheusLabelSelector = TextEditingController();
  final prometheusContainer = TextEditingController();
  final prometheusPort = TextEditingController();
  final prometheusUsername = TextEditingController();
  final prometheusPassword = TextEditingController();
  final prometheusToken = TextEditingController();

  SettingsPrometheusController({
    required this.currentPrometheusEnabled,
    required this.currentPrometheusAddress,
    required this.currentPrometheusNamespace,
    required this.currentPrometheusLabelSelector,
    required this.currentPrometheusContainer,
    required this.currentPrometheusPort,
    required this.currentPrometheusUsername,
    required this.currentPrometheusPassword,
    required this.currentPrometheusToken,
  });

  @override
  void onInit() {
    prometheusEnabled.value = currentPrometheusEnabled;
    prometheusAddress.text = currentPrometheusAddress;
    prometheusNamespace.text = currentPrometheusNamespace;
    prometheusLabelSelector.text = currentPrometheusLabelSelector;
    prometheusContainer.text = currentPrometheusContainer;
    prometheusPort.text = '$currentPrometheusPort';
    prometheusUsername.text = currentPrometheusUsername;
    prometheusPassword.text = currentPrometheusPassword;
    prometheusToken.text = currentPrometheusToken;

    super.onInit();
  }

  /// [validator] is used to validate the required field [timeout]. If the value is empty or not a number the
  /// validation fails.
  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    final parsedValue = int.tryParse(value);
    if (parsedValue == null) {
      return 'The field must be a number';
    }

    if (parsedValue < 0) {
      return 'The field must be a positive number';
    }

    return null;
  }

  void savePrometheusConfiguration() {
    globalSettingsController.prometheusEnabled.value = prometheusEnabled.value;
    globalSettingsController.prometheusAddress.value = prometheusAddress.text;
    globalSettingsController.prometheusNamespace.value =
        prometheusNamespace.text;
    globalSettingsController.prometheusLabelSelector.value =
        prometheusLabelSelector.text;
    globalSettingsController.prometheusContainer.value =
        prometheusContainer.text;
    globalSettingsController.prometheusPort.value =
        int.parse(prometheusPort.text);
    globalSettingsController.prometheusUsername.value = prometheusUsername.text;
    globalSettingsController.prometheusPassword.value = prometheusPassword.text;
    globalSettingsController.prometheusToken.value = prometheusToken.text;
  }
}

class SettingsPrometheusWidget extends StatelessWidget {
  const SettingsPrometheusWidget({
    Key? key,
    required this.currentPrometheusEnabled,
    required this.currentPrometheusAddress,
    required this.currentPrometheusNamespace,
    required this.currentPrometheusLabelSelector,
    required this.currentPrometheusContainer,
    required this.currentPrometheusPort,
    required this.currentPrometheusUsername,
    required this.currentPrometheusPassword,
    required this.currentPrometheusToken,
  }) : super(key: key);

  final bool currentPrometheusEnabled;
  final String currentPrometheusAddress;
  final String currentPrometheusNamespace;
  final String currentPrometheusLabelSelector;
  final String currentPrometheusContainer;
  final int currentPrometheusPort;
  final String currentPrometheusUsername;
  final String currentPrometheusPassword;
  final String currentPrometheusToken;

  @override
  Widget build(BuildContext context) {
    SettingsPrometheusController controller = Get.put(
      SettingsPrometheusController(
        currentPrometheusEnabled: currentPrometheusEnabled,
        currentPrometheusAddress: currentPrometheusAddress,
        currentPrometheusNamespace: currentPrometheusNamespace,
        currentPrometheusLabelSelector: currentPrometheusLabelSelector,
        currentPrometheusContainer: currentPrometheusContainer,
        currentPrometheusPort: currentPrometheusPort,
        currentPrometheusUsername: currentPrometheusUsername,
        currentPrometheusPassword: currentPrometheusPassword,
        currentPrometheusToken: currentPrometheusToken,
      ),
    );

    return AppBottomSheetWidget(
      title: 'Prometheus',
      subtitle: 'Prometheus configuration',
      icon: 'assets/plugins/image54x54/prometheus.png',
      onClosePressed: () {
        finish(context);
      },
      actionText: 'Save',
      onActionPressed: () {
        if (controller.prometheusFormKey.currentState != null &&
            controller.prometheusFormKey.currentState!.validate()) {
          controller.savePrometheusConfiguration();
          finish(context);
        }
      },
      child: Form(
        key: controller.prometheusFormKey,
        child: ListView(
          shrinkWrap: false,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: Text(
                'You can specify the address of an Prometheus instance, or if your Prometheus instance is not reachable via a public address you can specify a namespace, label selector, container and port running inside your cluster',
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
                  const Text('Enabled'),
                  Obx(
                    () => Switch(
                      activeColor: Constants.colorPrimary,
                      onChanged: (val) => controller.prometheusEnabled.value =
                          !controller.prometheusEnabled.value,
                      value: controller.prometheusEnabled.value,
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
                controller: controller.prometheusAddress,
                keyboardType: TextInputType.url,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Address',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
                controller: controller.prometheusNamespace,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Namespace',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
                controller: controller.prometheusLabelSelector,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Label Selector',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
                controller: controller.prometheusContainer,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Container',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
                controller: controller.prometheusPort,
                keyboardType: TextInputType.number,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Port',
                ),
                validator: controller.validator,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
                controller: controller.prometheusUsername,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
                controller: controller.prometheusPassword,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
                controller: controller.prometheusToken,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Token',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
