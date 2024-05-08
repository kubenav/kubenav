import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import 'package:kubenav/models/cluster_provider.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/providers/google_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/settings/clusters/settings_add_cluster_google.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

class SettingsGoogleProvider extends StatefulWidget {
  const SettingsGoogleProvider({
    super.key,
    required this.provider,
  });

  final ClusterProvider? provider;

  @override
  State<SettingsGoogleProvider> createState() => _SettingsGoogleProviderState();
}

class _SettingsGoogleProviderState extends State<SettingsGoogleProvider> {
  final _providerConfigFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _clientIDController = TextEditingController();
  final _clientSecretController = TextEditingController();
  final _redirectURLController = TextEditingController();
  final _codeController = TextEditingController();
  bool _isLoading = false;

  /// [_validator] is used to validate all the required fields. If they are
  /// missing the validation of the form will fail.
  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    return null;
  }

  Future<void> _signIn() async {
    try {
      await openUrl(
        'https://accounts.google.com/o/oauth2/v2/auth?client_id=${_clientIDController.text}&redirect_uri=${_redirectURLController.text}&response_type=code&scope=https://www.googleapis.com/auth/cloud-platform&access_type=offline&include_granted_scopes=true&prompt=consent',
      );
    } catch (err) {
      Logger.log(
        'SettingsGoogleProvider _signIn',
        'Failed to Open Sign In Url',
        err,
      );
      if (mounted) {
        showSnackbar(
          context,
          'Failed to Open Sign In Url',
          err.toString(),
        );
      }
    }
  }

  Future<void> _saveProvider() async {
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: false,
    );

    try {
      setState(() {
        _isLoading = true;
      });
      final googleTokens = await GoogleService().getTokensFromCode(
        _clientIDController.text,
        _clientSecretController.text,
        _codeController.text,
      );

      if (googleTokens.accessToken != null &&
          googleTokens.expiresIn != null &&
          googleTokens.refreshToken != null) {
        final expires = DateTime.now().millisecondsSinceEpoch +
            googleTokens.expiresIn! * 1000;

        if (widget.provider == null) {
          final provider = ClusterProvider(
            id: const Uuid().v4(),
            name: _nameController.text,
            type: ClusterProviderType.google,
            google: ClusterProviderGoogle(
              clientID: _clientIDController.text,
              clientSecret: _clientSecretController.text,
              code: _codeController.text,
              accessToken: googleTokens.accessToken!,
              accessTokenExpires: expires,
              refreshToken: googleTokens.refreshToken!,
              redirectURL: _redirectURLController.text,
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
              SettingsAddClusterGoogle(
                provider: provider,
              ),
            );
          }
        } else {
          final provider = widget.provider;
          provider!.name = _nameController.text;
          provider.google!.clientID = _clientIDController.text;
          provider.google!.clientSecret = _clientSecretController.text;
          provider.google!.code = _codeController.text;
          provider.google!.accessToken = googleTokens.accessToken!;
          provider.google!.accessTokenExpires = expires;
          provider.google!.refreshToken = googleTokens.refreshToken!;
          provider.google!.redirectURL = _redirectURLController.text;
          await clustersRepository.editProvider(provider);

          setState(() {
            _isLoading = false;
          });
          if (mounted) {
            Navigator.pop(context);
          }
        }
      } else {
        Logger.log(
          'SettingsGoogleProvider _saveProvider',
          'Failed to Get Credentials',
          'Access Token: ${googleTokens.accessToken}, Expires In: ${googleTokens.expiresIn}, Refresh Token: ${googleTokens.refreshToken}',
        );
        setState(() {
          _isLoading = false;
        });

        if (mounted) {
          showSnackbar(
            context,
            'Failed to Get Credentials',
            'Access Token: ${googleTokens.accessToken}, Expires In: ${googleTokens.expiresIn}, Refresh Token: ${googleTokens.refreshToken}',
          );
        }
      }
    } catch (err) {
      Logger.log(
        'SettingsGoogleProvider _saveProvider',
        'Failed to Save Provider Configuration',
        err,
      );
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          'Failed to Save Provider Configuration',
          err.toString(),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.provider != null && widget.provider!.google != null) {
      _nameController.text = widget.provider!.name!;
      _clientIDController.text = widget.provider!.google!.clientID ?? '';
      _clientSecretController.text =
          widget.provider!.google!.clientSecret ?? '';
      _redirectURLController.text =
          widget.provider!.google!.redirectURL ?? Constants.googleRedirectURI;
      _codeController.text = widget.provider!.google!.code ?? '';
    } else {
      _redirectURLController.text = Constants.googleRedirectURI;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _clientIDController.dispose();
    _clientSecretController.dispose();
    _redirectURLController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: ClusterProviderType.google.title(),
      subtitle: ClusterProviderType.google.subtitle(),
      icon: ClusterProviderType.google.icon(),
      closePressed: () {
        Navigator.pop(context);
      },
      actionText: widget.provider == null ? 'Save and Add Cluster(s)' : 'Save',
      actionPressed: () {
        _saveProvider();
      },
      actionIsLoading: _isLoading,
      child: Form(
        key: _providerConfigFormKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: Constants.spacingMiddle,
              bottom: Constants.spacingMiddle,
              left: Constants.spacingMiddle,
              right: Constants.spacingMiddle,
            ),
            child: Column(
              children: [
                TextFormField(
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
                const SizedBox(height: Constants.spacingMiddle),
                TextFormField(
                  controller: _clientIDController,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  enableSuggestions: false,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Client ID',
                  ),
                  validator: _validator,
                ),
                const SizedBox(height: Constants.spacingMiddle),
                TextFormField(
                  controller: _clientSecretController,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  enableSuggestions: false,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Client Secret',
                  ),
                  validator: _validator,
                ),
                const SizedBox(height: Constants.spacingMiddle),
                TextFormField(
                  controller: _redirectURLController,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  enableSuggestions: false,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Redirect URL',
                  ),
                  validator: _validator,
                ),
                const SizedBox(height: Constants.spacingMiddle),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    minimumSize: const Size.fromHeight(40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        Constants.sizeBorderRadius,
                      ),
                    ),
                  ),
                  onPressed: _signIn,
                  child: Text(
                    'Sign In',
                    style: primaryTextStyle(
                      context,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: Constants.spacingMiddle),
                TextFormField(
                  controller: _codeController,
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  enableSuggestions: false,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Code',
                  ),
                  validator: _validator,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
