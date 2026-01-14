import 'package:flutter/material.dart';

import 'package:kubenav/models/kubernetes/schema.models.swagger.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/resources.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/shared/app_list_item.dart';

/// The [DetailsItemConditions] widget is used to show the conditions of a
/// Kubernetes resource.
class DetailsItemConditions extends StatelessWidget {
  const DetailsItemConditions({super.key, required this.conditions});

  final List<IoK8sApimachineryPkgApisMetaV1Condition>? conditions;

  @override
  Widget build(BuildContext context) {
    if (conditions != null && conditions!.isNotEmpty) {
      return Column(
        children: [
          const SizedBox(height: Constants.spacingMiddle),
          Padding(
            padding: const EdgeInsets.all(Constants.spacingMiddle),
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
          SizedBox(
            height: 128,
            child: GridView.count(
              scrollDirection: Axis.horizontal,
              crossAxisCount: 2,
              childAspectRatio: 0.25,
              children: List.generate(conditions!.length, (index) {
                return Container(
                  margin: const EdgeInsets.only(
                    top: Constants.spacingSmall,
                    bottom: Constants.spacingSmall,
                    left: Constants.spacingMiddle,
                    right: Constants.spacingMiddle,
                  ),
                  child: AppListItem(
                    onTap: () {
                      showSnackbar(
                        context,
                        conditions![index].type,
                        'Status: ${conditions![index].status}\nLast Transition Time: ${getAge(conditions![index].lastTransitionTime)}\nReason: ${conditions![index].reason}\nMessage: ${conditions![index].message}',
                      );
                    },
                    child: Row(
                      children: [
                        Icon(
                          conditions![index].status == 'True'
                              ? Icons.radio_button_checked
                              : Icons.radio_button_unchecked,
                          size: 24,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: Constants.spacingSmall),
                        Expanded(
                          flex: 1,
                          child: Text(
                            conditions![index].type,
                            style: normalTextStyle(context),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      );
    }

    return Container();
  }
}
