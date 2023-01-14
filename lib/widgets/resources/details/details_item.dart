import 'package:flutter/material.dart';

import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/showmodal.dart';

abstract class IDetailsItemWidget {
  const IDetailsItemWidget({
    required this.item,
  });

  final dynamic item;
}

/// [DetailsItemModel] is the structure of a single item in the [DetailsItemWidget]. Each item requires a [name] and a
/// [values] parameter. The [values] parameter can be of type `String` or a `List<String>`. The optional [onTap]
/// function can be used to overwrite the behaviour of what happens when the user clicks on a value. It returns the
/// `index` of the value which was clicked.
class DetailsItemModel {
  const DetailsItemModel({
    required this.name,
    required this.values,
    this.onTap,
  });

  final String name;
  final dynamic values;
  final void Function(int index)? onTap;
}

/// [DetailsItemWidget] is a widget which can be used to render a list of details for a resource. It takes a list of
/// [details] which are of type [DetailsItemModel] and a [title]. The [smallPadding] argument can be used to minimize
/// the additional padding for the widget, so that it can be used in other places, like a bottom sheet.
class DetailsItemWidget extends StatelessWidget {
  const DetailsItemWidget({
    Key? key,
    required this.title,
    required this.details,
    this.smallPadding = false,
  }) : super(key: key);

  final String title;
  final List<DetailsItemModel> details;
  final bool smallPadding;

  /// [buildValue] build the values field for a details item. If the value is of type `List<String>` it will render the
  /// values via the [Chip] widget. If it is of type `String` or has an unknown type it will render the value via a
  /// [Text] component.
  Widget buildValue(
    BuildContext context,
    String name,
    dynamic values,
    void Function(int index)? onTap,
  ) {
    if (values is List<String>) {
      return Flexible(
        child: Wrap(
          children: List.generate(
            values.length,
            (index) => Container(
              margin: const EdgeInsets.all(Constants.spacingExtraSmall),
              child: ActionChip(
                onPressed: () {
                  if (onTap != null) {
                    onTap(index);
                  } else {
                    showSnackbar(context, name, values[index]);
                  }
                },
                label: Text(values[index]),
              ),
            ),
          ),
        ),
      );
    }

    if (onTap != null) {
      return Flexible(
        child: InkWell(
          onTap: () {
            onTap(-1);
          },
          child: Text(
            values.toString(),
            softWrap: true,
            style: TextStyle(
              color: theme(context).colorTextPrimary,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      );
    }

    return Flexible(
      child: Text(
        values.toString(),
        softWrap: true,
        style: TextStyle(
          color: theme(context).colorTextPrimary,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: Constants.spacingMiddle,
            left: smallPadding
                ? Constants.spacingExtraSmall
                : Constants.spacingMiddle,
            right: smallPadding
                ? Constants.spacingExtraSmall
                : Constants.spacingMiddle,
            bottom: Constants.spacingMiddle,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: primaryTextStyle(context, size: 18),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(
            left: smallPadding
                ? Constants.spacingExtraSmall
                : Constants.spacingMiddle,
            right: smallPadding
                ? Constants.spacingExtraSmall
                : Constants.spacingMiddle,
          ),
          padding: const EdgeInsets.all(Constants.spacingListItemContent),
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
            children: List.generate(
              details.length,
              (index) {
                return Container(
                  margin: const EdgeInsets.only(
                    top: Constants.spacingSmall,
                    bottom: Constants.spacingSmall,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${details[index].name}:',
                        style: primaryTextStyle(context, size: 14),
                        maxLines: 2,
                      ),
                      const SizedBox(width: Constants.spacingSmall),
                      buildValue(
                        context,
                        details[index].name,
                        details[index].values,
                        details[index].onTap,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
