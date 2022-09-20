import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/controllers/global_settings_controller.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/app_bottom_sheet_widget.dart';

class SettingsProxyController extends GetxController {
  final String currentProxy;

  GlobalSettingsController globalSettingsController = Get.find();
  final proxyFormKey = GlobalKey<FormState>();
  final proxy = TextEditingController();

  SettingsProxyController({
    required this.currentProxy,
  });

  @override
  void onInit() {
    proxy.text = currentProxy;

    super.onInit();
  }

  /// [validator] is used to validate the [proxy] field, which must be a valid url when not empty.
  String? validator(String? value) {
    if (value != null) {
      final parsedValue = int.tryParse(value);
      if (value != '' && parsedValue == null) {
        return 'The field must be empty or a valud URL';
      }
    }

    return null;
  }

  void saveProxy() async {
    globalSettingsController.proxy.value = proxy.text;
  }
}

class SettingsProxyWidget extends StatelessWidget {
  const SettingsProxyWidget({
    Key? key,
    required this.currentProxy,
  }) : super(key: key);

  final String currentProxy;

  @override
  Widget build(BuildContext context) {
    SettingsProxyController controller = Get.put(
      SettingsProxyController(
        currentProxy: currentProxy,
      ),
    );

    return AppBottomSheetWidget(
      title: 'Proxy',
      subtitle: 'A proxy for all Kubernetes requests',
      icon: Icons.http,
      onClosePressed: () {
        finish(context);
      },
      actionText: 'Save',
      onActionPressed: () {
        if (controller.proxyFormKey.currentState != null &&
            controller.proxyFormKey.currentState!.validate()) {
          controller.saveProxy();
          finish(context);
        }
      },
      child: Form(
        key: controller.proxyFormKey,
        child: ListView(
          shrinkWrap: false,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
                controller: controller.proxy,
                keyboardType: TextInputType.url,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Proxy',
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
