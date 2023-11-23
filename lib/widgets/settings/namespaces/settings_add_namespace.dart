import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

/// The [SettingsAddNamespace] can be used to add a new namespace to the list of
/// favorite namespaces. To add the namespace a user must provide the name of
/// the namespace.
class SettingsAddNamespace extends StatefulWidget {
  const SettingsAddNamespace({super.key});

  @override
  State<SettingsAddNamespace> createState() => _SettingsAddNamespaceState();
}

class _SettingsAddNamespaceState extends State<SettingsAddNamespace> {
  final _namespaceFormKey = GlobalKey<FormState>();
  final _namespaceController = TextEditingController();

  /// [_validator] is used to validate the required field
  /// [_namespaceController]. If the value is empty the validation fails.
  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: false,
    );

    return AppBottomSheetWidget(
      title: 'Add Namespace',
      subtitle: 'Add one of your favorite namespaces for quick access',
      icon: Icons.difference,
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Add Namespace',
      actionPressed: () {
        if (_namespaceFormKey.currentState != null &&
            _namespaceFormKey.currentState!.validate()) {
          appRepository.addNamespace(_namespaceController.text);
          Navigator.pop(context);
        }
      },
      actionIsLoading: false,
      child: Form(
        key: _namespaceFormKey,
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
                controller: _namespaceController,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Namespace',
                ),
                validator: _validator,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
