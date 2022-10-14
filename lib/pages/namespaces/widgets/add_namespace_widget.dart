import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/controllers/global_settings_controller.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/app_bottom_sheet_widget.dart';

class AddNamespaceController extends GetxController {
  GlobalSettingsController globalSettingsController = Get.find();
  final namespaceFormKey = GlobalKey<FormState>();
  final namespace = TextEditingController();

  AddNamespaceController();

  /// [validator] is used to validate the required field [namesoace]. If the value is empty the validation fails.
  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    return null;
  }

  void addNamespace() {
    globalSettingsController.namespaces.add(namespace.text);
  }
}

class AddNamespaceWidget extends StatelessWidget {
  const AddNamespaceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddNamespaceController controller = Get.put(AddNamespaceController());

    return AppBottomSheetWidget(
      title: 'Add Namespace',
      subtitle: 'Add one of your favorite namespaces for quick access',
      icon: Icons.difference,
      onClosePressed: () {
        finish(context);
      },
      actionText: 'Add Namespace',
      onActionPressed: () {
        if (controller.namespaceFormKey.currentState != null &&
            controller.namespaceFormKey.currentState!.validate()) {
          controller.addNamespace();
          finish(context);
        }
      },
      child: Form(
        key: controller.namespaceFormKey,
        child: ListView(
          shrinkWrap: false,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: Text(
                'Enter the name of one of your favorite namespaces for quick access:',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
                controller: controller.namespace,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Namespace',
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
