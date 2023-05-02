import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/custom_icons.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/settings/providers/reauthenticate/settings_reauthenticate_awssso_provider_config.dart';

// import 'package:kubenav/pages/providers/widgets/reauthenticate/awssso_provider_config_widget.dart';

/// [AppErrorWidget] is a widget which renders a full width card, to show an
/// error which occured during an operation in the app. A user must pass in a
/// error [message] and the error [details]. A user can also provide an options
/// [icon].
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

  /// [buildIcon] creates the icon for the error widget. The [icon] parameter
  /// for the widget could be of type `String` or `IconData` to also allow
  /// images from the assets folder as icons. If the icon is null, we use a
  /// default one.
  Widget buildIcon(BuildContext context, dynamic icon) {
    if (icon is String) {
      return SvgPicture.asset(icon);
    } else if (icon is IconData) {
      return Icon(
        icon,
        color: theme(context).colorOnPrimary,
        size: 108,
      );
    }

    return Icon(
      CustomIcons.kubenav,
      color: theme(context).colorOnPrimary,
      size: 108,
    );
  }

  Widget buildReauthWidget(String details) {
    if (details.contains('aws_sso_access_token_is_expired')) {
      return const SettingsReauthenticateAWSSSO();
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
            padding: const EdgeInsets.all(Constants.spacingMiddle),
            child: buildIcon(context, icon),
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
