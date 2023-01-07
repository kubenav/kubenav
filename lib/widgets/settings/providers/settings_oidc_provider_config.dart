import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import 'package:kubenav/models/cluster_provider.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/services/providers/oidc_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/settings/clusters/settings_add_cluster_oidc.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

class SettingsOIDCProvider extends StatefulWidget {
  const SettingsOIDCProvider({
    Key? key,
    required this.provider,
  }) : super(key: key);

  final ClusterProvider? provider;

  @override
  State<SettingsOIDCProvider> createState() => _SettingsOIDCProviderState();
}

class _SettingsOIDCProviderState extends State<SettingsOIDCProvider> {
  final _providerConfigFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _discoveryURLController = TextEditingController();
  final _clientIDController = TextEditingController();
  String _pkceMethod = '';
  final _clientSecretController = TextEditingController();
  final _scopesController = TextEditingController();
  final _certificateAuthorityController = TextEditingController();
  final _refreshTokenController = TextEditingController();
  final _codeController = TextEditingController();
  String _verifier = '';
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
      final oidcResponse = await OIDCService().getLink(
        _discoveryURLController.text,
        _clientIDController.text,
        _clientSecretController.text,
        _certificateAuthorityController.text,
        _scopesController.text,
        Constants.oidcRedirectURI,
        _pkceMethod,
      );

      if (oidcResponse.url != null) {
        if (oidcResponse.verifier != null) {
          setState(() {
            _verifier = oidcResponse.verifier!;
          });
        }

        await openUrl(oidcResponse.url!);
      }
    } catch (err) {
      Logger.log(
        'SettingsOIDCProvider signIn',
        'Could not open sign in url',
        err,
      );
      showSnackbar(
        context,
        'Could not generate and open sign in url',
        err.toString(),
      );
    }
  }

  Future<void> _saveProvider(BuildContext context) async {
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: false,
    );

    if (_providerConfigFormKey.currentState != null &&
        _providerConfigFormKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      try {
        String tmpRefreshToken = '';
        String tmpIDToken = '';

        if (_refreshTokenController.text == '') {
          final oidcResponse = await OIDCService().getRefreshToken(
            _discoveryURLController.text,
            _clientIDController.text,
            _clientSecretController.text,
            _certificateAuthorityController.text,
            _scopesController.text,
            Constants.oidcRedirectURI,
            _pkceMethod,
            _codeController.text,
            _verifier,
          );

          Logger.log(
            'SettingsOIDCProvider _saveProvider',
            'getRefreshToken response',
            oidcResponse,
          );

          tmpRefreshToken = oidcResponse.refreshToken ?? '';
          tmpIDToken = oidcResponse.idToken ?? '';
        } else {
          final oidcResponse = await OIDCService().getAccessToken(
            _discoveryURLController.text,
            _clientIDController.text,
            _clientSecretController.text,
            _certificateAuthorityController.text,
            _scopesController.text,
            Constants.oidcRedirectURI,
            _refreshTokenController.text,
          );

          Logger.log(
            'SettingsOIDCProvider _saveProvider',
            'getAccessToken response',
            oidcResponse,
          );

          tmpRefreshToken = _refreshTokenController.text;
          tmpIDToken = oidcResponse.idToken ?? '';
        }

        if (widget.provider == null) {
          final provider = ClusterProvider(
            id: const Uuid().v4(),
            name: _nameController.text,
            type: ClusterProviderType.oidc,
            oidc: ClusterProviderOIDC(
              discoveryURL: _discoveryURLController.text,
              clientID: _clientIDController.text,
              clientSecret: _clientSecretController.text,
              certificateAuthority: _certificateAuthorityController.text,
              scopes: _scopesController.text,
              pkceMethod: _pkceMethod,
              verifier: _verifier,
              code: _codeController.text,
              idToken: tmpIDToken,
              refreshToken: tmpRefreshToken,
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
              SettingsAddClusterOIDC(
                provider: provider,
              ),
            );
          }
        } else {
          final provider = widget.provider!;
          provider.name = _nameController.text;
          provider.oidc!.discoveryURL = _discoveryURLController.text;
          provider.oidc!.clientID = _clientIDController.text;
          provider.oidc!.clientSecret = _clientSecretController.text;
          provider.oidc!.certificateAuthority =
              _certificateAuthorityController.text;
          provider.oidc!.scopes = _scopesController.text;
          provider.oidc!.pkceMethod = _pkceMethod;
          provider.oidc!.verifier = _verifier;
          provider.oidc!.code = _codeController.text;
          provider.oidc!.idToken = tmpIDToken;
          provider.oidc!.refreshToken = tmpRefreshToken;
          await clustersRepository.editProvider(provider);

          setState(() {
            _isLoading = false;
          });
          if (mounted) {
            Navigator.pop(context);
          }
        }
      } catch (err) {
        Logger.log(
          'OIDCProviderConfigController _saveProvider',
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
  }

  Widget _buildPkceMethod() {
    if (_pkceMethod == '') {
      return Padding(
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
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.provider != null && widget.provider!.oidc != null) {
      _nameController.text = widget.provider?.name ?? '';
      _discoveryURLController.text = widget.provider?.oidc?.discoveryURL ?? '';
      _clientIDController.text = widget.provider?.oidc?.clientID ?? '';
      _pkceMethod = widget.provider?.oidc?.pkceMethod ?? '';
      _clientSecretController.text = widget.provider?.oidc?.clientSecret ?? '';
      _scopesController.text = widget.provider?.oidc?.scopes ?? '';
      _certificateAuthorityController.text =
          widget.provider?.oidc?.certificateAuthority ?? '';
      _refreshTokenController.text = widget.provider?.oidc?.refreshToken ?? '';
      _codeController.text = widget.provider?.oidc?.code ?? '';
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _discoveryURLController.dispose();
    _clientIDController.dispose();
    _clientSecretController.dispose();
    _scopesController.dispose();
    _certificateAuthorityController.dispose();
    _refreshTokenController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: ClusterProviderType.oidc.title(),
      subtitle: ClusterProviderType.oidc.subtitle(),
      icon: ClusterProviderType.oidc.image54x54(),
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
                controller: _discoveryURLController,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Discovery URL',
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('PKCE Method'),
                  DropdownButton(
                    value: _pkceMethod,
                    underline: Container(
                      height: 2,
                      color: theme(context).colorPrimary,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        _pkceMethod = newValue ?? '';
                      });
                    },
                    items: [
                      '',
                      'S256',
                    ].map((value) {
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
                  )
                ],
              ),
            ),
            _buildPkceMethod(),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
                controller: _scopesController,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Scopes (optional)',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
                controller: _certificateAuthorityController,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Certificate Authority (optional)',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
              ),
              child: TextFormField(
                controller: _refreshTokenController,
                keyboardType: TextInputType.text,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Refresh Token (optional)',
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
