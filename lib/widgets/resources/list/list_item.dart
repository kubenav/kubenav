import 'package:flutter/material.dart';

import 'package:kubenav/models/resource.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/navigate.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/utils/themes.dart';
import 'package:kubenav/widgets/resources/list/list_item_actions.dart';
import 'package:kubenav/widgets/resources/resource_details.dart';
import 'package:kubenav/widgets/shared/app_list_item.dart';

enum Status {
  undefined,
  success,
  warning,
  danger,
}

abstract class IListItemWidget {
  const IListItemWidget({
    required this.title,
    required this.resource,
    required this.path,
    required this.scope,
    required this.additionalPrinterColumns,
    required this.item,
  });

  final String title;
  final String resource;
  final String path;
  final ResourceScope scope;
  final List<AdditionalPrinterColumns> additionalPrinterColumns;
  final dynamic item;
}

class ListItemWidget extends StatelessWidget {
  const ListItemWidget({
    super.key,
    required this.title,
    required this.resource,
    required this.path,
    required this.scope,
    required this.additionalPrinterColumns,
    required this.name,
    required this.namespace,
    required this.item,
    required this.info,
    this.status = Status.undefined,
    this.onTap,
  });

  final String title;
  final String resource;
  final String path;
  final ResourceScope scope;
  final List<AdditionalPrinterColumns> additionalPrinterColumns;
  final String name;
  final String? namespace;
  final dynamic item;
  final List<String> info;
  final Status status;
  final void Function()? onTap;

  Widget buildStatus(BuildContext context) {
    if (status != Status.undefined) {
      return Wrap(
        children: [
          const SizedBox(width: Constants.spacingSmall),
          Icon(
            Icons.radio_button_checked,
            size: 24,
            color: status == Status.success
                ? Theme.of(context).extension<CustomColors>()!.success
                : status == Status.danger
                    ? Theme.of(context).extension<CustomColors>()!.error
                    : Theme.of(context).extension<CustomColors>()!.warning,
          ),
        ],
      );
    }

    return Container();
  }

  /// [buildInfo] creates the info widget. Eachitem in the list of [info] represents one line of text in the
  /// returned column widget.
  Widget buildInfo(BuildContext context, List<String> info) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: info
          .map(
            (e) => Text(
              Characters(e)
                  .replaceAll(Characters(''), Characters('\u{200B}'))
                  .toString(),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: secondaryTextStyle(
                context,
              ),
            ),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: Constants.spacingMiddle,
      ),
      child: AppListItem(
        onTap: () {
          navigate(
            context,
            ResourcesDetails(
              title: title,
              resource: resource,
              path: path,
              scope: scope,
              additionalPrinterColumns: additionalPrinterColumns,
              name: name,
              namespace: namespace,
            ),
          );
        },
        onDoubleTap: item == null
            ? null
            : () {
                showActions(
                  context,
                  ListItemActions(
                    title: title,
                    resource: resource,
                    path: path,
                    scope: scope,
                    additionalPrinterColumns: additionalPrinterColumns,
                    name: name,
                    namespace: namespace,
                    item: item,
                  ),
                );
              },
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Characters(name)
                        .replaceAll(Characters(''), Characters('\u{200B}'))
                        .toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: primaryTextStyle(
                      context,
                    ),
                  ),
                  buildInfo(context, info),
                ],
              ),
            ),
            buildStatus(context),
          ],
        ),
      ),
    );
  }
}
