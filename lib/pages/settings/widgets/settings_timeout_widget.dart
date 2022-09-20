import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/controllers/global_settings_controller.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/app_bottom_sheet_widget.dart';

class SettingsTimeoutController extends GetxController {
  final int currentTimeout;

  GlobalSettingsController globalSettingsController = Get.find();
  final timeoutFormKey = GlobalKey<FormState>();
  final timeout = TextEditingController();

  SettingsTimeoutController({
    required this.currentTimeout,
  });

  @override
  void onInit() {
    timeout.text = '$currentTimeout';

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

  void saveTimeout() async {
    final newTimeout = int.parse(timeout.text);
    globalSettingsController.timeout.value = newTimeout;
  }
}

class SettingsTimeoutWidget extends StatelessWidget {
  const SettingsTimeoutWidget({
    Key? key,
    required this.currentTimeout,
  }) : super(key: key);

  final int currentTimeout;

  @override
  Widget build(BuildContext context) {
    SettingsTimeoutController controller = Get.put(
      SettingsTimeoutController(
        currentTimeout: currentTimeout,
      ),
    );

    return AppBottomSheetWidget(
      title: 'Timeout',
      subtitle: 'Timeout for requests against the Kubernetes API',
      icon: Icons.schedule,
      onClosePressed: () {
        finish(context);
      },
      actionText: 'Save',
      onActionPressed: () {
        if (controller.timeoutFormKey.currentState != null &&
            controller.timeoutFormKey.currentState!.validate()) {
          controller.saveTimeout();
          finish(context);
        }
      },
      child: Form(
        key: controller.timeoutFormKey,
        child: ListView(
          shrinkWrap: false,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: Text(
                'Set the timeout for requests against the Kubernetes API in seconds. A value of "0" means no timeout:',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
                controller: controller.timeout,
                keyboardType: TextInputType.number,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Timeout',
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
