import 'dart:io';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/repositories/sponsor_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/custom_icons.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/navigate.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/plugins/plugins.dart';
import 'package:kubenav/widgets/resources/bookmarks/resources_bookmarks.dart';
import 'package:kubenav/widgets/resources/resources.dart';
import 'package:kubenav/widgets/settings/settings.dart';
import 'package:kubenav/widgets/settings/settings/sponsor/settings_sponsor_actions.dart';
import 'package:kubenav/widgets/settings/settings_clusters.dart';
import 'package:kubenav/widgets/shared/app_actions_header_widget.dart';

class OverviewActions extends StatelessWidget {
  const OverviewActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SponsorRepository sponsorRepository = Provider.of<SponsorRepository>(
      context,
      listen: true,
    );

    final sponsorAction = ((Platform.isAndroid || Platform.isIOS) &&
            sponsorRepository.isAvailable &&
            sponsorRepository.products.isNotEmpty &&
            !sponsorRepository.isSponsor)
        ? AppActionsHeaderModel(
            title: 'Sponsor',
            icon: Icons.favorite,
            onTap: () {
              showActions(
                context,
                const SettingsSponsorActions(
                  showDismiss: false,
                ),
              );
            },
          )
        : AppActionsHeaderModel(
            title: 'GitHub',
            icon: CustomIcons.github,
            onTap: () {
              openUrl('https://github.com/kubenav/kubenav');
            },
          );

    return AppActionsHeaderWidget(
      actions: [
        AppActionsHeaderModel(
          title: 'Resources',
          icon: CustomIcons.kubernetes,
          onTap: () {
            navigate(
              context,
              const Resources(),
              Constants.pageIndexResources,
            );
          },
        ),
        AppActionsHeaderModel(
          title: 'Plugins',
          icon: Icons.extension,
          onTap: () {
            navigate(
              context,
              const Plugins(),
              Constants.pageIndexPlugins,
            );
          },
        ),
        AppActionsHeaderModel(
          title: 'Settings',
          icon: Icons.settings,
          onTap: () {
            navigate(
              context,
              const Settings(),
              Constants.pageIndexSettings,
            );
          },
        ),
        AppActionsHeaderModel(
          title: 'Clusters',
          icon: CustomIcons.clusters,
          onTap: () {
            navigate(
              context,
              const SettingsClusters(),
              Constants.pageIndexSettings,
            );
          },
        ),
        AppActionsHeaderModel(
          title: 'Bookmarks',
          icon: Icons.bookmark,
          onTap: () {
            navigate(
              context,
              const ResourcesBookmarks(),
              Constants.pageIndexResources,
            );
          },
        ),
        sponsorAction,
      ],
    );
  }
}
