import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import 'package:kubenav/models/cluster_provider.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/services/providers/aws_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/settings/clusters/settings_add_cluster_awssso.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

class SettingsAWSSSOProvider extends StatefulWidget {
  const SettingsAWSSSOProvider({
    super.key,
    required this.provider,
  });

  final ClusterProvider? provider;

  @override
  State<SettingsAWSSSOProvider> createState() => _SettingsAWSSSOProviderState();
}

class _SettingsAWSSSOProviderState extends State<SettingsAWSSSOProvider> {
  final _providerConfigFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _startURLController = TextEditingController();
  final _accountIDController = TextEditingController();
  final _roleNameController = TextEditingController();
  String _ssoRegion = 'us-east-1';
  String _region = 'us-east-1';
  AWSSSOConfig? _awsSSOConfig;
  bool _verified = false;
  AWSSSOCredentials? _awsSSOCredentials;
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
        'SettingsAWSSSOProvider _startSSOFlow',
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
        'SettingsAWSSSOProvider _startSSOFlow',
        'Could not get SSO configuration',
        err,
      );
      if (!context.mounted) return;
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
      setState(() {
        _verified = true;
      });
    } catch (err) {
      Logger.log(
        'SettingsAWSSSOProvider _verifyDevice',
        'Could not verify device',
        err,
      );
      if (!context.mounted) return;
      showSnackbar(
        context,
        'Could not verify device',
        err.toString(),
      );
    }
  }

  void _getSSOCredentials() async {
    try {
      final ssoCredentials = await AWSService().getSSOToken(
        _accountIDController.text,
        _roleNameController.text,
        _ssoRegion,
        _awsSSOConfig!.client!.clientId!,
        _awsSSOConfig!.client!.clientSecret!,
        _awsSSOConfig!.device!.deviceCode!,
        '',
        0,
      );

      Logger.log(
        'SettingsAWSSSOProvider _getSSOCredentials',
        'SSO config was returned',
        ssoCredentials,
      );
      setState(() {
        _awsSSOCredentials = ssoCredentials;
      });
      if (mounted) {
        showSnackbar(
          context,
          'Credentials are created',
          'You can now click on the save button',
        );
      }
    } catch (err) {
      Logger.log(
        'SettingsAWSSSOProvider _getSSOCredentials',
        'Could not get SSO credentials',
        err,
      );
      if (!context.mounted) return;
      showSnackbar(
        context,
        'Could not get SSO credentials',
        err.toString(),
      );
    }
  }

  Future<void> _saveProvider(BuildContext context) async {
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: false,
    );

    try {
      if (_providerConfigFormKey.currentState != null &&
          _providerConfigFormKey.currentState!.validate()) {
        setState(() {
          _isLoading = true;
        });
        if (widget.provider == null) {
          final provider = ClusterProvider(
            id: const Uuid().v4(),
            name: _nameController.text,
            type: ClusterProviderType.awssso,
            awssso: ClusterProviderAWSSSO(
              startURL: _startURLController.text,
              accountID: _accountIDController.text,
              roleName: _roleNameController.text,
              ssoRegion: _ssoRegion,
              region: _region,
              ssoConfig: _awsSSOConfig!,
              ssoCredentials: _awsSSOCredentials!,
            ),
          );
          await clustersRepository.addProvider(provider);

          setState(() {
            _isLoading = false;
          });
          if (mounted) {
            Navigator.pop(context);
            showModal(
              context,
              SettingsAddClusterAWSSSO(
                provider: provider,
              ),
            );
          }
        } else {
          final provider = widget.provider;
          provider!.name = _nameController.text;
          provider.awssso!.startURL = _startURLController.text;
          provider.awssso!.accountID = _accountIDController.text;
          provider.awssso!.roleName = _roleNameController.text;
          provider.awssso!.ssoRegion = _ssoRegion;
          provider.awssso!.region = _region;
          provider.awssso!.ssoConfig = _awsSSOConfig;
          provider.awssso!.ssoCredentials = _awsSSOCredentials;
          await clustersRepository.editProvider(provider);

          setState(() {
            _isLoading = false;
          });
          if (mounted) {
            Navigator.pop(context);
          }
        }
      }
    } catch (err) {
      setState(() {
        _isLoading = false;
      });
      if (!context.mounted) return;
      showSnackbar(
        context,
        'Could not add provider configuration',
        err.toString(),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.provider != null && widget.provider!.awssso != null) {
      _nameController.text = widget.provider!.name!;
      _startURLController.text = widget.provider!.awssso!.startURL ?? '';
      _accountIDController.text = widget.provider!.awssso!.accountID ?? '';
      _roleNameController.text = widget.provider!.awssso!.roleName ?? '';
      _ssoRegion = widget.provider!.awssso!.ssoRegion ?? '';
      _region = widget.provider!.awssso!.region ?? '';
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _startURLController.dispose();
    _accountIDController.dispose();
    _roleNameController.dispose();
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
      actionText: widget.provider == null ? 'Save and add cluster(s)' : 'Save',
      actionPressed: () {
        _saveProvider(context);
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
                controller: _nameController,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
                validator: _validator,
              ),
            ),
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
              child: TextFormField(
                controller: _accountIDController,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Account ID',
                ),
                validator: _validator,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
                controller: _roleNameController,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Role Name',
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Region'),
                  DropdownButton(
                    value: _region,
                    underline: Container(
                      height: 2,
                      color: theme(context).colorPrimary,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        _region = newValue ?? '';
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
                onPressed: _awsSSOConfig == null || !_verified
                    ? null
                    : _getSSOCredentials,
                child: Text(
                  'Get Credentials',
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
