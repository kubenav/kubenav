import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/models/cluster_provider.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/settings/clusters/settings_add_cluster_aws.dart';
import 'package:kubenav/widgets/settings/clusters/settings_add_cluster_awssso.dart';
import 'package:kubenav/widgets/settings/clusters/settings_add_cluster_azure.dart';
import 'package:kubenav/widgets/settings/clusters/settings_add_cluster_digitalocean.dart';
import 'package:kubenav/widgets/settings/clusters/settings_add_cluster_google.dart';
import 'package:kubenav/widgets/settings/clusters/settings_add_cluster_kubeconfig.dart';
import 'package:kubenav/widgets/settings/clusters/settings_add_cluster_manual.dart';
import 'package:kubenav/widgets/settings/clusters/settings_add_cluster_oidc.dart';
import 'package:kubenav/widgets/settings/clusters/settings_add_cluster_rancher.dart';
import 'package:kubenav/widgets/settings/providers/settings_aws_provider_config.dart';
import 'package:kubenav/widgets/settings/providers/settings_awssso_multiple_providers_config.dart';
import 'package:kubenav/widgets/settings/providers/settings_awssso_provider_config.dart';
import 'package:kubenav/widgets/settings/providers/settings_azure_provider_config.dart';
import 'package:kubenav/widgets/settings/providers/settings_digitalocean_provider_config.dart';
import 'package:kubenav/widgets/settings/providers/settings_google_provider_config.dart';
import 'package:kubenav/widgets/settings/providers/settings_oidc_provider_config.dart';
import 'package:kubenav/widgets/settings/providers/settings_rancher_provider_config.dart';
import 'package:kubenav/widgets/shared/app_actions_widget.dart';

/// The [SettingsReuseProviderActions] widget shows an action menu, with all the
/// configured providers for the provided [providerType]. Next to the existing
/// providers the action menu also contains an item to add a new provider with
/// the provided type.
class SettingsReuseProviderActions extends StatelessWidget {
  const SettingsReuseProviderActions({
    super.key,
    required this.providerType,
  });

  final ClusterProviderType providerType;

  /// [buildExistinModal] returns a widget which can be opened in a modal to
  /// add clusters via an existing provider.
  Widget buildExistinModal(ClusterProvider provider) {
    switch (provider.type) {
      case ClusterProviderType.manual:
        return const SettingsAddClusterManual();
      case ClusterProviderType.kubeconfig:
        return const SettingsAddClusterKubeconfig();
      case ClusterProviderType.aws:
        return SettingsAddClusterAWS(
          provider: provider,
        );
      case ClusterProviderType.awssso:
        return SettingsAddClusterAWSSSO(
          provider: provider,
        );
      case ClusterProviderType.azure:
        return SettingsAddClusterAzure(
          provider: provider,
        );
      case ClusterProviderType.digitalocean:
        return SettingsAddClusterDigitalOcean(
          provider: provider,
        );
      case ClusterProviderType.google:
        return SettingsAddClusterGoogle(
          provider: provider,
        );
      case ClusterProviderType.oidc:
        return SettingsAddClusterOIDC(
          provider: provider,
        );
      case ClusterProviderType.rancher:
        return SettingsAddClusterRancher(
          provider: provider,
        );
      default:
        return const SettingsAddClusterManual();
    }
  }

  /// [buildNewModal] returns a widget which can be shown in a modal to add a
  /// new provider, which can then be used to add a cluster using this provider.
  Widget buildNewModal() {
    switch (providerType) {
      case ClusterProviderType.manual:
        return const SettingsAddClusterManual();
      case ClusterProviderType.kubeconfig:
        return const SettingsAddClusterKubeconfig();
      case ClusterProviderType.aws:
        return const SettingsAWSProvider(
          provider: null,
        );
      case ClusterProviderType.awssso:
        return const SettingsAWSSSOProvider(
          provider: null,
        );
      case ClusterProviderType.azure:
        return const SettingsAzureProvider(
          provider: null,
        );
      case ClusterProviderType.digitalocean:
        return const SettingsDigitalOceanProvider(
          provider: null,
        );
      case ClusterProviderType.google:
        return const SettingsGoogleProvider(
          provider: null,
        );
      case ClusterProviderType.oidc:
        return const SettingsOIDCProvider(
          provider: null,
        );
      case ClusterProviderType.rancher:
        return const SettingsRancherProvider(
          provider: null,
        );
      default:
        return const SettingsAddClusterManual();
    }
  }

  @override
  Widget build(BuildContext context) {
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: true,
    );

    final List<AppActionsWidgetAction> actions = clustersRepository.providers
        .where((p) => p.type == providerType)
        .map(
          (p) => AppActionsWidgetAction(
            title: p.name ?? '',
            color: theme(context).primary,
            onTap: () {
              Navigator.pop(context);
              showModal(context, buildExistinModal(p));
            },
          ),
        )
        .toList();

    actions.add(
      AppActionsWidgetAction(
        title: 'Add Provider',
        color: theme(context).primary,
        onTap: () {
          Navigator.pop(context);
          showModal(context, buildNewModal());
        },
      ),
    );

    /// If a user selected the AWS SSO provider we also have to add an option,
    /// where the user can load all the account ids and roles he has access to,
    /// so that he haven't to specify them manually in the provider
    /// configuration.
    if (providerType == ClusterProviderType.awssso) {
      actions.add(
        AppActionsWidgetAction(
          title: 'Add Multiple Providers',
          color: theme(context).primary,
          onTap: () {
            Navigator.pop(context);
            showModal(context, const SettingsAWSSSOMultipleProviders());
          },
        ),
      );
    }

    return AppActionsWidget(
      actions: actions,
    );
  }
}
