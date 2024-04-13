import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import 'package:kubenav/models/cluster_provider.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/services/providers/aws_service.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/settings/clusters/settings_reuse_provider_config_actions.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';

/// The [SelectedAWSSSOAccount] model is used for the selected accounts and
/// roles of an user. It contains the same information as the [AWSSSOAccount]
/// model, but only contains one role, so that we can identify the selected
/// roles in the [SettingsAWSSSOMultipleProvidersSelect] widget.
class SelectedAWSSSOAccount {
  String? accountId;
  String? accountName;
  String? role;
  String? accessToken;
  int? accessTokenExpire;

  SelectedAWSSSOAccount({
    required this.accountId,
    required this.accountName,
    required this.role,
    required this.accessToken,
    required this.accessTokenExpire,
  });
}

/// The [SettingsAWSSSOMultipleProvidersSelect] widget allows a user to select
/// a list of AWS SSO accounts and roles, which should be added to the app.
class SettingsAWSSSOMultipleProvidersSelect extends StatefulWidget {
  const SettingsAWSSSOMultipleProvidersSelect({
    super.key,
    required this.startURL,
    required this.ssoRegion,
    required this.ssoConfig,
    required this.accounts,
  });

  final String startURL;
  final String ssoRegion;
  final AWSSSOConfig ssoConfig;
  final List<AWSSSOAccount> accounts;

  @override
  State<SettingsAWSSSOMultipleProvidersSelect> createState() =>
      _SettingsAWSSSOMultipleProvidersSelectState();
}

class _SettingsAWSSSOMultipleProvidersSelectState
    extends State<SettingsAWSSSOMultipleProvidersSelect> {
  List<SelectedAWSSSOAccount> _selectedAccounts = [];
  bool _isLoading = false;

  /// [_addProviders] adds the users [_selectedAccounts] to our internal list of
  /// cluster providers. Before each account is added we also have to get the
  /// sso credentials for this account, so that we can use the account to get a
  /// the list of Kubernetes clusters from the AWS API.
  Future<void> _addProviders() async {
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: false,
    );

    try {
      setState(() {
        _isLoading = true;
      });
      for (final account in _selectedAccounts) {
        final ssoCredentials = await AWSService().getSSOToken(
          account.accountId ?? '',
          account.role ?? '',
          widget.ssoRegion,
          widget.ssoConfig.client!.clientId!,
          widget.ssoConfig.client!.clientSecret!,
          widget.ssoConfig.device!.deviceCode!,
          account.accessToken ?? '',
          account.accessTokenExpire ?? 0,
        );

        final provider = ClusterProvider(
          id: const Uuid().v4(),
          name:
              '${account.accountName} (${account.accountId}) - ${account.role}',
          type: ClusterProviderType.awssso,
          awssso: ClusterProviderAWSSSO(
            startURL: widget.startURL,
            accountID: account.accountId,
            roleName: account.role,
            ssoRegion: widget.ssoRegion,
            // NOTE: Currently we are using the provided SSO region also for the
            // cluster region. This may not be perfect but regarding
            // https://github.com/kubenav/kubenav/issues/490#issuecomment-1421430202
            // this seems to be the most comman use case. The region can still
            // be changed manually after the provider is added in the provider
            // settings.
            region: widget.ssoRegion,
            ssoConfig: widget.ssoConfig,
            ssoCredentials: ssoCredentials,
          ),
        );
        await clustersRepository.addProvider(provider);
      }

      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        Navigator.pop(context);
        showActions(
          context,
          const SettingsReuseProviderActions(
            providerType: ClusterProviderType.awssso,
          ),
        );
      }
    } catch (err) {
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        showSnackbar(
          context,
          'Could not add providers',
          err.toString(),
        );
      }
    }
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
      actionText: 'Add Providers',
      actionPressed: () {
        _addProviders();
      },
      actionIsLoading: _isLoading,
      child: ListView(
        children: [
          ...List.generate(
            widget.accounts.length,
            (accountIndex) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: Constants.spacingSmall,
                      bottom: Constants.spacingSmall,
                      left: Constants.spacingExtraSmall,
                      right: Constants.spacingExtraSmall,
                    ),
                    child: Text(
                      '${widget.accounts[accountIndex].accountName} (${widget.accounts[accountIndex].accountId})',
                      style: primaryTextStyle(context),
                    ),
                  ),
                  ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ...List.generate(
                        widget.accounts[accountIndex].roles?.length ?? 0,
                        (roleIndex) {
                          return Container(
                            margin: const EdgeInsets.only(
                              top: Constants.spacingSmall,
                              bottom: Constants.spacingSmall,
                              left: Constants.spacingExtraSmall,
                              right: Constants.spacingExtraSmall,
                            ),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: theme(context).shadow,
                                  blurRadius: Constants.sizeBorderBlurRadius,
                                  spreadRadius:
                                      Constants.sizeBorderSpreadRadius,
                                  offset: const Offset(0.0, 0.0),
                                ),
                              ],
                              color: theme(context).card,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(Constants.sizeBorderRadius),
                              ),
                            ),
                            child: CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              value: _selectedAccounts
                                      .where(
                                        (a) =>
                                            a.accountId ==
                                                widget.accounts[accountIndex]
                                                    .accountId &&
                                            a.role ==
                                                widget.accounts[accountIndex]
                                                    .roles![roleIndex],
                                      )
                                      .toList()
                                      .length ==
                                  1,
                              onChanged: (bool? value) {
                                if (value == true) {
                                  setState(() {
                                    _selectedAccounts.add(
                                      SelectedAWSSSOAccount(
                                        accountId: widget
                                            .accounts[accountIndex].accountId,
                                        accountName: widget
                                            .accounts[accountIndex].accountName,
                                        role: widget.accounts[accountIndex]
                                            .roles![roleIndex],
                                        accessToken: widget
                                            .accounts[accountIndex].accessToken,
                                        accessTokenExpire: widget
                                            .accounts[accountIndex]
                                            .accessTokenExpire,
                                      ),
                                    );
                                  });
                                }
                                if (value == false) {
                                  setState(() {
                                    _selectedAccounts = _selectedAccounts
                                        .where(
                                          (a) => !(a.accountId ==
                                                  widget.accounts[accountIndex]
                                                      .accountId &&
                                              a.role ==
                                                  widget.accounts[accountIndex]
                                                      .roles![roleIndex]),
                                        )
                                        .toList();
                                  });
                                }
                              },
                              title: Text(
                                Characters(
                                  widget
                                      .accounts[accountIndex].roles![roleIndex],
                                )
                                    .replaceAll(
                                      Characters(''),
                                      Characters('\u{200B}'),
                                    )
                                    .toString(),
                                style: noramlTextStyle(
                                  context,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
