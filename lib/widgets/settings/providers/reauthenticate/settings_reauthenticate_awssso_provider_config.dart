import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/models/cluster_provider.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/services/providers/aws_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/showmodal.dart';

class SettingsReauthenticateAWSSSO extends StatefulWidget {
  const SettingsReauthenticateAWSSSO({Key? key}) : super(key: key);

  @override
  State<SettingsReauthenticateAWSSSO> createState() =>
      _SettingsReauthenticateAWSSSOState();
}

class _SettingsReauthenticateAWSSSOState
    extends State<SettingsReauthenticateAWSSSO> {
  late ClusterProvider? _provider;
  AWSSSOConfig? _awsSSOConfig;
  bool _verified = false;
  AWSSSOCredentials? _awsSSOCredentials;

  void _startSSOFlow() async {
    try {
      final ssoConfig = await AWSService().getSSOConfig(
        _provider!.awssso!.ssoRegion ?? '',
        _provider!.awssso!.startURL ?? '',
      );

      Logger.log(
        'SettingsReauthenticateAWSSSO _startSSOFlow',
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
        'SettingsReauthenticateAWSSSO _startSSOFlow',
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

  void _verifyDevice() async {
    try {
      await openUrl(_awsSSOConfig!.device!.verificationUriComplete!);
      setState(() {
        _verified = true;
      });
    } catch (err) {
      Logger.log(
        'SettingsReauthenticateAWSSSO _verifyDevice',
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

  Future<void> _getSSOCredentials() async {
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: false,
    );

    try {
      final ssoCredentials = await AWSService().getSSOToken(
        _provider!.awssso!.accountID ?? '',
        _provider!.awssso!.roleName ?? '',
        _provider!.awssso!.ssoRegion ?? '',
        _awsSSOConfig?.client?.clientId ?? '',
        _awsSSOConfig?.client?.clientSecret ?? '',
        _awsSSOConfig?.device?.deviceCode ?? '',
        '',
        0,
      );

      Logger.log(
        'SettingsReauthenticateAWSSSO _getSSOCredentials',
        'SSO config was returned',
        ssoCredentials,
      );

      setState(() {
        _awsSSOCredentials = ssoCredentials;
      });

      _provider!.awssso!.ssoConfig = _awsSSOConfig;
      _provider!.awssso!.ssoCredentials = _awsSSOCredentials;
      await clustersRepository.editProvider(_provider!);

      if (mounted) {
        showSnackbar(
          context,
          'Provider configuration saved',
          'Refresh the view to use the new credentials',
        );
      }
    } catch (err) {
      Logger.log(
        'SettingsReauthenticateAWSSSO _startSSOFlow',
        'Could not get SSO credentials',
        err,
      );
      showSnackbar(
        context,
        'Could not get SSO credentials',
        err.toString(),
      );
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
    });
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
            horizontal: Constants.spacingSmall,
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
            onPressed: _verifyDevice,
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
            horizontal: Constants.spacingSmall,
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
            onPressed: _getSSOCredentials,
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
    );
  }
}
