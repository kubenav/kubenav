import 'package:flutter/material.dart';

import 'package:kubenav/models/cluster_provider.dart';
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/services/providers/aws_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/settings/providers/settings_awssso_multiple_providers_select.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

class SettingsAWSSSOMultipleProviders extends StatefulWidget {
  const SettingsAWSSSOMultipleProviders({
    Key? key,
  }) : super(key: key);

  @override
  State<SettingsAWSSSOMultipleProviders> createState() =>
      _SettingsAWSSSOMultipleProvidersState();
}

class _SettingsAWSSSOMultipleProvidersState
    extends State<SettingsAWSSSOMultipleProviders> {
  final _providerConfigFormKey = GlobalKey<FormState>();
  final _startURLController = TextEditingController();
  String _ssoRegion = 'us-east-1';
  AWSSSOConfig? _awsSSOConfig;
  bool _isLoading = false;

  /// [_validator] is used to validate all the required fields. If they are
  /// missing the validation of the form will fail.
  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    return null;
  }

  Future<void> _startSSOFlow() async {
    try {
      final ssoConfig = await AWSService().getSSOConfig(
        _ssoRegion,
        _startURLController.text,
      );

      Logger.log(
        'SettingsAWSSSOMultipleProviders _startSSOFlow',
        'SSO config was returned',
        ssoConfig,
      );
      setState(() {
        _awsSSOConfig = ssoConfig;
      });
      if (mounted) {
        showSnackbar(
          context,
          'Sing in completed',
          'You can now click on the verify button',
        );
      }
    } catch (err) {
      Logger.log(
        'SettingsAWSSSOMultipleProviders _startSSOFlow',
        'Could not get SSO configuration',
        err,
      );
      showSnackbar(
        context,
        'Could not get SSO configuration',
        err.toString(),
      );
    }
  }

  Future<void> _verifyDevice() async {
    try {
      await openUrl(_awsSSOConfig!.device!.verificationUriComplete!);
    } catch (err) {
      Logger.log(
        'SettingsAWSSSOMultipleProviders _verifyDevice',
        'Could not verify device',
        err,
      );
      showSnackbar(
        context,
        'Could not verify device',
        err.toString(),
      );
    }
  }

  /// [_loadAccounts] loads all the AWS SSO accounts a user has access to
  /// including there roles. If we are able to get these information we show
  /// the [SettingsAWSSSOMultipleProvidersSelect] widget in the next step, where
  /// the user can select the accounts and roles he wants to add to the app.
  Future<void> _loadAccounts(BuildContext context) async {
    try {
      if (_providerConfigFormKey.currentState != null &&
          _providerConfigFormKey.currentState!.validate()) {
        setState(() {
          _isLoading = true;
        });
        final accounts = await AWSService().getSSOAccounts(
          _ssoRegion,
          _awsSSOConfig!.client!.clientId!,
          _awsSSOConfig!.client!.clientSecret!,
          _awsSSOConfig!.device!.deviceCode!,
        );

        setState(() {
          _isLoading = false;
        });
        if (mounted) {
          Navigator.pop(context);
          showModal(
            context,
            SettingsAWSSSOMultipleProvidersSelect(
              startURL: _startURLController.text,
              ssoRegion: _ssoRegion,
              ssoConfig: _awsSSOConfig!,
              accounts: accounts,
            ),
          );
        }
      }
    } catch (err) {
      setState(() {
        _isLoading = false;
      });
      showSnackbar(
        context,
        'Could not load accounts and roles',
        err.toString(),
      );
    }
  }

  @override
  void dispose() {
    _startURLController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: ClusterProviderType.awssso.title(),
      subtitle: ClusterProviderType.awssso.subtitle(),
      icon: ClusterProviderType.awssso.icon(),
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: 'Load Accounts and Roles',
      actionPressed: () {
        _loadAccounts(context);
      },
      actionIsLoading: _isLoading,
      child: Form(
        key: _providerConfigFormKey,
        child: ListView(
          shrinkWrap: false,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
                controller: _startURLController,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Start URL',
                ),
                validator: _validator,
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
                  const Text('SSO Region'),
                  DropdownButton(
                    value: _ssoRegion,
                    underline: Container(
                      height: 2,
                      color: theme(context).colorPrimary,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        _ssoRegion = newValue ?? '';
                      });
                    },
                    items: awsRegions.map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            color: theme(context).colorTextPrimary,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme(context).colorPrimary,
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      Constants.sizeBorderRadius,
                    ),
                  ),
                ),
                onPressed: _startSSOFlow,
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
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme(context).colorPrimary,
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      Constants.sizeBorderRadius,
                    ),
                  ),
                ),
                onPressed: _awsSSOConfig == null ? null : _verifyDevice,
                child: Text(
                  'Verify',
                  style: primaryTextStyle(
                    context,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
