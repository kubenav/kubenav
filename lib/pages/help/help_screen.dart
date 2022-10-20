import 'package:flutter/material.dart';

import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';

import 'package:kubenav/models/help_model.dart' as help_model;
import 'package:kubenav/pages/help/help_controller.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/app_bottom_sheet_widget.dart';
import 'package:kubenav/widgets/app_floating_action_buttons_widget.dart';
import 'package:kubenav/widgets/app_vertical_list_simple_widget.dart';

class Help extends GetView<HelpController> {
  const Help({Key? key}) : super(key: key);

  Widget buildHelpSection(BuildContext context, int sectionIndex) {
    return AppVertialListSimpleWidget(
      title: help_model.Help.list[sectionIndex].title,
      items: List.generate(
        help_model.Help.list[sectionIndex].items.length,
        (itemIndex) => AppVertialListSimpleModel(
          onTap: () {
            Get.bottomSheet(
              BottomSheet(
                onClosing: () {},
                enableDrag: false,
                builder: (builder) {
                  return AppBottomSheetWidget(
                    title: help_model
                        .Help.list[sectionIndex].items[itemIndex].title,
                    subtitle: 'Help',
                    icon: help_model
                        .Help.list[sectionIndex].items[itemIndex].icon,
                    onClosePressed: () {
                      finish(context);
                    },
                    actionText: 'Close',
                    onActionPressed: () {
                      finish(context);
                    },
                    child: Markdown(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      selectable: true,
                      data: help_model
                          .Help.list[sectionIndex].items[itemIndex].markdown,
                    ),
                  );
                },
              ),
              isScrollControlled: true,
            );
          },
          children: [
            Icon(
              help_model.Help.list[sectionIndex].items[itemIndex].icon,
              color: Constants.colorPrimary,
            ),
            const SizedBox(width: Constants.spacingSmall),
            Expanded(
              flex: 1,
              child: Text(
                help_model.Help.list[sectionIndex].items[itemIndex].title,
                style: noramlTextStyle(
                  context,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey[300],
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Help'),
      ),
      bottomNavigationBar: const AppBottomNavigationBarWidget(),
      floatingActionButton: const AppFloatingActionButtonsWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: Constants.spacingMiddle,
                bottom: Constants.spacingMiddle,
              ),
              child: Column(
                children: List.generate(
                  help_model.Help.list.length,
                  (index) => buildHelpSection(context, index),
                ),
              ),
            ),
            const SizedBox(height: Constants.spacingSmall),
          ],
        ),
      ),
    );
  }
}
