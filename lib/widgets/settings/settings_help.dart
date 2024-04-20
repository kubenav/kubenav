import 'package:flutter/material.dart';

import 'package:flutter_markdown/flutter_markdown.dart';

import 'package:kubenav/models/help.dart' as help_model;
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/utils/themes.dart';
import 'package:kubenav/widgets/shared/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/shared/app_bottom_sheet_widget.dart';
import 'package:kubenav/widgets/shared/app_floating_action_buttons_widget.dart';
import 'package:kubenav/widgets/shared/app_vertical_list_simple_widget.dart';

/// The [SettingsHelp] widget displays the help screen, where the user can
/// access all the help texts from the [help_model]. The help screen is divided
/// into multiple section, where each section has multiple items. When the user
/// clicks on a help item the help is rendered as Markdown in a modal.
class SettingsHelp extends StatelessWidget {
  const SettingsHelp({super.key});

  Widget buildHelpSection(BuildContext context, int sectionIndex) {
    return Column(
      children: [
        AppVertialListSimpleWidget(
          title: help_model.Help.list[sectionIndex].title,
          items: List.generate(
            help_model.Help.list[sectionIndex].items.length,
            (itemIndex) => AppVertialListSimpleModel(
              onTap: () {
                showModal(
                  context,
                  AppBottomSheetWidget(
                    title: help_model
                        .Help.list[sectionIndex].items[itemIndex].title,
                    subtitle: 'Help',
                    icon: help_model
                        .Help.list[sectionIndex].items[itemIndex].icon,
                    closePressed: () {
                      Navigator.pop(context);
                    },
                    actionText: 'Close',
                    actionPressed: () {
                      Navigator.pop(context);
                    },
                    actionIsLoading: false,
                    child: Markdown(
                      padding: const EdgeInsets.all(
                        Constants.spacingMiddle,
                      ),
                      styleSheet: MarkdownStyleSheet(
                        code: TextStyle(
                          fontFamily: getMonospaceFontFamily(),
                          color: const Color(0xffd8dee9),
                          backgroundColor: const Color(0xff2e3440),
                        ),
                        codeblockDecoration: const BoxDecoration(
                          color: Color(0xff2e3440),
                        ),
                      ),
                      selectable: true,
                      data: help_model
                          .Help.list[sectionIndex].items[itemIndex].markdown,
                    ),
                  ),
                );
              },
              children: [
                Icon(
                  help_model.Help.list[sectionIndex].items[itemIndex].icon,
                  color: Theme.of(context).colorScheme.primary,
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
                  color: Theme.of(context)
                      .extension<CustomColors>()!
                      .textPrimary
                      .withOpacity(Constants.opacityIcon),
                  size: 16,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: Constants.spacingMiddle),
      ],
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(
              help_model.Help.list.length,
              (index) => buildHelpSection(context, index),
            ),
          ),
        ),
      ),
    );
  }
}
