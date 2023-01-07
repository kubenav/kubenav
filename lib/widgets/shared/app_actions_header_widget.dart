import 'package:flutter/material.dart';

import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';

/// [AppActionsHeaderModel] is the class to define an action for the
/// [AppActionsHeaderWidget] widget. Each action must have a [title], a [icon]
/// and a [onTap] function which is executed when a user clicks on the action.
class AppActionsHeaderModel {
  String title;
  IconData icon;
  void Function() onTap;

  AppActionsHeaderModel({
    required this.title,
    required this.icon,
    required this.onTap,
  });
}

/// [AppActionsHeaderWidget] is a header widget for a page, which can be used to
/// show [actions] with a title and icon. The actions are defined via the
/// [AppActionsHeaderModel].
class AppActionsHeaderWidget extends StatelessWidget {
  const AppActionsHeaderWidget({
    Key? key,
    required this.actions,
  }) : super(key: key);

  final List<AppActionsHeaderModel> actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: actions.length <= 3
          ? 90
          : actions.length <= 6
              ? 180
              : 270,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(
        bottom: Constants.spacingExtraLarge,
      ),
      decoration: BoxDecoration(
        color: theme(context).colorPrimary,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.elliptical(MediaQuery.of(context).size.width, 80.0),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(
          right: Constants.spacingMiddle,
          left: Constants.spacingMiddle,
        ),
        transform: Matrix4.translationValues(0, 16.0, 0),
        alignment: Alignment.center,
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
        child: Wrap(
          alignment: WrapAlignment.center,
          direction: Axis.horizontal,
          spacing: Constants.spacingSmall,
          children: actions.map(
            (action) {
              return InkWell(
                onTap: action.onTap,
                child: Container(
                  constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width * 0.25,
                  ),
                  padding: const EdgeInsets.only(
                    top: Constants.spacingMiddle,
                    bottom: Constants.spacingMiddle,
                  ),
                  child: Column(
                    children: [
                      Icon(
                        action.icon,
                        color: theme(context).colorPrimary,
                        size: 28,
                      ),
                      const SizedBox(
                        height: Constants.spacingSmall,
                      ),
                      Text(
                        action.title,
                        style: primaryTextStyle(context, size: 12),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
