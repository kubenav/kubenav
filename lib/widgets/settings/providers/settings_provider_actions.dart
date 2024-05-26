import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/models/cluster_provider.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/utils/themes.dart';
import 'package:kubenav/widgets/settings/providers/settings_aws_provider_config.dart';
import 'package:kubenav/widgets/settings/providers/settings_awssso_provider_config.dart';
import 'package:kubenav/widgets/settings/providers/settings_azure_provider_config.dart';
import 'package:kubenav/widgets/settings/providers/settings_digitalocean_provider_config.dart';
import 'package:kubenav/widgets/settings/providers/settings_google_provider_config.dart';
import 'package:kubenav/widgets/settings/providers/settings_oidc_provider_config.dart';
import 'package:kubenav/widgets/settings/providers/settings_rancher_provider_config.dart';
import 'package:kubenav/widgets/shared/app_actions_widget.dart';

/// [buildProviderModal] returns a widget which can be displayed in a modal,
/// to modify the configuration of the provider given via the
/// [provider] parameter.
Widget buildProviderModal(ClusterProvider provider) {
  switch (provider.type) {
    case ClusterProviderType.aws:
      return SettingsAWSProvider(
        provider: provider,
      );
    case ClusterProviderType.awssso:
      return SettingsAWSSSOProvider(
        provider: provider,
      );
    case ClusterProviderType.azure:
      return SettingsAzureProvider(
        provider: provider,
      );
    case ClusterProviderType.digitalocean:
      return SettingsDigitalOceanProvider(
        provider: provider,
      );
    case ClusterProviderType.google:
      return SettingsGoogleProvider(
        provider: provider,
      );
    case ClusterProviderType.oidc:
      return SettingsOIDCProvider(
        provider: provider,
      );
    case ClusterProviderType.rancher:
      return SettingsRancherProvider(
        provider: provider,
      );
    default:
      return Container();
  }
}

/// The [SettingsProviderActions] returns a list of actions to edit or delete an
/// existing provider. If the user selects the edit item, we show a modal with
/// the provider configuration, which can then be modified by the user. If the
/// user selects the delete item, we remove the provider, when it is not used by
/// a cluster.
class SettingsProviderActions extends StatelessWidget {
  const SettingsProviderActions({
    super.key,
    required this.provider,
  });

  final ClusterProvider provider;

  /// [_deleteProvider] deletes the given provider. For the success and the
  /// error case we show the user an message, to inform the user about the
  /// result of the operation.
  Future<void> _deleteProvider(BuildContext context) async {
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: false,
    );

    try {
      await clustersRepository.deleteProvider(provider.id!);
      if (context.mounted) {
        Navigator.pop(context);
        showSnackbar(
          context,
          'Provider Deleted',
          'The provider ${provider.name} was deleted',
        );
      }
    } catch (err) {
      if (context.mounted) {
        Navigator.pop(context);
        showSnackbar(
          context,
          'Failed to Delete Provider',
          err.toString(),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppActionsWidget(
      actions: [
        AppActionsWidgetAction(
          title: 'Edit',
          color: Theme.of(context).colorScheme.primary,
          onTap: () {
            Navigator.pop(context);
            showModal(context, buildProviderModal(provider));
          },
        ),
        AppActionsWidgetAction(
          title: 'Delete',
          color: Theme.of(context).extension<CustomColors>()!.error,
          onTap: () {
            _deleteProvider(context);
          },
        ),
      ],
    );
  }
}
