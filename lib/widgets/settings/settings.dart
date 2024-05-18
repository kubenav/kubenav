import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/clusters_repository.dart';
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/custom_icons.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/logger.dart';
import 'package:kubenav/utils/navigate.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/utils/themes.dart';
import 'package:kubenav/widgets/settings/settings/settings_home_page.dart';
import 'package:kubenav/widgets/settings/settings/settings_info.dart';
import 'package:kubenav/widgets/settings/settings/settings_prometheus.dart';
import 'package:kubenav/widgets/settings/settings/settings_proxy.dart';
import 'package:kubenav/widgets/settings/settings/settings_sponsor.dart';
import 'package:kubenav/widgets/settings/settings/settings_timeout.dart';
import 'package:kubenav/widgets/settings/settings/sponsor/settings_sponsor_banner.dart';
import 'package:kubenav/widgets/settings/settings_clusters.dart';
import 'package:kubenav/widgets/settings/settings_help.dart';
import 'package:kubenav/widgets/settings/settings_namespaces.dart';
import 'package:kubenav/widgets/settings/settings_providers.dart';
import 'package:kubenav/widgets/shared/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/shared/app_floating_action_buttons_widget.dart';
import 'package:kubenav/widgets/shared/app_list_item.dart';
import 'package:kubenav/widgets/shared/app_no_clusters_widget.dart';
import 'package:kubenav/widgets/shared/app_vertical_list_simple_widget.dart';

/// The [Settings] widget is used to display a list of clusters, the settings,
/// the help and the app information.
class Settings extends StatelessWidget {
  const Settings({super.key});

