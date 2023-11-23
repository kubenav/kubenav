import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

/// The [SettingsTimeout] widget allows a user to change the timeout for all
/// Kubernetes API requests.
class SettingsTimeout extends StatefulWidget {
  const SettingsTimeout({
    super.key,
    required this.currentTimeout,
  });

  final int currentTimeout;

  @override
  State<SettingsTimeout> createState() => _SettingsTimeoutState();
}

class _SettingsTimeoutState extends State<SettingsTimeout> {
  final _timeoutFormKey = GlobalKey<FormState>();
  final _timeoutController = TextEditingController();

  /// [_validator] is used to validate the required field [_timeoutController].
  /// If the value is empty or not a number the validation fails.
  String? _validator(String? value) {
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

  @override
  void initState() {
    super.initState();
    _timeoutController.text = '${widget.currentTimeout}';
  }

  @override
  void dispose() {
    _timeoutController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: false,
    );

    return AppBottomSheetWidget(
      title: 'Timeout',
      subtitle: 'Timeout for requests against the Kubernetes API',
      icon: Icons.schedule,
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Save',
      actionPressed: () {
        if (_timeoutFormKey.currentState != null &&
            _timeoutFormKey.currentState!.validate()) {
          appRepository.setTimeout(int.tryParse(_timeoutController.text) ?? 0);
          Navigator.pop(context);
        }
      },
      actionIsLoading: false,
      child: Form(
        key: _timeoutFormKey,
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
                controller: _timeoutController,
                keyboardType: TextInputType.url,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Timeout',
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
