import 'package:flutter/material.dart';

import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/shared/app_list_item.dart';

class DetailsItemConditions extends StatelessWidget {
  const DetailsItemConditions({
    super.key,
    required this.item,
  });

  final dynamic item;

  @override
  Widget build(BuildContext context) {
    if (item != null &&
        item['status'] != null &&
        item['status']['conditions'] != null &&
        item['status']['conditions'] is List &&
        item['status']['conditions'].isNotEmpty) {
      return Column(
        children: [
          const SizedBox(height: Constants.spacingMiddle),
          Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: Constants.spacingMiddle,
                  left: Constants.spacingMiddle,
                  right: Constants.spacingMiddle,
                  bottom: Constants.spacingMiddle,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Conditions',
                        style: primaryTextStyle(context, size: 18),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: Constants.spacingMiddle,
                  right: Constants.spacingMiddle,
                ),
                height: 128,
                child: GridView.count(
                  scrollDirection: Axis.horizontal,
                  crossAxisCount: 2,
                  childAspectRatio: 0.25,
                  mainAxisSpacing: 16.0,
                  children: List.generate(
                    item['status']['conditions'].length,
                    (index) {
                      return Container(
                        margin: const EdgeInsets.all(
                          Constants.spacingSmall,
                        ),
                        child: AppListItem(
                          onTap: () {
                            final age = item['status']['conditions'][index]
                                        ['lastTransitionTime'] !=
                                    null
                                ? getAge(DateTime.parse(item['status']
                                        ['conditions'][index]
                                    ['lastTransitionTime'],),)
                                : '-';

                            showSnackbar(
                              context,
                              item['status']['conditions'][index]['type'],
                              'Status: ${item['status']['conditions'][index]['status']}\nAge: $age\nReason: ${item['status']['conditions'][index]['reason'] ?? '-'}\nMessage: ${item['status']['conditions'][index]['message'] ?? '-'}',
                            );
                          },
                          child: Row(
                            children: [
                              Icon(
                                item['status']['conditions'][index]['status'] ==
                                        'True'
                                    ? Icons.radio_button_checked
                                    : Icons.radio_button_unchecked,
                                size: 24,
                                color: theme(context).colorPrimary,
                              ),
                              const SizedBox(width: Constants.spacingSmall),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  item['status']['conditions'][index]['type'],
                                  style: noramlTextStyle(
                                    context,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    }

    return Container();
  }
}
