import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/custom_icons.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/navigate.dart';
import 'package:kubenav/widgets/settings/settings_clusters.dart';

/// [AppNoClustersWidget] is a widget, which can be displayed when no clusters
/// are configured in the app. On mobile, it will show the user an option to
/// configure a cluster.
class AppNoClustersWidget extends StatelessWidget {
  const AppNoClustersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeRepository>(
      context,
      listen: true,
    );

    return Container(
      padding: const EdgeInsets.only(
        left: Constants.spacingMiddle,
        right: Constants.spacingMiddle,
      ),
      child: Container(
        margin: const EdgeInsets.only(
          top: Constants.spacingSmall,
          bottom: Constants.spacingSmall,
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: theme(context).shadow,
              blurRadius: Constants.sizeBorderBlurRadius,
              spreadRadius: Constants.sizeBorderSpreadRadius,
              offset: const Offset(0.0, 0.0),
            ),
          ],
          color: theme(context).card,
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
                  color: theme(context).primary,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(Constants.sizeBorderRadius),
                    topRight: Radius.circular(Constants.sizeBorderRadius),
                  ),
                ),
                height: 140,
                width: MediaQuery.of(context).size.width,
                child: Icon(
                  CustomIcons.clusters,
                  color: theme(context).onPrimary,
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
      ),
    );
  }
}
