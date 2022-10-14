import 'package:flutter/material.dart';

import 'package:kubenav/pages/providers/widgets/reauthenticate/awssso_provider_config_widget.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/custom_icons.dart';
import 'package:kubenav/utils/helpers.dart';

/// [AppErrorWidget] is a widget which renders a full width card, to show an error which occured during an operation in
/// the app. A user must pass in a error [message] and the error [details]. A user can also provide an options [icon].
class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({
    Key? key,
    required this.message,
    required this.details,
    this.icon,
  }) : super(key: key);

  final String message;
  final String details;
  final dynamic icon;

  /// [buildIcon] creates the icon for the error widget. The [icon] parameter for the widget could be of type `String`
  /// or `IconData` to also allow images from the assets folder as icons. If the icon is null, we use a default one.
  Widget buildIcon(dynamic icon) {
    if (icon is String) {
      return Image.asset(icon);
    } else if (icon is IconData) {
      return Icon(
        icon,
        color: Colors.white,
        size: 108,
      );
    }

    return const Icon(
      CustomIcons.kubenav,
      color: Colors.white,
      size: 108,
    );
  }

  Widget buildReauthWidget(String details) {
    if (details.contains('aws_sso_access_token_is_expired')) {
      return const AWSSSOProviderReauthenticateWidget();
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: buildIcon(icon),
          ),
          const SizedBox(height: Constants.spacingSmall),
          Padding(
            padding: const EdgeInsets.only(
              left: Constants.spacingSmall,
            ),
            child: Text(
              message,
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
              details,
              style: secondaryTextStyle(
                context,
              ),
            ),
          ),
          const SizedBox(height: Constants.spacingSmall),
          buildReauthWidget(details),
        ],
      ),
    );
  }
}
