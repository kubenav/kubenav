import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import 'package:kubenav/models/cluster_provider.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/providers/oidc_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/utils/themes.dart';
import 'package:kubenav/widgets/settings/clusters/settings_add_cluster_oidc.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

class SettingsOIDCProvider extends StatefulWidget {
  const SettingsOIDCProvider({super.key, required this.provider});

  final ClusterProvider? provider;

  @override
  State<SettingsOIDCProvider> createState() => _SettingsOIDCProviderState();
}

class _SettingsOIDCProviderState extends State<SettingsOIDCProvider> {
  final _providerConfigFormKey = GlobalKey<FormState>();
  final _addDefaultScopesTooltipKey = GlobalKey<TooltipState>();
  final _nameController = TextEditingController();
  OIDCFlow _flow = OIDCFlow.standard;
  final _discoveryURLController = TextEditingController();
  final _clientIDController = TextEditingController();
  String _pkceMethod = '';
  final _clientSecretController = TextEditingController();
  final _scopesController = TextEditingController();
  bool _addDefaultScopes = true;
  final _certificateAuthorityController = TextEditingController();
  final _refreshTokenController = TextEditingController();
  final _redirectURLController = TextEditingController();
  final _codeController = TextEditingController();
  final _stateController = TextEditingController();
  String _verifier = '';
  bool _useAccessToken = false;
  bool _isLoading = false;
  OIDCDeviceAuth? _deviceAuthData;

