import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/models/cluster_provider.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/settings/providers/settings_provider_actions.dart';
import 'package:kubenav/widgets/shared/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/shared/app_floating_action_buttons_widget.dart';

/// The [SettingsProviders] widgets can be used to display a page with all
/// providers which were added by a user. The user can then modify or delete
/// an existing provider.
///
/// It is not possible to add a new provider on this page, because new providers
/// should only be added via the cluster page.
class SettingsProviders extends StatelessWidget {
  const SettingsProviders({Key? key}) : super(key: key);

  /// [buildProvider] returns a widget for a provider. The widget shows the user
  /// defined name of the provider, as well as the title and subtitle for the
  /// provider type.
  /// When a user clicks on the provider we also open the
  /// [SettingsProviderActions] actions, where the user can then delete or
  /// modify the provider.
  Widget buildProvider(BuildContext context, ClusterProvider provider) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: Constants.spacingMiddle,
      ),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor,
            blurRadius: Constants.sizeBorderBlurRadius,
            spreadRadius: Constants.sizeBorderSpreadRadius,
            offset: const Offset(0.0, 0.0),
          ),
        ],
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(Constants.sizeBorderRadius),
        ),
      ),
      child: InkWell(
        onTap: () {
          showActions(context, SettingsProviderActions(provider: provider));
        },
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Constants.colorPrimary,
                borderRadius: BorderRadius.all(
                  Radius.circular(Constants.sizeBorderRadius),
                ),
              ),
              height: 54,
              width: 54,
              child: Image.asset(
                provider.type!.image42x42(),
              ),
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
              color: Colors.grey[300],
              size: 24,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: true,
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Providers'),
      ),
      bottomNavigationBar: const AppBottomNavigationBarWidget(),
      floatingActionButton: const AppFloatingActionButtonsWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: Constants.spacingLarge),
            Padding(
              padding: const EdgeInsets.only(
                left: Constants.spacingMiddle,
                right: Constants.spacingMiddle,
              ),
              child: Column(
                children: List.generate(
                  clustersRepository.providers.length,
                  (index) => buildProvider(
                    context,
                    clustersRepository.providers[index],
                  ),
                ),
              ),
            ),
            const SizedBox(height: Constants.spacingSmall),
          ],
        ),
      ),
    );
  }
}
