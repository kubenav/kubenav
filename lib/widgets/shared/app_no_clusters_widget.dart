import 'dart:io';

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
/// configure a cluster. On desktop it is used to show an error message, with a
/// hint how the clusters are loaded.
class AppNoClustersWidget extends StatelessWidget {
  const AppNoClustersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeRepository>(
      context,
      listen: true,
    );

    /// On Android and iOS we show a widget which can be used by the user to go
    /// the [SettingsClusters] page, where he can add a cluster via his
    /// Kubeconfig or one of our supported providers.
    if (Platform.isAndroid || Platform.isIOS) {
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
                color: theme(context).colorShadow,
                blurRadius: Constants.sizeBorderBlurRadius,
                spreadRadius: Constants.sizeBorderSpreadRadius,
                offset: const Offset(0.0, 0.0),
              ),
            ],
            color: theme(context).colorCard,
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
                    color: theme(context).colorPrimary,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(Constants.sizeBorderRadius),
                      topRight: Radius.circular(Constants.sizeBorderRadius),
                    ),
                  ),
                  height: 140,
                  width: MediaQuery.of(context).size.width,
                  child: const Icon(
                    CustomIcons.clusters,
                    color: Colors.white,
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

    /// On Linux, macOS and Windows, we show an error message, with the hint that
    /// the clusters are automatically loaded from the Kubeconfig file located at
    /// `~/.kube/config`.
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
              color: theme(context).colorShadow,
              blurRadius: Constants.sizeBorderBlurRadius,
              spreadRadius: Constants.sizeBorderSpreadRadius,
              offset: const Offset(0.0, 0.0),
            ),
          ],
          color: theme(context).colorCard,
          borderRadius: const BorderRadius.all(
            Radius.circular(Constants.sizeBorderRadius),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: theme(context).colorPrimary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(Constants.sizeBorderRadius),
                  topRight: Radius.circular(Constants.sizeBorderRadius),
                ),
              ),
              height: 140,
              width: MediaQuery.of(context).size.width,
              child: const Icon(
                CustomIcons.clusters,
                color: Colors.white,
                size: 108,
              ),
            ),
            const SizedBox(height: Constants.spacingSmall),
            Padding(
              padding: const EdgeInsets.only(
                left: Constants.spacingSmall,
              ),
              child: Text(
                'No clusters were found',
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
                'kubenav will use your Kubeconfig file from "~/.kube/config" to detect all your configured clusters',
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