  /// [_buildClusters] returns a horizontal list of the users most used
  /// clusters (currently "most used" is defined via the order). The user can
  /// click on one of the clusters to quickly change the active cluster.
  ///
  /// If the user hasn't any clusters configured yet. We display the
  /// [AppNoClustersWidget] widget, so the user can go to the clusters page to
  /// add his first cluster.
  Widget _buildClusters(
    BuildContext context,
  ) {
    ClustersRepository clustersRepository = Provider.of<ClustersRepository>(
      context,
      listen: false,
    );

    if (clustersRepository.clusters.isEmpty) {
      return const Padding(
        padding: EdgeInsets.only(
          left: Constants.spacingMiddle,
          right: Constants.spacingMiddle,
        ),
        child: AppNoClustersWidget(),
      );
    }

    int maxClusters = 6;

    return SizedBox(
      height: 128,
      child: GridView.count(
        scrollDirection: Axis.horizontal,
        crossAxisCount: 2,
        childAspectRatio: 0.25,
        children: List.generate(
          clustersRepository.clusters.length <= maxClusters
              ? clustersRepository.clusters.length
              : maxClusters,
          (index) {
            return Container(
              margin: const EdgeInsets.only(
                top: Constants.spacingSmall,
                bottom: Constants.spacingSmall,
                left: Constants.spacingMiddle,
                right: Constants.spacingMiddle,
              ),
              child: AppListItem(
                onTap: () {
                  clustersRepository.setActiveCluster(
                    clustersRepository.clusters[index].id,
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      clustersRepository.clusters[index].id ==
                              clustersRepository.activeClusterId
                          ? Icons.radio_button_checked
                          : Icons.radio_button_unchecked,
                      size: 24,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(width: Constants.spacingSmall),
                    Expanded(
                      flex: 1,
                      child: Text(
                        clustersRepository.clusters[index].name,
                        style: noramlTextStyle(
                          context,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  /// [_buildViewAllClusters] displays the title for the clusters section and
  /// a "View all" button, which can be used by the user to go to the clusters
  /// page, where a user can add more clusters or reorder his existing clusters.
  Widget _buildViewAllClusters(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        Constants.spacingMiddle,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text('Clusters', style: primaryTextStyle(context, size: 18)),
          ),
          InkWell(
            onTap: () {
              navigate(context, const SettingsClusters());
            },
            child: Row(
              children: [
                Text(
                  'View all',
                  style: secondaryTextStyle(
                    context,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(width: Constants.spacingExtraSmall),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Theme.of(context).colorScheme.primary,
                  size: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _toogleAuthentication(BuildContext context) async {
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: false,
    );

    try {
      await appRepository.toogleAuthentication();
    } catch (err) {
      if (context.mounted) {
        showSnackbar(
          context,
          'Failed to Enable Authentication',
          err.toString(),
        );
      }
    }
  }

  /// [buildHelp] builds the help section in the settings. From the help section
  /// a user can access the help screen [SettingsHelp] or the logs via the
  /// [Logger] which were created during his actions in the app
  Widget buildHelp(BuildContext context) {
    return AppVerticalListSimpleWidget(
      title: 'Help',
      items: [
        AppVerticalListSimpleModel(
          onTap: () {
            showModal(
              context,
              const Logger(),
            );
          },
          children: [
            Icon(
              Icons.subject,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: Constants.spacingSmall),
            Expanded(
              flex: 1,
              child: Text(
                'Logs',
                style: noramlTextStyle(
                  context,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Theme.of(context)
                  .extension<CustomColors>()!
                  .textPrimary
                  .withOpacity(Constants.opacityIcon),
              size: 16,
            ),
          ],
        ),
        AppVerticalListSimpleModel(
          onTap: () {
            navigate(
              context,
              const SettingsHelp(),
            );
          },
          children: [
            Icon(
              Icons.help,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: Constants.spacingSmall),
            Expanded(
              flex: 1,
              child: Text(
                'Help',
                style: noramlTextStyle(
                  context,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Theme.of(context)
                  .extension<CustomColors>()!
                  .textPrimary
                  .withOpacity(Constants.opacityIcon),
              size: 16,
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeRepository themeRepository = Provider.of<ThemeRepository>(
      context,
      listen: true,
    );
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: true,
    );
    Provider.of<ClustersRepository>(
      context,
      listen: true,
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Settings'),
      ),
      bottomNavigationBar: const AppBottomNavigationBarWidget(),
      floatingActionButton: const AppFloatingActionButtonsWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SettingsSponsorBanner(),
              _buildViewAllClusters(context),
              _buildClusters(context),
              const SizedBox(height: Constants.spacingMiddle),
              AppVerticalListSimpleWidget(
                title: 'Settings',
                items: [
                  AppVerticalListSimpleModel(
                    onTap: () {
                      navigate(context, const SettingsProviders());
                    },
                    children: [
                      Icon(
                        CustomIcons.kubernetes,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: Constants.spacingSmall),
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Provider',
                          style: noramlTextStyle(
                            context,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Theme.of(context)
                            .extension<CustomColors>()!
                            .textPrimary
                            .withOpacity(Constants.opacityIcon),
                        size: 16,
                      ),
                    ],
                  ),
                  AppVerticalListSimpleModel(
                    onTap: () {
                      navigate(
                        context,
                        const SettingsNamespaces(),
                      );
                    },
                    children: [
                      Icon(
                        CustomIcons.namespaces,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: Constants.spacingSmall),
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Namespaces',
                          style: noramlTextStyle(
                            context,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Theme.of(context)
                            .extension<CustomColors>()!
                            .textPrimary
                            .withOpacity(Constants.opacityIcon),
                        size: 16,
                      ),
                    ],
                  ),
                  AppVerticalListSimpleModel(
                    children: [
                      Icon(
                        Icons.fingerprint,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: Constants.spacingSmall),
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Authentication',
                          style: noramlTextStyle(
                            context,
                          ),
                        ),
                      ),
                      Switch(
                        activeColor: Theme.of(context).colorScheme.primary,
                        onChanged: (value) {
                          _toogleAuthentication(context);
                        },
                        value: appRepository.settings.isAuthenticationEnabled,
                      ),
                    ],
                  ),
                  AppVerticalListSimpleModel(
                    children: [
                      Icon(
                        CustomIcons.clusters,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: Constants.spacingSmall),
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Show Cluster on Start',
                          style: noramlTextStyle(
                            context,
                          ),
                        ),
                      ),
                      Switch(
                        activeColor: Theme.of(context).colorScheme.primary,
                        onChanged: (value) {
                          appRepository.setIsShowClustersOnStart(
                            !appRepository.settings.isShowClustersOnStart,
                          );
                        },
                        value: appRepository.settings.isShowClustersOnStart,
                      ),
                    ],
                  ),
                  AppVerticalListSimpleModel(
                    children: [
                      Icon(
                        Icons.code,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: Constants.spacingSmall),
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Theme',
                          style: noramlTextStyle(
                            context,
                          ),
                        ),
                      ),
                      DropdownButton(
                        value: themeRepository.themeName,
                        underline: Container(
                          height: 2,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        onChanged: (ThemeName? value) {
                          themeRepository
                              .setThemeName(value ?? ThemeName.light);
                        },
                        items: ThemeName.values.map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(
                              value.toShortString(),
                              style: TextStyle(
                                color: Theme.of(context)
                                    .extension<CustomColors>()!
                                    .textPrimary,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  AppVerticalListSimpleModel(
                    children: [
                      Icon(
                        Icons.code,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: Constants.spacingSmall),
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Editor Format',
                          style: noramlTextStyle(
                            context,
                          ),
                        ),
                      ),
                      DropdownButton(
                        value: appRepository.settings.editorFormat,
                        underline: Container(
                          height: 2,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        onChanged: (String? newValue) {
                          appRepository.setEditorFormat(newValue ?? 'yaml');
                        },
                        items: [
                          'yaml',
                          'json',
                        ].map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                color: Theme.of(context)
                                    .extension<CustomColors>()!
                                    .textPrimary,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  AppVerticalListSimpleModel(
                    onTap: () {
                      showModal(
                        context,
                        SettingsHomePage(
                          currentHome: appRepository.settings.home,
                        ),
                      );
                    },
                    children: [
                      Icon(
                        Icons.home,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: Constants.spacingSmall),
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Home Page',
                          style: noramlTextStyle(
                            context,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Theme.of(context)
                            .extension<CustomColors>()!
                            .textPrimary
                            .withOpacity(Constants.opacityIcon),
                        size: 16,
                      ),
                    ],
                  ),
                  AppVerticalListSimpleModel(
                    onTap: () {
                      showModal(
                        context,
                        SettingsProxy(
                          currentProxy: appRepository.settings.proxy,
                        ),
                      );
                    },
                    children: [
                      Icon(
                        Icons.http,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: Constants.spacingSmall),
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Proxy',
                          style: noramlTextStyle(
                            context,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Theme.of(context)
                            .extension<CustomColors>()!
                            .textPrimary
                            .withOpacity(Constants.opacityIcon),
                        size: 16,
                      ),
                    ],
                  ),
                  AppVerticalListSimpleModel(
                    onTap: () {
                      showModal(
                        context,
                        SettingsTimeout(
                          currentTimeout: appRepository.settings.timeout,
                        ),
                      );
                    },
                    children: [
                      Icon(
                        Icons.schedule,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: Constants.spacingSmall),
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Timeout',
                          style: noramlTextStyle(
                            context,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Theme.of(context)
                            .extension<CustomColors>()!
                            .textPrimary
                            .withOpacity(Constants.opacityIcon),
                        size: 16,
                      ),
                    ],
                  ),
                  AppVerticalListSimpleModel(
                    onTap: () {
                      showModal(
                        context,
                        SettingsPrometheus(
                          currentPrometheus: appRepository.settings.prometheus,
                        ),
                      );
                    },
                    children: [
                      Icon(
                        Icons.extension,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: Constants.spacingSmall),
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Prometheus',
                          style: noramlTextStyle(
                            context,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Theme.of(context)
                            .extension<CustomColors>()!
                            .textPrimary
                            .withOpacity(Constants.opacityIcon),
                        size: 16,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: Constants.spacingMiddle),
              const SettingsSponsor(),
              const SizedBox(height: Constants.spacingMiddle),
              buildHelp(context),
              const SizedBox(height: Constants.spacingMiddle),
              const SettingsInfo(),
              const SizedBox(height: Constants.spacingMiddle),
            ],
          ),
        ),
      ),
    );
  }
}
