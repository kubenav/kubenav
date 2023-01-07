import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import 'package:kubenav/models/cluster_provider.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/services/providers/google_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/settings/clusters/settings_add_cluster_google.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

class SettingsGoogleProvider extends StatefulWidget {
  const SettingsGoogleProvider({
    Key? key,
    required this.provider,
  }) : super(key: key);

  final ClusterProvider? provider;

  @override
  State<SettingsGoogleProvider> createState() => _SettingsGoogleProviderState();
}

class _SettingsGoogleProviderState extends State<SettingsGoogleProvider> {
  final _providerConfigFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _clientIDController = TextEditingController();
  final _clientSecretController = TextEditingController();
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
          'https://accounts.google.com/o/oauth2/v2/auth?client_id=${_clientIDController.text}&redirect_uri=${Constants.googleRedirectURI}&response_type=code&scope=https://www.googleapis.com/auth/cloud-platform&access_type=offline&include_granted_scopes=true');
    } catch (err) {
      Logger.log(
        'SettingsGoogleProvider _signIn',
        'Could not open sign in url',
        err,
      );
      showSnackbar(
        context,
        'Could not open sign in url',
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
      Logger.log(
        'SettingsGoogleProvider _saveProvider',
        'Could not save provider configuration',
        err,
      );
      setState(() {
        _isLoading = false;
      });
      showSnackbar(
        context,
        'Could not save provider configuration',
        err.toString(),
      );
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
      _codeController.text = widget.provider!.google!.code ?? '';
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _clientIDController.dispose();
    _clientSecretController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: ClusterProviderType.google.title(),
      subtitle: ClusterProviderType.google.subtitle(),
      icon: ClusterProviderType.google.image54x54(),
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
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
                onPressed: _signIn,
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
            ),
          ],
        ),
      ),
    );
  }
}
