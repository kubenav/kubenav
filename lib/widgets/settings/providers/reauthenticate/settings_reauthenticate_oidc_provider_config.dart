import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/models/cluster_provider.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/services/providers/oidc_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';

class SettingsReauthenticateOIDC extends StatefulWidget {
  const SettingsReauthenticateOIDC({super.key});

  @override
  State<SettingsReauthenticateOIDC> createState() =>
      _SettingsReauthenticateOIDCState();
}

class _SettingsReauthenticateOIDCState
    extends State<SettingsReauthenticateOIDC> {
  late ClusterProvider? _provider;
  final _codeController = TextEditingController();
  final _stateController = TextEditingController();
  String _verifier = '';

  Future<void> _signIn() async {
    try {
      final oidcResponse = await OIDCService().getLink(
        _provider?.oidc?.discoveryURL ?? '',
        _provider?.oidc?.clientID ?? '',
        _provider?.oidc?.clientSecret ?? '',
        _provider?.oidc?.certificateAuthority ?? '',
        _provider?.oidc?.scopes ?? '',
        _provider?.oidc?.redirectURL ?? '',
        _provider?.oidc?.pkceMethod ?? '',
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
        'SettingsReauthenticateOIDC _signIn',
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

  Future<void> _getCredentials() async {
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: false,
    );

    try {
      final oidcResponse = await OIDCService().getRefreshToken(
        _provider?.oidc?.discoveryURL ?? '',
        _provider?.oidc?.clientID ?? '',
        _provider?.oidc?.clientSecret ?? '',
        _provider?.oidc?.certificateAuthority ?? '',
        _provider?.oidc?.scopes ?? '',
        _provider?.oidc?.redirectURL ?? '',
        _provider?.oidc?.pkceMethod ?? '',
        _codeController.text,
        _verifier,
        _provider?.oidc?.useAccessToken ?? false,
      );

      _provider!.oidc!.idToken = oidcResponse.idToken;
      _provider!.oidc!.refreshToken = oidcResponse.refreshToken;
      _provider!.oidc!.code = _codeController.text;
      await clustersRepository.editProvider(_provider!);

      if (mounted) {
        showSnackbar(
          context,
          'Provider Configuration Saved',
          'Refresh the view to use the new credentials',
        );
      }
    } catch (err) {
      Logger.log(
        'SettingsReauthenticateOIDC _signIn',
        'Failed to Get Credentials',
        err,
      );
      if (mounted) {
        showSnackbar(
          context,
          'Failed to Get Credentials',
          err.toString(),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
        context,
        listen: false,
      );

      final cluster = clustersRepository.getCluster(
        clustersRepository.activeClusterId,
      );
      if (cluster != null) {
        _provider = clustersRepository.getProvider(cluster.clusterProviderId);
      } else {
        _provider = null;
      }

      _stateController.text = generateRandomString(6);
    });
  }

  @override
  void dispose() {
    _codeController.dispose();
    _stateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Constants.spacingSmall,
            horizontal: Constants.spacingSmall,
          ),
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
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Constants.spacingSmall,
            horizontal: Constants.spacingSmall,
          ),
          child: ElevatedButton(
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
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Constants.spacingSmall,
            horizontal: Constants.spacingSmall,
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
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Constants.spacingSmall,
            horizontal: Constants.spacingSmall,
          ),
          child: ElevatedButton(
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
            onPressed: _codeController.text == '' ? null : _getCredentials,
            child: Text(
              'Get Credentials',
              style: primaryTextStyle(
                context,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
