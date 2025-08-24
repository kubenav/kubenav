import 'package:flutter/material.dart';

import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/shared/app_list_item.dart';

/// [AppVerticalListSimpleModel] represents a single item in the
/// [AppVerticalListSimpleWidget] widget. Each item mist contain a list of
/// [children] and an optional [onTap] function which is called when the user
/// clicks on the item in the list.
class AppVerticalListSimpleModel {
  List<Widget> children;
  void Function()? onTap;

  AppVerticalListSimpleModel({required this.children, this.onTap});
}

/// [AppVerticalListSimpleWidget] is a widget to render a simple vertical list.
/// The list items are defined via the [AppVerticalListSimpleModel].
///
/// The [smallPadding] argument can be used to minimize the additional padding
/// for the widget, so that it can be used in other places, like a bottom sheet.
class AppVerticalListSimpleWidget extends StatelessWidget {
  const AppVerticalListSimpleWidget({
    super.key,
    required this.title,
    required this.items,
  });

  final String title;
  final List<AppVerticalListSimpleModel> items;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.all(Constants.spacingMiddle),
          child: Row(
            children: [
              Expanded(
                child: Text(title, style: primaryTextStyle(context, size: 18)),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: Constants.spacingMiddle,
            right: Constants.spacingMiddle,
          ),
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) =>
                const SizedBox(height: Constants.spacingMiddle),
            itemCount: items.length,
            itemBuilder: (context, index) => AppListItem(
              onTap: items[index].onTap,
              child: Row(children: items[index].children),
            ),
          ),
        ),
      ],
    );
  }
}
