import 'package:flutter/material.dart';
import 'package:kubenav/models/resource.dart';

import 'package:kubenav/utils/resources/general.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/resources/details/details_item.dart';

class DetailsItemAdditionalPrinterColumns extends StatelessWidget {
  const DetailsItemAdditionalPrinterColumns({
    Key? key,
    required this.additionalPrinterColumns,
    required this.item,
  }) : super(key: key);

  final List<AdditionalPrinterColumns> additionalPrinterColumns;
  final dynamic item;

  List<DetailsItemModel> _buildDetailsItems() {
    List<DetailsItemModel> detailsItems = [];

    for (final additionalPrinterColumn in additionalPrinterColumns) {
      final value = getAdditionalPrinterColumnValue(
        additionalPrinterColumn,
        item,
      );

      detailsItems.add(
        DetailsItemModel(
          name: additionalPrinterColumn.name,
          values: value,
          onTap: additionalPrinterColumn.description == ''
              ? null
              : (index) {
                  showSnackbar(
                    '${additionalPrinterColumn.name}: $value',
                    additionalPrinterColumn.description,
                  );
                },
        ),
      );
    }

    return detailsItems;
  }

  @override
  Widget build(BuildContext context) {
    if (additionalPrinterColumns.isEmpty) {
      return Container();
    }

    return DetailsItemWidget(
      title: 'Additional Information',
      details: _buildDetailsItems(),
    );
  }
}
