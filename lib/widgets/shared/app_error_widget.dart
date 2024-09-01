import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/custom_icons.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/themes.dart';
import 'package:kubenav/widgets/settings/providers/reauthenticate/settings_reauthenticate_awssso_provider_config.dart';
import 'package:kubenav/widgets/settings/providers/reauthenticate/settings_reauthenticate_oidc_provider_config.dart';

/// [AppErrorWidget] is a widget which renders a full width card, to show an
/// error which occured during an operation in the app. A user must pass in a
/// error [message] and the error [details]. A user can also provide an options
/// [icon].
class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({
    super.key,
    required this.message,
    required this.details,
    this.icon,
  });

  final String message;
  final String details;
  final dynamic icon;

  /// [_buildIcon] creates the icon for the error widget. The [icon] parameter
  /// for the widget could be of type `String` or `IconData` to also allow
  /// images from the assets folder as icons. If the icon is null, we use a
  /// default one.
  Widget _buildIcon(BuildContext context, dynamic icon) {
    if (icon is String) {
      return SvgPicture.asset(icon);
    } else if (icon is IconData) {
      return Icon(
        icon,
        color: Theme.of(context).colorScheme.onPrimary,
        size: 108,
      );
    }

    return Icon(
      CustomIcons.kubenav,
      color: Theme.of(context).colorScheme.onPrimary,
      size: 108,
    );
  }

  Widget _buildReauthWidget(String details) {
    if (details.contains('aws_sso_access_token_is_expired')) {
      return const SettingsReauthenticateAWSSSO();
    }

    if (details.contains('oidc_access_token_is_expired_and_no_refresh_token')) {
      return const SettingsReauthenticateOIDC();
    }

    return Container();
  }

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
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.all(
          Radius.circular(Constants.sizeBorderRadius),
        ),
      ),
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
            padding: const EdgeInsets.all(Constants.spacingMiddle),
            child: _buildIcon(context, icon),
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
          _buildReauthWidget(details),
        ],
      ),
    );
  }
}
