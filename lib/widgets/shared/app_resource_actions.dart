import 'package:flutter/material.dart';

import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/themes.dart';
import 'package:kubenav/widgets/shared/app_actions_widget.dart';

/// The [AppResourceActionsMode] enum defines all the modes which are supported
/// by the [AppResourceActions] widget.
enum AppResourceActionsMode {
  header,
  actions,
}

/// [AppResourceActionsModel] is the class to define an action for the
/// [AppResourceActions] widget. Each action must have a [title], a [icon]
/// and a [onTap] function which is executed when a user clicks on the action.
class AppResourceActionsModel {
  String title;
  IconData icon;
  void Function() onTap;

  AppResourceActionsModel({
    required this.title,
    required this.icon,
    required this.onTap,
  });
}

/// The [AppResourceActions] widget can be used to render a list of actions for
/// a resource, like viewing logs of a container, scaling deployments, etc. The
/// actions which should be shown are defined via the [actions] parameter. The
/// widget can also be used via different [mode]s, so that we can reuse the same
/// actions in different places of the UI. The following modes are supported:
///
/// - `header`: The widget can be used as a header on a page
/// - `actions`: The actions will be shown via an [AppActionsWidget]. When this
///   mode is selected we will call `Navigator.pop(context)` before the defined
///   `onTap` function of an action to close the actions menu.
class AppResourceActions extends StatelessWidget {
  const AppResourceActions({
    super.key,
    required this.mode,
    required this.actions,
  });

  final AppResourceActionsMode mode;
  final List<AppResourceActionsModel> actions;

  @override
  Widget build(BuildContext context) {
    if (mode == AppResourceActionsMode.header) {
      return Container(
        height: actions.length <= 3
            ? 90
            : actions.length <= 6
                ? 180
                : actions.length <= 9
                    ? 270
                    : 360,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(
          bottom: Constants.spacingExtraLarge,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
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
          child: Wrap(
            alignment: WrapAlignment.center,
            direction: Axis.horizontal,
            spacing: Constants.spacingSmall,
            children: actions.map(
              (action) {
                return Container(
                  constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width * 0.25,
                  ),
                  padding: const EdgeInsets.only(
                    top: Constants.spacingMiddle,
                    bottom: Constants.spacingMiddle,
                  ),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: action.onTap,
                        child: Column(
                          children: [
                            Icon(
                              action.icon,
                              color: Theme.of(context).colorScheme.primary,
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
                    ],
                  ),
                );
              },
            ).toList(),
          ),
        ),
      );
    }

    if (mode == AppResourceActionsMode.actions) {
      return AppActionsWidget(
        actions: actions.map(
          (e) {
            return AppActionsWidgetAction(
              title: e.title,
              color: Theme.of(context).colorScheme.primary,
              onTap: () {
                Navigator.pop(context);
                e.onTap();
              },
            );
          },
        ).toList(),
      );
    }

    return Container();
  }
}
