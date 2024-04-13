import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'package:kubenav/models/cluster_provider.dart';
import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/settings/providers/settings_provider_actions.dart';
import 'package:kubenav/widgets/shared/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/shared/app_drawer.dart';
import 'package:kubenav/widgets/shared/app_floating_action_buttons_widget.dart';
import 'package:kubenav/widgets/shared/app_list_item.dart';

/// The [SettingsProviders] widgets can be used to display a page with all
/// providers which were added by a user. The user can then modify or delete
/// an existing provider.
///
/// It is not possible to add a new provider on this page, because new providers
/// should only be added via the cluster page.
class SettingsProviders extends StatelessWidget {
  const SettingsProviders({super.key});

  /// [buildProvider] returns a widget for a provider. The widget shows the user
  /// defined name of the provider, as well as the title and subtitle for the
  /// provider type.
  /// When a user clicks on the provider we also open the
  /// [SettingsProviderActions] actions, where the user can then delete or
  /// modify the provider.
  Widget buildProvider(BuildContext context, ClusterProvider provider) {
    return AppListItem(
      onTap: () {
        showActions(context, SettingsProviderActions(provider: provider));
      },
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: theme(context).primary,
              borderRadius: const BorderRadius.all(
                Radius.circular(Constants.sizeBorderRadius),
              ),
            ),
            height: 54,
            width: 54,
            padding: const EdgeInsets.all(
              Constants.spacingIcon54x54,
            ),
            child: SvgPicture.asset(provider.type!.icon()),
          ),
          const SizedBox(width: Constants.spacingSmall),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  provider.name!,
                  style: primaryTextStyle(
                    context,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  provider.type!.title(),
                  style: secondaryTextStyle(
                    context,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  provider.type!.subtitle(),
                  style: secondaryTextStyle(
                    context,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: Constants.spacingSmall),
          Icon(
            Icons.arrow_forward_ios,
            color:
                theme(context).textSecondary.withOpacity(Constants.opacityIcon),
            size: 24,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeRepository>(
      context,
      listen: true,
    );
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: true,
    );
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: true,
    );

    return Scaffold(
      drawer: appRepository.settings.classicMode ? const AppDrawer() : null,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Providers'),
      ),
      bottomNavigationBar: appRepository.settings.classicMode
          ? null
          : const AppBottomNavigationBarWidget(),
      floatingActionButton: const AppFloatingActionButtonsWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: Constants.spacingLarge),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.only(
                  left: Constants.spacingMiddle,
                  right: Constants.spacingMiddle,
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: Constants.spacingMiddle,
                ),
                itemCount: clustersRepository.providers.length,
                itemBuilder: (context, index) => buildProvider(
                  context,
                  clustersRepository.providers[index],
                ),
              ),
              const SizedBox(height: Constants.spacingSmall),
            ],
          ),
        ),
      ),
    );
  }
}