  /// [_validator] is used to validate all the required fields. If they are
  /// missing the validation of the form will fail.
  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    return null;
  }

  /// [_signIn] constructs the sign in url for the OIDC provider and opens it in
  /// the browser via the [openUrl] function. This is required to get the `code`
  /// for the [_codeController] in the standard authentication flow.
  Future<void> _signIn() async {
    try {
      final oidcResponse = await OIDCService().getLink(
        _discoveryURLController.text,
        _clientIDController.text,
        _clientSecretController.text,
        _certificateAuthorityController.text,
        _scopesController.text,
        _addDefaultScopes,
        _redirectURLController.text,
        _pkceMethod,
        _stateController.text,
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
        'Failed to Open Sign In Url',
        err,
      );
      if (mounted) {
        showSnackbar(context, 'Failed to Open Sign In Url', err.toString());
      }
    }
  }

  /// [_initDeviceFlow] initializes the device flow for the OIDC provider. It
  /// fetches the device code and user code and saves the data in the
  /// [_deviceAuthData] state.
  Future<void> _initDeviceFlow() async {
    try {
      final deviceAuthData = await OIDCService().deviceAuth(
        _discoveryURLController.text,
        _clientIDController.text,
        _certificateAuthorityController.text,
        _scopesController.text,
        _addDefaultScopes,
      );

      setState(() {
        _deviceAuthData = deviceAuthData;
      });
    } catch (err) {
      Logger.log(
        'SettingsOIDCProvider _initDeviceFlow',
        'Failed to Initialize Device Flow',
        err,
      );
      if (mounted) {
        showSnackbar(
          context,
          'Failed to Initialize Device Flow',
          err.toString(),
        );
      }
    }
  }

  /// [_verifyDeviceFlow] opens the verification url for the device flow, so
  /// that the user can verify the device via the provided user code from the
  /// [_initDeviceFlow] function.
  Future<void> _verifyDeviceFlow() async {
    try {
      if (_deviceAuthData?.verificationURI != null) {
        await openUrl(_deviceAuthData!.verificationURI!);
      }
    } catch (err) {
      Logger.log(
        'SettingsOIDCProvider _verfiyDeviceFlow',
        'Failed to Verify Device',
        err,
      );
      if (mounted) {
        showSnackbar(context, 'Failed to Verify Device', err.toString());
      }
    }
  }

  Future<void> _saveProvider() async {
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: false,
    );

    if (_providerConfigFormKey.currentState != null &&
        _providerConfigFormKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      if (_flow == OIDCFlow.device) {
        /// Handle the device flow. For that we have to get a refresh token
        /// via the device code returned in the [_initDeviceFlow] function. The
        /// call will also return an id token, which can then be used to
        /// authorize the user against the Kubernetes API via the OIDC provider.
        try {
          final tmpTokens = await OIDCService().deviceAuthGetRefreshToken(
            _discoveryURLController.text,
            _clientIDController.text,
            _certificateAuthorityController.text,
            _scopesController.text,
            _addDefaultScopes,
            _deviceAuthData?.deviceCode ?? '',
            _useAccessToken,
          );

          if (widget.provider == null) {
            final provider = ClusterProvider(
              id: const Uuid().v4(),
              name: _nameController.text,
              type: ClusterProviderType.oidc,
              oidc: ClusterProviderOIDC(
                flow: _flow,
                discoveryURL: _discoveryURLController.text,
                clientID: _clientIDController.text,
                clientSecret: _clientSecretController.text,
                certificateAuthority: _certificateAuthorityController.text,
                scopes: _scopesController.text,
                addDefaultScopes: _addDefaultScopes,
                pkceMethod: _pkceMethod,
                verifier: _verifier,
                code: _codeController.text,
                idToken: tmpTokens.idToken,
                refreshToken: tmpTokens.refreshToken,
                redirectURL: _redirectURLController.text,
                useAccessToken: _useAccessToken,
              ),
            );
            await clustersRepository.addProvider(provider);

            setState(() {
              _isLoading = false;
            });
            if (mounted) {
              Navigator.pop(context);
              showModal(context, SettingsAddClusterOIDC(provider: provider));
            }
          } else {
            final provider = widget.provider!;
            provider.name = _nameController.text;
            provider.oidc!.flow = _flow;
            provider.oidc!.discoveryURL = _discoveryURLController.text;
            provider.oidc!.clientID = _clientIDController.text;
            provider.oidc!.clientSecret = _clientSecretController.text;
            provider.oidc!.certificateAuthority =
                _certificateAuthorityController.text;
            provider.oidc!.scopes = _scopesController.text;
            provider.oidc!.addDefaultScopes = _addDefaultScopes;
            provider.oidc!.pkceMethod = _pkceMethod;
            provider.oidc!.verifier = _verifier;
            provider.oidc!.code = _codeController.text;
            provider.oidc!.idToken = tmpTokens.idToken;
            provider.oidc!.refreshToken = tmpTokens.refreshToken;
            provider.oidc!.redirectURL = _redirectURLController.text;
            provider.oidc!.useAccessToken = _useAccessToken;
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
      } else {
        /// Handle the standard authentication flow. For that we have to get a
        /// new refresh token when none was provided. If a refresh token was
        /// provided we will use this refresh token to get a new id token, which
        /// can then be used to authenticate the user against the Kubernetes API
        /// via the OIDC provider.
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
              _addDefaultScopes,
              _redirectURLController.text,
              _pkceMethod,
              _codeController.text,
              _verifier,
              _useAccessToken,
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
              _addDefaultScopes,
              _redirectURLController.text,
              _refreshTokenController.text,
              _useAccessToken,
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
                flow: _flow,
                discoveryURL: _discoveryURLController.text,
                clientID: _clientIDController.text,
                clientSecret: _clientSecretController.text,
                certificateAuthority: _certificateAuthorityController.text,
                scopes: _scopesController.text,
                addDefaultScopes: _addDefaultScopes,
                pkceMethod: _pkceMethod,
                verifier: _verifier,
                code: _codeController.text,
                idToken: tmpIDToken,
                refreshToken: tmpRefreshToken,
                redirectURL: _redirectURLController.text,
                useAccessToken: _useAccessToken,
              ),
            );
            await clustersRepository.addProvider(provider);

            setState(() {
              _isLoading = false;
            });
            if (mounted) {
              Navigator.pop(context);
              showModal(context, SettingsAddClusterOIDC(provider: provider));
            }
          } else {
            final provider = widget.provider!;
            provider.name = _nameController.text;
            provider.oidc!.flow = _flow;
            provider.oidc!.discoveryURL = _discoveryURLController.text;
            provider.oidc!.clientID = _clientIDController.text;
            provider.oidc!.clientSecret = _clientSecretController.text;
            provider.oidc!.certificateAuthority =
                _certificateAuthorityController.text;
            provider.oidc!.scopes = _scopesController.text;
            provider.oidc!.addDefaultScopes = _addDefaultScopes;
            provider.oidc!.pkceMethod = _pkceMethod;
            provider.oidc!.verifier = _verifier;
            provider.oidc!.code = _codeController.text;
            provider.oidc!.idToken = tmpIDToken;
            provider.oidc!.refreshToken = tmpRefreshToken;
            provider.oidc!.redirectURL = _redirectURLController.text;
            provider.oidc!.useAccessToken = _useAccessToken;
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
    }
  }

  Widget _buildPkceMethod() {
    if (_pkceMethod == '') {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: Constants.spacingSmall),
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

  List<Widget> _buildDeviceAuth() {
    if (_deviceAuthData != null) {
      return [
        const SizedBox(height: Constants.spacingMiddle),
        const Text(
          'Copy the code shown in the input field from below and click the verify button to verify your device.',
        ),
        const SizedBox(height: Constants.spacingMiddle),
        TextFormField(
          initialValue: _deviceAuthData?.userCode ?? '',
          keyboardType: TextInputType.text,
          autocorrect: false,
          enableSuggestions: false,
          maxLines: 1,
          readOnly: true,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Code',
          ),
        ),
        const SizedBox(height: Constants.spacingMiddle),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            minimumSize: const Size.fromHeight(40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Constants.sizeBorderRadius),
            ),
          ),
          onPressed: _verifyDeviceFlow,
          child: Text(
            'Verify',
            style: primaryTextStyle(
              context,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: Constants.spacingMiddle),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Use Access Token instead of ID Token'),
            Switch(
              activeColor: Theme.of(context).colorScheme.primary,
              onChanged:
                  (val) => {
                    setState(() {
                      _useAccessToken = !_useAccessToken;
                    }),
                  },
              value: _useAccessToken,
            ),
          ],
        ),
      ];
    } else {
      return [Container()];
    }
  }

  /// [_buildFormForFlow] returns the widgets which are required for the
  /// selected [_flow]. This is required, because depending on the selected flow
  /// we need different information from the user.
  List<Widget> _buildFormForFlow() {
    if (_flow == OIDCFlow.device) {
      return [
        const SizedBox(height: Constants.spacingMiddle),
        TextFormField(
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
        const SizedBox(height: Constants.spacingMiddle),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                const Text('Add Default Scopes'),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder:
                          (context) => AlertDialog(
                            title: Text('Add Default Scopes'),
                            content: Text(
                              'Add the "openid" and "offline_access" scopes.',
                            ),
                          ),
                    );
                  },
                  icon: Icon(Icons.info),
                ),
              ],
            ),
            Switch(
              activeColor: Theme.of(context).colorScheme.primary,
              onChanged:
                  (val) => {
                    setState(() {
                      _addDefaultScopes = !_addDefaultScopes;
                    }),
                  },
              value: _addDefaultScopes,
            ),
          ],
        ),
        const SizedBox(height: Constants.spacingMiddle),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            minimumSize: const Size.fromHeight(40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Constants.sizeBorderRadius),
            ),
          ),
          onPressed: _initDeviceFlow,
          child: Text(
            'Initialize Device Flow',
            style: primaryTextStyle(
              context,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        ..._buildDeviceAuth(),
      ];
    }

    return [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: Constants.spacingSmall),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('PKCE Method'),
            DropdownButton(
              value: _pkceMethod,
              underline: Container(
                height: 2,
                color: Theme.of(context).colorScheme.primary,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  _pkceMethod = newValue ?? '';
                });
              },
              items:
                  ['', 'S256'].map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                          color:
                              Theme.of(
                                context,
                              ).extension<CustomColors>()!.textPrimary,
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ],
        ),
      ),
      _buildPkceMethod(),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: Constants.spacingSmall),
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
        padding: const EdgeInsets.symmetric(vertical: Constants.spacingSmall),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                const Text('Add Default Scopes'),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder:
                          (context) => AlertDialog(
                            title: Text('Add Default Scopes'),
                            content: Text(
                              'Add the "openid" and "offline_access" scopes.',
                            ),
                          ),
                    );
                  },
                  icon: Icon(Icons.info),
                ),
              ],
            ),

            Switch(
              activeColor: Theme.of(context).colorScheme.primary,
              onChanged:
                  (val) => {
                    setState(() {
                      _addDefaultScopes = !_addDefaultScopes;
                    }),
                  },
              value: _addDefaultScopes,
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: Constants.spacingSmall),
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
        padding: const EdgeInsets.symmetric(vertical: Constants.spacingSmall),
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
        padding: const EdgeInsets.symmetric(vertical: Constants.spacingSmall),
        child: TextFormField(
          controller: _redirectURLController,
          keyboardType: TextInputType.text,
          autocorrect: false,
          enableSuggestions: false,
          maxLines: 1,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Redirect URL',
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: Constants.spacingSmall),
        child: TextFormField(
          controller: _stateController,
          keyboardType: TextInputType.text,
          enabled: false,
          autocorrect: false,
          enableSuggestions: false,
          maxLines: 1,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'State',
          ),
          validator: _validator,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: Constants.spacingSmall),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Use Access Token instead of ID Token'),
            Switch(
              activeColor: Theme.of(context).colorScheme.primary,
              onChanged:
                  (val) => {
                    setState(() {
                      _useAccessToken = !_useAccessToken;
                    }),
                  },
              value: _useAccessToken,
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: Constants.spacingSmall),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            minimumSize: const Size.fromHeight(40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Constants.sizeBorderRadius),
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
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: Constants.spacingSmall),
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
    ];
  }

  @override
  void initState() {
    super.initState();
    if (widget.provider != null && widget.provider!.oidc != null) {
      _nameController.text = widget.provider?.name ?? '';
      _flow = widget.provider?.oidc?.flow ?? OIDCFlow.standard;
      _discoveryURLController.text = widget.provider?.oidc?.discoveryURL ?? '';
      _clientIDController.text = widget.provider?.oidc?.clientID ?? '';
      _pkceMethod = widget.provider?.oidc?.pkceMethod ?? '';
      _clientSecretController.text = widget.provider?.oidc?.clientSecret ?? '';
      _scopesController.text = widget.provider?.oidc?.scopes ?? '';
      _addDefaultScopes = widget.provider?.oidc?.addDefaultScopes ?? true;
      _certificateAuthorityController.text =
          widget.provider?.oidc?.certificateAuthority ?? '';
      _refreshTokenController.text = widget.provider?.oidc?.refreshToken ?? '';
      _redirectURLController.text =
          widget.provider?.oidc?.redirectURL ?? Constants.oidcRedirectURI;
      _useAccessToken = widget.provider?.oidc?.useAccessToken ?? false;
      _codeController.text = widget.provider?.oidc?.code ?? '';
    } else {
      _redirectURLController.text = Constants.oidcRedirectURI;
    }

    _stateController.text = generateRandomString(12);
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
    _redirectURLController.dispose();
    _codeController.dispose();
    _stateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: ClusterProviderType.oidc.title(),
      subtitle: ClusterProviderType.oidc.subtitle(),
      icon: ClusterProviderType.oidc.icon(),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Authentication Flow'),
                    DropdownButton(
                      value: _flow,
                      underline: Container(
                        height: 2,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      onChanged: (OIDCFlow? newValue) {
                        setState(() {
                          _flow = newValue ?? OIDCFlow.standard;
                        });
                      },
                      items:
                          OIDCFlow.values.map((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(
                                value.pretty(),
                                style: TextStyle(
                                  color:
                                      Theme.of(
                                        context,
                                      ).extension<CustomColors>()!.textPrimary,
                                ),
                              ),
                            );
                          }).toList(),
                    ),
                  ],
                ),
                const SizedBox(height: Constants.spacingMiddle),
                TextFormField(
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
                ..._buildFormForFlow(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
