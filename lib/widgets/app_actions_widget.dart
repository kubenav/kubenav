import 'package:flutter/material.dart';

import 'package:kubenav/utils/constants.dart';

// Action defines the structure of a single action for the AppActionsWidget. Each action must have a title, an optional
// color (the default one will be the primary color of the app) and a onTap function which is called, when the user
// clicks on the action.
class AppActionsWidgetAction {
  String title;
  Color color;
  void Function() onTap;

  AppActionsWidgetAction({
    required this.title,
    this.color = Constants.colorPrimary,
    required this.onTap,
  });
}

// AppActionsWidget is a widget which can be used within a bottom sheet to show some additional actions for a component,
// when a user clicks on the component. The actions are defined as a list of our Action model. The widget can be used
// as follows:
//
// AppActionsWidget(
//   actions: [
//     AppActionsWidgetAction(
//       title: 'Edit',
//       onTap: () {},
//     ),
//     AppActionsWidgetAction(
//       title: 'Delete',
//       color: Constants.colorDanger,
//       onTap: () {},
//     ),
//   ],
// )
class AppActionsWidget extends StatelessWidget {
  const AppActionsWidget({
    Key? key,
    required this.actions,
  }) : super(key: key);

  final List<AppActionsWidgetAction> actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: Constants.spacingMiddle,
        right: Constants.spacingMiddle,
        top: Constants.spacingMiddle,
        bottom: Constants.spacingLarge,
      ),
      padding: const EdgeInsets.only(
        left: Constants.spacingMiddle,
        right: Constants.spacingMiddle,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(Constants.sizeBorderRadius),
        ),
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: List.generate(actions.length, (index) {
          if (index == actions.length - 1) {
            return Wrap(
              children: [
                InkWell(
                  child: ListTile(
                    title: Text(
                      actions[index].title,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: actions[index].color),
                    ),
                  ),
                  onTap: actions[index].onTap,
                ),
                const Divider(
                  height: 0,
                  thickness: 1.0,
                ),
              ],
            );
          } else {
            return InkWell(
              child: ListTile(
                title: Text(
                  actions[index].title,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: actions[index].color),
                ),
              ),
              onTap: actions[index].onTap,
            );
          }
        }),
      ),
    );
  }
}
