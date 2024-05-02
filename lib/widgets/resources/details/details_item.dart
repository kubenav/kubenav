import 'package:flutter/material.dart';

import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/utils/themes.dart';

abstract class IDetailsItemWidget {
  const IDetailsItemWidget({
    required this.item,
  });

  final dynamic item;
}

/// [DetailsItemModel] is the structure of a single item in the
/// [DetailsItemWidget]. Each item requires a [name] and a [values] parameter.
/// The [values] parameter can be of type `String` or a `List<String>`. The
/// optional [onTap] function can be used to overwrite the behaviour of what
/// happens when the user clicks on a value. It returns the `index` of the value
/// which was clicked.
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

/// [DetailsItemWidget] is a widget which can be used to render a list of
/// details for a resource. It takes a list of [details] which are of type
/// [DetailsItemModel] and a [title]. The [smallPadding] argument can be used to
/// minimize the additional padding for the widget, so that it can be used in
/// other places, like a bottom sheet.
class DetailsItemWidget extends StatelessWidget {
  const DetailsItemWidget({
    super.key,
    required this.title,
    required this.details,
    this.goTo,
    this.goToOnTap,
  });

  final String title;
  final List<DetailsItemModel> details;
  final String? goTo;
  final void Function()? goToOnTap;

  /// [_filterDetails] filters the details list and removes all items which have
  /// no values.
  List<DetailsItemModel> _filterDetails(List<DetailsItemModel> details) {
    return details.where((e) {
      if (e.values is List<String>) {
        return e.values.isNotEmpty;
      }
      return e.values != null;
    }).toList();
  }

  /// [_buildValue] build the values field for a details item. If the value is
  /// of type `List<String>` it will render the values via the [Chip] widget. If
  /// it is of type `String` or has an unknown type it will render the value via
  /// a [Text] component.
  Widget _buildValue(
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
            style: TextStyle(
              color: Theme.of(context).extension<CustomColors>()!.textPrimary,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      );
    }

    return Flexible(
      child: Text(
        values.toString(),
        style: TextStyle(
          color: Theme.of(context).extension<CustomColors>()!.textPrimary,
        ),
      ),
    );
  }

  /// [_buildGoTo] renders a link with the provided [goTo] text and [goToOnTap]
  /// function next to the title.
  Widget _buildGoTo(BuildContext context) {
    if (goTo != null && goToOnTap != null) {
      return InkWell(
        onTap: goToOnTap,
        child: Row(
          children: [
            Text(
              goTo!,
              style: secondaryTextStyle(
                context,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(width: Constants.spacingExtraSmall),
            Icon(
              Icons.keyboard_arrow_right,
              color: Theme.of(context).colorScheme.primary,
              size: 16,
            ),
          ],
        ),
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    final filteredDetails = _filterDetails(details);

    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.all(Constants.spacingMiddle),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: primaryTextStyle(context, size: 18),
                ),
              ),
              _buildGoTo(context),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(
            left: Constants.spacingMiddle,
            right: Constants.spacingMiddle,
          ),
          padding: const EdgeInsets.all(Constants.spacingListItemContent),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).extension<CustomColors>()!.shadow,
                blurRadius: Constants.sizeBorderBlurRadius,
                spreadRadius: Constants.sizeBorderSpreadRadius,
                offset: const Offset(0.0, 0.0),
              ),
            ],
            color: Theme.of(context).colorScheme.background,
            borderRadius: const BorderRadius.all(
              Radius.circular(Constants.sizeBorderRadius),
            ),
          ),
          child: Column(
            children: List.generate(
              filteredDetails.length,
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
                        '${filteredDetails[index].name}:',
                        style: primaryTextStyle(context, size: 14),
                        maxLines: 2,
                      ),
                      const SizedBox(width: Constants.spacingSmall),
                      _buildValue(
                        context,
                        filteredDetails[index].name,
                        filteredDetails[index].values,
                        filteredDetails[index].onTap,
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
