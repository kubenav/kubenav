import 'package:flutter/material.dart';

import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/resources/general.dart';

class DetailsItemConditionsWidget extends StatelessWidget {
  const DetailsItemConditionsWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

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
                        style: primaryTextStyle(size: 18),
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
                        margin: const EdgeInsets.only(
                          top: Constants.spacingSmall,
                          bottom: Constants.spacingSmall,
                          left: Constants.spacingSmall,
                          right: Constants.spacingSmall,
                        ),
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Constants.shadowColorGlobal,
                              blurRadius: Constants.sizeBorderBlurRadius,
                              spreadRadius: Constants.sizeBorderSpreadRadius,
                              offset: const Offset(0.0, 0.0),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(Constants.sizeBorderRadius),
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            final age = item['status']['conditions'][index]
                                        ['lastTransitionTime'] !=
                                    null
                                ? getAge(DateTime.parse(item['status']
                                        ['conditions'][index]
                                    ['lastTransitionTime']))
                                : '-';

                            snackbar(
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
                                color: Constants.colorPrimary,
                              ),
                              const SizedBox(width: Constants.spacingSmall),
                              Expanded(
                                child: Text(
                                  item['status']['conditions'][index]['type'],
                                  style: noramlTextStyle(),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                flex: 1,
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
