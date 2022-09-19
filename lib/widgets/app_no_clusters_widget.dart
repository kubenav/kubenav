import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/custom_icons.dart';
import 'package:kubenav/utils/helpers.dart';

/// [AppNoClustersWidget] is a widget, which can be displayed when no clusters are configured in the app. On mobile, it
/// will show the user an option to configure a cluster. On desktop it is used to show an error message.
class AppNoClustersWidget extends StatelessWidget {
  const AppNoClustersWidget({Key? key}) : super(key: key);

  Widget buildNoClusterWidget(BuildContext context) {
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
              Get.toNamed('/settings/clusters');
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Constants.colorPrimary,
                    borderRadius: BorderRadius.only(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Constants.colorPrimary,
                borderRadius: BorderRadius.only(
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

  @override
  Widget build(BuildContext context) {
    return buildNoClusterWidget(context);
  }
}
