import 'package:flutter/material.dart';

import 'package:kubenav/utils/constants.dart';

/// [Action] defines the structure of a single action for the
/// [AppActionsWidget]. Each action must have a [title], an optional [color]
/// (the default one will be the primary color of the app) and an [onTap]
/// function which is called, when the user clicks on the action.
class AppActionsWidgetAction {
  String title;
  Color color;
  void Function() onTap;

  AppActionsWidgetAction({
    required this.title,
    required this.color,
    required this.onTap,
  });
}

/// [AppActionsWidget] is a widget which can be used within a bottom sheet to
/// show some additional [actions] for a component, when a user clicks on the
/// component. The actions are defined as a list of our [AppActionsWidgetAction]
/// model.
class AppActionsWidget extends StatelessWidget {
  const AppActionsWidget({
    super.key,
    required this.actions,
  });

  final List<AppActionsWidgetAction> actions;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(
          Constants.spacingMiddle,
        ),
        padding: const EdgeInsets.only(
          left: Constants.spacingMiddle,
          right: Constants.spacingMiddle,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.all(
            Radius.circular(Constants.sizeBorderRadius),
          ),
        ),
        child: SingleChildScrollView(
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(0),
            separatorBuilder: (context, index) {
              return const Divider(
                height: 0,
                thickness: 1.0,
              );
            },
            itemCount: actions.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: actions[index].onTap,
                title: Text(
                  actions[index].title,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: actions[index].color),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
