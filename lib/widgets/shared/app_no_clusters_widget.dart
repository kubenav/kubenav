import 'package:flutter/material.dart';

import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/custom_icons.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/navigate.dart';
import 'package:kubenav/utils/themes.dart';
import 'package:kubenav/widgets/settings/settings_clusters.dart';

/// [AppNoClustersWidget] is a widget, which can be displayed when no clusters
/// are configured in the app. On mobile, it will show the user an option to
/// configure a cluster.
class AppNoClustersWidget extends StatelessWidget {
  const AppNoClustersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).extension<CustomColors>()!.shadow,
            blurRadius: Constants.sizeBorderBlurRadius,
            spreadRadius: Constants.sizeBorderSpreadRadius,
            offset: const Offset(0.0, 0.0),
          ),
        ],
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.all(
          Radius.circular(Constants.sizeBorderRadius),
        ),
      ),
      child: InkWell(
        onTap: () {
          navigate(
            context,
            const SettingsClusters(),
            Constants.pageIndexSettings,
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(Constants.sizeBorderRadius),
                  topRight: Radius.circular(Constants.sizeBorderRadius),
                ),
              ),
              height: 140,
              width: MediaQuery.of(context).size.width,
              child: Icon(
                CustomIcons.clusters,
                color: Theme.of(context).colorScheme.onPrimary,
                size: 108,
              ),
            ),
            const SizedBox(height: Constants.spacingSmall),
            Padding(
              padding: const EdgeInsets.only(
                left: Constants.spacingSmall,
              ),
              child: Text(
                'Add a Cluster',
                style: primaryTextStyle(
                  context,
                ),
              ),
            ),
            const SizedBox(height: Constants.spacingExtraSmall),
            Padding(
              padding: const EdgeInsets.only(
                left: Constants.spacingSmall,
              ),
              child: Text(
                'Add your first cluster and start using kubenav',
                style: secondaryTextStyle(
                  context,
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
