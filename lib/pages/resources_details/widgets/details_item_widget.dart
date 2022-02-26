import 'package:flutter/material.dart';

import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';

abstract class IDetailsItemWidget {
  const IDetailsItemWidget({
    required this.item,
  });

  final dynamic item;
}

class DetailsItemModel {
  const DetailsItemModel({
    required this.name,
    required this.values,
    this.onTap,
  });

  final String name;
  final List<String> values;
  final void Function(int index)? onTap;
}

class DetailsItemWidget extends StatelessWidget {
  const DetailsItemWidget({
    Key? key,
    required this.title,
    required this.details,
  }) : super(key: key);

  final String title;
  final List<DetailsItemModel> details;

  Widget buildValue(
      String name, List<String> values, void Function(int index)? onTap) {
    if (values.length == 1) {
      return Flexible(
        child: InkWell(
          onTap: () {
            if (onTap != null) {
              onTap(0);
            }
          },
          child: Text(
            values[0],
            softWrap: true,
          ),
        ),
      );
    }

    return Flexible(
      child: Wrap(
        children: List.generate(
          values.length,
          (index) => InkWell(
            onTap: () {
              if (onTap != null) {
                onTap(index);
              } else {
                snackbar('$name Value', values[index]);
              }
            },
            child: Chip(
              label: Text(values[index]),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
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
                  title,
                  style: primaryTextStyle(size: 18),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(
            left: Constants.spacingMiddle,
            right: Constants.spacingMiddle,
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
                        style: primaryTextStyle(size: 14),
                      ),
                      const SizedBox(width: Constants.spacingSmall),
                      buildValue(
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
